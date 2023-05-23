#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E7BD() 

    Local aArea     := GetArea()
    Local cAlias    := GetNextAlias()
    Local cQuery    := ""
    Local dData1    := ""
    Local dData2    := ""
    Local cMsg     := ""
    Local nCont     := 0
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

    dData1 := ctod(FwInputBox("Digite a data de início (DD/MM/AA):" ))
    dData2 := ctod(FwInputBox("Digite a data final (DD/MM/AA): "))

    cQuery := "SELECT * FROM " + RetSqlName('SC5') + " WHERE C5_EMISSAO >= '" + DTOS(dData1) + "' AND C5_EMISSAO <= '" + DTOS(dData2) + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
        cMsg += "Pedido: " + &(cAlias)->(C5_NUM) + " Data de Emissão: " + cvaltochar(StoD(&(cAlias)->(C5_EMISSAO))) + CRLF + CRLF

            If nCont == 6
                FwAlertInfo(cMsg, 'Pedidos')
                nCont := 0
                cMsg := ''
            Endif'
        nCont++
        &(cAlias)->(DbSkip())
    End
    If nCont > 0 
        FwAlertInfo(cMsg, 'Pedidos')
    Endif
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
