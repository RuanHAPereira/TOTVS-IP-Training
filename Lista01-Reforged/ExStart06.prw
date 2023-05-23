#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE006()
    
    Local cFahrenh := ''
    Local nCelsius := ''

    cFahrenh := FwInputBox('Coloque aqui a temperatura em Fahrenheit que ser� transformada em Celsius', cFahrenh)

    While !EHNUMERO(cFahrenh)// Valida��o de entrada que determina se � um n�mero, seja ele positivo ou negativo.
        FwAlertError('Voc� n�o colocou uma temperatura v�lida' , 'Erro!')
        cFahrenh := FwInputBox('Coloque aqui a temperatura em Fahrenheit que ser� transformada em Celsius', cBase)
    End


    nCelsius := (VAL(cFahrenh) -32) * (5/9)

    FwAlertSuccess('A temperatura em Celsius �: ' + CVALTOCHAR(nCelsius))
Return

/*6 -Escreva um algoritmo para ler uma temperatura
 em graus Fahrenheit, calcular e escrever o valor
 correspondente em graus Celsius.
 Observa��o: Para testar se a sua resposta est�
 correta saiba que 100 graus Celsius = 212 graus
Fahrenheit. */
