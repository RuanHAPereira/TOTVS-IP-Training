
#INCLUDE 'TOTVS.CH'

User Function RE13()
    Local cNome := ''
    Local cValor := ''
    Local cQuant := ''

    cNome := FwInputBox('Insira o nome do seu produto: ', cNome)
    cValor := FwInputBox('Insira o valor unit�rio do seu produto: ', cValor)
    cQuant :=  FwInputBox('Insira a quantidade deste produto que voc� comprou: ', cQuant)
Return

/*13 - Fa�a um algoritmo para ler: a descri��o do produto (nome), a quantidade adquirida e o pre�o unit�rio.
 Calcular e escrever o total (total = quantidade adquirida * pre�o unit�rio), o desconto e o total a pagar (total a pagar = total - desconto),
 sabendo-se que:
 o Se quantidade <= 5 o desconto ser� de 2%
 o Se quantidade > 5 e quantidade <= 10 o
 desconto ser� de 3%
 o Se quantidade > 10 o desconto ser� de 5%*/
