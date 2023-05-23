
#INCLUDE 'TOTVS.CH'

User Function RE009()
    Local cValor := ''

    cValor := FwInputBox('Insira um número', cValor)

    If VAL(cValor) > 0
        FwAlertInfo('O VaLor inserido é positivo!')
    Elseif VAL(cValor) < 0
        FwAlertInfo('O VaLor inserido é negativo!')
    Else
        FwAlertInfo('O VaLor inserido é zero!')
    ENDIF
Return

//9 - Ler um VALor e escrever se é positivo, negativo ou zero
