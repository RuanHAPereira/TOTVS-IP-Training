#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE006()
    
    Local cFahrenh := ''
    Local nCelsius := ''

    cFahrenh := FwInputBox('Coloque aqui a temperatura em Fahrenheit que será transformada em Celsius', cFahrenh)

    While !EHNUMERO(cFahrenh)// Validação de entrada que determina se é um número, seja ele positivo ou negativo.
        FwAlertError('Você não colocou uma temperatura válida' , 'Erro!')
        cFahrenh := FwInputBox('Coloque aqui a temperatura em Fahrenheit que será transformada em Celsius', cBase)
    End


    nCelsius := (VAL(cFahrenh) -32) * (5/9)

    FwAlertSuccess('A temperatura em Celsius é: ' + CVALTOCHAR(nCelsius))
Return

/*6 -Escreva um algoritmo para ler uma temperatura
 em graus Fahrenheit, calcular e escrever o valor
 correspondente em graus Celsius.
 Observação: Para testar se a sua resposta está
 correta saiba que 100 graus Celsius = 212 graus
Fahrenheit. */
