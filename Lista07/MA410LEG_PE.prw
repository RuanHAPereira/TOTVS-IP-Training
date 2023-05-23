/*4 – Você acabou de mudar a legenda no browse dos
pedidos de venda, agora, utilizando outro PE,
altere as imagens da janela onde é possível
identificar o que cada legenda representa. Deve
ficar desse jeito:*/

#INCLUDE 'protheus.ch'

User Function MA410LEG()

    Local aLegenda := PARAMIXB

    aLegenda := {}

    AADD(aLegenda,{"CHECKOK" ,"Pedido de Venda em aberto"})
    AADD(aLegenda,{"BR_CANCEL" ,"Pedido de Venda encerrado"})
    AADD(aLegenda,{"GCTPIMSE" ,"Pedido de Venda liberado"})
    AADD(aLegenda,{"BR_AZUL" ,"Pedido Bloqueado por Regra"})
    AADD(aLegenda,{"BR_LARANJA" ,"Pedido Bloqueado por Verba"})

Return(aLegenda)
