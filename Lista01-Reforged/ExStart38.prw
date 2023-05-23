#INCLUDE "TOTVS.CH"

User Function RE38()

    local nIdade := 0
    local nMaior := 0
    local nCont  := 0

    For nCont := 1 to 10
        nIdade := VAL(FwInputBox("Digite a idade da " + CVALTOCHAR(nCont) + "ª pessoa."))

        if nIdade >= 18
            nMaior++
        endif
    Next

    FwAlertSuccess(CVALTOCHAR(nMaior) + " pessoas são maiores de idade.")

Return 

// 38 - Faça um programa que receba a idade de dez
// pessoas e que calcule e mostre a quantidade de
// pessoas com idade maior ou igual a 18 anos.
