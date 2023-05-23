#INCLUDE 'TOTVS.CH'

#DEFINE NOME_ALUNO 1
#DEFINE NOTA1 2
#DEFINE NOTA2 3
#DEFINE NOTA3 4
#DEFINE MEDIA 5

User Function l5e16()
    Local aArray := [4,5]
    Local nCont := 0
    Local nCont2 := 0
    Local cMsg := ''

    for nCont := 1 to 4
        for nCont2 := 1 to 5
            if nCont2 == 1
                aArray[nCont, NOME_ALUNO] := FwInputBox('Digite aqui o nome do ' + CVALTOCHAR(nCont) + 'º aluno:')
                cMsg += 'Nome:' + aArray[nCont, NOME_ALUNO] + CRLF

            elseif nCont2 > 1 .and. nCont2 < 5
                aArray[nCont, nCont2] := Val(FwInputBox('Digite aqui a ' + CVALTOCHAR(nCont2 - 1) + 'ª nota do aluno:'))
                cMsg += CVALTOCHAR(nCont2) + 'ª nota: ' + CVALTOCHAR(aArray[nCont, nCont2])
            else
                aArray[nCont, MEDIA] := ((aArray[nCont, NOTA1] + aArray[nCont, NOTA2] + aArray[nCont, NOTA3]) / 3)
                cMsg += 'Media: ' +  CVALTOCHAR(aArray[nCont, MEDIA]) + CRLF + '-----------------------------------------------' + CRLF
            endif
        next
    next

    FwAlertInfo(cMsg)
Return
