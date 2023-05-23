#INCLUDE 'TOTVS.CH'

User Function E16()

    Local cUsuario := ''
    Local cSenha1  := ''
    Local cSenha2  := ''
    
    WHILE .T.
        cUsuario := FwInputBox('insira aqui o nome de usuário')

        //Aqui o usuário é obrigado a fazer um nome de usuário com mais de 5 caracteres
        IF len(cUsuario) < 6
            FwAlertError('Seu usuario deve possuir mais do que 5 caracteres')
        ELSE
            EXIT//Optei por EXIT para não ficar resetando toda hora o Loop, gastando 1 linha por vez
        ENDIF
    ENDDO

    WHILE .T. 
        cSenha1 := FwInputBox('Insira aqui sua senha')

        //Aqui o usuário é obrigado a fazer uma senha com mais de 5 caracteres
        IF len(cSenha1) < 6
            FwAlertError('Sua senha deve possuir mais do que 5 caracteres')

        //Aqui é chamado a função TesteSenha que explicarei mais abaixo
        ELSEIF !TesteSenha(cSenha1)

           FwAlertError('Sua senha deve possuir ao menos uma letra maiuscula, um digito numerico e um simbolo')
        ELSE
            EXIT
        ENDIF
    ENDDO

    //Loop que obriga o usuário a confirmar a senha e caso não seja exatamente igual a primeira, ele não sai do loop.
    WHILE .T.
        cSenha2 := FwInputBox('Confirme sua senha', 'Cadastro')
        IF cSenha1 == cSenha2
            EXIT
        ELSE
            FwAlertError('Suas senhas nao coincidem')
        ENDIF
    ENDDO

    FwAlertSuccess('Usuario e Senha cadastrados')


Return

//Nesta função, a senha do usuário será percorrida 3x por 3 loops For, cada uma checando cada elemento da string para conferir se a senha apresenta pelo menos uma letra maiúscula, um número e um símbolo.
static Function TesteSenha(cSenha)
    Local nI    := 0
    Local lLet  := .F.
    Local lDigi := .F.
    Local lSimb := .F.
    
    FOR nI := 1 TO len(cSenha)
        IF isUpper(SubStr(cSenha, nI , 1))
            lLet := .T.
            EXIT
        ENDIF
    NEXT nI
    
    for nI := 1 to len(cSenha)
        IF IsDigit(SubStr(cSenha, nI , 1))
            lDigi := .T.
            EXIT
        ENDIF
    NEXT nI
    
    //Para símbolos foi utilizada a tabela ASC por eu não saber de uma mulher maneira para fazer a comparação.
    for nI := 1 to len(cSenha)
        IF (asc(SubStr(cSenha, nI, 1)) >= 33 .and. asc(SubStr(cSenha, nI, 1)) <= 47) .or.(asc(SubStr(cSenha, nI, 1)) >=58 .and. asc(SubStr(cSenha, nI, 1)) <=64) .or. (asc(SubStr(cSenha, nI, 1)) >= 91 .and. asc(SubStr(cSenha, nI, 1)) <= 96) .or. (asc(SubStr(cSenha, nI, 1)) >= 123 .and. asc(SubStr(cSenha, nI, 1)) <= 126)
            lSimb := .T.
            EXIT
        ENDIF
    NEXT nI

    IF lLet .AND. lDigi .AND. lSimb
        RETURN .T.
    ENDIF
RETURN .F.
