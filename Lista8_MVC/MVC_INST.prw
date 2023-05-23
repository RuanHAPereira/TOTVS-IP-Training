#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_INST
    Codigo MVC para cadastro de instrutores
    @type  Function
    @author Ruan Pereira
    @since 28/03/2023
/*/
User Function MVC_INST()

	Local oMark  := FwMarkBrowse():New()
	Local cTitle := 'Cadastro do Instrutor'
	Local cAlias := 'ZZI'

	//?Instanciando o Browse
	oMark:SetAlias(cAlias)
	oMark:SetDescription(cTitle)
	oMark:SetFieldMark('ZZI_MARK')
	oMark:AddButton('Excluir marcados', 'U_ExcMarcados',5, 1)
	oMark:DisableReport()

	//?Ativando o browse
	oMark:Activate()
Return

//?definindo o menu 
Static function MenuDef()

	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC_INST' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC_INST' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVC_INST' OPERATION 5 ACCESS 0

return aRotina

//?Modelo de Dados

Static Function ModelDef()

	//?Validação do Modelo
	Local bModelPos := { |oModel| VldIns(oModel)}
	Local oModel   := MPFormModel():New('MVC_INSTM', /**/, bModelPos)
	Local oStruZZI := FWFormStruct(1, 'ZZI')

	//?Define de os submodelos serão fields ou grid
	oModel:AddFields('ZZIMASTER', , oStruZZI)

	//?descrição do modelo
	oModel:SetDescription('Modelo de dados - Cadastro de Instrutores')

	//?descrição do submodelo
	oModel:GetModel('ZZIMASTER'):SetDescription('Cadastro de Instrutores')
	oModel:SetPrimaryKey({'ZZI_COD'})

return oModel

//?Visualização de dados
Static Function ViewDef()

	Local oModel   := FWLoadModel('MVC_INST')
	Local oView    := FWFormView():New()
	Local oStruZZI := FWFormStruct(2,'ZZI')

	//?indica o modelo da view
	oView:SetModel(oModel)

	//?cria a estrutura visual de campos
	oView:AddField('VIEW_ZZI', oStruZZI, 'ZZIMASTER')

	//?cria boxes horizontais
	oView:CreateHorizontalBox('INSTRUTORES', 100)

	//?relaciona os boxes com as estruturas visuais
	oView:SetOwnerView('VIEW_ZZI','INSTRUTORES')

	//?cria um titulo encima de cada formulário
	oView:EnableTitleView('VIEW_ZZI', 'Cadastro de Instrutores')

return oView

User Function ExcMarcados()

	if MsgYesNo('Confima a exclusão dos Instrutores marcados?')
		DbSelectArea('ZZI')
		ZZI->(DbGoTop())
        
		while ZZI->(!EOF())
			if oMark:IsMark()
				if ZZI_QTDAL < 1
					RecLock('ZZI', .F.)
					ZZI->(DbDelete())
					ZZI->(MSUnlock())
				else 
					Help(NIL,NIL,'Operação não permitida!',NIL,'o Instrutor não pode ser excluido',1,0,NIL,NIL,NIL,NIL,NIL, {'Ele tem alunos'})
				endif
			endif
			ZZI->(DbSkip())
		enddo
	endif
	oMark:Refresh(.T.)
return

Static Function VldIns(oModel)

	Local nOper         := oModel:GetOperation()
	Local lOk           := .T.
	Local cEscolaridade := Alltrim(oModel:GetValue('ZZIMASTER', 'ZZI_ESC'))
	Local dIdade        := oModel:GetValue('ZZIMASTER', 'ZZI_NASC')
	Local dHabilita     := oModel:GetValue('ZZIMASTER', 'ZZI_HAB')
	Local cQtdAlunos    := oModel:GetValue('ZZIMASTER', 'ZZI_QUANT')

	if nOper == 3
		if cEscolaridade == 'F'
			lOk := .F.
			Help(NIL,NIL, 'Nível de Escolaridade Inválido', NIL, 'Volte a estudar',1,0,NIL,NIL,NIL,NIL,NIL, {'Procure a escola mais proxima'})
		elseif (DateDiffYear(dIdade, Date()) < 21) //?Função que mostra a diferença em anos entre duas datas 
			lOk := .F.
			Help(NIL,NIL, 'Idade Invalida', NIL, 'É necessário ter mais de 21 anos para ser instrutor',1,0,NIL,NIL,NIL,NIL,NIL, {'Volte quando tiver 21 anos ou mais'})
		elseif (DateDiffYear(dHabilita, Date()) < 2)
			lOk := .F.
			Help(NIL,NIL, 'Habilitação invalida', NIL, 'É necessário ter pelo menos 2 anos da 1 habilitação',1,0,NIL,NIL,NIL,NIL,NIL, {'Aguarde ate ter 2 anos'})
		endif
	elseif nOper == 5
		if cQtdAlunos >= 1
			lOk := .F.
			Help(NIL,NIL,'Operação não permitida!',NIL,'o Instrutor não pode ser excluido',1,0,NIL,NIL,NIL,NIL,NIL, {'Ele tem alunos'})
		endif
	endif
return lOk
