#INCLUDE 'TOTVS.CH'

User Function RE10()
    Local cVal    := ''
    Local aVal    := {}
    Local nCont   := 0
    Local cResult := ''

    For nCont := 1 To 3
        cVal := FwInputBox('Digite um valor: ', cVal)
        //aVal[nCont] := cVal
        AADD(aVal,VAL(cVal))
    Next

    ASORT(aVal)

    For nCont := 1 to LEN(aVal)
        if nCont < LEN(aVal)
            cResult += ALLTRIM(STR(aVal[nCont])) + ', '
        elseif nCont = 3
            cResult += ALLTRIM(STR(aVal[nCont])) + '.'
        endif    
    Next nCont

    FwAlertInfo('Os números em ordem crescente são: ' + cResult)

Return

//• 10 - Ler 3 valores (considere que não serão informados valores iguais) e escrevê-los em ordem crescente.
