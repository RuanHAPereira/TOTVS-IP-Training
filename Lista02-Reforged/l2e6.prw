#INCLUDE "TOTVS.CH"

// Corrigi durante a aula hoje, pois nao tinha conseguido executar o FOR

User Function E6()
    Local nNum := {}
    Local nValor := 0
    Local nI := 1

    for nI := 1 to 4

        nValor := Val(FwInputBox("Digite um valor: "))
        AADD( nNum, nValor )
    next

    for nI := 1 to 4
        if nNum[nI] % 2 == 0 .and. nNum[nI] % 3 == 0

            MSGALERT(Alltrim(str(nNum[nI])) + "é divisivel por 2 e 3!")

        else

            MSGALERT(Alltrim(str[nI]) + " nao e divisivel por 2 e 3!")
        endif 
    next
Return 
