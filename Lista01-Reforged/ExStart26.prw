#INCLUDE 'TOTVS.CH'

User Function RE26()
	Local nSoma := 0
	Local nQuant := 0
    Local nCont := 0

	For nCont := 15 to 100
		nSoma += nCont
		nQuant++
	Next

	nMedia := nSoma / nQuant

	FwAlertSuccess('A m�dia aritm�tica dos n�meros entre 15 e 100 �: ' + CVALTOCHAR(nMedia))
Return

// 26 - Fa�a um algoritmo que calcule e escreva a
// m�dia aritm�tica dos n�meros inteiros entre 15
// (inclusive) e 100 (inclusive).
