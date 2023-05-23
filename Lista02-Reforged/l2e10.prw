User Function E11()
    Local nNum :=''
    Local nMaior := 0
    Local nMenor := 9999
    Local nI := ''
    Local cMostra := ''

    for nI := 1 to 5 
        nNum := Val(FwInputBox("Digite o " + CVALTOCHAR(nI) + "º numero", ""))
        cMostra += CVALTOCHAR(nNum) + ", "

        if nNum > nMaior
            nMaior := nNum
        endif

        if nNum < nMenor
            nMenor := nNum
        endif 
    next   

    FwAlertInfo("Os numeros digitados: " + CRLF + cMostra + CRLF +;
    "Maior Valor digitado: " + CVALTOCHAR(nMaior) + CRLF + "Menor valor digitado: " + CVALTOCHAR(nMenor), "Maior e menor")
Return
