
#INCLUDE 'TOTVS.CH'

User Function RE005()
    local cCustoFab  := ''
    local cCustFinal := ''

    cCustoFab := FwInputBox('Insira o custo de f�brica do carro: ' , cCustoFab)
    cCustFinal := VAL(cCustoFab) + ((VAL(cCustoFab)*0.28)*0.45)
    
    FwAlertSuccess('O custo final do carro �: ' + CVALTOCHAR(cCustFinal))
Return

/*5 - O custo de um carro novo ao consumidor � a soma do custo de f�brica com a porcentagem do distribuidor e dos impostos (aplicados ao custo de
 f�brica). Supondo que o percentual do distribuidor seja de 28% e os impostos de 45%, escrever um algoritmo para ler o custo de f�brica de um carro,
 calcular e escrever o custo final ao consumidor.*/
