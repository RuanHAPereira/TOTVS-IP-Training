#INCLUDE 'TOTVS.CH'

User Function RE30()

    Local nNumero := 0
    Local nCont   := 0
    Local cMsg    := ''
    Local aArray1 := {}

    For nCont := 1 to 10
        nNumero := VAL(FwInputBox('Digite aqui o ' + ALLTRIM(STR(nCont)) + 'º número do array.'))
        AADD(aArray1, nNumero)
    Next

    For nCont := 10 to 1 Step -1
        If nCont != 1
            cMsg += (ALLTRIM(STR(aArray1[nCont])) + ',')
        Else
            cMsg += (ALLTRIM(STR(aArray1[nCont])) + '.')
        Endif
    Next

    FwAlertSuccess('Vetor resultante com os números na ordem inversa é: ' + cMsg)

return

// 30 - Faça um algoritmo para ler 10 números e
// armazenar em um array. Após a leitura total dos 10
// números, o algoritmo deve escrever esses 10
// números lidos na ordem inversa.
