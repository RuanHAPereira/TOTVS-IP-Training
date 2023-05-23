#INCLUDE 'TOTVS.CH'

User Function A410Cons()
    Local aArea        := GetArea()  
    Local aButton    := {}
 
    //Se não for inclusão
    If ! INCLUI
        aAdd(aButton,{'RELATORIO', {||Alert(SC5->C5_NUM)}, "Teste","* Teste"} )
    Endif
     
    RestArea(aArea)
Return(aButton)
