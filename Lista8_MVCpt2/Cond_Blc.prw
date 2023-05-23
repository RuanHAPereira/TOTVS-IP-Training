#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function Cond_Blc
    Cadastros do Condomínio
    @type  Function
    @author Ruan Pereia
    @since 30/03/2023
    @version 1.0
    /*/
User Function Cond_Blc()

    local cAlias  := "ZS5"
    local cTitle  := "Blocos do Condomínio"
    local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    //oBrowse:DisableDetails()
    //oBrowse:DisableReport()

    oBrowse:Activate()

Return 

Static Function MenuDef()

    local aRotina := {}

    ADD OPTION aRotina TITLE "Visualizar" ACTION 'VIEWDEF.Cond_Blc' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir"    ACTION 'VIEWDEF.Cond_Blc' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Alterar"    ACTION 'VIEWDEF.Cond_Blc' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir"    ACTION 'VIEWDEF.Cond_Blc' OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()

    local oModel   := MpFormModel():New("CadBL")
    local oStruZS5 := FwFormStruct(1, "ZS5")
    
    oModel:AddFields("ZS5MASTER",,oStruZS5)
    oStruZS5:SetProperty('ZS5_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZS5", "ZS5_COD")'))
    oModel:SetPrimaryKey({"ZS5_COD"})

Return oModel

Static Function ViewDef()

    local oModel    := FwLoadModel('Cond_Blc')
    local oStruZS5  := FwFormStruct(2, "ZS5")
    local oView     := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField("VIEW_ZS5", oStruZS5, "ZS5MASTER")
    oView:CreateHorizontalBox("ZS5MASTER", 100)
    oView:SetOwnerView("VIEW_ZS5", "ZS5MASTER")
    oView:EnableTitleView("VIEW_ZS5", "Cadastro de Blocos do Condomínio")

Return oView
