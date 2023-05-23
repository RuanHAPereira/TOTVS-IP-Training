#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function ManuCad()

    Local aArea := GetArea()
     
    RecLock('SB1', .F.)
        SB1->B1_DESC   := 'Cad. Manual - ' + M->B1_DESC
        SB1->B1_MSBLQL := '1'
    SB1->(MsUnlock())
     
    RestArea(aArea)

Return

User Function ValidaExc()

    Local aArea := GetArea()
    Local lRet  := .T.

    IF Alltrim(C5_TIPOINC) == 'AUTOMÁTICO'
        lRet := .F.

        FwAlertError('Pedidos automáticos não podem ser excluidos', 'NÃO PERMITIDO')

    Endif

    RestArea(aArea)

Return lRet

User Function BloqCli()

    Local aArea := GetArea()
     
    RecLock('SA1', .F.)
        SA1->A1_MSBLQL := '1'
    SA1->(MsUnlock())
     
    RestArea(aArea)
Return

User Function MBrowSB1()
    Local aArea := GetArea()
    Local cAlias      := 'SB1'
    Local aRotina   := {}

    Aadd(aRotina, {'Pesquisar',   'AxPesqui', 0, 1})
    Aadd(aRotina, {'Visualizar',  'AxVisual', 0, 2})
    Aadd(aRotina, {'Incluir',     'AxInclui', 0, 3})
    Aadd(aRotina, {'Alterar',     'AxAltera', 0, 4})
    Aadd(aRotina, {'Excluir',     'AxDeleta', 0, 5})


    DbSelectArea('SB1')
    DbSetOrder(1)

    MBrowse(NIL, NIL, NIL, NIL, cAlias)

    DbCloseArea()
    RestArea(aArea)

Return

User Function MuniCad()

    local aArea   := GetArea()
    local cAlias  := GetNextAlias()
    local cQuery  := ""
    local nCount  := 0
    local lValido := .T.

    cQuery := "SELECT " + CRLF
    cQuery += "     CC2_EST " + CRLF
    cQuery += "     ,CC2_CODMUN " + CRLF
    cQuery += "     ,CC2_MUN" + CRLF
    cQuery += "FROM " + RetSqlName('CC2') + CRLF
    cQuery += "WHERE CC2_EST = '"
    cQuery += M->CC2_EST  + "' AND CC2_MUN = '" + alltrim(M->CC2_MUN) + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DBGOTOP())

    While &(cAlias)->(!EOF())
        nCount++
        &(cAlias)->(DBSKIP())
    end

    if nCount > 1
        MSGStop("O município já existe!")
        lValido := .F.
    else
        lValido := .T.
    endif

    &(cAlias)->(DBCLOSEAREA())
    RestArea(aArea)

Return lValido
