unit detMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxTextEdit,
  Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Buttons,
  zeroEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfdetMovimento = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    btCancelar: TBitBtn;
    DSMOV: TDataSource;
    lbIDCTR: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edDSCNT: TEdit;
    edDSUNI: TEdit;
    edDSEVE: TEdit;
    edDSPES: TEdit;
    gdMov: TcxGrid;
    gvMov: TcxGridDBTableView;
    glMov: TcxGridLevel;
    QYMOV: TFDQuery;
    edIDEVE: TEdit;
    edIDPES: TEdit;
    edPTUNI: TEdit;
    edIDCNT: TEdit;
    edIDUNI: TEdit;
    QYMOVtp_mov: TStringField;
    QYMOVst_mov: TStringField;
    QYMOVnr_doc: TStringField;
    QYMOVnt_reg: TStringField;
    QYMOVdt_ven: TDateField;
    QYMOVcompt: TStringField;
    QYMOVperio_ini: TDateField;
    QYMOVperio_fim: TDateField;
    QYMOVdt_bxa: TDateField;
    QYMOVbanco: TStringField;
    QYMOVagencia: TStringField;
    QYMOVnr_conta: TStringField;
    QYMOVtp_conta: TShortintField;
    QYMOVdescr: TStringField;
    QYMOVobs: TStringField;
    QYMOVus_entreg: TWordField;
    QYMOVdt_entreg: TDateTimeField;
    QYMOVus_inc: TWordField;
    QYMOVdt_inc: TDateTimeField;
    QYMOVus_alt: TWordField;
    QYMOVdt_alt: TDateTimeField;
    QYMOVus_efe: TWordField;
    QYMOVdt_efe: TDateTimeField;
    QYMOVdsuni: TStringField;
    QYMOVdspes: TStringField;
    QYMOVdseve: TStringField;
    QYMOVdstpd: TStringField;
    QYMOVvalor: TBCDField;
    gvMovst_mov: TcxGridDBColumn;
    gvMovdsuni: TcxGridDBColumn;
    gvMovdspes: TcxGridDBColumn;
    gvMovdseve: TcxGridDBColumn;
    gvMovdt_ven: TcxGridDBColumn;
    gvMovdt_bxa: TcxGridDBColumn;
    gvMovcompt: TcxGridDBColumn;
    gvMovvalor: TcxGridDBColumn;
    gvMovnt_reg: TcxGridDBColumn;
    gvMovdstpd: TcxGridDBColumn;
    gvMovnr_doc: TcxGridDBColumn;
    gvMovperio_ini: TcxGridDBColumn;
    gvMovperio_fim: TcxGridDBColumn;
    gvMovbanco: TcxGridDBColumn;
    gvMovagencia: TcxGridDBColumn;
    gvMovnr_conta: TcxGridDBColumn;
    gvMovtp_conta: TcxGridDBColumn;
    gvMovdescr: TcxGridDBColumn;
    gvMovobs: TcxGridDBColumn;
    gvMovdt_entreg: TcxGridDBColumn;
    gvMovdt_inc: TcxGridDBColumn;
    gvMovdt_alt: TcxGridDBColumn;
    gvMovdt_efe: TcxGridDBColumn;
    QYUSU: TFDQuery;
    QYMOVusalt: TStringField;
    QYMOVusefe: TStringField;
    QYMOVusent: TStringField;
    QYMOVusinc: TStringField;
    gvMovusinc: TcxGridDBColumn;
    gvMovusalt: TcxGridDBColumn;
    gvMovusefe: TcxGridDBColumn;
    gvMovusent: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QYMOVagenciaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QYMOVnr_contaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QYMOVnr_docGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QYMOVtp_contaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; idctr: integer); reintroduce;
  end;

var
  fdetMovimento: TfdetMovimento;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfdetMovimento.btCancelarClick(Sender: TObject);
begin
  Close;
end;

constructor TfdetMovimento.Create(AOwner: TComponent; idctr: integer);
begin
  inherited Create(AOwner);
  lbIDCTR.Visible := wUsuario <= 100;//(wModoDev <> 0);
  qyusu.open('SELECT id, descr FROM tbusuario order by id');

  qymov.SQL.Text:= 'SELECT *, uni.descr dsuni, pes.descr dspes, eve.descr dseve, tpd.descr dstpd ' +
    'FROM `plmovimento` mov ' +
    'left join tbunidades uni on uni.id = mov.id_uni ' +
    'LEFT join tbpessoal pes on pes.id = mov.id_pes ' +
    'LEFT JOIN tbeventos eve on eve.id = mov.id_eve ' +
    'LEFT JOIN tbtipodoc tpd on tpd.id = mov.id_tpd ' +
    'WHERE ' +
      'id_ctr = ' + inttostr(idctr) + ' and ' +
      'st_fim="N"; ';
  qymov.Open();
end;

procedure TfdetMovimento.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfdetMovimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qymov.Close;
  qyusu.Close;
end;


procedure TfdetMovimento.FormCreate(Sender: TObject);
begin
  // inherited create
end;

procedure TfdetMovimento.QYMOVagenciaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := formataAGencia(Sender.AsString);

end;

procedure TfdetMovimento.QYMOVnr_contaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := formataNrConta(Sender.AsString);

end;

procedure TfdetMovimento.QYMOVnr_docGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := formataNrDoc(Sender.AsString);

end;

procedure TfdetMovimento.QYMOVtp_contaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value	> 0 then
    if DM.qyTCB.Locate('id', Sender.Value, []) then
      Text := DM.qyTCB['sigla'];

end;

end.
