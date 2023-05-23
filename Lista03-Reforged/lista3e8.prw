#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3E8BD()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    //SELECT TOP 1 para selecionar apenas a primeira linha da tabela
    cQuery := "SELECT TOP 1 " + CRLF
    cQuery += "     C6_DESCRI " + CRLF
    cQuery += "     ,C6_PRODUTO " + CRLF
    cQuery += "     ,C6_PRCVEN " + CRLF
    cQuery += "     ,C6_VALOR " + CRLF
    cQuery += "FROM " + RetSqlName('SC6') +  CRLF
    //Selecionando a ordem de maneira decrescente pelo valor, assim o valor mais alto ficará no topo
    cQuery += " ORDER BY C6_VALOR DESC "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    //Loop que irá percorrer toda nossa seleção do banco de dados
    While &(cAlias)->(!EOF())

        //cMsg concatenando os dados que serão mostrados para o usuário final.
        cMsg += 'Código: ' + &(cAlias)->(C6_PRODUTO) + CRLF
        cMsg += 'Descrição: ' + &(cAlias)->(C6_DESCRI) + CRLF
        cMsg += 'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(C6_PRCVEN))) + CRLF
        cMsg += 'Valor total: R$' + Alltrim(STR(&(cAlias)->(C6_VALOR))) + CRLF
        cMsg += '--------------------' + CRLF + CRLF
        
        //DbSkip para não gerar um loop infinito
        &(cAlias)->(DbSkip())
    Enddo

    //Mensagem que será mostrada para o cliente
    FwAlertSuccess(cMsg, 'Produto de maior valor total')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
