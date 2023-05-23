#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Fun��o para criar uma pasta
  @type  Function
  @author Ruan Pereira
  @since 24/04/2023
  /*/
User Function CrFolder()

  Local cCaminho   := '\' //? Endere�o onde a pasta ser� criada
  Local cNomePasta := 'Lista13' //? Nome da pasta que ser� criada

  //? Verificando se a pasta j� existe
  if !ExistDir(cCaminho + cNomePasta)
    //? Criando a pasta
    if MakeDir(cCaminho + cNomePasta) == 0
      //? Chamando a fun��o que criar� um arquivo de texto dentro da pasta criada.
      if ExistBlock('Escreve')
        ExecBlock('Escreve', .F., .F., cCaminho + cNomePasta)
      endif
      if ExistBlock('EscrCSV')
        ExecBlock('EscrCSV', .F., .F., cCaminho + cNomePasta)
      endif
    else
      FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
    endif
  else
    if ExistBlock('Escreve')
      ExecBlock('Escreve', .F., .F., cCaminho + cNomePasta)
    endif
    if ExistBlock('EscrCSV')
      ExecBlock('EscrCSV', .F., .F., cCaminho + cNomePasta)
    endif
  endif
Return
