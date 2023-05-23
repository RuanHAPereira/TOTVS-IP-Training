#INCLUDE 'TOTVS.CH'

User Function L3E15()

    Local aMes      := {'Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'}
    Local aTemp     := {}
    Local nTemp     := 0
    Local nMedia    := 0
    Local nSoma     := 0
    Local nCont     := 1
    Local cShow     := ''
    Local nI        := 0


    for nCont := 1 to 12  //Conta até 12 para preencher as temperaturas médias;
        nTemp := (FwInputBox('Digite a temperatura média do mês de ' + aMes[nCont] + ': '))
            nTemp := VAL(nTemp)
            aADD(aTemp , nTemp) //Insere os valores digitados na array.

            nSoma += nTemp
    next

    nMedia := nSoma / 12

    for nI := 1 to 12 //Percorre a array de temperatura procurando as temperaturas mais altas que a média.
        if aTemp[nI] > nMedia
            cShow += ('  ' + aMes[nI] + ' ' +  Alltrim(STR(aTemp[nI])) + CRLF) //Armazena a temperatura mais alta e o mês correspondente em uma string.
        endif
    next

    FwAlertSuccess('A temperatura média desse ano foi : ' + cValToChar(nMedia) + CRLF + ;
    'Os meses com temperatura acima da média foram: ' + cShow) //Mostra para o usuário a média anual e os meses com temperatura acima da média.

Return
