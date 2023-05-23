
#INCLUDE 'TOTVS.CH'

User Function E172()
    Local nSort   := 0
    Local nChute  := 0
    Local lLoop   := .T.
    Local lOpcao  := 0
    Local nCont   := 1

    FwAlertInfo('Vamos jogar um jogo de adivinha��o?')

    //Aqui o n�mero � sorteado 'aleat�riamente'
    nSort := RANDOMIZE(0, 100)

    //Aqui o usu�rio coloca seu chute para tentar acertar o n�mero.
    nChute := VAL(FwInputBox('Coloque aqui um n�mero para ser seu chute.'))

    //Loop que ir� checar se o n�mero sorteado � maior, menor ou igual ao chute para definir a resposta que o usu�rio ir� receber.
    While lLoop 
        If nSort > nChute
            MSGALERT('O n�mero sorteado � maior que seu chute', 'Maior')

        Elseif nSort < nChute
            MSGALERT('O n�mero sorteado � menor que seu chute', 'Menor')

        Else
            FwAlertSuccess('Parab�ns, voc� acertou o n�mero sorteado!')
            Exit
        Endif

        //Ap�s cada erro o usu�rio pode escolher se deseja continuar jogando ou n�o.
        lOpcao := MSGYESNO('Deseja tentar novamente?', 'N�o foi dessa vez')

        //Caso o usu�rio decida n�o continuar jogando, um alerta ser� disparado informando o n�mero sorteado.
        If lOpcao == .F.
            FwAlertInfo('Que pena que voc� desistiu' + CRLF +;
            'O n�mero sorteado era: ' + CVALTOCHAR(nSort), 'QUE PENA')
            Exit
        Endif

        nChute := VAL(FwInputBox('Coloque aqui um n�mero para ser seu chute.'))
        
        //Contador que ir� definir quantas tentativas foram realizadas.
        nCont++
    End

    //If que ir� checar quantas tentativas foram feitas e dar� uma resposta baseada na quantidade de tentativas.
    If nCont < 5
        FwAlertSuccess('Voc� � muito bom, acertou em ' + CVALTOCHAR(nCont) + ' tentativas.')
    Elseif nCont < 9
        FwAlertSuccess('Voc� � mediano, acertou em ' + CVALTOCHAR(nCont) + ' tentativas.')
    Elseif nCont < 13
        FwAlertSuccess('Voc� � fraco, te falta �dio, por isso acertou em ' + CVALTOCHAR(nCont) + ' tentativas.')
    Endif

Return

// � Em menos de 5 tentativas exibir a mensagem:
// �Voc� � muito bom, acertou em �x� tentativas.�
// � Em mais que 5 e menos que 9 tentativas:
// �Voc� � bom, acertou em �x� tentativas".
// � Em mais que 9 e menos que 13 tentativas:
// �Voc� � mediano, acertou em �x� tentativas�.
// � Em mais que 13: �Voc� � muito fraco, acertou
// em �x� tentativas�
