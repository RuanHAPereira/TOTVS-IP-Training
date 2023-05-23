
#INCLUDE 'TOTVS.CH'

User Function E172()
    Local nSort   := 0
    Local nChute  := 0
    Local lLoop   := .T.
    Local lOpcao  := 0
    Local nCont   := 1

    FwAlertInfo('Vamos jogar um jogo de adivinhação?')

    //Aqui o número é sorteado 'aleatóriamente'
    nSort := RANDOMIZE(0, 100)

    //Aqui o usuário coloca seu chute para tentar acertar o número.
    nChute := VAL(FwInputBox('Coloque aqui um número para ser seu chute.'))

    //Loop que irá checar se o número sorteado é maior, menor ou igual ao chute para definir a resposta que o usuário irá receber.
    While lLoop 
        If nSort > nChute
            MSGALERT('O número sorteado é maior que seu chute', 'Maior')

        Elseif nSort < nChute
            MSGALERT('O número sorteado é menor que seu chute', 'Menor')

        Else
            FwAlertSuccess('Parabéns, você acertou o número sorteado!')
            Exit
        Endif

        //Após cada erro o usuário pode escolher se deseja continuar jogando ou não.
        lOpcao := MSGYESNO('Deseja tentar novamente?', 'Não foi dessa vez')

        //Caso o usuário decida não continuar jogando, um alerta será disparado informando o número sorteado.
        If lOpcao == .F.
            FwAlertInfo('Que pena que você desistiu' + CRLF +;
            'O número sorteado era: ' + CVALTOCHAR(nSort), 'QUE PENA')
            Exit
        Endif

        nChute := VAL(FwInputBox('Coloque aqui um número para ser seu chute.'))
        
        //Contador que irá definir quantas tentativas foram realizadas.
        nCont++
    End

    //If que irá checar quantas tentativas foram feitas e dará uma resposta baseada na quantidade de tentativas.
    If nCont < 5
        FwAlertSuccess('Você é muito bom, acertou em ' + CVALTOCHAR(nCont) + ' tentativas.')
    Elseif nCont < 9
        FwAlertSuccess('Você é mediano, acertou em ' + CVALTOCHAR(nCont) + ' tentativas.')
    Elseif nCont < 13
        FwAlertSuccess('Você é fraco, te falta ódio, por isso acertou em ' + CVALTOCHAR(nCont) + ' tentativas.')
    Endif

Return

// • Em menos de 5 tentativas exibir a mensagem:
// “Você é muito bom, acertou em “x” tentativas.”
// • Em mais que 5 e menos que 9 tentativas:
// “Você é bom, acertou em “x” tentativas".
// • Em mais que 9 e menos que 13 tentativas:
// “Você é mediano, acertou em “x” tentativas”.
// • Em mais que 13: “Você é muito fraco, acertou
// em “x” tentativas”
