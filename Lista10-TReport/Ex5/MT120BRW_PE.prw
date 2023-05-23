#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT120BRW
    Ponto de entrada para adicionar um botão a rotina de pedidos de compra
    @type  Function
    @author Ruan Pereira
    @since 08/04/2023
/*/
User Function MT120BRW()
    Aadd(aRotina, {'Criar Relatório', 'U_RpPedido()', 0,6})
    Aadd(aRotina, {'Relatório de Pedidos', 'U_RpPeds()', 0,6})
Return
