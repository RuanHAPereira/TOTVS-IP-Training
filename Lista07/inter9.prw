#INCLUDE "TOTVS.CH"

User Function TMB()

    Local oDlg
    Local oCombo
    Local cTitle  := "Calculo TMB"
    Local nPeso   := SPACE( 6 )
    Local nIdade  := SPACE( 6 )
    Local nAltura := SPACE( 6 )
    Local cSexo   := ""
    Local aSexo   :={"Homem" , "Mulher"}

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 240, 360 PIXEL

    @ 014, 010 SAY "Digite o peso: "   SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Digite a idade: "  SIZE 85, 07 OF oDlg PIXEL
    @ 050, 010 SAY "Digite a altura: " SIZE 85, 07 OF oDlg PIXEL
    @ 072, 010 SAY "Sexo: "            SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET nPeso             SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET nIdade            SIZE 55, 11 OF oDlg PIXEL
    @ 050, 100 MSGET nAltura           SIZE 55, 11 OF oDlg PIXEL
    @ 072, 100 COMBOBOX oCombo VAR cSexo ITEMS aSexo SIZE 55, 11 OF oDlg PIXEL 
    @ 090, 010 BUTTON "Mostrar o TMB" SIZE 145, 025 OF oDlg PIXEL ACTION {CalcTMB(nPeso, nIdade, nAltura, cSexo), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function CalcTMB(nPeso, nIdade, nAltura, cSexo)

    Local nTMB := 0

    if cSexo == "Homem"
        nTMB := INT(66.5 + (13.75 * VAL(nPeso)) + (5.003 * VAL(nAltura)) - (6.75 * VAL(nIdade)))
        FwAlertInfo(CVALTOCHAR( nTMB )+ " calorias.")
    else
        nTMB := INT(655.1 + (9.563 * VAL(nPeso)) + (1.850 * VAL(nAltura)) - (4.676 * VAL(nIdade)))
        FwAlertInfo(CVALTOCHAR( nTMB )+ " calorias.")
    endif

Return
