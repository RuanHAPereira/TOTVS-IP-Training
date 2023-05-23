// 2 – Faça uma consulta na tabela SC5 para retornar todos os pedidos de Venda em que o “número da
// nota” (C5_NOTA) não foi preenchido.
// Apresente em uma mensagem quais são os números dos pedidos e o nome dos clientes.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E2BD()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cPed    := ''
    Local cNome   := ''
    Local cMsg    := ''
    Local nCont   := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     PV.C5_NUM " + CRLF
    cQuery += "     ,PV.C5_NOTA " + CRLF
    cQuery += "     ,CL.A1_NOME " + CRLF
    cQuery += "     ,PV.C5_CLIENTE " + CRLF
    cQuery += "     ,CL.A1_COD  " + CRLF
    cQuery += "FROM " + RetSqlName('SC5') + " PV "  + CRLF
    cQuery += "INNER JOIN " + RetSqlName('SA1') + " CL ON  " + CRLF
    cQuery += "     PV.C5_CLIENTE = CL.A1_COD " + CRLF
    cQuery += "WHERE " + CRLF
    cQuery += "     PV.C5_NOTA = ' '" + CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
        cPed  := &(cAlias)->(C5_NUM)
        cNome := &(cAlias)->(A1_NOME)

        cMsg += 'Pedido ' + cValToChar(nCont) + ': ' + cPed + CRLF
        cMsg += 'Cliente: ' + cNome + CRLF
        cMsg += '--------------------' + CRLF + CRLF

        &(cAlias)->(DbSkip())
        nCont++
    Enddo


    FwAlertInfo(cMsg, 'Pedidos de Venda com nº da nota em branco.')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return
