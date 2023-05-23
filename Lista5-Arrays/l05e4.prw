#INCLUDE "TOTVS.CH"

User Function nomeFunction(param_name)
    Local aArray := {}
    Local nCont := 0
    Local cMsg := ""

    for nCont := 2 to 20 step 2
        AADD(aArray, nCont)
    next 

    for nCont := 1 to 10
        if nCont < 10
            cMsg += CVALTOCHAR(aArray[nCont]) + ", "
        else
            cMsg += CVALTOCHAR(aArray[nCont]) + ", "
        endif 
    next 

    FwAlertInfo(cMsg, "Os itens do Array!")
Return 
