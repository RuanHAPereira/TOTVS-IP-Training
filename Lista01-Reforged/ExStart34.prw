#INCLUDE 'TOTVS.CH'

User Function RE34()

    Local nIdade     := 0
    Local nSomaIdade := 0
    Local nPeso      := 0
    Local nPeso90    := 0
    Local nMedia     := 0
    local nCont      := 0

    For nCont := 1 to 7
        nIdade := VAL(FwInputBox('Digite aqui a idade da ' + ALLTRIM(STR(nCont)) + '� pessoa.'))
            nSomaIdade += nIdade

        nPeso := VAL(FwInputBox('Digite aqui o peso da  ' + ALLTRIM(STR(nCont)) + '� pessoa.'))

        If nPeso > 90
            nPeso90++
        Endif
    Next

    nMedia := nSomaIdade / 7

    FwAlertSuccess('A m�dia da idade das pessoas �: ' + CVALTOCHAR(nMedia))

    FwAlertSuccess('Pessoas com mais de 90 quilos: ' + CVALTOCHAR(nPeso90))

Return

// 34 - Fa�a um programa que receba a idade e o peso
// de sete pessoas. Calcule e mostre:
// o A quantidade de pessoas com mais de 90
// quilos
// o A m�dia das idades das sete pessoas
