#INCLUDE "TOTVS.CH"

User Function Cadastro()

    Local oDlg
    Local cTitle       := ""
    Local cUser        := SPACE(20)
    Local cPass        := SPACE(20)
    Local cConfirmPass := SPACE(20)

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 250, 360 PIXEL 

    @ 014, 010 SAY "Digite um usuario valido: " SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Digite uma senha valida: "  SIZE 85, 07 OF oDlg PIXEL
    @ 050, 010 SAY "Confirme a senha: "         SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET cUser            SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET cPass            SIZE 55, 11 OF oDlg PIXEL
    @ 050, 100 MSGET cConfirmPass     SIZE 55, 11 OF oDlg PIXEL
    @ 100, 010 BUTTON "Validar"       SIZE 145, 025 OF oDlg PIXEL;
    ACTION {Validacao(cUser, cPass, cConfirmPass)}

    ACTIVATE MSDIALOG oDlg CENTERED

Return 

Static Function Validacao(cUser, cPass, cConfirmPass)

    Local nCont := 0 
    Local nSoma := 0
    Local nUser := 0
    Local lValido := .F.

    cUser  := ALLTRIM( cUser )
    cPass  := ALLTRIM( cPass )
    cConfirmPass := ALLTRIM( cConfirmPass )

    if cUser == "" 
        FwAlertInfo("Campo do usuário em branco!")
    elseif LEN( cUser ) <= 5
        FwAlertInfo("O username deve ter mais que cinco caracteres!")
    else
        FwAlertInfo("Usuário válido!")
        nUser++

    endif

    if cPass == "" .or. cConfirmPass == ""
        FwAlertInfo("O campo da senha está em branco!")
    elseif Len(cPass) < 6 
        FwAlertInfo("Senha inválida")
    elseif cPass != cConfirmPass
        FwAlertInfo("Confirmação de senha inválida!")
    else
        for nCont := 1 to LEN( cPass )
            if lValido == .F. .and. (ASC(SUBSTR(cPass, nCont)) >= 65 .or. ASC(SUBSTR(cPass, nCont)) <= 90)
                nSoma++
                lValido := .T.
            endif 
        next

        lValido := .F.
        for nCont := 1 to LEN( cPass )
            if lValido == .F. .and. (ASC(SUBSTR(cPass, nCont)) >= 48 .or. ASC(SUBSTR(cPass, nCont)) <= 57)
                nSoma++
                lValido := .T.
            endif 
        next

        lValido := .F.
        for nCont := 1 to LEN( cPass )
            if lValido == .F. .and. (ASC(SUBSTR(cPass, nCont)) >= 33 .and. ASC(SUBSTR(cPass, nCont)) <= 47) .or.(ASC(SUBSTR(cPass, nCont)) >= 58 .and. ASC(SUBSTR(cPass, nCont)) <= 64) .or. (ASC(SUBSTR(cPass, nCont)) >= 91 .and. ASC(SUBSTR(cPass, nCont)) <= 96) .or. (ASC(SUBSTR(cPass, nCont)) >= 123 .and. ASC(SUBSTR(cPass, nCont)) <= 126)
                nSoma++
                lValido := .T.
            endif 
        next

        if nSoma == 3
            FwAlertInfo("Senha Válida!")
        else
            FwAlertInfo("Senha Inválida!")
        endif 
    endif

    if cPass == cConfirmPass .and. nSoma == 3 .and. nUser == 1
        FwAlertInfo("Usuário Cadastrado!!")
    endif

Return
