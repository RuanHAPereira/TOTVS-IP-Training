#INCLUDE 'TOTVS.CH'

User Function RE19()
	Local nNum := 10                       //atribui a variavel com valor de 10

	Do While nNum >= 1                     //aqui é o limite minimo que quero que a contagem chegue 
		FwAlertInfo(CVALTOCHAR(nNum))
		nNum--                             // nNum-- para ir diminuindo uma unidade a cada volta no DoWhile
	EndDo

    FwAlertSuccess('Contagem finalizada!')
    
Return

/* 19 - Escreva um algoritmo para imprimir os números
 de 1 (inclusive) a 10 (inclusive) em ordem
 decrescente.*/
