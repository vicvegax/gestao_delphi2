unit Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, dxColorEdit,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.ExtDlgs;

type
  TfConfig = class(TForm)
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    cbAgendado: TdxColorEdit;
    cbEmconta: TdxColorEdit;
    cbLiquidado: TdxColorEdit;
    cbEntregue: TdxColorEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edLINK1: TEdit;
    edLINK2: TEdit;
    edLINK3: TEdit;
    Label9: TLabel;
    cbUltMov: TdxColorEdit;
    imgLogo: TImage;
    imgSelo: TImage;
    dlgImg: TOpenPictureDialog;
    Label10: TLabel;
    Label11: TLabel;
    edLINK4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure imgLogoDblClick(Sender: TObject);
    procedure imgSeloDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfig: TfConfig;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfConfig.btOKClick(Sender: TObject);
var
  sLogo, sSelo: TStringStream;
begin
  corMovAgendado := cbAgendado.ColorValue;
  corMovEmconta := cbEmconta.ColorValue;
  corMovLiquidado := cbLiquidado.ColorValue;
  corDocEntregue := cbEntregue.ColorValue;
  corUltMov:= cbUltMov.ColorValue;
  sLogo:= TStringStream.Create;
  imgLogo.Picture.SaveToStream(sLogo);
  sSelo:= TStringStream.Create;
  imgSelo.Picture.SaveToStream(sSelo);
  DM.DBCON.ExecSQL('UPDATE config SET ' +
    'corAgendado = :v1, ' +
    'corEmconta = :v2, ' +
    'corLiquidado = :v3, ' +
    'corEntregue = :v4, ' +
    'corUltMov = :v5, ' +
    'linkPolitica1 = :vs1, ' +
    'linkPolitica2 = :vs2, ' +
    'linkPolitica3 = :vs3, ' +
    'linkPolitica4 = :vs4, ' +
    'logo = :v6, ' +
    'selo = :v7 ' +
    'WHERE id = 1', [corMovAgendado, corMovEmconta, corMovLiquidado, corDocEntregue, corUltMov,
    edLINK1.Text, edLINK2.Text, edLINK3.Text, edLINK4.Text,
    sLogo.DataString, sSelo.DataString]);
  sLogo.Free;
  sSelo.Free;

  ModalResult := mrOk;

end;

procedure TfConfig.FormCreate(Sender: TObject);
var
  sLogo, sSelo: TStringStream;
begin
  DM.carregaConfig(false);
  cbAgendado.ColorValue := corMovAgendado;
  cbEmconta.ColorValue := corMovEmconta;
  cbLiquidado.ColorValue := corMovLiquidado;
  cbEntregue.ColorValue := corDocEntregue;
  cbUltMov.ColorValue := corUltMov;
  edLINK1.Text := DM.qyCFG.FieldByName('linkPolitica1').AsString;
  edLINK2.Text := DM.qyCFG.FieldByName('linkPolitica2').AsString;
  edLINK3.Text := DM.qyCFG.FieldByName('linkPolitica3').AsString;
  edLINK4.Text := DM.qyCFG.FieldByName('linkPolitica4').AsString;
  DM.qyCFG.Close;
  if DM.DBCON.ExecSQLScalar('SELECT NOT ISNULL(logo) FROM config where id = 1') then begin
    sLogo:= TStringStream.Create(vartostr(DM.DBCON.execsqlScalar('select logo from config where id = 1')));
    imgLogo.Picture.LoadFromStream(sLogo);
    sLogo.Free;
  end;
  if DM.DBCON.ExecSQLScalar('SELECT NOT ISNULL(selo) FROM config where id = 1') then begin
    sSelo:= TStringStream.Create(vartostr(DM.DBCON.execsqlScalar('select selo from config where id = 1')));
    imgSelo.Picture.LoadFromStream(sSelo);
    sSelo.Free;
  end;

end;

procedure TfConfig.imgLogoDblClick(Sender: TObject);
begin
if dlgImg.Execute() then
  imgLogo.Picture.LoadFromFile(dlgImg.FileName);
end;

procedure TfConfig.imgSeloDblClick(Sender: TObject);
begin
if dlgImg.Execute() then
  imgSelo.Picture.LoadFromFile(dlgImg.FileName);

end;

end.
