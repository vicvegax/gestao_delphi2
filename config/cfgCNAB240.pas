unit cfgCNAB240;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfcfgCNAB240 = class(TForm)
    btConf: TBitBtn;
    btCancelar: TBitBtn;
    Label1: TLabel;
    edDSEMP: TEdit;
    Label2: TLabel;
    cbTPSER: TComboBox;
    Label3: TLabel;
    cbTPCNT: TComboBox;
    Label4: TLabel;
    edDTPAG: TcxDateEdit;
    procedure btConfClick(Sender: TObject);
    procedure cbTPSERSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcfgCNAB240: TfcfgCNAB240;

implementation

{$R *.dfm}

procedure TfcfgCNAB240.btConfClick(Sender: TObject);
begin
ModalResult:= mrOk;
end;

procedure TfcfgCNAB240.cbTPSERSelect(Sender: TObject);
begin
cbTPCNT.Enabled:= (cbTPSER.ItemIndex = 0);
cbTPCNT.ItemIndex:= cbTPSER.ItemIndex;

end;

end.
