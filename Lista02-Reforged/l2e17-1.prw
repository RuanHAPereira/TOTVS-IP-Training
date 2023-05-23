#INCLUDE 'TOTVS.CH'

User Function E171()
    Local nSort   := 0
    Local nChute  := 0
    Local lLoop   := .T.
    Local lOpcao  := 0

    FwAlertInfo('Vamos jogar um jogo de adivinhação?')

    //Aqui o número é sorteado 'aleatóriamente'
    nSort := RANDOMIZE(0, 100)

    //Aqui o usuário coloca seu chute para tentar acertar o número.
    nChute := Val(FwInputBox('Coloque aqui um número para ser seu chute.'))

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
            'O número sorteado era: ' + cValToChar(nSort), 'QUE PENA')
            Exit
        Endif

        nChute := Val(FwInputBox('Coloque aqui um número para ser seu chute.'))
    End

Return

// Parte 1: Elaborar um jogo do tipo adivinhe o
// número. Onde deverá ser sorteado um número
// entre 0 e 100. Em seguida solicitado que o usuário
// adivinhe qual foi o número sorteado. Após o
// “chute” do usuário apresentar uma mensagem
// informando se o número sorteado é maior, menor ou
// igual ao número “chutado”.
