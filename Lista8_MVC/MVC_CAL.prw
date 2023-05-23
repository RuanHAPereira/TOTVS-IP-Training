#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_CAL
    Rotina MVC para cadastro de Alunos
    @type  Function
    @author Ruan Pereira
    @since 29/03/2023
/*/
User Function MVC_CAL()

	Local oMark  := FwMarkBrowse():New()
	Local cTitle := 'Cadastro de Alunos'
	Local cAlias := 'ZZF'

	//? Instanciando o Browse
	oMark:SetAlias(cAlias)
	oMark:SetDescription(cTitle)
	oMark:SetFieldMark('ZZF_MARK')
	oMark:AddButton('Excluir marcados', 'U_ExcAlunos',5, 1)
	oMark:DisableReport()

	//?Ativando o Mark
	oMark:Activate()

Return

//? Definindo o menu 
Static function MenuDef()

	Local aRotina := {} //?Array vazio para que possa ser adcionado os botões 

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC_CAL' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC_CAL' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVC_CAL' OPERATION 5 ACCESS 0

return aRotina

//? Modelo de Dados
Static Function ModelDef()

	//?Validação do Modelo
	Local bModelPos := { |oModel| VldInstrutor(oModel)}
	Local oModel    := MPFormModel():New('MVC_CALM',/**/, bModelPos)
	Local oStruZZF  := FWFormStruct(1, 'ZZF')
	Local aTrigger  := FwStruTrigger('ZZF_INSTRU', 'ZZF_NOMEIN', 'ZZI->ZZI_NOME', .T., 'ZZI', 1, 'xFilial("ZZI")+Alltrim(M->ZZF_INSTRU)')

	//?Adicionando o gatilho de campo
	oStruZZF:AddTrigger(aTrigger[1], aTrigger[2], aTrigger[3], aTrigger[4])

	//?Define de os submodelos serão fields ou grid
	oModel:AddFields('ZZFMASTER', , oStruZZF)

	//?Preenchendo o campo código automatico
	oStruZZF:SetProperty('ZZF_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GETSXENUM("ZZF", "ZZF_COD")'))

	//?descrição do modelo
	oModel:SetDescription('Modelo de dados - Cadastro de Alunos')

	//?descrição do submodelo
	oModel:GetModel('ZZFMASTER'):SetDescription('Cadastro de Alunos')
	oModel:SetPrimaryKey({'ZZF_COD'})

return oModel

//? Visualização de dados
Static Function ViewDef()

	Local oModel   := FWLoadModel('MVC_CAL')
	Local oView    := FWFormView():New()
	Local oStruZZF := FWFormStruct(2,'ZZF')

	//?indica o modelo da view
	oView:SetModel(oModel)

	//?cria a estrutura visual de campos
	oView:AddField('VIEW_ZZF', oStruZZF, 'ZZFMASTER')

	//?cria boxes horizontais
	oView:CreateHorizontalBox('ALUNOS', 100)

	//?relaciona os boxes com as estruturas visuais

	oView:SetOwnerView('VIEW_ZZF','ALUNOS')
	//?cria um titulo encima de cada formulário

	oView:EnableTitleView('VIEW_ZZF', 'Cadastro de Alunos')
	oView:SetFieldAction('ZZF_AULA', { |oView| VldAula(oView)})

return oView

//?Validação do Instrutor
Static Function VldInstrutor(oModel)

	Local lOk        := .t.
	Local nOper      := oModel:GetOperation()
	Local cNome      := Alltrim(oModel:GetValue('ZZFMASTER', 'ZZF_NOME'))
	Local cInstrutor := Alltrim(oModel:GetValue('ZZFMASTER', 'ZZF_INSTRU'))
	Local cAulas     := Alltrim(oModel:GetValue('ZZFMASTER', 'ZZF_AULA'))
	Local nQtd       := 0

	DbSelectArea('ZZI')
	ZZI->(DbGoTop())

	while ZZI->(!EOF())
		if Alltrim(ZZI_COD) == cInstrutor
			nQtd := ZZI_QUANT
			if nOper == 3
				if nQtd == 5
					lOk := .f.
					help(NIL,NIL, 'Instrutor indiponível', NIL, 'O instrutor selecionado só pode atender 5 alunos', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Escolha outro instrutor'})
				else
					nQtd++
					RecLock('ZZI', .F.)
					ZZI->ZZI_QUANT := nQtd
					ZZI->(MSUnlock())
				endif
			elseif nOper == 5
				if cAulas == '1'
					lOk := .f.
					help(NIL,NIL, 'Aluno(a) em aulas', NIL, 'O aluno(a) ' +cNome+' Não pode ser excluido pois esta em aula' , 1 ,0 , NIL, NIL, NIL, NIL, NIL, {'Escolha outro aluno'})
				else
					if nQtd <= 1
						nQtd := 0
					else
						nQtd--
					endif
					RecLock('ZZI', .F.)
					ZZI->ZZI_QUANT := nQtd
					ZZI->(MSUnlock())
				endif
			endif
		endif
		ZZI->(DbSkip())
	enddo
return lOk

//?Exclusão de alunos marcados
User Function ExcAlunos()

	Local nQtd := 0

	if MsgYesNo('Confima a exclusão dos Alunos marcados?')

		DbSelectArea('ZZF')
		ZZF->(DbGoTop())

		while ZZF->(!EOF())

			//?verifica se esta marcado
			if oMark:IsMark()
				DbSelectArea('ZZI')
				DbSetOrder(1)
				if DbSeek(xFilial("ZZI") + ZZF->ZZF_INSTRU)
					nQtd := ZZI->ZZI_QUANT

					//?se o campo realiza aulas for diferente de SIM
					if Alltrim(ZZF->ZZF_AULAS) != '1'
						RecLock('ZZF', .F.)
						ZZF->(DbDelete())
						ZZF->(MSUnlock())
						if nQtd <= 1
							nQtd := 0
						else
							nQtd--
						endif
						RecLock('ZZI', .F.)
						ZZI->ZZI_QUANT := nQtd
						ZZI->(MSUnlock())
					else
						help(NIL,NIL, 'Aluno(a) em aulas', NIL, 'O aluno(a) Não pode ser excluido pois esta em aula' ,1,0,NIL,NIL,NIL,NIL,NIL, {'Escolha outro aluno'})
					endif
				endif
			endif
			ZZF->(DbSkip())
		enddo
	endif
	oMark:Refresh(.T.)
return

//?Validação do campo Realizando Aulas 
Static Function VldAula(oView)

	Local oModel     := oView:GetModel('ZZFMASTER')
	Local cInstrutor := Alltrim(oView:GetValue('ZZFMASTER', 'ZZF_INSTRU'))
	Local cAulas     := Alltrim(oView:GetValue('ZZFMASTER', 'ZZF_AULA'))

	DbSelectArea('ZZI')
	DbSetOrder(1)

	if cAulas == "1"
		if Empty(cInstrutor)
			oModel:SetValue('ZZF_AULA', "2")
			help(NIL, NIL, 'Instrutor não selecionado', NIL, 'Instrutor em branco' , 1, 0, NIL, NIL, NIL, NIL, NIL, {'Selecione corretamente o instrutor e retorne a este campo'})
			oView:Refresh()
			
		elseif DbSeek(xFilial("ZZI") + cInstrutor)
			if ZZI_QUANT == 5
				oModel:SetValue('ZZF_AULA', "2")
				help(NIL, NIL, 'Instrutor indiponível', NIL, 'O instrutor selecionado só pode atender 5 alunos', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Escolha outro instrutor'})
				oView:Refresh()
			endif
		endif
	endif
return
