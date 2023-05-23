#INCLUDE 'TOTVS.CH'

User Function RE008()
    Local cHoraReg    := ''
    Local cSemana     := ''
    Local nBancoHoras := 0
    Local nHoraExtra  := 0
    Local nSalario    := 0
    Local nCont       := 0

    cHoraReg := FwInputBox('Coloque aqui quanto o funcion�rio recebe por hora: ', cHoraReg)

    For nCont := 1 TO 4
        cSemana := FwInputBox('Coloque aqui quanto o funcionario trabalhou na ' + CVALTOCHAR(nCont) + '� semana', cSemana)
        nBancoHoras+= VAL(cSemana)
    Next

    If nBancoHoras > 160
        nHoraExtra := (nBancoHoras - 160)*(VAL(cHoraReg)*1.5)
        nSalario := (nBancoHoras*VAL(cHoraReg)) + nHoraExtra

        FwAlertInfo('O sal�rio do funcion�rio �: R$' + CVALTOCHAR(NoRound(nSalario,2)) + CRLF + 'Onde ele recebeu de hora extra: R$' + CVALTOCHAR(NoRound(nHoraExtra,2)))
    Else
        nSalario := (nBancoHoras*VAL(cHoraReg))
        FwAlertInfo('O sal�rio do funcion�rio �: R$' + CVALTOCHAR(NoRound(nSalario,2)))
    Endif
          
Return

/*8 - A jornada de trabalho semanal de um
funcion�rio � de 40 horas. O funcion�rio que
trabalhar mais de 40 horas receber� hora extra,
cujo c�lculo � o VALor da hora regular com um
acr�scimo de 50%.
Escreva um algoritmo que leia o n�mero de horas
trabalhadas em um m�s, o sal�rio por hora e
escreva o sal�rio total do funcion�rio, que dever�
ser acrescido das horas extras, caso tenham sido
trabalhadas (considere que o m�s possua 4
semanas exatas).*/

