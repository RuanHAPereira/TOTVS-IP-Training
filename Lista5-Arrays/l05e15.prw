#INCLUDE "TOTVS.CH"

User Function l5e15()
    Local aArray := {12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
    Local nI := 0
    Local nCont := 0
    Local nAux := 0

    for nCont := 1 to LEN(aArray)
        for nI := 1 to LEN(aArray)
            if aArray[nI] > aArray[nCont]
                nAux := aArray[nCont]
                aArray[nCont] := aArray[nI]
                aArray[nI] := nAux
            endif
        next
    next

    FwAlertInfo(ARRTOKSTR(aArray, ", ") + ".", "Array exibido com função.")

Return
