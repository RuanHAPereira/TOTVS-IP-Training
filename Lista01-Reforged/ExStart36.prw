#INCLUDE 'TOTVS.CH'

User function RE36()
    Local nNum    := 0
    Local nCont   := 0
    Local nResult := 0

    nNum := VAL(FwInputBox('Digite aqui um n�mero para saber seu fatorial.')) 

    nResult := nNum

    For nCont := nNUm to 2 step -1

            nResult := nResult * (nCont-1)
    NEXT

    if nNum == 0
        FwAlertSuccess('O resultado de ' + CVALTOCHAR(nNum) + '! �: 1')
    else 
        FwAlertSuccess('O resultado de ' + CVALTOCHAR(nNum) + '! �: ' + CVALTOCHAR(nResult))
    endif

RETURN

// 36 - Fa�a um programa para calcular n! (Fatorial
// de n), sendo que o valor inteiro de n � fornecido
// pelo usu�rio. Sabe-se que: 4! = 4 * 3 * 2 * 1
