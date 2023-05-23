#INCLUDE 'TOTVS.CH'

User Function l5e10()
    Local aArrayA := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    Local aArrayB := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
    Local aArrayC := {}
    Local nCont   := 0

    aArrayC := aClone(aArrayA)

    for nCont := 1 to 15
        AADD(aArrayC, aArrayB[nCont])
    next

    FwAlertInfo(ARRTOKSTR(aArrayC), 'Array C:')
Return
