#INCLUDE 'TOTVS.CH'

User Function L3E18()

    Local cNome   := ''
    Local cMsg    := ''
    Local nCont   := 0

    //Nome já é recebido em maiúsculo
    cNome := UPPER(FwInputBox('Escreva seu nome', cNome))

    //Aqui ele já concatena o nome dentro de cMsg já salvando 1 letra em cada linha
    For nCont := 1 to Len(cNome)
        cMsg += SUBSTR(cNome, 1, nCont) + CRLF
    Next

    FwAlertSucces('O Resultado é: ' + CRLF + CRLF + cMsg, cNome)
Return
