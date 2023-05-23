#INCLUDE "Totvs.ch"
#INCLUDE "FWMVCDEF.CH"

/*/{Protheus.doc} User Function MYMVC2
    exemplo MVC
    @type  Function
    @author Ruan Pereira
    @since 20/03/2023
    /*/
User Function MYMVC_2()
    local cAlias  := 'ZZC'
    local cTitle  := 'Cursos'
    local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:Activate()
Return

Static Function MenuDef()
    local aRotina := {}

    ADD Option aRotina TITLE "Visualizar" ACTION "VIEWDEF.MYMVC_2" OPERATION 2 ACCESS 0
    ADD Option aRotina TITLE "Cadastrar"  ACTION "VIEWDEF.MYMVC_2" OPERATION 3 ACCESS 0
    ADD Option aRotina TITLE "Mudar"      ACTION "VIEWDEF.MYMVC_2" OPERATION 4 ACCESS 0
    ADD Option aRotina TITLE "Deletar"    ACTION "VIEWDEF.MYMVC_2" OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()
    local oModel   := MPFormModel():New('MYMVC_2M')
    local oStruZZC := FwFormStruct(1, 'ZZC')
    local oStruZZD := FwFormStruct(1, 'ZZD')
    local aTrigger := FwStruTrigger('ZZD_COD', 'ZZD_NOME', 'ZZA->ZZA_NOME', .T., 'ZZA', 1, 'xFILIAL("ZZA")+ALLTRIM(M-ZZD_COD)')

    oStruZZD:AddTrigger(aTrigger[1], aTrigger[2], aTrigger[3], aTrigger[4])

    oModel:AddFields('ZZCMASTER', /*COMPONENTE PAI*/, oStruZZC)

    oModel:AddGrid('ZZDDETAIL', 'ZZCMASTER', oStruZZD)

    oModel:SetDescription('Cursos')
    oModel:GetModel('ZZCMASTER'):SetDescription('Cursos')

    oModel:GetModel('ZZDDETAIL'):SetDescription('Alunos')

    oModel:SetRelation('ZZDDETAIL', {{'ZZD_FILIAL', 'xFilial("ZZD")'}, {'ZZD_CURSO', 'ZZC_COD'}}, ZZD->(IndexKEy(1)))

    oModel:SetPrimaryKey({'ZZC_COD','ZZD_COD'})
Return oModel

Static Function ViewDef()
    local oModel   := FWLoadModel('MYMVC_2')
    local oStruZZC := FwFormStruct(2, 'ZZC')
    local oStruZZD := FwFormStruct(2, 'ZZD')
    local oView    := FwFormView():New()

    oView:SetModel(oModel)

    oView:AddField('VIEW_ZZC', oStruZZC, 'ZZCMASTER')
    oView:AddGrid('VIEW_ZZD', oStruZZD, 'ZZDDETAIL')

    oView:CreateHorizontalBox('CURSO', 30)
    oView:CreateHorizontalBox('ALUNOS', 70)

    oView:SetOwnerView('VIEW_ZZC', 'CURSO')
    oView:SetOwnerView('VIEW_ZZD', 'ALUNOS')

    oView:EnableTitleView('VIEW_ZZC', 'Dados do Curso')
    oView:EnableTitleView('VIEW_ZZD', 'Alunos Matriculados')

    oView:SetViewAction('BUTTONOK', {|oView| MostraMsg(oView)})
    
    oView:SetFieldAction('ZZC_COD', {|oView| CarregaMsg(oView)})

    oView:AddUserButton('Um Botão', 'CLIPS', {|| FwAlertInfo('Pronto!', 'Essa é a mensagem!')}, 'Botão de Mensagem', /* nShortcut*/,;
                         {MODEL_OPERATION_INSERT, MODEL_OPERATION_UPDATE})

    oView:addOtherObjects('BOTAO', {|oPanel| Clique(oPanel)})
    oView:SetOwnerView('BOTAO',)
Return oView

Static Function Clique(oPanel)
    TButton():New(005, 001, 'Clique aqui!', oPanel, {|| FwAlertSucess('Você clicou', 'Parabéns')}, 050, 020)
Return

Static Function MostraMsg(oView)
    local nOper  := oView:GetOperation()
    local cCurso := oView:GetValue('ZZCMASTER', 'ZZC_NOME')
    local cLinhas := cValToChar(oView:GetModel('ZZDDETAIL'):Length(.T.))

    if nOper == 3
        FwAlertSuccess('Inclusão do curso <b>' + cCurso + '</b> realizada com sucesso!', 'SetViewAction')
    elseif nOper == 4 
        FwAlertSuccess('Alteração do curso <b>' + cCurso + '</b> realizada com sucesso!', 'SetViewAction')
    elseif nOper == 5
        FwAlertSuccess('Exclusão do curso <b>' + cCurso + '</b> realizada com sucesso!', 'SetViewAction')
    endif

    FwAlertInfo('Existem <b>' + cLinhas + '</b> linhas no grid.')
Return

Static Function CarregaNome(oView)
    local cNome := 'Curso'
    local oModel := oView:GetModel('ZZCMASTER')

    oModel:SetValue('ZZC_NOME', cNome)

    oView:Refresh()
Return
