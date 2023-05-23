#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E12BD()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local aNomes  := {}
    Local aCod    := {}
    Local aVal    := {}
    Local cQuery  := ''
    Local cMsg    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     B1_COD " + CRLF
    cQuery += "     ,B1_DESC " + CRLF
    cQuery += "     ,B1_PRV1 " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') +  CRLF
    cQuery += " ORDER BY B1_PRV1 ASC "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        If (&(cAlias)->(B1_PRV1)) > 0
            AADD(aNomes, &(cAlias)->(B1_DESC))
            AADD(aCod, &(cAlias)->(B1_COD))
            AADD(aVal, &(cAlias)->(B1_PRV1))
        Endif
        
        &(cAlias)->(DbSkip())
    Enddo

    cMsg += 'Produto mais barato: ' + aNomes[1] + CRLF + ' Código: ' + aCod[1] + ' Preço: R$ ' + cValToChar(aVal[1]) + CRLF
    cMsg += 'Produto mais caro: ' + aNomes[len(aNomes)] + CRLF + ' Código: ' + aCod[len(aCod)] + ' Preço: R$ '  +cValToChar(aVal[len(aVal)]) + CRLF

    FwAlertSuccess(cMsg, 'Produto mais barato e mais caro')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
