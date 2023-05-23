#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function PedVendas()

    local oDlg      := NIL 
    local cTitle    := 'Vendas do Produto' 
    local cIten     := 'Código: ' 
    local nOpcao    := 0
    private cCod    := Space(6) 

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 080, 300 PIXEL 

    @ 014, 010 SAY cIten  SIZE 55, 07 OF oDlg PIXEL 
    @ 014, 050 MSGET cCod SIZE 20, 07 OF oDlg PIXEL 

    DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg 
    DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg 

    ACTIVATE MSDIALOG oDlg CENTERED   

    if nOpcao == 1
        Vendas()
    else
        FwAlertError('Cancelado pelo Usuário' , 'Cancelado!')
    endif 

Return 

Static Function Vendas()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     C6_NUM " + CRLF
    cQuery += "     ,C6_PRODUTO " + CRLF
    cQuery += "FROM " + RetSqlName('SC6') +  CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

       If cCod == ALLTRIM(&(cAlias)->(C6_PRODUTO))
       
            cMsg += &(cAlias)->(C6_NUM) + ', '

        Endif

        &(cAlias)->(DbSkip())
    Enddo

        FwAlertInfo(cMsg, 'Pedidos de compra do produto', cCod)

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return
