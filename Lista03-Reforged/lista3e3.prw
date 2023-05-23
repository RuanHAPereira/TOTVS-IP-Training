#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E3BD()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local nCont   := 0
    Local cMsg    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     PPDV.C6_PRODUTO " + CRLF
    cQuery += "     ,PPDV.C6_DESCRI " + CRLF
    cQuery += "     ,PPDV.C6_QTDVEN " + CRLF
    cQuery += "     ,PPDV.C6_PRUNIT " + CRLF
    cQuery += "     ,PPDV.C6_VALOR  " + CRLF
    cQuery += "FROM " + RetSqlName('SC5') + " PDV "  + CRLF
    cQuery += "INNER JOIN " + RetSqlName('SC6') + " PPDV ON  " + CRLF
    cQuery += "     PDV.C5_NUM = PPDV.C6_NUM " + CRLF
    cQuery += "WHERE " + CRLF
    cQuery += "     PDV.C5_NUM = 'PV0008'" + CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())

        cMsg += 'Código: ' +  (cAlias)->(C6_PRODUTO) + CRLF;
         + 'Descrição: ' + (cAlias)->(C6_DESCRI) + CRLF;
          + 'Qtd.: ' + cValToChar((cAlias)->(C6_QTDVEN)) + CRLF;
           + 'Val. Unit.: ' + cValToChar((cAlias)->(C6_PRUNIT)) + CRLF;
            + 'Val. Total: ' + cValToChar((cAlias)->(C6_VALOR)) + CRLF;
            + 'Val. Total: ' + Transform((cAlias)->(C6_VALOR), PesqPict("SC6", "C6_VALOR")) + CRLF
        cMsg += '--------------------' + CRLF + CRLF

        nCont++

        If nCont == 5
            FwAlertInfo(cMsg, 'Dados do Produto')
            nCont := 0
            cMsg := ''
        Endif
        (cAlias)->(DbSkip())
    Enddo

    If nCont > 0 
        FwAlertInfo(cMsg, 'Dados do Produto')
    Endif

    (cAlias)->(DbCloseArea())
    RestArea(aArea)
    
Return
