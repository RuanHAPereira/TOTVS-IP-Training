#INCLUDE 'TOTVS.CH'

User Function RE004()
    Local cSalario  := ''
    Local cReajuste := ''
    Local nSalFinal := ''
    
    cSalario  := FwInputBox('Digite aqui o sal�rio mensal atual do funcion�rio.', cSalario)

    cReajuste := FwInputBox('Agora digite o percentual de reajuste do sal�rio.', cReajuste)

    nSalFinal := Val(cSalario) + (Val(cSalario)*(Val(cReajuste)/100))

    FwAlertSuccess('O novo sal�rio do funcion�rio �: ' + cValToChar(nSalFinal))

Return 
