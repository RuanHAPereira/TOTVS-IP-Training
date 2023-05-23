#INCLUDE "TOTVS.CH"

User Function VetorExerc14()
   
    Local aArea      := GetArea()
    Local aDados     := Array(5)
    Local nAtual     := 0
     
    //Define o Array
    aDados[1] := "3"
    aDados[2] := "5"
    aDados[3] := "7"
    aDados[4] := "9"
    aDados[5] := "11"
    //Percorre e mostra o numero
    For nAtual := 1 To Len(aDados)
        MsgInfo("["+cValToChar(nAtual)+"] "+ aDados[nAtual])
    Next
     
    RestArea(aArea)
Return
