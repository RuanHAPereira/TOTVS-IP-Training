#INCLUDE "TOTVS.CH"

User Function KmPercor()

    Local oDlg
    Local cTitle := "Calcule o valor do aluguel"
    Local nKM    := SPACE( 4 )
    Local nDias  := SPACE( 3 )

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 160, 350 PIXEL

    @ 014, 010 SAY "KMs percorridos: "   SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Dias alugados: "     SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET nKM                 SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET nDias               SIZE 55, 11 OF oDlg PIXEL
    @ 050, 010 BUTTON "Calcular aluguel" SIZE 145, 025 OF oDlg PIXEL;
     ACTION {Aluguel(nKM, nDias), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED

Return 

Static Function Aluguel(nKM, nDias)

    Local nValorDia   := 0
    Local nValorKM    := 0
    Local nValorTotal := 0

    nValorDia := Val(nDias) * 60
    nValorKM := Val(nKM) * 0.15
    nValorTotal := nValorDia + nValorKM

    FwAlertInfo("O valor do alguel e: R$" + CVALTOCHAR( nValorTotal ))
Return 
