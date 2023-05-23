#INCLUDE "TOTVS.CH"

User Function DoisPositivos()

    Local cTitle := 'Soma, diferença, produto e quociente!', cTexto := 'Insira o primeiro valor: ', cTexto2 := 'Insira o segundo valor: '
    Local nValor_1 := Space(10), nValor_2 := Space(10)
    Local oDlg

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL

    @ 014, 010 SAY cTexto         SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010 SAY cTexto2        SIZE 55, 07 OF oDlg PIXEL
    @ 010, 070 MSGET nValor_1     SIZE 55, 11 OF oDlg PIXEL
    @ 030, 070 MSGET nValor_2     SIZE 55, 11 OF oDlg PIXEL
    @ 010, 140 BUTTON 'Operações' SIZE 55, 11 OF oDlg PIXEL;
     ACTION {OperacoesDoisNum(nValor_1, nValor_2), oDlg:End()}
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function OperacoesDoisNum(nValor_1, nValor_2)

    FwAlertInfo('A soma dos números é: '      + ALLTRIM(STR(VAL(nValor_1)+Val(nValor_2))+CRLF+;
                'A diferença entre eles é: '  + ALLTRIM(STR(VAL(nValor_1)-VAL(nValor_2)))+CRLF+;
                'O produto entre eles é: '    + ALLTRIM(STR(VAL(nValor_1)*VAL(nValor_2)))+CRLF+;
                'O quociente dos números é: ' + ALLTRIM(STR(VAL(nValor_1)/VAL(nValor_2)))))
Return
