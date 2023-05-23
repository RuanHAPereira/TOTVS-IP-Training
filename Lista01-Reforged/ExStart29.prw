#INCLUDE 'TOTVS.CH'

user function Ex029()

    Local nRecebe := 0
    local aArray1 := {}
    local aArray2 := {}
    local nNum    := 0
    Local cMsg    := ''
    Local nCont   := 0

    for nCont := 1 to 10
        nRecebe := VAL(FwInputBox('Digite o ' + ALLTRIM(STR(nCont)) + 'º número do vetor'))
        AADD(aArray1, nRecebe)
    next

    nNum := VAL(FwInputBox('Digite um número para multiplicar pelo vetor'))

    for nCont := 1 to 10
        AADD(aArray2,aArray1[nCont] * nNum)
        
    next

    for nCont := 1 to 10
        If nCont < 10
            cMsg += (ALLTRIM(STR(aArray2[nCont])) + ',')
        Else
            cMsg += (ALLTRIM(STR(aArray2[nCont])) + '.')
        Endif
    next

    FwAlertSuccess('Vetor resultado: ' + cMsg)

return

// 29 - Ler um vetor aArray1 de 10 números. Após, ler
// mais um número e guardar em uma variável nNum.
// Armazenar em um array aArray2 o resultado de
// cada elemento de aArray1 multiplicado pelo valor
// nNum. Logo após, imprimir o vetor aArray2.
