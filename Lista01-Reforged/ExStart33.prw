#INCLUDE 'TOTVS.CH'

User Function RE33()
    Local nNumero := 0
    Local aArray  := {}
    Local aPosi   := {{},{},{},{},{}}
    Local nCont   := 0
    Local nCont2  := 0
    Local cMsg    := ''


    For nCont := 1 to 5
        nNumero := VAL(FwInputBox('Digite aqui o ' + ALLTRIM(STR(nCont)) + '� n�mero do array.'))
        AADD(aArray, nNumero)
    Next

    For nCont := 1 to 5
        For nCont2 := 1 to 5
            If aArray[nCont] == aArray[nCont2]
                AADD(aPosi, aArray[nCont][nCont2])
            Endif
        Next
    Next

    For nCont := 1 to 5
        For nCont2 := 1 to 5
            cMsg := ''
            cMsg += (ALLTRIM(STR(aArray[nCont])) + ',')
        Next
        FwAlertSuccess('O n�mero na' + CVALTOCHAR(nCont) + 'posi��o, se repeta nas posi��es: ' + cMsg)
    Next

return

// 33 - Fa�a um algoritmo para ler 20 n�meros e
// armazenar em um array aNumeros, verificar e
// escrever se existem n�meros repetidos no array
// aNumeros e em que posi��es se encontram.
