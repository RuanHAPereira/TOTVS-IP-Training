#include "TOTVS.CH"

User Function E12()

    Local nNum := 0
    Local cMult := ""
    Local nCont := 0

    for nNum := 1 to 100
        if nNum % 3 == 0
            if nCont > 0
                cMult += ", "
            endif 
            cMult += CVALTOCHAR(nNum)
            nCont++
        endif 
    next      
   
    FwAlertSuccess("Numeros multiplos de 3 ente 1 e 100:   " + CRLF + cMult, "Resultado!")

Return 

