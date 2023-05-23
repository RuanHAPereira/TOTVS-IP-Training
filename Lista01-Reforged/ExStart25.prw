#INCLUDE 'TOTVS.CH'

User Function RE25()
	Local nSoma  := 0
    Local cValor := ''
    Local nCont  := 0

	For nCont := 1 to 10
		cValor := VAL(FwInputBox('Digite o valor: '))
		nSoma += cValor
	Next

	FwAlertSuccess('A soma dos 10 valores digitados é: ' + AllTRIM(STR(nSoma)))

Return

// 25 - Escreva um algoritmo para ler 10 números e ao
// final da leitura escrever a soma total dos 10
// números lidos.
