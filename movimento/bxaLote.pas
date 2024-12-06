unit bxaLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB;

type
  TfbxaLote = class(TForm)
    Label12: TLabel;
    Label2: TLabel;
    btConf: TBitBtn;
    cbIDCNT: TcxLookupComboBox;
    edDTBXA: TcxDateEdit;
    btCancelar: TBitBtn;
    lbLote: TLabel;
    DSCNT: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btConfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; qtd: Integer; vlt: Double;
      idcnt: Integer); reintroduce;
  end;

var
  fbxaLote: TfbxaLote;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

{ TfbxaLote }

procedure TfbxaLote.btConfClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

constructor TfbxaLote.Create(AOwner: TComponent; qtd: Integer; vlt: Double;
  idcnt: Integer);
begin
  inherited Create(AOwner);
  lbLote.Caption := 'Confirmar a Efetivação de ' + inttostr(qtd) +
    ' lançamentos totalizando ' + formataValorDC(vlt) + '?';
  cbIDCNT.editvalue := idcnt;
  edDTBXA.editvalue := DM.proxDiaUtil(date);
end;

procedure TfbxaLote.FormCreate(Sender: TObject);
begin
  // inherited
end;

end.
