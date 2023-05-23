#INCLUDE "TOTVS.CH"

User Function E4_V2()
    Local aArray := {}
    Local nCont := 0
    Local cMsg := ""

    for nCont := 2 to 20 step 2                                     //em um FOR temos um CONTADOR que se inicia a partir de 2 ate 20 pulando de 2 em 2 numeros
        AADD(aArray, nCont)                                         //Adcionando nCont na variavel aArray      
    
    next

    for nCont := 1 to 10                                            //Iniciamos um contador de 1 a 10 para que o array seja populado com ate 10 elementos 
        if nCont < 10                                               //
            cMsg += CVALTOCHAR(aArray[nCont]) + ", "
        else
            cMsg += CVALTOCHAR(aArray[nCont]) + ", "
        endif 
    next 


    FwAlertInfo(cMsg, "Conteúdo do Array em números pares: ")
Return
