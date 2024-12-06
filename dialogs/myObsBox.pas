unit myObsBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfmyObsBox = class(TForm)
    lbPROMPT: TLabel;
    edPROMPT: TEdit;
    lbUsuario: TLabel;
    lbData: TLabel;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ACaption, APrompt: String);
      reintroduce;
  end;

var
  fmyObsBox: TfmyObsBox;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfmyObsBox.btOKClick(Sender: TObject);
begin
  if edPROMPT.Text = '' then
  begin
    MsgErro('Informe uma Observação!');
    edPROMPT.SetFocus;
    exit;
  end;
  modalresult := mrok;
end;

constructor TfmyObsBox.Create(AOwner: TComponent; ACaption, APrompt: String);
begin
  inherited Create(AOwner);

  Self.caption := ACaption;
  lbPROMPT.caption := APrompt;

  lbUsuario.caption := 'Usuário: ' + DM.qyLogin.FieldByName('descr').AsString;

  lbData.caption := FormatDateTime('dd/mm/yyyy', Date);
end;

end.
