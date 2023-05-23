#INCLUDE "TOTVS.CH"

User Function l5e11()
    local aArrayA    := {} 
    local aArrayB    := {} 
    local nAux  := 0
    local nCont := 0

    for nCont := 1 to 10
        aAdd(aArrayA, (RANDOMIZE(1 , 49)))
        nAux += aArrayA[nCont]
        aAdd(aArrayB, ( nAux ))
    next 

    FwAlertInfo('O Array B é: ' + ARRTOKSTR(aArrayB,", "))
Return
