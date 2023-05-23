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

    FwAlertInfo("O array A é: " + ARRTOKSTR(aVetorA) + CRLF +;
                "O array B é: " + ARRTOKSTR(aVetorB) + CRLF +;
                "O array C que é a soma de A e B então será: " + ARRTOKSTR(aVetorC) + CRLF)
Return
