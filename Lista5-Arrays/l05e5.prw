#INCLUDE "TOTVS.CH"

User Function l5e5()
    Local aVetorA := {}
    Local aVetorB := {}
    Local aVetorC := {}
    Local nCont   := 0

    for nCont := 1 to 20
        AADD( aVetorA, (RANDOMIZE( 1, 20 )))
        AADD( aVetorB, (RANDOMIZE( 1, 20 )))
        AADD( aVetorC, (aVetorA[nCont] + aVetorB[nCont]))
    next

    FwAlertInfo("O array A �: " + ARRTOKSTR(aVetorA) + CRLF +;
                "O array B �: " + ARRTOKSTR(aVetorB) + CRLF +;
                "O array C que � a soma de A e B ent�o ser�: " + ARRTOKSTR(aVetorC) + CRLF)
Return
