// 1 – Crie um ponto de entrada que seja executado
// na inclusão/alteração de produtos. O objetivo
// desse PE é acrescentar o texto “Cad. Manual - ”
// antes da descrição do produto.
// o Ex: “Cad. Manual – Fone de Ouvido”

User Function MT010ALT()
    
    Local aArea     := GetArea()
    Local aAreaSB1  := SB1->(GetArea())
    Local lRetorno  := .F.

    if ExistBlock('ManuCad')
        lRetorno := ExecBlock('ManuCad', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSB1)

Return lRetorno
