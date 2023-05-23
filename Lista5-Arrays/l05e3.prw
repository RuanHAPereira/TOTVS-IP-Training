#INCLUDE "TOTVS.CH"

User Function l5e3()
    Local aArray := {}
    Local nCont := 0
    Local cMsg := ""

    for nCont := 1 to 30
        AADD(aArray, RANDOMIZE( 1, 30 ))
    next 

        for nCont := 1 to 30 
            if nCont < 30 
                cMsg += CVALTOCHAR( aArray[nCont]) + ", "
            else
                cMsg += CVALTOCHAR( aArray[nCont]) + ", "
            endif
        next
    

    FwAlertInfo(cMsg, "Contem no Array!")
Return
