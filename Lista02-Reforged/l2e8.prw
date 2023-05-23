#Include "TOTVS.CH"

#define Usuario "Ruan Henrique"
#define Senha "123456"

User Function E8()

    local cUser:= ""
    local cPass:= ''

    cUser := Val(FwInputBox("Informe o nome do usuario: ", cUser)) 
    cPass := Val(FwInputBox("Informe a senha: ",  cPass)) 

    if cUser != Usuario 
       Alert("Usuario ou senha invalido!")
    
    else 
        if cPass != Pass
            Alert("Usuario ou senha invalido!")
        else
            Alert("Acesso permitido!")
        endif
    endif
         
return 
