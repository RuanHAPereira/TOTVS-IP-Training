
#INCLUDE 'TOTVS.CH'

User Function RE009()
    Local cValor := ''

    cValor := FwInputBox('Insira um n�mero', cValor)

    If VAL(cValor) > 0
        FwAlertInfo('O VaLor inserido � positivo!')
    Elseif VAL(cValor) < 0
        FwAlertInfo('O VaLor inserido � negativo!')
    Else
        FwAlertInfo('O VaLor inserido � zero!')
    ENDIF
Return

//9 - Ler um VALor e escrever se � positivo, negativo ou zero
