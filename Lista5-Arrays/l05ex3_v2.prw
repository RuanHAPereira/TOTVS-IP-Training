#INCLUDE "TOTVS.CH"

User Function E3_V2()
    Local aArray := {}                              //Array vazio    
    Local nCont := 0                                //Contador iniciando com 0
    Local cMsg := ""                                //Variavel que receberá o valor que está dentro do Array

    for nCont := 1 to 30                            //FOR com um CONTADOR de 1 a 30 
        AADD(aArray, RANDOMIZE( 0, 30))             //Adcionando 30 elementos randomicos dentre 0 e 30 na variavel aArray
    next

    for nCont := 1 to 30                            //Um segundo FOR com um CONTADOR de 1 a 30     
        cMsg += CVALTOCHAR(aArray[nCont]) + ", "    //Variavel cMsg concatenando o aArray recebendo o CONTADOR(nCont), dentro da função cValToChar
    next

    FwAlertInfo(cMsg, "Conteudo do Array!")         //Na esquerda apresenta o resultado da variavel, apos a virgula vem o texto que será exibido como título na MSG de alerta!
Return
