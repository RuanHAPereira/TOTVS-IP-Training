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

    FwAlertInfo('Os n�meros em ordem crescente s�o: ' + cResult)

Return

//� 10 - Ler 3 valores (considere que n�o ser�o informados valores iguais) e escrev�-los em ordem crescente.
