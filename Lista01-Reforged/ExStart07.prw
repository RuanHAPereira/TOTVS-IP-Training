#INCLUDE 'TOTVS.CH'

User Function RE007()
   
    Local cFruta  := ''
    Local nPreco := 0

    cFruta := FwInputBox('Quantas ma��s voc� comprou?' , cFruta)

    if VAL(cFruta) <12
        nPreco := VAL(cFruta) * 1.30
    else
        nPreco := VAL(cFruta) * 1.00
    endif

    FwAlertInfo('O custo total da compra foi: R$' + CVALTOCHAR(NoRound(nPreco,2)))
Return

/*7 - As ma��s custam R$ 1,30 cada se forem
 compradas menos de uma d�zia, e R$ 1,00 se forem
 compradas pelo menos 12. Escreva um programa
 que leia o n�mero de ma��s compradas, calcule e
 escreva o custo total da compra.*/
