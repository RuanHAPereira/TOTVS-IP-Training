#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_CNH
    Codigo MVC para realizar cadastro de Categorias de CNH
    @type  Function
    @author Ruan Pereira
    @since 28/03/2023
/*/
User Function MVC_CNH()

    Local oBrowse := FWMBrowse():New()
    Local cTitle  := 'Categorias CNH'
    Local cAlias  := 'ZZE'

    //? Instanciando o Browse
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableReport()

    //? Ativando o browse
    oBrowse:Activate()
Return 

//? Definindo o menu 
Static function MenuDef()

	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC_CNH' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC_CNH' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVC_CNH' OPERATION 5 ACCESS 0

return aRotina

//?Modelo de Dados
Static Function ModelDef()

    //? Validações do Modelo
    Local bModelPos := { |oModel| ValidaSigla(oModel)}
    Local oModel    := MPFormModel():New('MVC_CNHM',/*bModelPre*/, bModelPos)
    Local oStruZZE  := FWFormStruct(1, 'ZZE')
    Local aTrigger  := FwStruTrigger('ZZE_CVU', 'ZZE_NVU', 'ZZV->ZZV_NOME', .T., 'ZZV', 1, 'xFilial("ZZV")+Alltrim(M->ZZE_CVU)')

    //? Adicionando o gatilho de campo
    oStruZZE:AddTrigger(aTrigger[1], aTrigger[2], aTrigger[3], aTrigger[4])

    //? Define de os submodelos serão fields ou grid
    oModel:AddFields('ZZEMASTER', , oStruZZE)

    //? Preenchendo o campo código automatico
    oStruZZE:SetProperty('ZZE_COD',MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GETSXENUM("ZZE", "ZZE_COD")'))

    //? Descrição do modelo
    oModel:SetDescription('Modelo de dados - Categorias de CNH')

    //? Descrição do submodelo
    oModel:GetModel('ZZEMASTER'):SetDescription('Cadastro Categoria CNH')
    oModel:SetPrimaryKey({'ZZE_COD'})

return oModel

//? Visualização de dados
Static Function ViewDef()

    Local oModel   := FWLoadModel('MVC_CNH')
    Local oView    := FWFormView():New()
    Local oStruZZN := FWFormStruct(2,'ZZE')

    //? Indica o modelo da view 
    oView:SetModel(oModel)

    //? Cria a estrutura visual de campos
    oView:AddField('VIEW_ZZE', oStruZZN, 'ZZEMASTER')

    //? Cria boxes horizontais 
    oView:CreateHorizontalBox('CNH', 100)

    //? Relaciona os boxes com as estruturas visuais 
    oView:SetOwnerView('VIEW_ZZE','CNH')

	//? Cria um titulo encima de cada formulário
    oView:EnableTitleView('VIEW_ZZE', 'Categorias de CNH')

return oView

Static Function ValidaSigla(oModel)

    Local lOk      := .T.
    Local nOper    := oModel:GetOperation()
    Local nTamanho := len(Alltrim(oModel:GetValue('ZZEMASTER', 'ZZE_SGL')))

    if nOper == 3
        if nTamanho != 1 .AND. nTamanho != 3 
            lOk := .F.
            Help(NIL, NIL,'Respeite os limites', NIL, 'O campo Sigla precisa ter 1 ou 3 caracteres', 1, 0, NIL, NIL, NIL, NIL, NIL, {'preencha corretamente o campo'})
        endif 
    endif 
return lOk 
