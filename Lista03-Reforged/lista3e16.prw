#INCLUDE 'TOTVS.CH'

User Function L3E16()

    Local cNome   := ''
    Local cMsg    := ''
    Local nCont   := 0

    cNome := FwInputBox('Digite aqui seu nome', cNome)

    //Neste loop ele irá percorrer o nome todo de trás pra frente e concatená-lo ao contrário em cMsg
    For nCont := Len(cNome) to 1 Step -1
        cMsg += Substr(cNome, nCont, 1)
    Next

    FwAlertSucces('Seu nome ao contrário é: ' + UPPER(cMsg), 'Olá, ' + UPPER(cMsg))

Return 
