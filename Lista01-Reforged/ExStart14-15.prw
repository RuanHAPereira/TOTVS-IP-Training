#INCLUDE 'TOTVS.CH'

User Function RE1415()

    local cNum     := ''
    local nNum1     := 0
    local nNum2     := 0
    local nDiv      := 0
    local lLoop     := .T.

    cNum := FwInputBox('Digite o primeiro n�mero: ', cNum)
    nNum1 := VAL(cNum)

    While lLoop

        cNum := FwInputBox("Digite o segundo n�mero: ", cNum)

        if VAL(cNum) == 0
            MSGSTOP('VALOR INAVLIDO!!')
            loop 
        else
            nNum2 := VAL(cNum)
            lLoop := .F.
        endif

    End while

    nDiv := nNum1 / nNum2 

    FwAlertInfo(CVALTOCHAR(nNum1) + " / " + CVALTOCHAR(nNum2) + " = " + CVALTOCHAR(nDiv), "Divis�o:")
    
Return 

/*� 14 - Escreva um algoritmo para ler 2 VALores e se o
  segundo VALor informado for ZERO, deve ser lido
  um novo VALor, ou seja, para o segundo VALor n�o
  pode ser aceito o VALor zero. Imprimir o resultado
  da divis�o do primeiro VALor lido pelo segundo
  VALor lido.
  � 15 - Acrescentar uma mensagem de 'VALOR
  INV�LIDO' no exerc�cio anterior caso o segundo
  VALor informado seja ZERO.*/
