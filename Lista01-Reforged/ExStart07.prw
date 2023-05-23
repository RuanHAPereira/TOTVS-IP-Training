#INCLUDE 'TOTVS.CH'

User Function RE007()
   
    Local cFruta  := ''
    Local nPreco := 0

    cFruta := FwInputBox('Quantas maçãs você comprou?' , cFruta)

    if VAL(cFruta) <12
        nPreco := VAL(cFruta) * 1.30
    else
        nPreco := VAL(cFruta) * 1.00
    endif

    FwAlertInfo('O custo total da compra foi: R$' + CVALTOCHAR(NoRound(nPreco,2)))
Return

/*7 - As maçãs custam R$ 1,30 cada se forem
 compradas menos de uma dúzia, e R$ 1,00 se forem
 compradas pelo menos 12. Escreva um programa
 que leia o número de maçãs compradas, calcule e
 escreva o custo total da compra.*/
