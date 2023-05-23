#INCLUDE "TOTVS.CH"

#define Usuario "Ruan Henrique"
#define Senha   "123456"

User Function Login()

    Local oDlg
    Local cTitle := "Validação de Usuário e Senha"
    Local cUser  := SPACE(20)
    Local cPass  := SPACE(20)

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 160,340 PIXEL

    @ 014, 010 SAY "Digite o usuario: " SIZE 85, 07 OF oDlg PIXEL
    @ 030, 010 SAY "Digite a senha: "   SIZE 85, 07 OF oDlg PIXEL
    @ 010, 100 MSGET cUser              SIZE 55, 11 OF oDlg PIXEL
    @ 030, 100 MSGET cPass              SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 050, 010 BUTTON "Validar"         SIZE 145, 025 OF oDlg PIXEL;
     ACTION {Validation(cUser, cPass), oDlg:END()}

    ACTIVATE MSDIALOG oDlg CENTERED

Return 

Static Function Validation(cUser, cPass)
    
    if ALLTRIM(cUser) == Usuario .and. ALLTRIM(cPass) == Senha
        FwAlertSuccess("Bem Vindo!")
    else
        FwAlertError("Usuario ou senha invalido!")
    endif 

Return 
