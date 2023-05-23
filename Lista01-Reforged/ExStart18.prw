#INCLUDE 'PROTHEUS.CH'

User Function RE18()
	Local nNum := 1

	Do While nNum <= 10
		FwAlertInfo(CVALTOCHAR(nNum))
		nNum++
	EndDo

    FwAlertSuccess('Contagem finalizada!')
    
Return

/* 18 - Escreva um algoritmo para imprimir os números
 de 1 (inclusive) a 10 (inclusive) em ordem
 crescente.*/
