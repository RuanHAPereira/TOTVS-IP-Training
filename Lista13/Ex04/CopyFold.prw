#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopiaArq
  Escreva um programa que criará uma pasta
  com o nome “Lista 13” no rootpath
  (protheus_data) e copiará o arquivo do
  exercício 2 para essa pasta.
  @type  Function
  @author Ruan Pereira
  @since 24/04/2023
  /*/
User Function CopyFold()

  Local cPastaOrig := 'C:\Exercicios_TOTVS\lista 13 - ex1\' //? Pasta onde os arquivos estão inicialmente - Origem
  Local cPastaDest := '\' //? Pasta onde os arquivos serão salvos (dentro da protheus_data) - Destino

  //? Pegando os dados de todos os arquivos existentes dentro da pasta de origem
  Local aArquivos  := Directory(cPastaOrig + 'ArquivoLista13.txt' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordenação dos arquivos*/)
  Local nI         := 0

  if LEN(aArquivos) > 0
    for nI := 3 to LEN(aArquivos)
      //? Copiando os arquivos da pasta de origem para a pasta de destino. 
      if !CpyT2S(cPastaOrig + aArquivos[nI][1], cPastaDest)      
        MsgStop('Houve um erro ao excluir o arquivo ' + aArquivos[nI][1])
      endif
    next
    FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluído!')
  else
    FwAlertInfo('Apasta não contem nenhum arquivo!', 'Atenção!')
  endif
Return
