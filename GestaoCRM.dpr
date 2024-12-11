program GestaoCRM;

{$R 'Language.res' 'Language.rc'}

uses
  {$IFDEF EurekaLog}
  EMemLeaks,
  EResLeaks,
  EDebugExports,
  EDebugJCL,
  EFixSafeCallException,
  EMapWin32,
  EAppVCL,
  EDialogWinAPIMSClassic,
  ESendWebHTTP,
  ExceptionLog7,
  {$ENDIF EurekaLog}
  Vcl.Forms,
  SysUtils,
  Windows,
  Dialogs,
  main in 'main.pas' {fMain},
  relAnalisePonto in 'relatorio\relAnalisePonto.pas' {frelAnalisePonto},
  cadEmpresas in 'cadastros\cadEmpresas.pas' {fcadEmpresas},
  cadUsuarioNivelPermis in 'cadastros\cadUsuarioNivelPermis.pas' {fCadUsuarioNivelPermis},
  cadUnidades in 'cadastros\cadUnidades.pas' {fcadUnidades},
  visPessoal in 'visual\visPessoal.pas' {fvisPessoal},
  cadEventos in 'cadastros\cadEventos.pas' {fcadEventos},
  cadUsuario in 'cadastros\cadUsuario.pas' {fcadUsuario},
  modDados in 'modulos\modDados.pas' {DM: TDataModule},
  modFuncoes in 'modulos\modFuncoes.pas',
  movEntrega in 'movimento\movEntrega.pas' {fEntrega},
  login in 'login.pas' {fLogin},
  cadFeriados in 'cadastros\cadFeriados.pas' {fcadFeriados},
  splash in 'splash.pas' {fSplash},
  cdrPessoal in 'cadrapido\cdrPessoal.pas' {fcdrPessoal},
  cdrEventos in 'cadrapido\cdrEventos.pas' {fcdrEventos},
  cdrUnidades in 'cadrapido\cdrUnidades.pas' {fcdrUnidades},
  plaContrato in 'movimento\plaContrato.pas' {fPlaContrato},
  lanMovimento in 'movimento\lanMovimento.pas' {flanMov},
  detMovimento in 'movimento\detMovimento.pas' {fdetMovimento},
  dlgAgeFor in 'dialogs\dlgAgeFor.pas' {fdlgAgeFor},
  myMsgAltLote in 'dialogs\myMsgAltLote.pas' {fmsgAltLote},
  cadTipoDoc in 'cadastros\cadTipoDoc.pas' {fCadTipoDoc},
  lanContrato in 'movimento\lanContrato.pas' {flanContrato},
  update in 'update.pas' {fUpdate},
  relDesembolso in 'relatorio\relDesembolso.pas' {frelDesembolso},
  relConta in 'relatorio\relConta.pas' {frelConta},
  sinalConta in 'dialogs\sinalConta.pas' {fsinalConta},
  Config in 'Config.pas' {fConfig},
  bxaLote in 'movimento\bxaLote.pas' {fbxaLote},
  myObsBox in 'dialogs\myObsBox.pas' {fmyObsBox},
  importAgente in 'utils\importAgente.pas' {fImportAgente},
  cadUsuarioPermissao in 'cadastros\cadUsuarioPermissao.pas' {fCadUsuarioPermissao},
  cadTipoGenerico in 'cadastros\cadTipoGenerico.pas' {fCadTipoGen},
  cadUsuarioNivel in 'cadastros\cadUsuarioNivel.pas' {fCadUsuarioNivel},
  calculadora in 'dialogs\calculadora.pas' {fCalc},
  dadosContrato in 'utils\dadosContrato.pas' {fDadosContrato},
  bxaMovimento in 'movimento\bxaMovimento.pas' {fBaixa},
  resumoConta in 'relatorio\resumoConta.pas' {fResumoConta},
  dadosUnidade in 'utils\dadosUnidade.pas' {fDadosUnidade},
  plaRegimeTrib in 'movimento\plaRegimeTrib.pas' {fplRegimeTrib},
  lanFatura in 'movimento\lanFatura.pas' {flanFatura},
  importBens in 'utils\importBens.pas' {fImportBens},
  OrdenaGrid in 'utils\OrdenaGrid.pas' {fOrdenaGrid},
  cadContas in 'cadastros\cadContas.pas' {fcadContas},
  mudarSenha in 'utils\mudarSenha.pas' {fMudarSenha},
  cadInvent in 'cadastros\cadInvent.pas' {fcadInvent},
  cadPessoal in 'cadastros\cadPessoal.pas' {fcadPessoal},
  visCNAB240 in 'visual\visCNAB240.pas' {fvisCNAB240},
  ajustaConta in 'utils\ajustaConta.pas' {fajustaConta},
  emailrecup in 'utils\emailrecup.pas' {femailRecup},
  cfgCNAB240 in 'config\cfgCNAB240.pas' {fcfgCNAB240},
  cfgFatura in 'config\cfgFatura.pas' {fCfgFatura},
  myInputBox in 'dialogs\myInputBox.pas' {fInputBox},
  cfgRelatorios in 'config\cfgRelatorios.pas' {fCfgRel},
  moverInvent in 'utils\moverInvent.pas' {fMoverInvent},
  aguarde in 'aguarde.pas' {fAguarde},
  plaMovimento in 'movimento\plaMovimento.pas' {fplaMov},
  cadCateg in 'cadastros\cadCateg.pas' {fcadCateg},
  importRec in 'utils\importRec.pas' {fImportRec},
  selConta in 'utils\selConta.pas' {fSelConta},
  lanParcela in 'movimento\lanParcela.pas' {flanParcela};

