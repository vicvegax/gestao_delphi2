unit myMsgAltLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfmsgAltLote = class(TForm)
    lbDESCR: TLabel;
    btESTE: TBitBtn;
    btCancelar: TBitBtn;
    btTODOS: TBitBtn;
    Label1: TLabel;
    lbCUS: TLabel;
    lbEVE: TLabel;
    lbFAV: TLabel;
    lbVEN: TLabel;
    lbCOMPT: TLabel;
    lbVLD: TLabel;
    lbTPD: TLabel;
    lbBCO: TLabel;
    procedure btESTEClick(Sender: TObject);
    procedure btTODOSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmsgAltLote: TfmsgAltLote;

implementation

{$R *.dfm}

uses modFuncoes;

procedure TfmsgAltLote.btESTEClick(Sender: TObject);
begin
  modalResult:= 1;
end;

procedure TfmsgAltLote.btTODOSClick(Sender: TObject);
begin
modalResult:= 99;
end;

end.
