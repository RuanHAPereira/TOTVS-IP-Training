#INCLUDE 'TOTVS.CH'

User Function RE31()

    Local nNumero := 0
    Local nCont   := 0
    Local cMsg    := ''
    Local aArray1 := {}

    For nCont := 1 to 10
        nNumero := VAL(FwInputBox('Digite aqui o ' + ALLTRIM(STR(nCont)) + '� n�mero do array.'))
        AADD(aArray1, nNumero)
    Next

    ASORT(aArray1)

    For nCont := 1 to 10
        If nCont < 10
           cMsg    += (ALLTRIM(STR(aArray1[nCont])) + ',')
        Else
          cMsg    += (ALLTRIM(STR(aArray1[nCont])) + '.')
        Endif
    Next

  FwAlertSuccess('Vetor resultante com os n�meros na ordem inversa �: ' + cMsg)   

return

// 31 - Fa�a um algoritmo para ler 10 n�meros e
// armazenar em um array. Ap�s isto, o algoritmo deve
// ordenar os n�meros no array em ordem crescente.
// Escrever o vetor ordenado.
