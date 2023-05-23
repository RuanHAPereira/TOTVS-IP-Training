#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E5BD()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    Local nCont   := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     B1_COD " + CRLF
    cQuery += "     ,B1_DESC " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') +  CRLF
    cQuery += " ORDER BY B1_DESC ASC "

    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        cMsg += 'Código: ' + &(cAlias)->(B1_COD) + CRLF
        cMsg += 'Descrição: ' + &(cAlias)->(B1_DESC) + CRLF
        cMsg += '--------------------' + CRLF + CRLF

        nCont++

        If nCont == 5
            FwAlertInfo(cMsg, 'Dados do Produto')
            nCont := 0
            cMsg := ''
        Endif

        &(cAlias)->(DbSkip())
    Enddo

    If nCont > 0 
        FwAlertInfo(cMsg, 'Dados do Produto')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
