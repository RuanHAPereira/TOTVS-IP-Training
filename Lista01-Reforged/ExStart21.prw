User Function RE21()
	Local nNum    := 1
	Local cN      := ''
    Local cMSG := ''

	cN := FwInputBox("Digite o valor de N: ", cN)
        cN := VAL(cN)

	Do While nNum <= cN
        if nNum < cN
            cMSG := cMSG + ALLTRIM(STR(nNum) + ', ')
        else
            cMSG := cMSG + ALLTRIM(STR(nNum) + '. ')
        endif 
		nNum++
	EndDo
    FwAlertSuccess('Os n�meros entre 1 e ' + CVALTOCHAR(cN) + 's�o: ' + cMSG)

Return

// 21 - Ler um valor N e imprimir todos os valores
// inteiros entre 1 (inclusive) e N (inclusive).
// Considere que o N ser� sempre maior que ZERO.
