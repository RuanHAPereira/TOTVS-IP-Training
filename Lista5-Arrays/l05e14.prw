#INCLUDE "TOTVS.CH"

User Function l5e14()
    Local aArray  := {}
    Local cLetra  := 0
    Local nRepete := 0

    while LEN(aArray) < 12
        cLetra := CHR(RANDOMIZE(97, 122))
        nRepete := ASCAN(aArray, cLetra, 1, LEN(aArray))

            if nRepete == 0
                AADD(aArray, cLetra)
            endif
    enddo

    LetraMin(aArray)
Return 

Static Function LetraMin(aArray)
    Local cMsg := ""
    Local nCont   := 0

    for nCont := 1 to LEN(aArray)
        if nCont < 12
            cMsg += CVALTOCHAR(aArray[nCont]) + ", "
        else 
            cMsg += CVALTOCHAR(aArray[nCont]) + ", "
        endif
    next

    FwAlertInfo(cMsg, 'Conteúdo do Array:')
Return
