#INCLUDE 'TOTVS.CH'

User Function L3E17()

    Local cNome   := ''
    Local cMsg    := ''
    Local nCont   := 0

    //Nome já é recebido em maiúsculo
    cNome := Upper(FwInputBox('Escreva seu nome', cNome))

    //Aqui ele já concatena o nome dentro de cMsg já salvando 1 letra em cada linha
    For nCont := 1 to Len(cNome)
        cMsg += SUBSTR(cNome, nCont, 1) + CRLF
    Next

    FwAlertSucces('O Resultado ficou assim: ' + CRLF + CRLF + cMsg, cNome)
Return
