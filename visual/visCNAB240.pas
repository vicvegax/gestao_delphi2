unit visCNAB240;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, fs_synmemo,
  Vcl.ExtCtrls, modFuncoes, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMemo,
  Vcl.Buttons;

type
  TfvisCNAB240 = class(TForm)
    ed1: TcxMemo;
    Panel1: TPanel;
    btCancelar: TBitBtn;
    chINF: TCheckBox;
    lbINF: TLabel;
    Button1: TButton;
    dlgSalva: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure ed1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chINFClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    lharq,
    lhlot,
    ldeta,
    ldetb,
    ltlot,
    ltarq: TCNAB;
  end;

var
  fvisCNAB240: TfvisCNAB240;

implementation

{$R *.dfm}

uses modDados;

procedure TfvisCNAB240.btCancelarClick(Sender: TObject);
begin
Close;

end;

procedure TfvisCNAB240.Button1Click(Sender: TObject);
begin
  dlgSalva.FileName:= 'CNAB240_' + formatdatetime('yyyymmdd_hhnnss', now);
  if dlgSalva.Execute() then begin
    //dlgSalva.
    ed1.Lines.SaveToFile(dlgSalva.FileName);
    ShowMessage('Arquivo CNAB240 salvo em: ' + #13#10 + dlgSalva.FileName);
  end;
end;

procedure TfvisCNAB240.chINFClick(Sender: TObject);
begin
  if not chINF.Checked then begin
    lbINF.Caption:= 'Informações';
  end;
  ed1.Properties.ReadOnly:= chINF.Checked;
end;

procedure TfvisCNAB240.ed1Click(Sender: TObject);
var
  tpr: char; //tipo de registro
  cds: char; //código de segmento
  st: string;
  cnab: TCNAB;
  lin, col, i: integer;
begin
//if wUsuario >= 100 then exit;
  if not chINF.Checked then exit;

  //ShowMessage(inttostr(ed1.CaretPos.X) + '/' + inttostr(ed1.CaretPos.Y) + '/' + inttostr(ed1.SelStart));
  lin:= ed1.CaretPos.Y;
  if lin = ed1.Lines.Count then exit;

  col:= ed1.CaretPos.X+1;
  ed1.SelStart:= ed1.SelStart - ed1.CaretPos.X;
  tpr:= ed1.Lines[lin][8];
  cds:= ed1.Lines[lin][14];


  case tpr of
    '0': cnab:= lharq;
    '1': cnab:= lhlot;
    '3': begin
      if cds = 'A' then cnab:= ldeta
      else cnab:= ldetb;
    end;
    '5': cnab:= ltlot;
    '9': cnab:= ltarq;
  end;

//  cnab.st:= ed1.Lines[lin];
  for i := 2 to cnab._qtcol do begin
    if col < cnab._pos[i] then begin
      col:= i-1;
      break;
    end;
  end;
  if col > cnab._qtcol then col:= cnab._qtcol;
//    raise Exception.Create('erro na coleta da coluna: ' + inttostr(col));

  ed1.selstart:= ed1.SelStart + cnab._pos[col]-1;
  ed1.SelLength:= cnab._tam[col];

  case tpr of
    '0': st:= 'Header Arq.';
    '1': st:= 'Header Lote';
    '3': begin
      if cds = 'A' then st:= 'Detalhe A'
      else st:= 'Detalhe B';
    end;
    '5': st:= 'Trailer Lote';
    '9': st:= 'Trailer Arq.';
  end;
  lbINF.Caption:= Format('Lin: %d, Col: %d, Tam: %d, Campo: %d, Tipo: [%s], Conteúdo: %s', [lin+1, cnab._pos[col], cnab._tam[col], col, st, ed1.SelText]);
{
  lbLIN.Caption:= inttostr(lin+1);
  lbCOL.Caption:= inttostr(col);
  lbVAL.Caption:= ed1.SelText;
}

  //ed1.sel
end;

procedure TfvisCNAB240.FormCreate(Sender: TObject);
begin
  ed1.Align:= alClient;
  WindowState := wsMaximized;
end;

end.
