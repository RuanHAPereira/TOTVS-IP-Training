#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_VISU
    Rotina MVC para visualizar Categoria da CNH, Instrutores e Alunos
    @type  Function
    @author Ruan Pereira 
    @since 29/03/2023
/*/
User Function MVC_VISU()

	Local oBrowse := FWMBrowse():New()
	Local cTitle  := 'Visualização de Categoria x Instrutor x Alunos'
	Local cAlias  := 'ZZE'

	//?Instanciando o Browse
	oBrowse:SetAlias(cAlias)
	oBrowse:SetDescription(cTitle)
	oBrowse:DisableReport()

	//?Ativando o browse
	oBrowse:Activate()

Return

Static Function MenuDef()

	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVC_VISU' OPERATION 2 ACCESS 0

return aRotina

Static Function ModelDef()

	Local oModel   := MPFormModel():New('MVC_VISUM')
	Local oStruZZE := FWFormStruct(1, 'ZZE')
	Local oStruZZI := FWFormStruct(1, 'ZZI')
	Local oStruZZF := FWFormStruct(1, 'ZZF')

	//?definição dos submodelos
	oModel:AddFields('ZZEMASTER', /*PAI*/, oStruZZE)
	oModel:AddGrid('ZZIDETAIL', 'ZZEMASTER', oStruZZI)
	oModel:AddGrid('ZZFDETAIL', 'ZZIDETAIL', oStruZZF)

	//?descrição do modelo
	oModel:SetDescription('Modelo de dados - Visualização de Categoria x Instrutor x Alunos')
	oModel:GetModel('ZZEMASTER'):SetDescription('Topo do Pedido')
	oModel:GetModel('ZZIDETAIL'):SetDescription('Topo ZZI')
	oModel:GetModel('ZZFDETAIL'):SetDescription('Topo ZZF')

	//? relacionando das tabelas
	oModel:SetRelation('ZZIDETAIL', {{'ZZI_FILIAL', 'xFilial("ZZI")'}, {'ZZI_CATE', 'ZZE_COD'}}, ZZI->(IndexKey(1)))
	oModel:SetRelation('ZZFDETAIL', {{'ZZF_FILIAL', 'xFilial("ZZF")'}, {'ZZF_INSTRU', 'ZZI_COD'}}, ZZF->(IndexKey(1)))
	oModel:SetPrimaryKey({'ZZE_COD'})

return oModel

//?Visualização de dados
Static Function ViewDef()

	Local oModel   := FWLoadModel('MVC_VISU')
	Local oView    := FWFormView():New()
	Local oStruZZE := FWFormStruct(2,'ZZE')
	Local oStruZZI := FWFormStruct(2,'ZZI')
	Local oStruZZF := FWFormStruct(2,'ZZF')

	//?indica o modelo da view
	oView:SetModel(oModel)

	//?cria a estrutura visual de campos
	oView:AddField('VIEW_ZZE', oStruZZE, 'ZZEMASTER')
	oView:AddGrid('VIEW_ZZI', oStruZZI, 'ZZIDETAIL')
	oView:AddGrid('VIEW_ZZF', oStruZZF, 'ZZFDETAIL')

	//?cria boxes horizontais
	oView:CreateHorizontalBox('CATEGORIA', 20)
	oView:CreateHorizontalBox('INSTRUTORES', 40)
	oView:CreateHorizontalBox('ALUNOS', 40)

	//?relacionando os boxes com as estruturas visuais
	oView:SetOwnerView('VIEW_ZZE','CATEGORIA')
	oView:SetOwnerView('VIEW_ZZI','INSTRUTORES')
	oView:SetOwnerView('VIEW_ZZF','ALUNOS')

	//?criando um titulo em cima de cada formulário
	oView:EnableTitleView('VIEW_ZZE', 'Categoria de CNH')
	oView:EnableTitleView('VIEW_ZZI', 'Instrutores da Categoria')
	oView:EnableTitleView('VIEW_ZZF', 'Alunos do Instrutor')

return oView
