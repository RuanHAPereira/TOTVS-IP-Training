#INCLUDE "TOTVS.CH"

User Function E2_V2()
    Local aArray := {}
//   Local aArray2 := {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    Local nCont := 0
    Local cMsg := ""

    for nCont := 1 to 10 
        AADD(aArray, nCont)
    next

    for nCont := 10 to 1 step -1
        cMsg += CVALTOCHAR(aArray[ncont]) + ", "
    next
   /* for nCont := 1  to 10 
        aArray2[nCont] := "ruan"
        
    next
*/
    FwAlertInfo(cMsg, "Conteudo do Array: ")

//    FwAlertInfo(ARRTOKSTR(aArray2))
Return 
