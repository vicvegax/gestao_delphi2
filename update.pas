unit update;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Zip,
  ShellApi, WebCopy;

type
  TfUpdate = class(TForm)
    pnAtu: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    lbBYTE: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    edHTTP: TEdit;
    edPORT: TEdit;
    btUPD: TButton;
    WebCopy1: TWebCopy;
    procedure mxUpdateBeforeShowInfo(Sender: TObject;
      var ShowInfo, CheckForUpdate: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btUPDClick(Sender: TObject);
    procedure WebCopy1FileDone(Sender: TObject; idx: Integer);
    procedure WebCopy1CopyProgress(Sender: TObject; fileidx: Integer; size,
      totsize: Cardinal);
    procedure WebCopy1ErrorInfo(Sender: TObject; ErrorCode: Integer;
      ErrorInfo: string);
    procedure WebCopy1URLNotFound(Sender: TObject; url: string);
  private
  { Private declarations }
    const
    WM_AFTER_SHOW = WM_USER + 1; // custom message
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
  public
    { Public declarations }
  end;

var
  fUpdate: TfUpdate;

implementation

{$R *.dfm}

uses modFuncoes, modDados;

procedure TfUpdate.btUPDClick(Sender: TObject);
begin
  //mxUpdate.HTTPPort:= strtoint(edPORT.Text);
  //mxUpdate.ProductInfo.URL:= edHTTP.Text;
  //mxUpdate.CheckForAnUpdate;
  webcopy1.Items.Clear;
  with webcopy1.Items.Add do begin
    url := ansistring(edHTTP.Text);
    targetdir:= appdir('update');
    targetfilename:= 'update.zip';
  end;
  webcopy1.ThreadExecute;
end;

procedure TfUpdate.FormCreate(Sender: TObject);
begin
  Self.AutoSize:= true;
  if not directoryexists(appdir('update')) then begin
    if not createdir(appdir('update')) then begin
      raise Exception.Create
        ('2308181609 - Diretorio UPDATE não pode ser criado.');
      Close;
    end;
  end;

  webcopy1.ShowDialog := not (wusuario > 100);

  edHTTP.Visible:= wUsuario <= 100;
  edPORT.Visible:= edHTTP.Visible;
  btUPD.Visible:= edHTTp.Visible;

  //edPORT.Text:= DM.DBCON.ExecSQLScalar('SELECT updport FROM config WHERE id = 1');
  edHTTP.Text:= DM.DBCON.ExecSQLScalar('SELECT updurl2 FROM config WHERE id = 1');
end;

procedure TfUpdate.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);  //Atualizacão acontece no procedure WmAfterShow

end;

procedure TfUpdate.mxUpdateBeforeShowInfo(Sender: TObject;
  var ShowInfo, CheckForUpdate: Boolean);
begin
  ShowInfo := False;

end;

procedure TfUpdate.WebCopy1CopyProgress(Sender: TObject; fileidx: Integer;
  size, totsize: Cardinal);
begin
  lbBYTE.Caption := IntToStr(size) + ' de ' + inttostr(totsize);

end;

procedure TfUpdate.WebCopy1ErrorInfo(Sender: TObject; ErrorCode: Integer;
  ErrorInfo: string);
begin
  ShowMessage('ERR2308180824 - Erro no download! - (' + inttostr(errorcode) + ') ' + errorinfo);
  if wUsuario > 100 then Application.Terminate;

end;

procedure TfUpdate.WebCopy1FileDone(Sender: TObject; idx: Integer);
var
  arq: TZipFile;
  st: string;
begin
  if not webcopy1.Items[0].Success then exit;

  //if webcopy1. then

  Self.DoubleBuffered := False;

  st := appdir('update\update.zip');
  if not FileExists(st) then begin
    MsgErro('ERR2308181610 - O arquivo "' + st +
      '" não existe! ERRO NA ATUALIZAÇÃO!!!');
    Close;
    exit;
  end;

  arq := TZipFile.Create;
  arq.Open(st, zmRead);
  arq.ExtractAll(appdir('update'));
  arq.Close;
  arq.Free;
  pnAtu.Caption := 'Atualização Baixada!\nAguarde...';

  st := appdir('updatehmwin64.exe');
  if not FileExists(st) then begin
    MsgErro('ERR2308181606 - Arquivo "' + st + '" não encontrado!');
    Close;
    exit;
  end;

  ///////
  if fileexists('.\update\libeay32.dll') then begin
    if not fileexists('.\libeay32.dll') then begin
      copyfile('.\update\libeay32.dll', '.\libeay32.dll', false);
    end;
  end;
  if fileexists('.\update\ssleay32.dll') then begin
    if not fileexists('.\ssleay32.dll') then begin
      copyfile('.\update\ssleay32.dll', '.\ssleay32.dll', false);
    end;
  end;
  //////

  If ShellExecute(Application.MainForm.Handle, PChar('open'), PChar(st),
    PChar('gestaocrm.exe update gestaocrm'), PChar(''), SW_SHOWNORMAL) <= 32 Then begin
    MsgErro('ERR2308181607 - Erro no ShellExecute da Atualização!');
    Close;
  end else begin
    // dm.DBTRANS.StartTransaction;
    dm.DBCON.ExecSQL('UPDATE log_novo SET ' +
      'tpsai = :v1, dhsai = :v2 WHERE id = :v3', [wLOGUP, Now, wLOGID]);
    // dm.DBCON.ExecSQL('INSERT INTO log (tplog, idusu, dthr, local, hash) ' +
    // 'VALUES (:v1, :v2, :v3, :v4, :v5)', [wLOGUP, wUsuario, Now, getPCName().GetHashCode, wHashlog]);
    // dm.DBTRANS.Commit;
    Application.Terminate;
  end;
  // shellexecute(
end;

procedure TfUpdate.WebCopy1URLNotFound(Sender: TObject; url: string);
begin
  MsgErro('2308181608 - Não encontrado: ' + url);
  // , mtError, [ mbOK ], 0 );
  if wUsuario > 100 then Application.Terminate	;

end;

procedure TfUpdate.WmAfterShow(var Msg: TMessage);
begin
  if wUsuario > 100 then btUPD.Click	;

end;

end.
