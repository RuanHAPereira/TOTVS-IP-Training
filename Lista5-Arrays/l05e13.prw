#INCLUDE "TOTVS.CH"

User Function l5e13()
    local aArray := {}

    UPPERCASE(aArray)

    FwAlertInfo(ARRTOKSTR(aArray, " , "), 'Itens no array: ')

Return 

Static Function UPPERCASE(aArray)     
    local nCont := 0

    for nCont := 1 to 50
        AADD(aArray, (CHR(RANDOMIZE(65 , 90))))
    next 

Return
