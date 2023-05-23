#INCLUDE "Totvs.ch"
#INCLUDE "FWMVCDEF.CH"

/*/{Protheus.doc} User Function MYMVC3
    exemplo MVC
    @type  Function
    @author Ruan Pereira
    @since 20/03/2023
    /*/
User Function MYMVC_3()
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

    //? Validações do Modelo
    local bModelPre    := {|oModel| ValidPre(oModel)}
    local bModelPos    := {|oModel| ValidPos(oModel)}
    local bModelCancel := {|oModel| Cancel(oModel)}

    //? Validações do fomulario

    local bFieldPos   := {|oFields| ValidFields(oFields)}
    local bLoadFields := {|oFields, lCopy| LoadFields(oFields)}

    //? Validações do Grid
    local bLinePre := {|oGrid, nLine, cAction, cFieldId, xValue, xCurValue|}

    local oModel   := MPFormModel():New('MYMVC_3M', bModelPre, bModelPos, /*bModelCommit*/, bModelCancel)
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

    oModel:GetModel('ZZDDETAIL'):SetUniqueLine({'ZZD_COD'})

Return oModel

Static Function ViewDef()
    local oModel   := FWLoadModel('MYMVC_3')
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

Static Function ValidPre(oModel)
    local nOperation := oModel:GetOperation()
    local lOK        := .T. 

    if nOperation == 4 
        oModel:GetModel('ZZCMASTER'):GetStruct():SetProperty('ZZC_COD', MODEL_FIELD_WHEN, FwBuildFeature(STRUCT_FEATURE_WHEN, '.F.'))
        lOk := .F.    
    endif
Return

Static Function ValidPos(oModel)
    local nOperation := oModel:GetOperation()
    local cNomeCurso := oModel:GetValue('ZZCMASTER', 'ZZC_NOME')
    local lVazio := Vazio(cNomeCurso)
    local lTudoOk     := .T. //variavel declarada recebendo True

    if nOperation == 5
        lTudoOk := .F.
        Help(Nil, Nil, 'Não autorizado', Nil, 'Você não tem autorização para fazer exclusões!', 1, 0, Nil, Nil, Nil, Nil, Nil, {'Contate o administrador.'})
    elseif lVazio 
        lTudoOk := .F.
         Help(Nil, Nil, 'Não é possível gravar o curso', Nil, 'O <b>NOME DO CURSO</b> não foi preenchido', 1, 0, Nil, Nil, Nil, Nil, Nil, {'Contate o administrador.'})
    endif

Return lTudoOk
 
Static Function Cancel(oModel)
    local lCancela :=.F.
    local cMsg     := 'Deseja cancelar a operação?'

    FwFormCancel(oModel)
    lCancela := MsgYesNo(cMsg, 'Cancelar?')

Return lCancela

Static Function ValidFields(oFields)
    local lTudoOk := .T.
    local cCod := oFields:GetValue('ZZC_COD')

    if cCod == '000000'
        lTudoOk := .F.
        Help(Nil, Nil, 'Operação não permitida', Nil, 'O código do curso não pode ser <b>000000,/b>', 1, 0, Nil, Nil, Nil, Nil, Nil, {'Preencha o código corretamente.'})
    endif

Return lTudoOk

Static Function LoadFields(oFields)
    local aDados := {}
    local nRecNo := LASTREC()

    AADD(aDados, {xFilial('ZZC'), '111111', 'COBOL'})
    AADD(aDados, nRecNo)

Return aDados

Static Function ValidLine(oGrid, nLine, cAction, cFieldId, xValue, xCurValue)
    local lValido := .T.

    if cAction == 'SETVALUE' .AND. cFieldId == 'ZZB_COD' .AND. xValue == xCurValue
    Help(Nil, Nil, 'Não tem porque fazer isso!', Nil, 'Você selecionou o mesmo aluno!', 1, 0, Nil, Nil, Nil, Nil, Nil, {'Selecione outro aluno!'})


Return lValido
