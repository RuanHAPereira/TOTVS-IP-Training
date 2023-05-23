#INCLUDE "TOTVS.CH"

User Function MostraIMC()

    Local oDlg 
    Local cTitle  := "Calculo do IMC"
    Local nPeso   := SPACE(5)
    Local nAltura := SPACE(5)

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 150 , 360 PIXEL

    @ 014, 010 SAY "Digite o peso: "   SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Digite a altura: " SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET nPeso             SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET nAltura           SIZE 55, 11 OF oDlg PIXEL
    @ 050, 010 BUTTON "Mostrar o IMC"  SIZE 145, 025 OF oDlg PIXEL;
     ACTION {IMC(nPeso, nAltura), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function IMC(nPeso, nAltura)

    Local nIndice := 0

    nIndice := Val(nPeso) / (Val(nAltura) * Val(nAltura))

    if nIndice < 18.5 
        FwAlertInfo("Magreza - Grau:0")
    elseif nIndice >= 18.5 .and. nIndice <= 24.9
        FwAlertInfo("Normal - Grau:0")
    elseif nIndice >= 25.0 .and. nIndice <= 29.9
        FwAlertInfo("Sobrepeso - Grau:I")
    elseif nIndice >= 30.0 .and. nIndice <= 39.9
        FwAlertInfo("Obesidade - Grau:II")
    else
        FwAlertInfo("Obesidade Grave - Grau:III")
    endif

Return
