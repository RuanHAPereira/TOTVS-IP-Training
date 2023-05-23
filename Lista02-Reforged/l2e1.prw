#Include 'TOTVS.CH'

User Function E1()

    Local nNum1:= ''
    Local nNum2:= ''
    Local nResult:= 0

    nNum1 := VAL(FwInputBox('Digite o primeiro numero: ', nNum1))
    nNum2 := VAL(FwInputBox('Digite o segundo numero: ', nNum2))

    nResult = nNum1 + nNum2
        Alert("A soma sera: " + ALLTRIM(str(nResult)))
    nResult = nNum1 - nNum2
        Alert('A subtracao sera: ' + ALLTRIM(str(nResult)))
    nResult = nNum1 * nNum2
        Alert('O produto sera: ' + ALLTRIM(str(nResult)))
    nResult = nNum1 / nNum2
        Alert('A divisao sera:' + ALLTRIM(str(nResult)))
Return 
 
 
 
 
 