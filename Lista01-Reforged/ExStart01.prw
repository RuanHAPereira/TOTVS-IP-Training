//• 1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE001()

    local nMSG := ''
    local nNum := 0

    nMSG := FwInputBox("Qual número você deseja saber o antecessor?", nMSG)

    While !NUMBER(nMSG)// Validação de entrada que determina se é um número, seja ele positivo ou negativo.
        FwAlertError("Você não colocou um número" , "Error")
        nMSG := FwInputBox("Qual número você deseja saber o antecessor?", nMSG)
    End
    nNum := (VAL(nMSG) - 1)
    FwAlertSuccess("O antecessor é: " + cValToChar(nNum) , "Antecessor")

Return
