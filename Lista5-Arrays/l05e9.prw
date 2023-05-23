#INCLUDE 'TOTVS.CH'

User Function l5e9()
    Local aArrayA   := {1, 2, 3, 4, 5, 6, 7, 8}
    Local aArrayB   := {}
    Local nCont := 0

    For nCont := 1 to 8
        AADD(aArrayB, aArrayA[nCont] * 3)
    Next

    FwAlertInfo(ARRTOKSTR(aArrayA), 'Array A: ')
    FwAlertInfo(ARRTOKSTR(aArrayB), 'Array B: ')
Return
