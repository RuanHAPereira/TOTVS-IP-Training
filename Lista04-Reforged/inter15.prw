
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function NewProdCad()

    local oDlg      := NIL 
    local cTitle    := 'Produtos' 
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
        Search()
    else
        FwAlertError('Cancelado pelo Usuário' , 'Cancelado!')
    endif 
    
Return 

Static Function Search()

    Local aArea       := GetArea()
    Local cAlias      := GetNextAlias()
    Local cQuery      := ''
    Local cMsg        := ''
    Local nCont       := 0
    Local lCad        := .F.
    Private cCadastro := 'Cadastro de Produtos'

    cQuery := "SELECT " + CRLF
    cQuery += "     B1_COD " + CRLF
    cQuery += "     ,B1_DESC " + CRLF
    cQuery += "     ,B1_PRV1 " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') +  CRLF
    cQuery += " ORDER BY B1_DESC ASC "

    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        If cCod == ALLTRIM(&(cAlias)->(B1_COD))
            cMsg += 'Código: ' + &(cAlias)->(B1_COD) + CRLF
            cMsg += 'Descrição: ' + &(cAlias)->(B1_DESC) + CRLF
            cMsg += 'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF
            cMsg += '--------------------' + CRLF + CRLF

            nCOnt++
        Endif

        &(cAlias)->(DbSkip())
    Enddo

    If nCOnt > 0
        FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
        FwAlertError('Código de produto inexistente no sistema')
        lCad := MSGYESNO('Deseja cadastrar este código?', 'Cadastrar?')
            If lCad == .T.

                AxCadastro('SB1', 'Cadastro de Produtos')
            Else
                FwAlertInfo('Cadastro recusado')
            Endif
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
    
Return
