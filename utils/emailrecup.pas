unit emailrecup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfemailRecup = class(TForm)
    Label1: TLabel;
    edCPF: TEdit;
    Label2: TLabel;
    edEmail: TEdit;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  femailRecup: TfemailRecup;

implementation

{$R *.dfm}

end.
