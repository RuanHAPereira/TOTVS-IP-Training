#INCLUDE "TOTVS.CH"

User Function AreaTinta()

    Local oDlg
    Local cTitle   := "Area a ser pintada"
    Local nLargura := SPACE(4)
    Local nAltura  := SPACE(4)

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 160, 350 PIXEL

    @ 014, 010 SAY "Altura da parede: "  SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Largura da parede: " SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET nAltura             SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET nLargura            SIZE 55, 11 OF oDlg PIXEL
    @ 050, 010 BUTTON "Calcular"         SIZE 145, 025 OF oDlg PIXEL;
     ACTION {Parede(nLargura, nAltura), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED

Return 

Static Function Parede(nLargura, nAltura)

    Local nArea  := 0
    Local nTinta := 0

    nArea := Val(nLargura) * Val(nAltura)
    nTinta := nArea / 2

    FwAlertInfo("Quantidade de tinta necessaria é: " + CValtoChar(nTinta)+ "litros")
    
Return
