#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE002()

    local cBase     := ""
    local cAltura   := ""
    local nArea     := 0

    cBase := FwInputBox('Digite o tamanho da base do retângulo em centímetros', cBase)

    While !NUMBER(cBase)// VALidação de entrada que determina se é um número, seja ele positivo ou negativo.
        FwAlertError('Você não colocou um número' , 'Error')
        cBase := FwInputBox('Digite o tamanho da base do retângulo em centímetros', cBase)
    End

    cAltura := FwInputBox('Digite o tamanho da altura do retângulo em centímetros', cAltura)

    While !NUMBER(cAltura)// VALidação de entrada que determina se é um número, seja ele positivo ou negativo.
        FwAlertError('Você não digitou um número' , 'Error')
        cAltura := FwInputBox('Digite o tamanho da altura do retângulo em centímetros', cAltura)
    End

    nArea := (VAL(cBase) * VAL(cAltura))

    FwAlertSuccess('A área do retângulo é: ' + CVALTOCHAR(nArea) + 'cm²' , 'Área retângulo')

Return
