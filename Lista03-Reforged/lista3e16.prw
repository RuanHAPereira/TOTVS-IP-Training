#INCLUDE 'TOTVS.CH'

User Function L3E16()

    Local cNome   := ''
    Local cMsg    := ''
    Local nCont   := 0

    cNome := FwInputBox('Digite aqui seu nome', cNome)

    //Neste loop ele ir� percorrer o nome todo de tr�s pra frente e concaten�-lo ao contr�rio em cMsg
    For nCont := Len(cNome) to 1 Step -1
        cMsg += Substr(cNome, nCont, 1)
    Next

    FwAlertSucces('Seu nome ao contr�rio �: ' + UPPER(cMsg), 'Ol�, ' + UPPER(cMsg))

Return 
