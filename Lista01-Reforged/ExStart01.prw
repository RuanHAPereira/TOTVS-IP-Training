//� 1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE001()

    local nMSG := ''
    local nNum := 0

    nMSG := FwInputBox("Qual n�mero voc� deseja saber o antecessor?", nMSG)

    While !NUMBER(nMSG)// Valida��o de entrada que determina se � um n�mero, seja ele positivo ou negativo.
        FwAlertError("Voc� n�o colocou um n�mero" , "Error")
        nMSG := FwInputBox("Qual n�mero voc� deseja saber o antecessor?", nMSG)
    End
    nNum := (VAL(nMSG) - 1)
    FwAlertSuccess("O antecessor �: " + cValToChar(nNum) , "Antecessor")

Return
