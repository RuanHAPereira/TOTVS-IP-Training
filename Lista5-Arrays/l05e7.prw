#INCLUDE "TOTVS.CH"

User Function l5e7()
    Local aArrayA := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
    Local aArrayB := {}
    Local nCont   := 0
    Local cMsg := ''

    for nCont := 15 to 1 step -1
        AADD(aArrayB, aArrayA[nCont])
    next

    for nCont := 1 to 15
        If nCont < 15
            cMsg += CVALTOCHAR(aArrayB[nCont]) + ', '
        else 
            cMsg += CVALTOCHAR(aArrayB[nCont]) + '.'
        endif
    next

    FwAlertInfo(cMsg, 'Os itens contidos no array são...')
Return
