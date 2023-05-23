#INCLUDE "TOTVS.CH"

//Feito atraves da correção dos exercicios 

User Function E15()
    Local nNum := 0
    Local cInput := ""
    Local nLimite := 0
    Local nFibon := 1
    Local nFibon2 := 1
    Local nFiboSoma := 0
    Local cFinal := ""

    cInput := ""
    cInput := U_RecebeValor(cInput, "Informe o valor de numeros da serie: ")
    nLimite := cInput

    cFinal += "Serie de Fibonacci ate " + CVALTOCHAR(nLimite) + ": " + CRLF

    for nNum := 1 to nLimite
        nFiboSoma := nFibon2
        nFibon2 := nFibon
        nFibon += nFiboSoma

        cFinal += "[" + CVALTOCHAR(nNum) + "] numero: " + CVALTOCHAR(nFiboSoma) + CRLF
    next nNum   

    FwAlertSuccess(cFinal, "Resultado!")

Return
