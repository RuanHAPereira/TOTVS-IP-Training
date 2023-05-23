#INCLUDE "TOTVS.CH"

User Function Pagamento()
    Local oDlg
    Local cTitle    := "Calcule o salário"
    Local nSalario  := SPACE( 4 )
    Local nReajuste := SPACE( 3 )

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 160, 350 PIXEL
    
    @ 014, 010 SAY "Salario atual: "          SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Percentual de reajuste: " SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET nSalario                 SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET nReajuste                SIZE 55, 11 OF oDlg PIXEL
    @ 050, 010 BUTTON "Calcular"              SIZE 145, 025 OF oDlg PIXEL ACTION {Reajuste(nSalario, nReajuste), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED

Return 

Static Function Reajuste(nSalario, nReajuste)

    Local nSalarioAtual := 0

    nSalario  := Val(nSalario)
    nReajuste := Val(nReajuste)

    nSalarioAtual := nSalario + (nSalario*(nReajuste/100))

    FwAlertInfo("O valor atualizado e: R$ " + CVALTOCHAR( nSalarioAtual ))
    
Return