{$R *.res}

var
  result: Integer;
  MutexHandle: THandle;

begin
  {
    * ALTERAR O TIPO DE CONTA NA TAB. DE CONTAS (BD) 2>3 e 3>4
      (FOI ADICIONADO O TIPO CP) <<<< 09/12/2024
    * ALTERAR A LOCALIZAÇÃO DO BD <<<< 09/12/2024
  }

  wVersao := '0951'; // Informações da Versão de Lançamento
  // wDtLanc:= '23/10/2023';   //Mudados para cá em 16/08/2023
  wDtLanc := '241210'; // Formato mudado para YYMMDD em 23/10/2023
  ////////////// ATENÇÃOOOOOOO <<<< 17/05/2024
  ///   Problema ao Em Conta em lote na Pl. de Movimento
  ///   Quando a seleção contem datas de dias não úteis(fds) <<<<<<<<< VERIFICAR
  ////////////////////////////////////////////////////////
  MutexHandle := CreateMutex(nil, True, '6EACD0BF-F3E0-44D9-91E7-47467B5A2B6A');
  if MutexHandle = 0 then
    RaiseLastOSError;

  if GetLastError = ERROR_ALREADY_EXISTS then begin
    ShowMessage('Já existe uma instância deste aplicativo aberto!');
    CloseHandle(MutexHandle);
    Application.Terminate;
    Exit;
  end;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Solução - Sistema de Gestão';

  //fAguarde:= TfAguarde.Create(nil);
  //fAguarde.Hide;
  //
  with TfSplash.Create(nil) do begin
    try
      Show;
      update;
      //
      Application.CreateForm(TDM, DM);
  //Application.CreateForm(TfajustaConta, fajustaConta);
  // DM:= TDM.Create(nil);
      //
      //
      //
    finally
      Hide;
      Free;
    end;
  end;
  if wModoDev = 2 then begin // NOLOGIN no arquivo DEV.MOD - 23/08/2023
    wUsuario := 98; // Modo Desenvolvedor
    DM.qyLogin.Open
      ('SELECT usu.id, usu.cpf, usu.descr, usu.ult_log, usu.senha, usu.ativo, usu.id_nivel, '
      + 'niv.descr as ds_nivel, niv.permis ' +
      'FROM tbusuario as usu LEFT JOIN tbusuarionivel as niv ON usu.id_nivel = niv.id '
      + 'WHERE usu.id = :id1', [wUsuario]);
    result := 1;
    wTudoPermitido := True;
  end else begin
    fLogin := TfLogin.Create(nil);
    result := fLogin.ShowModal;
    // fLogin.hide;
    fLogin.Free;
  end;

  if result = 1 then begin
    // if application.MainForm <> nil then
    // ShowMessage('erro');
    Application.CreateForm(TfMain, fMain);
  end else begin
    DM.qyLogin.Close;
    Application.Terminate;
  end;

  Application.Run;

  // Application.Restore;
end.










