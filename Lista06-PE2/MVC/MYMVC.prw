#INCLUDE "TOTVS.CH"
#INCLUDE "FWMVCDEF.CH"

/*/{Protheus.doc} User Function MYMVC
    Exemplo de uso da clase FWMBrowse
    @type  Function
    @author Ruan Pereira
    @since 17/03/2023
    /*/
User Function MYMVC()

    local cAlias  := "ZZC"
    local cTitle  := "Cadastro de Cursos"
    local oBrowse := FWMBrowse():New() 

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    // oBrowse:setFilterDefault('A1_TIPO == "F"')
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()

Return

Static Function MenuDef()

    local aRotina := {}

    Add Option aRotina TITLE "Incluir" ACTION "VIEWDEF.MYMVC" OPERATION 3 ACCESS 0
    Add Option aRotina TITLE "Alterar" ACTION "VIEWDEF.MYMVC" OPERATION 4 ACCESS 0
    Add Option aRotina TITLE "Excluir" ACTION "VIEWDEF.MYMVC" OPERATION 5 ACCESS 0
    
return aRotina

Static Function ModelDef()

    local oModel  := MPFormModel():New('MYMVCM')
    local oStruZZC:= FWFormStruct(1, 'ZZC')

    oModel:AddFields('ZZCMASTER', NIL, oStruZZC)

    oModel:SetDescription('Modelo de Dados de Cursos')

    oModel:GetModel('ZZCMASTER'):SetDescription('Formulário do Curso')

    oModel:SetPrimaryKey({'ZZC_COD'})

Return oModel

Static Function ViewDef()
    
    local oModel   := FWLoadModel('MYMVC')
    local oStruZZC := FWFormStruct(2, 'ZZC')
    local oView    := FWLoadModel():New()

    oView:SetModel(oModel)

    oView:AddField('VIEW_ZZC', oStruZZC, 'ZZCMASTER')

    oView:CreateHorizontalBox('TELA', 100)

    oView:SetOwnerView('VIEW_ZZC', 'TELA')

Return
