#INCLUDE 'TOTVS.CH'

User Function RE24()

	Local cValor  := 0
	Local nDentro := 0
	Local nFora   := 0
    Local cDentro := ''
    Local cFora   := ''
    Local nI      := 0

	For nI := 1 to 10
		cValor := VAL(FwInputBox('Digite o valor '))
		If cValor >= 10 .and. cValor <= 20
			nDentro++
            cDentro += ALLTRIM(STR(cValor)) + ','            
		Else
			nFora++
            cFora += ALLTRIM(STR(cValor)) + ','
		EndIf
	Next
	FwAlertSuccess(CVALTOCHAR(nDentro) + ' valores est�o dentro do intervalo [10, 20]. ' + CVALTOCHAR(nFora) + ' valores est�o fora do intervalo.')
    FwAlertSuccess('Os valores que est�o dentro do intervalo [10, 20] s�o: ' + cDentro + '. E os que est�o fora do intervalo s�o: ' + cFora + '.')

Return

// 24 - Ler 10 valores e escrever quantos desses
// valores lidos est�o no intervalo [10, 20] (incluindo
// os valores 10 e 20 no intervalo) e quantos deles
// est�o fora deste intervalo.
