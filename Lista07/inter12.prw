#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function HoraPedido()

    Local nOpcao   := 0
    Local cTitle   := 'Cálculos' // Título
    Local cTexto   := 'Calculando'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Variável objeto que recebe os componentes da caixa de diálogo
    Private dData1 := SPACE(10)
    Private dData2 := SPACE(10)

    //Cria uma caixa de diálogo no padrão Windows com o título da variável cTítulo que começa no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficará dentro da janela de diálogo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto           SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'Data inicial'   SIZE 55, 07 OF oDlg PIXEL
    @ 030, 040  MSGET dData1         SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET irá abrir uma área de input que salvará a informação dentro de uma variável.
    @ 050, 010  SAY 'Data final'     SIZE 55, 07 OF oDlg PIXEL
    @ 050, 040  MSGET dData2         SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de diálogo oDlg centralizada     

    if nOpcao == 1
        RelatoData()
    Else
        FwAlertError('CANCELADO PELO USUÁRIO', 'CANCELADO')
    endif
Return

Static Function RelatoData() 

    Local aArea     := GetArea()
    Local cAlias    := GetNextAlias()
    Local cQuery    := ""
    Local cMsg      := ""
    Local nCont     := 0
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

    dData1 := ctod(dData1)
    dData2 := ctod(dData2)

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
