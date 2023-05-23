#INCLUDE 'TOTVS.CH'

User Function l5e12()
    Local aArrayA := {1, 2, 3, 4, 5}
    Local aArrayB := {}
    Local nCont   := 0

    for nCont := 1 to 5
        AADD(aArrayB, (aArrayA[nCont] * -1))
    next

    FwAlertInfo(ARRTOKSTR(aArrayB), 'O Array B é: ')
Return
