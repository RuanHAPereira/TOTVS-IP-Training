#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE002()

    local cBase     := ""
    local cAltura   := ""
    local nArea     := 0

    cBase := FwInputBox('Digite o tamanho da base do ret�ngulo em cent�metros', cBase)

    While !NUMBER(cBase)// VALida��o de entrada que determina se � um n�mero, seja ele positivo ou negativo.
        FwAlertError('Voc� n�o colocou um n�mero' , 'Error')
        cBase := FwInputBox('Digite o tamanho da base do ret�ngulo em cent�metros', cBase)
    End

    cAltura := FwInputBox('Digite o tamanho da altura do ret�ngulo em cent�metros', cAltura)

    While !NUMBER(cAltura)// VALida��o de entrada que determina se � um n�mero, seja ele positivo ou negativo.
        FwAlertError('Voc� n�o digitou um n�mero' , 'Error')
        cAltura := FwInputBox('Digite o tamanho da altura do ret�ngulo em cent�metros', cAltura)
    End

    nArea := (VAL(cBase) * VAL(cAltura))

    FwAlertSuccess('A �rea do ret�ngulo �: ' + CVALTOCHAR(nArea) + 'cm�' , '�rea ret�ngulo')

Return
