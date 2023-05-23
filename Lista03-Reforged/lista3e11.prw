#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E11BD()

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
    cQuery += "     A2_EST = 'SP'"

    
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
            cMsg := ''
        Endif

        &(cAlias)->(DbSkip())
    Enddo

    If nCont > 0 
        FwAlertInfo(cMsg, 'Fornecedores Situados em SP')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
