#INCLUDE "TOTVS.CH"

User Function E13()
    Local nNum  := nCont := 0
    Local nMult := nLimite := 0
    Local cMult := ""

    nMult   := Val(FwInputBox("Qual o numero do multiplo?"))
    nLimite := Val(FwInputBox("Qual o numero limite?"))

    for nCont := 1 to nLimite
        if nCont % nMult = 0
            nNum := nCont
            cMult+= CVALTOCHAR(nNum) + " "
        endif
    next   
Return
