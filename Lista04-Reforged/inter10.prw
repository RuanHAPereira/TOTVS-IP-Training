#INCLUDE "TOTVS.CH"

User Function FolhaPag()

    Local oDlg
    Local cTitle     := "Folha de Pagamento"
    Local nQuantHora := SPACE( 6 )
    Local nValorHora := SPACE( 6 )
    
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 160, 360 PIXEL

    @ 014, 010 SAY "Digite quantidade de horas trabalhadas: " SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Digite o valor da hora: "                 SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET nQuantHora                               SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET nValorHora                               SIZE 55, 11 OF oDlg PIXEL
    @ 050, 010 BUTTON "Calcular IR"                           SIZE 145, 025 OF oDlg PIXEL;
     ACTION {DescontoIR(nQuantHora, nValorHora), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function DescontoIR(nQuantHora, nValorHora)

    Local nSalario  := 0 
    Local nIR       := 0
    Local nINSS     := 0
    Local nFGTS     := 0
    Local nSalaLiq  := 0

    nSalario := Val(nQuantHora) * Val(nValorHora)

    if nSalario > 1200 .and. nSalario <= 1800
        nIR := (5 / 100) * nSalario
    elseif nSalario > 1800 .and. nSalario <= 2500
        nIR := (10 / 100) * nSalario
    elseif nSalario > 2500
        nIR := (20 / 100) * nSalario
    else
        FwAlertInfo("Isento de desconto.")
    endif 

    nINSS := (10 / 100) * nSalario

    nFGTS := (11 / 100) * nSalario

    nSalaLiq := nSalario - (nINSS + nIR)

    FwAlertInfo("Salário bruto: " + CVALTOCHAR(nSalario) + CRLF + ;
               ("IR: " + CVALTOCHAR( nIR )) + CRLF + ;
               ("INSS: " + CVALTOCHAR( nINSS )) + CRLF + ;
               ("FGTS: " + CVALTOCHAR( nFGTS )) + CRLF + ;
               ("Salário Líquido: " + CVALTOCHAR( nSalaLiq )))

Return
