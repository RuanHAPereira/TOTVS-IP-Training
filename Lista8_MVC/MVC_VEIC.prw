#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_VEIC
    codigo em MVC para cadastros de veiculos de uma auto escola
    @type  Function
    @author Ruan Pereira
    @since 29/03/2023
/*/
User Function MVC_VEIC()

    Local oBrowse := FWMBrowse():New()
    Local cTitle  := 'Cadastro de Veiculos'
    Local cAlias  := 'ZZV'

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

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC_VEIC' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC_VEIC' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVC_VEIC' OPERATION 5 ACCESS 0

return aRotina

//? Modelo de Dados
Static Function ModelDef()

    Local oModel   := MPFormModel():New('MVC_VEICM')
    Local oStruZZV := FWFormStruct(1, 'ZZV')

    //? Definindo os submodelos
    oModel:AddFields('ZZVMASTER',/**/ , oStruZZV) //? submodelo FIELD

    //? Descrição do modelo
    oModel:SetDescription('Modelo de dados - Cadastro de Veiculos')

    //? Descrição do submodelo
    oModel:GetModel('ZZVMASTER'):SetDescription('Cadastro de Veiculos')
    oModel:SetPrimaryKey({'ZZV_COD'})

return oModel

//? Visualização de dados
Static Function ViewDef()

    Local oModel   := FWLoadModel('MVC_VEIC')
    Local oView    := FWFormView():New()
    Local oStruZZV := FWFormStruct(2, 'ZZV')

    //? Indica o modelo da view 
    oView:SetModel(oModel)

    //? Cria a estrutura visual de campos
    oView:AddField('VIEW_ZZV', oStruZZV, 'ZZVMASTER')

    //? Cria boxes horizontais 
    oView:CreateHorizontalBox('VEÍCULOS', 100)

    //? Relaciona os boxes com as estruturas visuais 
    oView:SetOwnerView('VIEW_ZZV', 'VEÍCULOS')

	//? Cria um titulo encima de cada formulário
    oView:EnableTitleView('VIEW_ZZV', 'Cadastro de Veículos')

return oView
