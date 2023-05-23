#INCLUDE 'TOTVS.CH'

User Function l5e17()
    Local oGrpTela
    Local oBtnConf
    Local oGrpArray
    Local oGrpBotoes
    Local nJanLarg := 300
    Local nJanAltu := 380
    Private lRetorno := .F.
    Private oDLG
    Private aArray := {}
    //Says e Gets
    Private oGetResult, cGetResult := ''
    Private oGetArray, cGetArray := ''


    DEFINE MSDIALOG oDLG TITLE "Login" FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
        //Grupo de Login
        @ 003, 001     GROUP oGrpTela TO (nJanAltu/15)-1, (nJanLarg/2)-3         PROMPT "Resultados: "     OF oDLG COLOR 0, 16777215 PIXEL
            @ 0010, 006   MSGET oGetResult VAR    cGetResult           SIZE (nJanLarg/2)-12, 010 OF oGrpTela COLORS 0, 16777215 NO BORDER PIXEL 
            oGetResult:lActive := .F.

        @ 023, 001     GROUP oGrpArray TO (nJanAltu/15)-1, (nJanLarg/2)-3         PROMPT "Array: "     OF oDLG COLOR 0, 16777215 PIXEL
            @ 025, 006   MSGET oGetArray VAR    cGetArray           SIZE (nJanLarg/2)-12, 012 OF oGrpArray COLORS 0, 16777215 NO BORDER PIXEL 
            oGetArray:lActive := .F.

        @ 040, 001 GROUP oGrpBotoes TO (nJanAltu/2.3)-1, (nJanLarg/2)-3         PROMPT "Ações: "     OF oDLG COLOR 0, 16777215 PIXEL
            @ 060, 006   BUTTON oBtnConf PROMPT "Carregar" SIZE 055, 015 OF oDLG ACTION (CarregaArray()) PIXEL
            @ 060, 088   BUTTON oBtnConf PROMPT "Exibir" SIZE 055, 015 OF oDLG ACTION (ExibeArray()) PIXEL
            @ 075, 006   BUTTON oBtnConf PROMPT "Crescente" SIZE 055, 015 OF oDLG ACTION (ArrayCresc()) PIXEL
            @ 075, 088   BUTTON oBtnConf PROMPT "Decrescente" SIZE 055, 015 OF oDLG ACTION (ArrayDecresc()) PIXEL
            @ 090, 006   BUTTON oBtnConf PROMPT "Pesquisar" SIZE 055, 015 OF oDLG ACTION (Pesquisa()) PIXEL
            @ 090, 088   BUTTON oBtnConf PROMPT "Somatoria" SIZE 055, 015 OF oDLG ACTION (ASoma()) PIXEL
            @ 105, 006   BUTTON oBtnConf PROMPT "Média" SIZE 055, 015 OF oDLG ACTION (AMedia()) PIXEL
            @ 105, 088   BUTTON oBtnConf PROMPT "Maior/Menor" SIZE 055, 015 OF oDLG ACTION (AMaioreMenor()) PIXEL
            @ 120, 006   BUTTON oBtnConf PROMPT "Embaralha" SIZE 055, 015 OF oDLG ACTION (AEmbaralha()) PIXEL
            @ 120, 088   BUTTON oBtnConf PROMPT "Repete" SIZE 055, 015 OF oDLG ACTION (ARepete()) PIXEL

        @ (nJanAltu/2)-18, 006 BUTTON oBtnConf PROMPT "Limpar" SIZE (nJanLarg/2)-12, 015 OF oDLG ACTION (LimpaArray()) PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED   

Return

Static Function CarregaArray()
    Local nContador := 0
    aArray := {}

    For nContador := 1 to 8
        AADD(aArray,Randomize(1, 99))
    Next

    cGetArray := 'Array: ' + (ArrTokStr(aArray, ", "))
    oGetArray:Refresh()
Return

Static Function ExibeArray()
    FwAlertInfo('Os números sorteados aleatoriamente foram: ' + CRLF + (ArrTokStr(aArray, ', ')), 'Array')
Return

Static Function ArrayCresc()

    ASORT(aArray)

    cGetResult := ArrTokStr(aArray, ", ")
    oGetResult:Refresh()
Return 
Return

Static Function ArrayDecresc()

    ASORT(aArray,,, { |x, y| x > y } )

    cGetResult := (ArrTokStr(aArray, ", "))
    oGetResult:Refresh()
Return

Static Function Pesquisa()
    Local nNum := 0
    Local nCont := 0
    Local cMsg  := ''

    nNum := Val(FwInputBox('Coloque aqui o número para encontrar a posição: '))

    For nCont := 1 to Len(aArray)
        If nNum == aArray[nCont]
            cMsg += 'Número ' + cValToChar(nNUm) + ' foi encontrado na posição ' + cValToChar(nCont) + CRLF
        Endif
    Next

    If cMsg == ' ' 
        FwAlertInfo('O número pesquisado não está dentro do Array')
    Else
        FwAlertSuccess(cMsg, 'O número foi encontrado')
    Endif
Return

Static Function ASoma()
    Local nSoma := 0
    Local nCont := 0

    For nCont := 1 to Len(aArray)
        nSoma += aArray[nCont]
    Next

    cGetResult := cValToChar(nSoma)
Return

Static Function AMedia()
    Local nSoma := 0
    Local nCont := 0
    Local nMedia := 0

    For nCont := 1 to Len(aArray)
        nSoma += aArray[nCont]
    Next

    nMedia := nSoma / Len(aArray)

    cGetResult := cValToChar(nMedia)
    oGetResult:Refresh()
Return

Static Function AMaioreMenor()
    Local nMaior := 0
    Local nMenor := 0

    ASORT(aArray)

    nMaior := ATAIL(aArray)
    nMenor := aArray[1]

    cGetResult := 'O maior valor é: ' + cValToChar(nMaior) + CRLF + 'E o menor valor é: ' + cValToChar(nMenor)
    oGetResult:Refresh()
Return

Static Function AEmbaralha()
    Local nCount   := 0
    Local nPosRan  := 0 
    Local nPosicao := 0 
    Local aPosicao := {} 
    Local aAux     := {}


    For nCount := 1 to 8
        nPosRan := RANDOMIZE(1, 9)
        nPosicao := aScan(aPosicao, nPosRan)
        if nPosicao == 0
            aadd(aPosicao, nPosRan)
            aadd(aAux, aArray[nPosRan])
        else
            nCount--
        endif
    Next
    cGetResult := ArrTokStr(aAux, ", ")
    oGetResult:Refresh()
Return

Static Function ARepete()
    local nCount   := 0
    local nCount2  := 0
    local cRepete  := ""


    for nCount := 1 to len(aArray)
        for nCount2 := (nCount + 1) to len(aArray)
            if aArray[nCount] == aArray[nCount2]
                cRepete += CRLF + 'O número ' + cvaltochar(aArray[nCount]) + ' se encontra nas posições ' + ALLTRIM(STR(nCount)) + ' e '+ ALLTRIM(STR(nCount2))
            endif
        next
    next

    MsgInfo(cRepete)

Return

Static Function LimpaArray()

    aArray := {}
    cGetResult := ''
    cGetArray  := ''
    oGetResult:Refresh()
    oGetArray:Refresh()
Return
