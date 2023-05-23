#INCLUDE 'TOTVS.CH'

User Function E11()
    Local aEscolha := {'For', 'While'}

    //Aqui o usuário poderá escolher com qual Loop os números serão gerados.
    aEscolha := Aviso('Escolha a função que o programa utilizará', 'Faça sua escolha', aEscolha, 1)

    If aEscolha == 1
        FunFor()
    Else
        FunWhile()
    Endif
Return 

Static Function FunFor()
    Local cNums := ''
    Local nI    := 1

    //Estrutura de Loop de 1 a 50 utilizando For e concatenando os números na variável cNums.
    For nI := 1 to 50
        If nI < 50
            cNums += cValToChar(RANDOMIZE(10, 99)) + ', '
        Else 
            cNums += cValToChar(RANDOMIZE(10, 99)) + '.'
        Endif
    Next

    FwAlertSuccess('O números gerados foram: ' + CRLF + cNums)
Return

Static Function FunWhile()
    Local cNums := ''
    Local nI    := 1

    //Estrutura de Loop de 1 a 50 utilizando While e concatenando os números na variável cNums.
    While nI <= 50
        If nI < 50
            cNums += cValToChar(RANDOMIZE(10, 99)) + ', '
        Else 
            cNums += cValToChar(RANDOMIZE(10, 99)) + '.'
        Endif
        nI++
    End

    FwAlertSuccess('O números gerados foram: ' + CRLF + cNums)

Return

// 11 - Elaborar um programa que exiba na tela,
// automaticamente, 50 valores gerados
// aleatoriamente, entre 10 e 99. Fazer 2 versões
// desta solução:
// o 1a - Utilizando For
// o 2a – Utilizando While
