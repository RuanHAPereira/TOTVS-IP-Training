#INCLUDE 'TOTVS.CH'

User Function CadZZE()

    Local cAlias  := 'ZZE', cTitulo := 'Cadastro de alunos '
    Local lVldAlt := 'U_VldAlt()'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, lVldAlt, NIL)

Return
