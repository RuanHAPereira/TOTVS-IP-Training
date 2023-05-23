#INCLUDE "TOTVS.CH"

User Function l5e6()
    Local aArrayA := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    Local aArrayB := {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
    Local aArrayC := {}
    Local nCont   := 0
    Local cMsg := ''

    for nCont := 1 to 10
        AADD(aArrayC, aArrayA[nCont])
        AADD(aArrayC, aArrayB[nCont])
    next

    for nCont := 1 to 20 
        if nCont < 20
            cMsg += CVALTOCHAR(aArrayC[nCont]) + ', '
        else 
            cMsg += CVALTOCHAR(aArrayC[nCont]) + '.'
        endif
    next

    FwAlertInfo(cMsg, 'Itens contidos no array são...')

Return
