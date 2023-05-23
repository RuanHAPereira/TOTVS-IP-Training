#INCLUDE 'TOTVS.CH'

User Function RE004()
    Local cSalario  := ''
    Local cReajuste := ''
    Local nSalFinal := ''
    
    cSalario  := FwInputBox('Digite aqui o salário mensal atual do funcionário.', cSalario)

    cReajuste := FwInputBox('Agora digite o percentual de reajuste do salário.', cReajuste)

    nSalFinal := Val(cSalario) + (Val(cSalario)*(Val(cReajuste)/100))

    FwAlertSuccess('O novo salário do funcionário é: ' + cValToChar(nSalFinal))

Return 
