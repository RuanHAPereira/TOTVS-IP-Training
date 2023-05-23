#INCLUDE "TOTVS.CH"

User Function ConvertDol()

    Local cTitle  := "Cotação do Dolar"
    Local cTexto1 := "Qual a cotação do dolar: "
    Local cTexto2 := "Informe a quantidade de dolares: "
    Local nDolar  := SPACE( 4 )
    Local nQuant  := SPACE( 4 )
    Local oDlg

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 160, 350 PIXEL

    @ 014, 010 SAY cTexto1      SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY cTexto2      SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET nDolar     SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET nQuant     SIZE 55, 11 OF oDlg PIXEL
    @ 050, 010 BUTTON "Cotação" SIZE 145, 025 OF oDlg PIXEL;
     ACTION {CotaDolar(nDolar, nQuant), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED 

Return 

Static Function CotaDolar(nDolar, nQuant)

    Local nCotacao := 0
    
    nDolar := VAL(nDolar)
    nQuant := VAL(nQuant)
    nCotacao := nDolar*nQuant
    FwAlertInfo("O valor convertido em reais é: R$ " + CVALTOCHAR( nCotacao ))
    
Return 
