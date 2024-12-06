unit relConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGrid, cxLabel, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxDBData,
  cxGridDBTableView, frxClass, frxDBSet;

type
  TfrelConta = class(TForm)
    gridConta: TcxGrid;
    Panel1: TPanel;
    pnFirstStart: TPanel;
    Label3: TLabel;
    edIDCNT: TEdit;
    btCancelar: TBitBtn;
    Label1: TLabel;
    edDTI: TEdit;
    edDTF: TEdit;
    Label2: TLabel;
    btXLS: TButton;
    btPDF: TButton;
    tbR: TFDMemTable;
    tbRData: TDateField;
    tbRIDUNI: TStringField;
    tbRUF: TStringField;
    tbRIDPES: TStringField;
    tbRHIST: TStringField;
    tbRNRDOC: TStringField;
    tbRVLD: TFloatField;
    tbRVLC: TFloatField;
    tbRSaldo: TFloatField;
    tbRTPREG: TSmallintField;
    dsR: TDataSource;
    glevelConta: TcxGridLevel;
    gviewConta: TcxGridDBTableView;
    gvcData: TcxGridDBColumn;
    gvcIDUNI: TcxGridDBColumn;
    colUF: TcxGridDBColumn;
    gvcIDPES: TcxGridDBColumn;
    gvcHIST: TcxGridDBColumn;
    gvcNRDOC: TcxGridDBColumn;
    gvcVLD: TcxGridDBColumn;
    gvcVLC: TcxGridDBColumn;
    gvcSaldo: TcxGridDBColumn;
    gvcTPREG: TcxGridDBColumn;
    frxDBR: TfrxDBDataset;
    tbRvl: TCurrencyField;
    tbRnt: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure gvcSALDOCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvcVLDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvcVLCCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvcHISTCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvcNRDOCCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gvcIDUNICustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tbRCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frelConta: TfrelConta;

implementation

{$R *.dfm}

uses modFuncoes, modDados;

procedure TfrelConta.btExportClick(Sender: TObject);
var
  nrins, dsemp: string;
begin
  gviewConta.BeginUpdate();

  if TComponent(Sender).Tag = 0 then
    DM.LoadReport('MovConta')
  else
    DM.LoadReport('MOVCONTAXLS');

  DM.frxRel.Variables['BCO'] := QuotedStr(DM.qyCnt.FieldByName('banco')
    .AsString);
  DM.frxRel.Variables['AGE'] :=
    QuotedStr(formataAgencia(DM.qyCnt.FieldByName('agencia').AsString));
  DM.frxRel.Variables['CNT'] :=
    QuotedStr(formataNrConta(DM.qyCnt.FieldByName('nr_conta').AsString));
  DM.frxRel.Variables['TIPO'] :=
    QuotedStr(cTiposConta[DM.qyCnt.FieldByName('tp_conta').AsInteger]);

  nrins:= '';
  dsemp:= '';
  DM.qry.Open('select nrins, descr from tbempresas where id = :id', [DM.qyCnt['id_emp']]);
  if dm.qry.RecordCount > 0 then begin
    nrins:= DM.qry['nrins'];
    dsemp:= DM.qry['descr'];
  end;
  DM.qry.Close;

  DM.frxRel.Variables['CNPJ'] := QuotedStr(formataNRINS(nrins, cTipoCNPJ));
  DM.frxRel.Variables['NOME'] := QuotedStr(dsemp);

  DM.frxRel.Variables['DTINI'] := QuotedStr(edDTI.Text);
  DM.frxRel.Variables['DTFIM'] := QuotedStr(edDTF.Text);
  DM.frxRel.PrepareReport();

  if TComponent(Sender).Tag = 0 then
  begin
    DM.frxPDF.OpenAfterExport := true;
    DM.frxPDF.ShowDialogOptions := [doShowSaveDialog];
    DM.frxPDF.FileName := 'MovConta.PDF';
    DM.frxRel.Export(DM.frxPDF);
  end
  else
  begin
    DM.frxXLS.OpenAfterExport := true;
    DM.frxXLS.ShowDialogOptions := [doShowSaveDialog];
    DM.frxXLS.FileName := 'MovConta.XLSX';
    DM.frxRel.Export(DM.frxXLS);
  end;
  gviewConta.EndUpdate;

end;

procedure TfrelConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbR.Close;
end;

procedure TfrelConta.FormCreate(Sender: TObject);
begin
  gridConta.Align:= alClient;
  tbR.Open;
end;

procedure TfrelConta.FormShow(Sender: TObject);
begin
//  Self.Left	:= Screen.WorkAreaLeft ;
//  Self.Top:= Screen.WorkAreaTop ;
//  Self.Width := Screen.WorkAreaWidth;
//  Self.Height := Screen.WorkAreaHeight ;

  //Self.Align := alClient;
  Self.WindowState := wsMaximized;
  self.BorderIcons := [biSystemMenu];
  Self.BorderStyle := bsSingle;

end;

procedure TfrelConta.gvcHISTCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  tpreg: variant;
begin
  tpreg := Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvcTPREG.Index];
  if tpreg = 2 then
    ACanvas.Font.Style := [fsBold];
  if tpreg = 0 then
    ACanvas.Font.Style := [fsItalic];

end;

procedure TfrelConta.gvcNRDOCCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  tpreg: variant;
begin
  tpreg := Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvcTPREG.Index];
  if tpreg = 4 then
    ACanvas.Font.Style := [fsBold];
  if tpreg = 0 then
    ACanvas.Font.Style := [fsItalic];

end;

procedure TfrelConta.gvcSALDOCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  tpreg: variant;
begin
  tpreg := Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvcTPREG.Index];
  if tpreg = 3 then
    ACanvas.Font.Style := [fsBold];
  if tpreg = 0 then
    ACanvas.Font.Style := [fsItalic];

  if AViewInfo.Value > 0 then
    ACanvas.Font.Color := corValorC
  else
    ACanvas.Font.Color := corValorD;

end;

procedure TfrelConta.gvcVLCCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Font.Color := corValorC;
  if Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvcTPREG.Index] = 4 then
    ACanvas.Font.Style := [fsBold];

end;

procedure TfrelConta.gvcVLDCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Font.Color := corValorD;
  if Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvcTPREG.Index] = 4 then
    ACanvas.Font.Style := [fsBold];

end;

procedure TfrelConta.tbRCalcFields(DataSet: TDataSet);
begin
  if dataset['saldo'] <> null then begin
    dataset['vl']:= abs(dataset['saldo']);
    if dataset['saldo'] > 0 then dataset['nt']:= 'C'
    else dataset['nt']:= 'D';
  end;
end;

procedure TfrelConta.WMSysCommand(var Message: TWMSysCommand);
begin
  case Message.CmdType and $FFF0 of
    SC_MOVE, SC_RESTORE: Exit;
  end;
  inherited;

end;

procedure TfrelConta.gvcIDUNICustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  tpreg: variant;
begin
  tpreg := Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvcTPREG.Index];
  if tpreg = 0 then
    ACanvas.Font.Style := [fsItalic]
  else if tpreg = 4 then
    ACanvas.Font.Style := [fsBold];

end;

end.
