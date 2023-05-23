#INCLUDE 'TOTVS.CH'

User Function RE23()

	Local cValor     := ''
	Local nNegativos := 0
    Local nCont      := 0

	For nCont := 1 to 10
		cValor := FwInputBox('Digite o valor ', cValor)

		If Val(cValor) < 0
			nNegativos++
		EndIf
	Next

	FwAlertSuccess('Foram digitados ' + cValToChar(nNegativos) + ' valores negativos.')

Return

// • 23 - Ler 10 valores e escrever quantos desses
// valores lidos são NEGATIVOS.
