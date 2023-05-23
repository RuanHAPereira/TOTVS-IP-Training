/*6 – Utilizando Ponto de Entrada, crie uma rotina
que fará com que qualquer cliente, quando for
cadastrado no Protheus, tenha o status de
bloqueado (A1_MSBLQL = 1).*/

#INCLUDE 'TOTVS.CH'

User Function M030INC()

    Local aArea     := GetArea()
    Local aAreaSA1  := SA1->(GetArea())
    Local lRet      := .F.

    if ExistBlock('BloqCli')
        lRet := ExecBlock('BloqCli', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSA1)

Return lRet
