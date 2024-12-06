unit lanFatura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, valorEdit, Vcl.Buttons, DateUtils;

type
  TflanFatura = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNFE: TEdit;
    edDTEMI: TcxDateEdit;
    edVALOR: TvalorEdit;
    btCancelar: TBitBtn;
    btConf: TBitBtn;
    Label4: TLabel;
    edUANO: TvalorEdit;
    procedure btConfClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure ProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edVALORKeyPress(Sender: TObject; var Key: Char);
    procedure edDTEMIPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  flanFatura: TflanFatura;

implementation

{$R *.dfm}

uses modFuncoes, modDados;

procedure TflanFatura.btCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TflanFatura.btConfClick(Sender: TObject);
begin
  if edNFE.Tag = 0 then //Novo Registro
    if DM.DBCON.ExecSQLScalar('select count(nfe) from plfatura where nfe = ' + edNFE.Text) > 0 then begin
      MsgErro('NF.e ' + edNFE.Text + ' já foi cadastrado!');
      edNFE.SetFocus;
      Exit;
    end;

  if edDTEMI.EditValue = NULL then begin
    MsgErro('Informe uma Data válida!');
    edDTEMI.SetFocus;
    Exit;
  end;

  if yearof(edDTEMI.Date) <> yearof(now) then begin
    if not perguntaNao('Ano informado é diferente do Ano Atual. Continuar?', 'Divergência de Ano') then Exit;
  end;

  if edVALOR.Value = 0 then begin
    if not perguntaNao('Valor Zerado. Continuar?', 'Valor Zerado')  then Exit;

  end;

  ModalResult := mrOK;
end;

procedure TflanFatura.edDTEMIPropertiesEditValueChanged(Sender: TObject);
var
  st: string;
  dt: string;
begin
  dt := formatdatetime('yyyy-mm-', edDTEMI.Date) + '01';
  st := 'select coalesce(sum(valor),0) from plfatura ' +
        'where ' +
          '(dtemi < date("' + dt + '")) and ' +
          '(dtemi >= date_sub("' + dt + '", interval 1 year)) and '+
          'idemp = :id';
  edUANO.Value := DM.DBCON.ExecSQLScalar(st, [edUANO.Tag]);

end;

procedure TflanFatura.edVALORKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    btConf.Click;
  end;

end;

procedure TflanFatura.ProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

end.
