#INCLUDE "TOTVS.CH"

User Function l5e02()
    Local aArray := {}
    Local nCont := 1
    Local cMsg := ""

    for nCont := 1 to 10
         aAdd(aArray, FwInputBox('Digite o ' + cValToChar(nCont) + 'º número:'))
    next 

    for nCont := 10 to 1 step -1
        if nCont > 1
            cMsg += aArray[nCont] + ", "
        else
            cMsg += aArray[nCont] + ", "
        endif
    next

    FwAlertInfo(cMsg, "Ordem contrária")
Return
