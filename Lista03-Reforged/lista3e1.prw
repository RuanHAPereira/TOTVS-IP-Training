#INCLUDE "TOTVS.CH"
#INCLUDE 'TBICONN.CH'

User Function L3E1BD()

  Local aArea := GetArea()
  Local cForn := "F00004" // variavel que declara o codigo do fornecedor
  Local cLoja := "01"
  Local cPedido := ''
  Local lEncont := .F.

  Prepare Environment Empresa "99" Filial "01" Tables "SC7" Modulo "COM"

  DbSelectArea('SC7')
  DeSetOrder(3) //numero do indice que trará as informações solicitadas

  lEncont := DbSeek(xFilial("SC7") + cForn + cLoja)

  if lEncont
    while !EOF()
      if SC7->C7_FORNECE == "F00004"
       cPedido := SC7-C7_NUM + CRLF
      else
        EXIT
      endif

       DbSkip()
    enddo 

   FwAlertInfo(cPedido, "Pedidos")
  endif

  DbCloseArea()
  RestArea(aArea)
Return
