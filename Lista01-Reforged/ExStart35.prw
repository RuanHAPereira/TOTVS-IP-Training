#INCLUDE 'TOTVS.CH'

User Function RE35()

    Local nIdade := -1
    Local nMedia := 0
    Local nSoma  := 0
    Local nCont  := 0

    While nIdade <> 0
        nIdade := VAL(FwInputBox('Digite aqui a idade da pessoa, ou coloque 0 para finalizar e calcular a m�dia')) 
        
        If nIdade <> 0
            nSoma += nIdade
            nCont++
        Endif

    ENDDO
    nMedia := nSoma / nCont

    FwAlertSuccess('A m�dia da idade das pessoas �: ' + CVALTOCHAR(nMedia) + 'anos.')

RETURN

// 35 - Fa�a um programa que receba v�rias idades e
// que calcule e mostre a m�dia das idades digitadas.
// Finalize o processo de entrada de dados digitando
// a idade igual a zero
