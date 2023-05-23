#INCLUDE 'TOTVS.CH'

User Function RE35()

    Local nIdade := -1
    Local nMedia := 0
    Local nSoma  := 0
    Local nCont  := 0

    While nIdade <> 0
        nIdade := VAL(FwInputBox('Digite aqui a idade da pessoa, ou coloque 0 para finalizar e calcular a média')) 
        
        If nIdade <> 0
            nSoma += nIdade
            nCont++
        Endif

    ENDDO
    nMedia := nSoma / nCont

    FwAlertSuccess('A média da idade das pessoas é: ' + CVALTOCHAR(nMedia) + 'anos.')

RETURN

// 35 - Faça um programa que receba várias idades e
// que calcule e mostre a média das idades digitadas.
// Finalize o processo de entrada de dados digitando
// a idade igual a zero
