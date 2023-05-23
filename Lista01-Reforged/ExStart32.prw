
#INCLUDE 'TOTVS.CH'

User Function RE32()

    local aArray1   := {}
    local aArray2   := {}
    local nCont     := 0
    local nNum      := 0
    local cPosScan  := ''
    local nCont2    := 0

    
    For nCont := 1 to 15
        nNum := VAL(FwInputBox('Digite o número para o primeiro array: ' + CVALTOCHAR(nCont) + '/15'))
        AADD(aArray1, nNum)
    next
    
    For nCont := 1 to 15
        nNum := VAL(FwInputBox('Digite o número para o segundo array: ' + CVALTOCHAR(nCont) + '/15'))
        AADD(aArray2, nNum)
    Next

    For nCont := 1 to 15
        
        if (aArray1[nCont]) == (aArray2[nCont])
                cPosScan += CVALTOCHAR(nCont) + ' ; '
                nCont2++
        endif
    Next

    if nCont2 > 0
        FwAlertInfo('Os arrays possuem números iguais nas posições:' + cPosScan)
    else
        FwAlertError('Não existem números em posições iguais entre os arrays.')
    endif 

Return

// 32 - Faça um algoritmo para ler dois arrays
// aArray1 e aArray2 de 15 números cada. Calcular e
// escrever a quantidade de vezes que aArray1 e
// aArray2 possuem os mesmos números e nas mesmas
// posições.
