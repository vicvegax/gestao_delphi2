unit cdrUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfcdrUnidades = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edDESCR: TEdit;
    edCod: TEdit;
    edObs: TMemo;
    edLocal: TEdit;
    cbUF: TComboBox;
    edPonto: TEdit;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    procedure btOKClick(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure cbUFKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcdrUnidades: TfcdrUnidades;

implementation

{$R *.dfm}

uses modFuncoes;

procedure TfcdrUnidades.btOKClick(Sender: TObject);
begin
  if edDESCR.Text = '' then
  begin
    MsgErro('Informe um Nome para a Unidade.');
    edDESCR.SetFocus;
    exit;
  end;

  ModalResult := mrOK;
end;

procedure TfcdrUnidades.cbUFKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    btOK.Click;
  end;

end;

procedure TfcdrUnidades.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

end.
