unit aguarde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Forms;

type
  TfAguarde = class(TForm)
    lb1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAguarde: TfAguarde;

implementation

{$R *.dfm}

procedure TfAguarde.FormCreate(Sender: TObject);
begin
lb1.Left:= (Self.ClientWidth div 2) - (lb1.Width div 2);
lb1.Top:= (self.ClientHeight div 2) - (lb1.Height div 2);

end;

end.
