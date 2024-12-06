unit dlgAgeFor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfdlgAgeFor = class(TForm)
    lbDESCR: TLabel;
    btAge: TBitBtn;
    btCancelar: TBitBtn;
    btFor: TBitBtn;
    procedure btAgeClick(Sender: TObject);
    procedure btForClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; iTPINS: Integer; APrompt: String);
      reintroduce;
  end;

var
  fdlgAgeFor: TfdlgAgeFor;

implementation

{$R *.dfm}

uses modFuncoes;

procedure TfdlgAgeFor.btAgeClick(Sender: TObject);
begin
  ModalResult := 100;

end;

procedure TfdlgAgeFor.btForClick(Sender: TObject);
begin
  ModalResult := 99;
end;

constructor TfdlgAgeFor.Create(AOwner: TComponent; iTPINS: Integer;
  APrompt: String);
begin
  inherited Create(AOwner);

  // Self.Caption:= ACaption;
  lbDESCR.Caption := 'Deseja cadastrar o ' + APrompt + ' como?';
  btAge.Enabled := (iTPINS = cTipoCPF);
end;

end.
