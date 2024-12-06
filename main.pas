unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, modFuncoes, mxWebUpdate,
  INIFiles,
  cxClasses, cxLocalization, Vcl.ComCtrls, IOUtils, MaskUtils, shellapi,
  Vcl.Imaging.pngimage;

type
  TfMain = class(TForm)
    mnuMain: TMainMenu;
    mnuTabelas: TMenuItem;
    mnuCadUnidades: TMenuItem;
    mnuCadAgentes: TMenuItem;
    mnuCadFornec: TMenuItem;
    mnuTabEventos: TMenuItem;
    mnuTabFeriados: TMenuItem;
    mnuCadTpBens: TMenuItem;
    mnuCadContas: TMenuItem;
    mnuUtiUsuarios: TMenuItem;
    mnuCadBensLoc: TMenuItem;
    mnuMovimento: TMenuItem;
    acList: TActionList;
    acInc: TAction;
    acAlt: TAction;
    acExc: TAction;
    acConf: TAction;
    pnBarCad: TPanel;
    btInc: TSpeedButton;
    btAlt: TSpeedButton;
    btExc: TSpeedButton;
    btConf: TSpeedButton;
    pnHead: TPanel;
    lbChildCaption: TLabel;
    Label2: TLabel;
    mnuUtilitarios: TMenuItem;
    mnuAtualizar: TMenuItem;
    mnuDev: TMenuItem;
    cxLocalizer1: TcxLocalizer;
    btChildFechar: TSpeedButton;
    mnuTabDocumentos: TMenuItem;
    stBar: TStatusBar;
    pnDEV: TPanel;
    lbDEV: TLabel;
    mnuCadBensCat: TMenuItem;
    pnNovaAtu: TPanel;
    lbNovaAtu: TLabel;
    mnuCadContratos: TMenuItem;
    mnuTabContratos: TMenuItem;
    mnuTabReajustes: TMenuItem;
    btVoltar: TSpeedButton;
    edDadosAtu: TMemo;
    lbVersao: TLabel;
    btAtualizar: TButton;
    mnuErro: TMenuItem;
    mnuCadastro: TMenuItem;
    Sair1: TMenuItem;
    mnuConfig: TMenuItem;
    N4: TMenuItem;
    mnuPolitica: TMenuItem;
    AindanoImplementado1: TMenuItem;
    PolticadeSeguranadaInformao1: TMenuItem;
    PolticadeSenhas: TMenuItem;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    mnuImportarAgentes: TMenuItem;
    mnUsuNivel: TMenuItem;
    mnUsuPermis: TMenuItem;
    mnUsuNivelPermis: TMenuItem;
    mnuDadosContrato: TMenuItem;
    mnuResumoContas: TMenuItem;
    N6: TMenuItem;
    imgLogo: TImage;
    mnuDadosUnidade: TMenuItem;
    mnuLucroPresumido: TMenuItem;
    BenseMateriais1: TMenuItem;
    N7: TMenuItem;
    mnuImpCSV: TMenuItem;
    mnuCadEmpresas: TMenuItem;
    Timer1: TTimer;
    N8: TMenuItem;
    AlterarSenha1: TMenuItem;
    mnuAjuContas: TMenuItem;
    mnuCfgRel: TMenuItem;
    lbPING: TLabel;
    btMover: TSpeedButton;
    acGenerico: TAction;
    btExportar: TSpeedButton;
    acExportar: TAction;
    Gerncia1: TMenuItem;
    mnuModoDepuracao: TMenuItem;
    PolticadeAdequaoLGPD1: TMenuItem;
    mnuAnalisePonto: TMenuItem;
    mnuImportaReceita: TMenuItem;
    pnAguarde: TPanel;
    procedure menuClick(Sender: TObject);
    procedure acModoExecute(Sender: TObject);
    procedure acConfExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuDevClick(Sender: TObject);
    procedure mnuAtualizarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject;
      var CanClose: Boolean);
    procedure mnuUtilitariosClick(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure pnDEVDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    procedure mnuErroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure mnuConfigClick(Sender: TObject);
    procedure AindanoImplementado1Click(Sender: TObject);
    procedure PolticadeSeguranadaInformao1Click(Sender: TObject);
    procedure PolticadeSenhasClick(Sender: TObject);
    procedure mnuImportarAgentesClick(Sender: TObject);
    procedure mnUsuNivelPermisClick(Sender: TObject);
    procedure DadosdeContratos1Click(Sender: TObject);
    procedure mnuImpCSVClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AlterarSenha1Click(Sender: TObject);
    procedure mnuAjuContasClick(Sender: TObject);
    procedure mnuCfgRelClick(Sender: TObject);
    procedure acGenericoExecute(Sender: TObject);
    procedure acExportarExecute(Sender: TObject);
    procedure mnuModoDepuracaoClick(Sender: TObject);
    procedure PolticadeAdequaoLGPD1Click(Sender: TObject);
  private
    { Private declarations }
    fChild: TForm;
    bChild: Boolean;
    ForcedClose: Boolean;
    // lCaption: String;
    procedure MostraLogo;
    procedure WMACAO(var Msg: TMessage); message WM_ACAO;
    procedure OnWindowsEnd(var Msg: TMessage);
      message WM_QUERYENDSESSION;
    // responds to message WM_ENDSESSION;
    // procedure AtuHead(St: String);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses modDados, cadCateg, cadContas, cadFeriados, cadInvent, cadUnidades,
  cadPessoal,
  cadEventos, cadUsuario, plaMovimento, cadTipoGenerico,
  plaContrato,
  cadTipoDoc, update, Config, importAgente, cadUsuarioNivel,
  cadUsuarioPermissao, cadUsuarioNivelPermis, dadosContrato, resumoConta,
  dadosUnidade, importBens, cadEmpresas, mudarSenha,
  ajustaConta, cfgRelatorios, plaRegimeTrib, relAnalisePonto, importRec;

procedure TfMain.acConfExecute(Sender: TObject);
begin
  //
  if (not Assigned(fChild)) then
    Exit;

  // Self.SetFocus;
  // Edit1.SetFocus;
  SendMessage(fChild.Handle, WM_ACAO, wpConfirma, 0);
  // Informa Ação Confirma

end;

procedure TfMain.acExportarExecute(Sender: TObject);
begin
  //
  if (not Assigned(fChild)) then
    Exit;

  // Self.SetFocus;
  // Edit1.SetFocus;
  SendMessage(fChild.Handle, WM_ACAO, wpExportar, 0);

end;

procedure TfMain.acGenericoExecute(Sender: TObject);
begin
  //
  if (not Assigned(fChild)) then
    Exit;

  // Self.SetFocus;
  // Edit1.SetFocus;
  SendMessage(fChild.Handle, WM_ACAO, wpGenerico, 0);
  // Informa Ação Confirma

end;

procedure TfMain.acModoExecute(Sender: TObject);
begin
  // ShellExecute(
  if (not Assigned(fChild)) then
    Exit;

  wModo := TComponent(Sender).Tag;

  // fChild.Tag:= lModo;

  lbChildCaption.Caption := fChild.Caption + ' - ' + kModo[wModo];
  // pnHead.Caption:= ' *** Modo de ' + kModo[wModo] + ' *** ';
  // pnHead.Caption:= kModo[wModo];//+ ' *** ';
  if (wModo = modoInc) then
  begin
    btInc.Down := true;
    lbChildCaption.Font.Color := clBlack;
  end
  else if (wModo = modoAlt) then
  begin
    btAlt.Down := true;
    lbChildCaption.Font.Color := clGreen;
  end
  else
  begin
    btExc.Down := true;
    lbChildCaption.Font.Color := clRed;
  end;

  // fMain.AtuHead(fChild.Caption);
  SendMessage(fChild.Handle, WM_ACAO, wpModo, wModo);
  // Informa que o Modo foi Alterado (Inc, Alt, Exc)
end;

procedure TfMain.AindanoImplementado1Click(Sender: TObject);
var
  st: string;
begin
  st := DM.DBCON.ExecSQLScalar('select linkPolitica1 from config');
  if st <> '' then
    shellexecute(0, 'open', PWideChar(st), '', '', sw_shownormal);
end;

procedure TfMain.AlterarSenha1Click(Sender: TObject);
begin
  with TfMudarSenha.Create(self) do begin
    ShowModal;
    Free;
  end;
end;

procedure TfMain.mnuAjuContasClick(Sender: TObject);
begin
  with TfajustaConta.Create(Self) do begin
    ShowModal;
    free;
  end;
end;

procedure TfMain.mnuAtualizarClick(Sender: TObject);
begin
  btAtualizar.click;
end;

procedure TfMain.mnuCfgRelClick(Sender: TObject);
begin
  with TfcfgRel.Create(Self) do begin
    ShowModal;
    Free;
  end;
end;

procedure TfMain.mnuConfigClick(Sender: TObject);
begin
  with TfConfig.Create(Self.Owner) do
  begin
    if ShowModal = idok then begin
      if (Assigned(fChild)) then begin
        if fChild.Tag = mnuMovimento.Tag then begin
          fChild.Hide;
          fChild.Show;
        end;

      end;
      MostraLogo;
    end;

    Free;
  end;
end;

procedure TfMain.mnuDevClick(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) < 0 then
  begin
    if Application.MessageBox('Ativar MODO DESENVOLVEDOR?',
      'Gestão e CRM', MB_YESNO) = IDNO then
      Exit;
    TFile.WriteAllText('DEV.MOD', '');
    showmessage('O Sistema irá ser Finalizado! ENTRE novamente!');
    Application.Terminate;
  end;
end;

procedure TfMain.mnuErroClick(Sender: TObject);
begin
  raise Exception.Create('Testando o Envio de EurekaLog!');
end;

procedure TfMain.OnWindowsEnd(var Msg: TMessage);
var
  CanClose: Boolean;
begin
  // Possible checking for flags, see http://msdn.microsoft.com/en-us/library/aa376889%28v=vs.85%29.aspx
  ForcedClose := true;
  CanClose := true;
  FormCloseQuery(Self, CanClose);
  Msg.Result := 1;
end;

// procedure TfMain.AtuHead(St: String);
// begin
// lbCap.Caption:= St;

// end;

procedure TfMain.btVoltarClick(Sender: TObject);
begin
  if (not Assigned(fChild)) then
    Exit;

  pnHead.Hide;
  pnBarCad.Hide;
  bChild := false;
  fChild.Close;
  fChild.Free;
  fChild := nil;

end;

procedure TfMain.DadosdeContratos1Click(Sender: TObject);
begin
  with TfDadosContrato.Create(Self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfMain.btAtualizarClick(Sender: TObject);
// var
// NovaAtu: boolean;
begin

  btAtualizar.Tag := 1;
  if not(GetKeyState(VK_SHIFT) < 0) then
  begin // shift NÃO está pressionado
    with DM.qry do
    begin
      open('SELECT livre FROM updateaplic ORDER BY ID DESC LIMIT 1');
      btAtualizar.Tag := fieldbyname('livre').AsVariant;
      Close;
    end;
  end;

  if (btAtualizar.Tag <> 0) then
  begin
    with TfUpdate.Create(Self) do
    begin
      ShowModal;
    end;
  end
  else
  begin
    MsgErro('Atualização não está funcionando no momento! Entre em contato com o desenvolvedor...');
  end;
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := ForcedClose;
  if not ForcedClose then begin
    {
    if (Assigned(fChild)) then
    begin
      fChild.Close;
      fChild.Free;
      fChild := nil;
      pnHead.Hide;
      pnBarCad.Hide;

      CanClose := false;
    end
    else
    begin
      CanClose := True;
        //(Application.MessageBox
        //('Deseja SAIR do aplicativo de Gestão?',
        //'Gestão e CRM', MB_YESNO) = IDYES); // or AllowClose;
    end;
    }
    CanClose:= true;
  end;

  if CanClose then begin
    if wModoDev = 0 then
      DM.DBCON.ExecSQL('UPDATE log_novo SET ' +
        'tpsai = :v1, dhsai = :v2 WHERE id = :v3',
        [wLOGSA, Now, wLOGID]);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
// var
// mii: TMenuItemInfo;
// MainMenu: hMenu;
// Buffer: array[0..79] of Char;
begin
  wModoDepuracao:= False;

  MostraLogo;
  ForcedClose := false;
  btVoltar.Left:= pnHead.ClientWidth - btVoltar.Width - 4;
  {
    //*** Alinha Menu Política à Direita - 14/09/23
    MainMenu := Self.Menu.Handle;

    //GET Help Menu Item Info
    mii.cbSize := SizeOf(mii) ;
    mii.fMask := MIIM_TYPE;
    mii.dwTypeData := Buffer;
    mii.cch := SizeOf(Buffer) ;
    GetMenuItemInfo(MainMenu, mnuPolitica.Command, false, mii) ;

    //SET Help Menu Item Info
    mii.fType := mii.fType or MFT_RIGHTJUSTIFY;
    SetMenuItemInfo(MainMenu, mnuPolitica.Command, false, mii) ;
    //*** Fim Alinhamento do Menu
  }
  pnNovaAtu.Left := (Self.ClientWidth - pnNovaAtu.Width) div 2;
  pnNovaAtu.Top := (Self.ClientHeight - pnNovaAtu.Height) div 2;
  pnNovaAtu.Hide;

  cxLocalizer1.StorageType:= lstResource;
  cxLocalizer1.Active := true; // vem primeiro que o Locale
  cxLocalizer1.Locale := 1046;

  if wModoDev <> 0 then
  begin
    Self.Caption := '(*** MODO DESENVOLVEDOR ***) ' + Self.Caption;
    stBar.Panels[0].Text := '(*** MODO DESENVOLVEDOR ***) ';
    Self.Color := pnDEV.Color;
  end
  else
    pnDEV.Hide;

  stBar.Panels[0].Text := stBar.Panels[0].Text + ' v' +
    FormatMaskText('9.9.99;0;_', wVersao) + '-' + wDtLanc;
  // Self.Caption:= Self.Caption + ' ' + FormatMaskText('9.9.99;0;_', wVersao) + ' - ' + wDtLanc;
  stBar.Panels[2].Text := DM.qyLOGIN.fieldbyname('descr').AsString + ' ('
    + DM.qyLOGIN.fieldbyname('ds_nivel').AsString + ')';

  //lbBDLOCAL.Visible := not wBDLOCAL;
  if wModoDev = 0 then begin
    with DM.qry do begin
      open('SELECT * FROM updateaplic ORDER BY id DESC LIMIT 1');
      btAtualizar.Tag := fieldbyname('livre').AsVariant;
      lbNovaAtu.Caption := 'ID' + fieldbyname('id').AsString +
        ' - UMA NOVA ATUALIZAÇÃO'#13#10'FOI DISPONIBILIZADA';
      if (fieldvalues['livre'] or wUsuario <= 100) and
        (
          (wVersao <> fieldbyname('versao').AsString) or
          (wDtLanc <> formatDatetime('yymmdd', fieldbyname('data').AsDateTime))
        ) then begin
        lbNovaAtu.Caption := lbNovaAtu.Caption + #13#10  + 'EM ' +
          formataData(fieldbyname('agora').AsDateTime) + ' ÀS ' +
          formatDatetime('hh:mm', fieldbyname('agora').AsDateTime);
        lbVersao.Caption := 'Versão Atual: ' +
          FormatMaskText('0.0.00;0;_', wVersao) + #13#10
          + 'Nova Versão: ' +
          FormatMaskText('0.0.00;0;_', fieldbyname('versao').AsString);
        edDadosAtu.Lines.Text := fieldbyname('dados').AsString;
        pnNovaAtu.Show;
        Self.Caption:= Self.Caption + ' ATUALIZE O SISTEMA!!!!!';
        timer1.Enabled:= true;
        if wVersao < fieldbyname('versao').AsString then
          Self.Menu:= nil;
      end;
      Close;
    end;
  end;

  ///////////////////////////////////////////////////////////////////////
  ///


  mnuErro.Visible := (wusuario <= 100);
  mnuImpCSV.Visible := wusuario <= 100;
  mnuAjuContas.Visible := wusuario <= 100;

  //MENU MOVIMENTO
  mnuMovimento.Enabled:= DM.permitido('MovC');

  //MENU CADATRO
  mnuCadContratos.Enabled := DM.permitido('cadContratosC');
  mnuCadEmpresas.Enabled := DM.permitido('cadEmpresasC');
  mnuCadContas.Enabled := DM.permitido('CadContasC');
  mnuCadUnidades.Enabled := DM.permitido('cadUnidadesC');
  mnuCadAgentes.Enabled := DM.permitido('cadAgentesC');
  mnuCadFornec.Enabled := DM.permitido('cadFornecC');

  //MENU BENS E MATERIAIS
  mnuCadBensLoc.Enabled:= DM.permitido('cadBensC');
  mnuCadBensCat.Enabled:= DM.permitido('cadBensC');
  mnuCadTpBens.Enabled:= DM.permitido('cadTpBensC');

  //MENU TABELAS
  mnuTabFeriados.Enabled := DM.permitido('tabFeriadosC');
  mnuTabEventos.Enabled := DM.permitido('tabEventosC');
  mnuTabDocumentos.Enabled := DM.permitido('tabDocumentosC');
  mnuTabContratos.Enabled := DM.permitido('tabContratosC');
  mnuTabReajustes.Enabled := DM.permitido('tabReajustesC');

  //MENU GERÊNCIA
  //mnuImportaReceita.Visible := wusuario <= 100;

  //MENU UTILITARIOS
  mnuDadosContrato.Enabled := DM.permitido('utiDadosContrato');
  mnuImportarAgentes.Enabled := DM.permitido('utiImportAgentes');
  mnuResumoContas.Enabled := DM.permitido('utiResumoContas');
  mnuLucroPresumido.Enabled := DM.permitido('utiLucroPresumido');
  mnuConfig.Enabled := DM.permitido('utiConfig');
  mnuUtiUsuarios.Enabled := DM.permitido('utiUsuariosC');
  mnUsuNivel.Visible := wusuario <= 100; //DM.permitido(920);
  mnUsuPermis.Visible := wusuario <= 100;
  mnUsuNivelPermis.Visible := DM.permitido('UtiRelNivelPerm');

  mnuCfgRel.Visible:= wUsuario <= 100;
  //mnuMov2.Visible:= (wUsuario <= 100);
  lbPING.Visible:= wUsuario <= 100;
  if lbPING.Visible then
    lbPING.Caption:= 'Ping (s): ' + vartostr(DM.DBCON.ExecSQLScalar('select ping from config'));

  ////////////////////////////////////////////////////////////////////////
  // ao abrir o explorer e executar o program pela PRIMEIRA VEZ, ele não vinha pra frente
  // Resolvido em 30/08/2023
  BringWindowToTop(Handle);
  SetForegroundWindow(Handle);

end;

procedure TfMain.FormResize(Sender: TObject);
begin
  if pnNovaAtu.Visible then begin

    pnNovaAtu.Left := (Self.ClientWidth - pnNovaAtu.Width) div 2;
    pnNovaAtu.Top := (Self.ClientHeight - pnNovaAtu.Height) div 2;

  end;

  imgLogo.Left := (Self.ClientWidth - imgLogo.Width) div 2;
  imgLogo.Top := (Self.ClientHeight - imgLogo.Height) div 2;
  pnAguarde.Left := (Self.ClientWidth - pnAguarde.Width) div 2;
  pnAguarde.Top := (Self.ClientHeight - pnAguarde.Height) div 2;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  // Self.BringToFront;
  Self.WindowState := wsMaximized;
end;

procedure TfMain.mnuImpCSVClick(Sender: TObject);
begin
  with TfimportBens.Create(Self) do
  begin
    ShowModal;
    // Close;
    Free;
  end;
end;

procedure TfMain.mnuImportarAgentesClick(Sender: TObject);
begin
  if (Assigned(fChild)) then begin
    // bChild:= false;
    if fChild.Tag = Tag then Exit; // bChild:= true;
    fChild.Close;
    fChild.Free;
    fChild := nil;
  end;
  pnHead.Hide;
  pnBarCad.Hide;
  with TfImportAgente.Create(Self) do begin
    ShowModal;
    Free;
  end;
end;

procedure TfMain.mnuModoDepuracaoClick(Sender: TObject);
begin
wModoDepuracao:= not wModoDepuracao;
mnuModoDepuracao.Checked:= wModoDepuracao;
end;

procedure TfMain.menuClick(Sender: TObject);
var
  Tag: integer;
  descr: string;
  pnBarCadVisible: boolean;
begin
  acList.State := asNormal;
  Tag := TComponent(Sender).Tag;
  bChild := true;
  if (Assigned(fChild)) then
  begin
    // bChild:= false;
    if fChild.Tag = Tag then
      Exit; // bChild:= true;
    fChild.Close;
    fChild.Free;
    fChild := nil;
  end;
  pnHead.Hide;
  pnBarCad.Hide;
  if (bChild) then begin
    pnAguarde.Visible:= true;
    Update;
    acGenerico.Visible:= False;
    acExportar.Visible:= False;
    pnBarCadVisible := true;
    btInc.Enabled:= True;
    btAlt.Enabled:= True;
    btExc.Enabled:= True;
    wModo := modoInc;
    case Tag of
      5: begin
        fChild:= TfcadEmpresas.Create(Application);
        descr:= 'cadEmpresas';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      10: begin
        fChild := TfcadContas.Create(Application);
        descr:= 'cadContas';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      20: begin
        fChild := TfcadUnidades.Create(Application);
        descr:= 'cadUnidades';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      30: begin
        fChild := TfcadPessoal.Create(Application, cTipoAgente);
        descr:= 'cadAgentes';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      40: begin
        fChild := TfcadPessoal.Create(Application, cTipoFornecedor);
        descr:= 'cadFornec';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      50: begin
        acGenerico.Visible:= True;
        acExportar.Visible:= True;
        fChild := TfcadInvent.Create(Application, True);
        descr:= 'cadBens';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      51: begin
        acGenerico.Visible:= True;
        acExportar.Visible:= True;
        fChild := TfcadInvent.Create(Application, False);
        descr:= 'cadBens';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      60: begin
        fChild := TfcadUsuario.Create(Application);
        descr:= 'utiUsuarios';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      61:
        fChild := TfcadUsuarioNivel.Create(Application);
      62:
        fChild := TfcadUsuarioPermissao.Create(Application);
      70: begin
        fChild := TfcadFeriados.Create(Application);
        descr:= 'tabFeriados';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      80: begin
        fChild := TfcadCateg.Create(Application);
        descr:= 'cadTpBens';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      90: begin
        fChild := TfcadEventos.Create(Application);
        descr:= 'tabEventos';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      100: begin
        fChild := TfcadTipoDoc.Create(Application);
        descr:= 'tabDocumentos';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
        // , 'tbTipoDoc', 'Documentos');
      101: begin
        fChild := TfcadTipoGen.Create(Application, 'tbtipocontrato', 'Contratos');
        descr:= 'tabContratos';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      102: begin
        fChild := TfcadTipoGen.Create(Application, 'tbtiporeajus', 'Reajustes');
        descr:= 'tabReajustes';
        btInc.Enabled:= DM.permitido(descr + 'I');
        btAlt.Enabled:= DM.permitido(descr + 'A');
        btExc.Enabled:= DM.permitido(descr + 'E');
      end;
      900: begin
        acList.State := asSuspended;
        pnBarCadVisible := false;
        wModo := modoNav;
        fChild := TfDadosContrato.Create(Application);
      end;
      901: begin
        acList.State := asSuspended;
        pnBarCadVisible := false;
        wModo := modoNav;
        fChild := TfResumoConta.Create(Application);
      end;
      902: begin
        acList.State := asSuspended;
        pnBarCadVisible := false;
        wModo := modoNav;
        fChild := TfDadosUnidade.Create(Application);
      end;
      903: begin
        acList.State := asSuspended;
        pnBarCadVisible := false;
        wModo := modoNav;
        fChild := TfplRegimeTrib.Create(Application);
      end;
      904: begin
        acList.State := asSuspended;
        pnBarCadVisible := false;
        wModo := modoNav;
        fChild := TfrelAnalisePonto.Create(Application);
      end;
      905: begin
        acList.State := asSuspended;
        pnBarCadVisible := false;
        wModo := modoNav;
        fChild := TfImportRec.Create(Application);
      end;

      1000: begin // planilha de Movimento
        startTickCount();
        acList.State := asSuspended;
        // 24/04/2023 - Se não há contas cadastradas, nem cria a planilha.
        pnBarCadVisible := false;
        pnHead.Caption := '';
        wModo := modoNav;
        DM.qyCnt.open(DM.sqlTBCNT);
        // DM.qyCnt.Filter:= 'ativo =
        if DM.qyCnt.RecordCount = 0 then begin
          DM.qyCnt.Close;
          MsgErro('Não há Contas de Movimento cadastradas.');
          Exit;
        end;
        fChild := TfplaMov.Create(Application);
      end;

      1100: begin // planilha de Contratos
        acList.State := asSuspended;
        // 24/04/2023 - Se não há contas cadastradas, nem cria a planilha.
        pnBarCadVisible := false;
        pnHead.Caption := '';
        wModo := modoNav;
        DM.qyCnt.open(DM.sqlTBCNT);
        if DM.qyCnt.RecordCount = 0 then begin
          DM.qyCnt.Close;
          MsgErro('Não há Contas de Movimento cadastradas.');
          Exit;
        end;
        fChild := TfplaContrato.Create(Application);
      end;

    else
      Exit;
    end;

    // pnHead.Caption
    // lbChildCaption.Caption:= fChild.Caption;
    lbChildCaption.Caption := fChild.Caption;
    pnBarCad.Visible := pnBarCadVisible;
    pnHead.Show;
    // pnBarCad.Show;
    fChild.Tag := Tag;
    fChild.Align := alClient;
    fChild.manualdock(Self);
    pnAguarde.Visible:= False;
    fChild.Show;
    if wModo = modoInc then acInc.Execute;
  end;

end;

procedure TfMain.pnDEVDblClick(Sender: TObject);
begin
  raise Exception.Create('Duplo clicado!');
end;

procedure TfMain.PolticadeAdequaoLGPD1Click(Sender: TObject);
var
  st: string;
begin
  st := DM.DBCON.ExecSQLScalar('select linkPolitica4 from config');
  if st <> '' then
    shellexecute(0, 'open', PWideChar(st), '', '', sw_shownormal);
end;

procedure TfMain.PolticadeSeguranadaInformao1Click(Sender: TObject);
var
  st: string;
begin
  st := DM.DBCON.ExecSQLScalar('select linkPolitica2 from config');
  if st <> '' then
    shellexecute(0, 'open', PWideChar(st), '', '', sw_shownormal);
end;

procedure TfMain.PolticadeSenhasClick(Sender: TObject);
var
  st: string;
begin
  st := DM.DBCON.ExecSQLScalar('select linkPolitica3 from config');
  if st <> '' then
    shellexecute(0, 'open', PWideChar(st), '', '', sw_shownormal);
  //
end;

procedure TfMain.mnUsuNivelPermisClick(Sender: TObject);
begin
  with TfCadUsuarioNivelPermis.Create(Self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfMain.Sair1Click(Sender: TObject);
begin
  ForcedClose := true;
  Close;
end;

procedure TfMain.Timer1Timer(Sender: TObject);
begin
lbNovaAtu.Visible:= not lbNovaAtu.Visible;
end;

procedure TfMain.mnuUtilitariosClick(Sender: TObject);
begin
  if wModoDev = 0 then
    mnuDev.Visible := GetKeyState(VK_SHIFT) < 0;
end;

procedure TfMain.MostraLogo;
var
  sLogo: TStringStream;
begin
  if DM.DBCON.ExecSQLScalar('SELECT NOT ISNULL(logo) FROM config where id = 1') then begin
    sLogo:= TStringStream.Create(Vartostr(DM.DBCON.ExecSQLScalar('select logo from config where id = 1')));
    imgLogo.Picture.LoadFromStream(sLogo);
    sLogo.Free;
    imgLogo.AutoSize:= True;
  end;

  imgLogo.Left := (Self.ClientWidth - imgLogo.Width) div 2;
  imgLogo.Top := (Self.ClientHeight - imgLogo.Height) div 2;
end;

procedure TfMain.WMACAO(var Msg: TMessage);
begin
  if Msg.wParam = wpModo then
  begin
    if Msg.LParam = modoInc then
      btInc.click;
    if Msg.LParam = modoAlt then
      btAlt.click;
    if Msg.LParam = modoExc then
      btExc.click;
  end;

end;

end.
