#INCLUDE 'TOTVS.CH'

User Function RE20()
	Local nNum := 101                     //Variavel declarada maior que 100
	
	Do While nNum <= 110                   // While  para executar uma contagem dos 10 primeiros numeros maiores que 100 
		FwAlertInfo(cValToChar(nNum))
		nNum++                            // Contador para somar uma unidade a cada volta no WHILE
	EndDo
Return

// 20 - Escreva um algoritmo para imprimir os 10
// primeiros números inteiros maiores que 100.
