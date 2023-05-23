#INCLUDE "TOTVS.CH"

User Function Ex4()
    local nValorA := ''
    local nValorB := ''

    nValorA := Val(FwInputBox("Digite o valor A" ,nValorA)) 
    nValorB := Val(FwInputBox("Digite o valor B" ,nValorB)) 

     Alert("O valor de A e: " + alltrim(str((nValorA-nValorB)^2)))
Return 
