#INCLUDE 'TOTVS.CH'

User Function l5e8()
    Local aArray := {'1', '2', '3', '4', '5', '6', '7', '8'}
    Local nCont  := 0

    for nCont := 8 to 1 step -1
        aAdd(aArray, aArray[nCont])
    next

    for nCont := 1 to 8
        ADEL(aArray, 1)
    next

    ASIZE(aArray, 8)

    FwAlertInfo(ARRTOKSTR(aArray))
Return
