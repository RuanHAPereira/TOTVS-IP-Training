#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E10BD() 

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cCod    := ''
    Local nCont   := 0
    Local nMedia  := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     C6_QTDVEN " + CRLF
    cQuery += "     ,C6_PRODUTO " + CRLF
    cQuery += "FROM " + RetSqlName('SC6') +  CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := FwInputBox('Insira o código do produto.', cCod)

    While &(cAlias)->(!EOF())

        If cCod == ALLTRIM(&(cAlias)->(C6_PRODUTO))

                nMedia += &(cAlias)->(C6_QTDVEN)
                nCont++
        Endif

            &(cAlias)->(DbSkip())
    Enddo

    nMedia := nMedia / nCont

    If nCont > 0
        FwAlertSuccess('A média das vendas deste produto é: ' + cValToChar(nMedia), 'Media do produto nos pedidos de venda')
    Else
        FwAlertError('Código de produto inexistente no sistema')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
