unit relDesembolso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, cxTextEdit, cxLabel,
  cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGrid, dxScrollbarAnnotations, cxCurrencyEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxDBData, cxGridDBTableView, frxClass, frxDBSet, StrUtils;

type
  TfrelDesembolso = class(TForm)
    gridMov: TcxGrid;
    gviewDesembolso: TcxGridDBTableView;
    gvdIDUNI: TcxGridColumn;
    gvdIDPES: TcxGridColumn;
    gvdIDEVE: TcxGridColumn;
    gvdDIA: TcxGridColumn;
    gvdVALOR: TcxGridColumn;
    gvdAGENCIA: TcxGridColumn;
    gvdCONTA: TcxGridColumn;
    glevelDesembolso: TcxGridLevel;
    gvdTPREG: TcxGridColumn;
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edIDCNT: TEdit;
    edDTI: TEdit;
    edDTF: TEdit;
    Panel2: TPanel;
    btCancelar: TBitBtn;
    gvdBANCO: TcxGridColumn;
    gvdTipo: TcxGridColumn;
    tbR: TFDMemTable;
    tbRIDUNI: TStringField;
    tbRUF: TStringField;
    tbRIDPES: TStringField;
    tbRNRDOC: TStringField;
    tbRTPREG: TSmallintField;
    dsR: TDataSource;
    tbRBanco: TStringField;
    tbRAgencia: TStringField;
    tbRConta: TStringField;
    tbRDia: TSmallintField;
    tbRValor: TFloatField;
    tbRIDEVE: TStringField;
    tbRTipo: TStringField;
    frxDBR: TfrxDBDataset;
    btPDF: TButton;
    btXLS: TButton;
    tbRCOMPT: TStringField;
    gvdCOMPT: TcxGridDBColumn;
    tbRvl: TCurrencyField;
    tbRnt: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure gvdVALORCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvdIDEVECustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExportClick(Sender: TObject);
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
  frelDesembolso: TfrelDesembolso;

implementation

{$R *.dfm}

uses modFuncoes, modDados;

procedure TfrelDesembolso.btExportClick(Sender: TObject);
var
  nrins, dsemp: string;
begin
  DM.qyCnt.Locate('id', edIDCNT.Tag, []);

  gviewDesembolso.BeginUpdate();

  if TComponent(Sender).Tag = 0 then
    DM.LoadReport('Desembolso')
  else
    DM.LoadReport('DesembolsoXLS');

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
  DM.frxRel.Variables['MES'] :=
    QuotedStr(cMeses[edDTF.Tag] + '/' + RightStr(edDTF.Text, 4));
  DM.frxRel.PrepareReport();

  if TComponent(Sender).Tag = 0 then
  begin
    DM.frxPDF.ShowDialogOptions := [doShowSaveDialog];
    DM.frxPDF.OpenAfterExport := true;
    DM.frxPDF.FileName := 'Desembolso.PDF';
    DM.frxRel.Export(DM.frxPDF);
  end
  else
  begin
    DM.frxXLS.ShowDialogOptions := [doShowSaveDialog];
    DM.frxXLS.OpenAfterExport := true;
    DM.frxXLS.FileName := 'Desembolso.XLSX';
    DM.frxRel.Export(DM.frxXLS);
  end;
  gviewDesembolso.EndUpdate;
end;

procedure TfrelDesembolso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbR.Close;
end;

procedure TfrelDesembolso.FormCreate(Sender: TObject);
begin
  gridMov.Align:= alClient;
  tbR.Open;
end;

procedure TfrelDesembolso.FormShow(Sender: TObject);
begin
//  Self.Left	:= Screen.WorkAreaLeft ;
//  Self.Top:= Screen.WorkAreaTop ;
//  Self.Width := Screen.WorkAreaWidth;
//  Self.Height := Screen.WorkAreaHeight ;

  Self.WindowState := wsMaximized;
  self.BorderIcons := [biSystemMenu];
  Self.BorderStyle := bsSingle;

end;

procedure TfrelDesembolso.gvdIDEVECustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvdTPREG.Index] = 2 then
    ACanvas.Font.Style := [fsBold];
end;

procedure TfrelDesembolso.gvdVALORCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Value > 0 then
    ACanvas.Font.Color := corValorC
  else
    ACanvas.Font.Color := corValorD;

  if (Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex,
    gvdTPREG.Index]) = 3 then
    ACanvas.Font.Style := [fsBold];

end;

procedure TfrelDesembolso.tbRCalcFields(DataSet: TDataSet);
begin
  if dataset['valor'] <> null then begin

    dataset['vl']:= abs(dataset['valor']);
    if dataset['valor'] > 0  then dataset['nt']:= 'C'
    else dataset['nt']:= 'D';
  end;
end;

procedure TfrelDesembolso.WMSysCommand(var Message: TWMSysCommand);
begin
  case Message.CmdType and $FFF0 of
    SC_MOVE, SC_RESTORE: Exit;
  end;
  inherited;

end;

end.