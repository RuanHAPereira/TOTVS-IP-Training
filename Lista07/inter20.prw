User Function CadZZE()

    Local cAlias := 'ZZE',  cFiltro   := ''

    Local aCores := { { 'ZZE->ZZE_DATNAS < Date()-6570' , 'ENABLE' },;
                      { 'ZZE->ZZE_DATNAS > Date()-6570' , 'DISABLE' } }

    Private cCadastro := 'Cadastro de alunos '
    Private aRotina := {{ 'Pesquisar' ,    'AxPesqui' ,     0, 1 },;
                        { 'Visualizar' ,   'AxVisual' ,     0, 2 },;
                        { 'Incluir' ,      'AxInclui' ,     0, 3 },;
                        { 'Alterar' ,      'AxAltera' ,     0, 4 },;
                        { 'Excluir' ,      'AxDeleta' ,     0, 5 },;
                        { 'Alunos' ,       'U_CadZZS' ,     0, 6 },;
                        { 'Legenda' ,      'U_Legend',      0, 7 }}

    DbSelectArea('ZZE')
    DbSetOrder(1)

    MBrowse(,,,,cAlias,,,,,,aCores,,,,,,,,cFiltro)     

    DbCloseArea()

Return
