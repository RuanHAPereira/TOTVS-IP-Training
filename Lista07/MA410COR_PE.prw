/*3 – Utilize um Ponto de Entrada para alterar as
legendas da rotina “Pedidos de Venda”.
As legendas devem utilizar as seguintes imagens:
o Pedido em aberto: “CHECKOK”
o Pedido encerrado: “BR_CANCEL”
o Pedido Liberado: “GCTPIMSE”
Após a alteração o browse dos pedidos de venda
devem ficar da seguinte forma:*/

#Include "protheus.ch"

User Function MA410COR()

    Local aCoresPE := { {"Empty(C5_LIBEROK).And.Empty(C5_NOTA)" ,'CHECKOK', 'Pedido em Aberto '    },;  //Pedido em Aberto 
                      {"!Empty(C5_NOTA).Or.C5_LIBEROK=='E'"   ,'BR_CANCEL', 'Pedido Encerrado'   },;  //Pedido Encerrado
                      {"!Empty(C5_LIBEROK).And.Empty(C5_NOTA)",'GCTPIMSE', 'Pedido Liberado'} }  //Pedido liberado


Return aCoresPE
