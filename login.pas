unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Controls, Vcl.ExtCtrls, System.Classes,
  Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, IOUtils, MaskUtils, Vcl.Imaging.pngimage,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, strutils;

type
  TfLogin = class(TForm)
    Label1: TLabel;
    edCPF: TEdit;
    Label2: TLabel;
    edSENHA: TEdit;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    pnUSU: TPanel;
    Label3: TLabel;
    lbUSU: TLabel;
    pnDEV: TPanel;
    lbDEV: TLabel;
    lbVersao: TLabel;
    lbBDLOCAL: TLabel;
    imgLogo: TImage;
    LinkLabel1: TLinkLabel;
    smtp1: TIdSMTP;
    msg1: TIdMessage;
    procedure btOKClick(Sender: TObject);
    procedure edCPFKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure pnDEVDblClick(Sender: TObject);
    procedure edCPFChange(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;

  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses modDados, modFuncoes, emailrecup;

procedure TfLogin.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure TfLogin.btOKClick(Sender: TObject);
var
  ult_log: Integer;
begin
  if length(sonumero(edCPF.Text)) < 11 then begin
    edCPF.SetFocus;
    exit;
  end;

  DM.qyLOGIN.Open
    ('SELECT usu.id, usu.cpf, usu.descr, usu.ult_log, usu.senha, usu.ativo, usu.id_nivel, '
    + 'niv.descr as ds_nivel, niv.permis ' +
    'FROM tbusuario as usu LEFT JOIN tbusuarionivel as niv ON usu.id_nivel = niv.id '
    + 'WHERE usu.cpf="' + sonumero(edCPF.Text) + '"');
  if DM.qyLOGIN.RecordCount = 0 then begin // not DM.qyLOGIN.Locate('cpf', edCPF.Text, []) then begin
    msgErro('CPF não encontrado!');
    edCPF.SetFocus;
    exit;
  end;

  if (length(edSENHA.Text) < 4) or
    (CodificaH(edSENHA.Text, 0) <> DM.qyLOGIN.FieldByName('senha').AsString)
  then begin
    msgErro('SENHA inválida!');
    edSENHA.SetFocus;
    edSENHA.SelectAll;
    exit;

  end;

  if DM.qyLOGIN.FieldByName('ativo').AsInteger <= 0 then
  begin
    msgErro('Usuário não autorizado!');
    exit;
  end;

  // ShowMessage('Seja bem vindo: ' + DM.qyUsu.FieldByName('descr').AsString);
  wUsuario := DM.qyLOGIN.FieldByName('id').AsInteger;
  btOK.Hide;
  btCancel.Hide;
  lbUSU.Caption := DM.qyLOGIN.FieldByName('descr').AsString;
  pnUSU.show;
  Self.Enabled := false;
  Self.Refresh;
  Sleep(500);
  wHashLog := TGUID.NewGuid.ToString().GetHashCode;
  DM.DBCON.StartTransaction;
  DM.DBCON.ExecSQL
    ('INSERT INTO log_novo (idusu, tpent, dhent, local, hash, versao) ' +
    'VALUES (:v1, :v2, :v3, :v4, :v5, :v6)', [wUsuario, wLOGEN, Now,
    getPCName().GetHashCode, wHashLog, wVersao]);
  DM.qry.Open('SELECT LAST_INSERT_ID() as lastid');
  wLOGID := DM.qry.FieldByName('lastid').AsInteger; // obtem ultimo ID no log;
  DM.qry.Close;

  ult_log := DM.qyLOGIN.FieldByName('ult_log').AsInteger;
  if ult_log > 0 then
  begin
    DM.qry.Open('select * from log_novo WHERE id = :v1', [ult_log]);
    if DM.qry.RecordCount = 0 then
    begin
      msgErro('ERR - 2308170824 - Erro no último LOG deste usuário! LOG ' +
        inttostr(ult_log) + ' não encontrado!');
    end
    else if DM.qry.RecordCount > 1 then
    begin
      msgErro('ERR - 2308170826 - Erro no último LOG deste usuário! LOG ' +
        inttostr(ult_log) + ' duplicado!');
    end
    else
    begin
      if DM.qry.FieldByName('tpsai').AsInteger = 0 then
      begin // saida inesperada do sistema
        DM.qry.Edit;
        DM.qry.FieldByName('tpsai').AsInteger := wLOGERR;
        DM.qry.Post
      end;
    end;
  end;
  DM.qry.Close;

  DM.qyLOGIN.Edit;
  DM.qyLOGIN.FieldByName('ult_log').AsInteger := wLOGID;
  DM.qyLOGIN.Post;
  DM.DBCON.Commit;
  modalResult := 1;

  if (wUsuario = 98) and (wModoDev = 0) then
  begin
    // Usuario: 11111111111 / 123456
    // NOLOGIN - Não pede login de usuário e senha
    // NOLOCAL - usa a base de dados externa
    // NODEV - Não entra no modo Dev
    TFile.WriteAllText(appdir('DEV.MOD'),
      ';NOLOGIN'#13#10';NOLOCAL'#13#10'NODEV'#13#10);
    ShowMessage
      ('O Sistema irá ser FINALIZADO! ENTRE novamente, DESENVOLVEDOR!');
    DM.DBCON.ExecSQL('INSERT INTO log_novo (idusu, tpsai, local, hash, versao) '
      + 'VALUES (:v1, :v2, :v3, :v4, :v5)',
      [wUsuario, wLOGDS, getPCName().GetHashCode, wHashLog, wVersao]);
    // dm.DBCON.Commit;
    Application.Terminate;
  end;

  // DM.qry.Open('select permis from tbusuarionivel where id = ' + DM.qyLogin.FieldByName('id_nivel').AsString);
  // if DM.qry.RecordCount > 0 then begin

  if DM.qyLOGIN.FieldByName('id_nivel').AsInteger > 1 then
  begin
    wTudoPermitido := false;
    //DM.tbUsuRel.Open('select permissao from tbusuarionivelpermissao where nivel = ' +
    //  DM.qyLOGIN.FieldByName('id_nivel').AsString);

    DM.tbUsuRel.Open('SELECT upper(up.nome) descr FROM `usuarionivelpermissao` unp ' +
                     'left join `usuariopermissao` up on unp.permissao = up.id ' +
                     'where (unp.nivel = ' + vartostr(dm.qyLogin['id_nivel']) + ') ' +
                     'order by descr');
  end else begin
    wTudoPermitido := True;
  end;
  // wPermissao:= DM.qyLogin.FieldByName('permis').AsString;//DM.qry.FieldByName('permis').AsString;
  // if wPermissao = '' then begin
  // wPermissao:= TudoPermitido;
  // MsgErro('2609231639 - Algum problema com as Permissões do Usuário ' + DM.qyLogin.FieldByName('descr').AsString);
  // end;
end;

procedure TfLogin.edCPFChange(Sender: TObject);
//var
//  st: string;
begin

  edCPF.Text := formataCPF(edCPF.Text);
  edCPF.SelStart := length(edCPF.Text);
  if length(edCPF.Text) = maskCPF.Length then begin
    if not checaNRINS(sonumero(edCPF.Text), cTipoCPF) then begin
      msgErro('CPF inválido!');
      edCPF.SelectAll;
    end else
      ProxFocus;
  end;
end;

procedure TfLogin.edCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(Key, ['0' .. '9', #8, #13, ^C, ^V]) then
    Key := #0;
  // edCPF.Text:= string(edCPF.Text).PadLeft(11, '0');

end;

procedure TfLogin.FormCreate(Sender: TObject);
var
  sLogo: TStringStream;
begin
  if DM.DBCON.ExecSQLScalar('SELECT NOT ISNULL(logo) FROM config where id = 1') then begin
    sLogo:= TStringStream.Create(Vartostr(DM.DBCON.ExecSQLScalar('select logo from config where id = 1')));
    imgLogo.Picture.LoadFromStream(sLogo);
    sLogo.Free;
    imgLogo.AutoSize:= True;
  end;
  //imgLogo.Top := 0;
  Self.ClientWidth := imgLogo.Width + imgLogo.Left + 8;
  Self.ClientHeight := imgLogo.Height + imgLogo.Top * 2;
  lbVersao.Caption := 'Versão ' + FormatMaskText('9.9.99;0;_', wVersao);
  lbVersao.Left := 8;
  lbVersao.Top := Self.ClientHeight - 8 - lbVersao.Height;
  // lbVersao.Left:= (clientWidth - lbVersao.Width) div 2;
  lbDEV.Left := (pnDEV.ClientWidth - lbDEV.Width) div 2;
  lbDEV.Top := (pnDEV.ClientHeight - lbDEV.Height) div 2;

  //lbBDLOCAL.Visible := not wBDLOCAL;
  if wModoDev = 0 then
    pnDEV.Hide;

  pnUSU.Hide;
end;

procedure TfLogin.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
var
  nova: string;
  email, st, st2: string;
  par: integer;
  i: integer;
begin
  if length(sonumero(edCPF.Text)) < 11 then begin
    msgerro('Informe um CPF válido!');
    edCPF.SetFocus;
    exit;
  end;

  DM.qry.Open
    ('SELECT usu.id as idusu, usu.cpf, usu.senha, usu.descr as dsusu, age.descr as dsage, age.email, age.id as idage ' +
     'FROM tbusuario as usu LEFT JOIN tbpessoal as age ON usu.cpf = age.nr_ins ' +
     'WHERE usu.cpf="' + sonumero(edCPF.Text) + '"');
  if DM.qry.RecordCount = 0 then begin // not DM.qyLOGIN.Locate('cpf', edCPF.Text, []) then begin
    msgErro('CPF não encontrado!');
    edCPF.SetFocus;
    exit;
  end;

  if vartostr(DM.qry['email']) = '' then begin // not DM.qyLOGIN.Locate('cpf', edCPF.Text, []) then begin
    msgErro('Não há e-mail de recuperação para este CPF!');
    edCPF.SetFocus;
    exit;
  end;

  st:= DM.qry['email'];
  par:= st.IndexOf('@');
  st2:= st.Substring(par);
  st:= st.Substring(0, par);
  if st.Length > 3 then
    st:= leftstr(st, 3) + stringofchar('*', st.Length-3);
  if not InputQuery('E-mail para recuperação de senha. DEVE SER O MESMO DO CADASTRO!!! CPF: ' + edCPF.Text,
    'Informe o e-mail cadastrado para recuperação de senha:' + #13#10 + st + st2,email) then exit;
//  if email = '' then Exit;

  if email.ToLower <> vartostr(DM.qry['email']).ToLower then begin
    msgerro('E-mail informado deve ser o mesmo que está cadastrado para o agente!');
    exit;
  end;

  nova:= '';
  for i := 1 to 6 do
    nova:= nova + inttostr(random(10));

  DM.qry.Edit;
  dm.qry['senha']:= CodificaH(nova, 0);
  dm.qry.Post;
  with MSG1.Recipients.Add do begin
    Name:=DM.qry['dsage'];
    Address:=Dm.qry['email'];
  end;
  //msg1.Body.Text:= 'Este é um e-mail de recuperação de senha.';
  msg1.Body.Text:= StringReplace(msg1.Body.Text, '%usuario%', Dm.qry['dsusu'], []);
  msg1.Body.Text:= StringReplace(msg1.Body.Text, '%senha%', nova, []);
  try
    SMTP1.Connect;
    SMTP1.Send(msg1);
    ShowMessage('Foi enviado um e-mail de recuperação para ' + Dm.qry['email'] + '! ' + #13#10 +
     'Se você não ver este e-mail em sua caixa de entrada dentro de 15 minutos, verifique em sua caixa de spam. Se estiver lá, por favor, marque como "Não é Spam".');
  finally
    smtp1.Disconnect;
  end;

end;

procedure TfLogin.pnDEVDblClick(Sender: TObject);
begin
  if wModoDev <> 0 then
  begin
    deletefile(appdir('DEV.MOD'));
    pnDEV.Hide;
    wModoDev := 0;
    ShowMessage
      ('O sistema será FINALIZADO e sairá do Modo Desenvoldedor! ENTRE novamente.');
    Application.Terminate;
  end;

end;

end.
