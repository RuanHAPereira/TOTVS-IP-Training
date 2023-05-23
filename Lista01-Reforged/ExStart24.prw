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
	FwAlertSuccess(CVALTOCHAR(nDentro) + ' valores estão dentro do intervalo [10, 20]. ' + CVALTOCHAR(nFora) + ' valores estão fora do intervalo.')
    FwAlertSuccess('Os valores que estão dentro do intervalo [10, 20] são: ' + cDentro + '. E os que estão fora do intervalo são: ' + cFora + '.')

Return

// 24 - Ler 10 valores e escrever quantos desses
// valores lidos estão no intervalo [10, 20] (incluindo
// os valores 10 e 20 no intervalo) e quantos deles
// estão fora deste intervalo.
