/*5 – Utilizando Ponto de Entrada, crie uma rotina
que fará com que qualquer produto, quando for
cadastrado no Protheus, tenha o status de
bloqueado (B1_MSBLQL = 1).*/

#INCLUDE "PROTHEUS.CH"

User Function FISA010()

    local aParam   := PARAMIXB
    local lRet     := .T.
    local oObj     := NIL
    local cIdPonto := ""
    local cIdModel := ""

    if aParam <> NIL
    
          oObj     := aParam[1] // Objeto do formulário ou do modelo, conforme o caso.
          cIDPonto := aParam[2] // ID do local de execução do ponto de entrada.
          cIDModel := aParam[3] // ID do formulário.

        If (cIDPonto == "MODELPOS")       // Na validação total do modelo.
            if ExistBlock('MuniCad')
                lRet := ExecBlock('MuniCad', .F.)
            endif
        endif
     EndIf

Return lRet
