
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function CliEstado()

    Local nOpcao    := 0
    Local cTitle    := 'Fornecedores' // Título
    Local cTexto    := 'Estado'
    Local nJanLarg  := 150
    Local nJanAltu  := 150
    Local oGrpLog
    Private oDlg    := NIL // Variável objeto que recebe os componentes da caixa de diálogo
    Private cEstado := SPACE(2)


    //Cria uma caixa de diálogo no padrão Windows com o título da variável cTítulo que começa no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    @ 003, 001     GROUP oGrpLog TO (nJanAltu/2)-1, (nJanLarg/2)-3         PROMPT cTexto     OF oDlg PIXEL

        //Item que ficará dentro da janela de diálogo ('OF' define o componente pai)
        @ 020, 010  SAY 'Estado do Fornecedor'   SIZE 55, 07 OF oDlg PIXEL
        @ 030, 010  MSGET cEstado                SIZE 55, 07 OF oDlg PIXEL PICTURE '@9'//MSGET irá abrir uma área de input que salvará a informação dentro de uma variável.


    DEFINE SBUTTON FROM 060, 010 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 060, 040 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de diálogo oDlg centralizada     

    if nOpcao == 1
        PegaEstado()
    Else
        FwAlertError('CANCELADO PELO USUÁRIO', 'CANCELADO')
    endif

Return

Static Function PegaEstado()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    Local nCont   := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     A2_COD " + CRLF
    cQuery += "     ,A2_NOME " + CRLF
    cQuery += "FROM " + RetSqlName('SA2') +  CRLF
    cQuery += "WHERE " + CRLF
    cQuery += "     A2_EST = '" + Upper(cEstado) + "'"

    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        cMsg += 'Código Fornecedor: ' + &(cAlias)->(A2_COD) + CRLF
        cMsg += 'Nome Fornecedor: ' + &(cAlias)->(A2_NOME) + CRLF
        cMsg += '--------------------' + CRLF + CRLF

        nCont++

        If nCont == 10
            FwAlertInfo(cMsg, 'Fornecedores Situados em SP')
            nCont := 0
            cMsg  := ''
        Endif

        &(cAlias)->(DbSkip())
    Enddo

    If nCont > 0 
        FwAlertInfo(cMsg, 'Fornecedores Situados em ' + cEstado)
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
    
Return 
