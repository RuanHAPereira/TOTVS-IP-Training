#INCLUDE 'TOTVS.CH'

User Function L3E18()

    Local cNome   := ''
    Local cMsg    := ''
    Local nCont   := 0

    //Nome j� � recebido em mai�sculo
    cNome := UPPER(FwInputBox('Escreva seu nome', cNome))

    //Aqui ele j� concatena o nome dentro de cMsg j� salvando 1 letra em cada linha
    For nCont := 1 to Len(cNome)
        cMsg += SUBSTR(cNome, 1, nCont) + CRLF
    Next

    FwAlertSucces('O Resultado �: ' + CRLF + CRLF + cMsg, cNome)
Return
