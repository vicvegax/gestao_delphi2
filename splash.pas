unit splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfSplash = class(TForm)
    imgLogo: TImage;
    p1: TPanel;
    p2: TPanel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSplash: TfSplash;

implementation

{$R *.dfm}


procedure TfSplash.FormCreate(Sender: TObject);
//var
//  sLogo: TStringStream;
begin
{
  if DM.DBCON.ExecSQLScalar('SELECT NOT ISNULL(logo) FROM config where id = 1') then begin
    sLogo:= TStringStream.Create(Vartostr(DM.DBCON.ExecSQLScalar('select logo from config where id = 1')));
    imgLogo.Picture.LoadFromStream(sLogo);
    sLogo.Free;
    //imgLogo.AutoSize:= True;
  end;
}
end;

procedure TfSplash.FormShow(Sender: TObject);
begin
  p1.Left := (imgLogo.Width - p1.Width) div 2;

  p2.Left := (imgLogo.Width - p2.Width) div 2;

end;

end.
