#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E9BD()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    lOCAL cCod    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'
    
    cCod := FwInputBox('Insira o código do produto.', cCod)

    cQuery := "SELECT " + CRLF
    cQuery += "     C6_NUM " + CRLF
    cQuery += "     ,C6_PRODUTO " + CRLF
    cQuery += "FROM " + RetSqlName('SC6') +  CRLF
    cQuery += "WHERE C6_PRODUTO = '" + cCod + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())


    While &(cAlias)->(!EOF())
       
            cMsg += ALLTRIM(&(cAlias)->(C6_NUM)) + ', '

        &(cAlias)->(DbSkip())
    Enddo

        FwAlertInfo(cMsg, 'Pedidos de compra do produto' + cCod, cCod)

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
