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

	FwAlertSuccess('A média aritmética dos números entre 15 e 100 é: ' + CVALTOCHAR(nMedia))
Return

// 26 - Faça um algoritmo que calcule e escreva a
// média aritmética dos números inteiros entre 15
// (inclusive) e 100 (inclusive).
