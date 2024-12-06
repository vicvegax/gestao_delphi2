unit myInputBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfInputBox = class(TForm)
    edPROMPT: TEdit;
    lbDESCR: TLabel;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    procedure edPROMPTKeyPress(Sender: TObject; var Key: Char);
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ACaption: String; APrompt: String);
      reintroduce;
  end;

var
  fInputBox: TfInputBox;

implementation

{$R *.dfm}

uses modFuncoes;

procedure TfInputBox.btOKClick(Sender: TObject);
begin
  if edPROMPT.Text = '' then
  begin
    edPROMPT.SetFocus;
    Exit;
  end
  else
  begin
    ModalResult := mrOk;
  end;

end;

constructor TfInputBox.Create(AOwner: TComponent; ACaption, APrompt: String);
begin
  inherited Create(AOwner);

  Self.Caption := ACaption;
  lbDESCR.Caption := APrompt;
end;

procedure TfInputBox.edPROMPTKeyPress(Sender: TObject; var Key: Char);
var
  pkey: integer;
begin
  pkey := pos(Key, comAcento);
  if pkey > 0 then
    Key := semacento[pkey];
end;

end.
