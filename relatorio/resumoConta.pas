unit resumoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls,
  Vcl.ExtCtrls, DateUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, StrUtils;

type
  TfResumoConta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edDTINI: TcxDateEdit;
    edDTFIM: TcxDateEdit;
    Label2: TLabel;
    grMovDBTableView1: TcxGridDBTableView;
    grMovLevel1: TcxGridLevel;
    grMov: TcxGrid;
    dsRES: TDataSource;
    qyRES: TFDQuery;
    grMovDBTableView1saldo: TcxGridDBColumn;
    grMovDBTableView1id_cnt: TcxGridDBColumn;
    grMovDBTableView1sd_ant: TcxGridDBColumn;
    qyREStotal: TBCDField;
    grMovDBTableView1Column1: TcxGridDBColumn;
    grMovDBTableView1Column2: TcxGridDBColumn;
    qyRESds_cnt: TStringField;
    grMovDBTableView1Column3: TcxGridDBColumn;
    qyREStp_cnt: TStringField;
    qyRESid: TWordField;
    qyREScod: TStringField;
    qyRESdescr: TStringField;
    qyRESsd_ant: TFMTBCDField;
    qyRESvl_rec: TFMTBCDField;
    qyRESvl_des: TFMTBCDField;
    qyREStp_conta: TShortintField;
    procedure FormCreate(Sender: TObject);
    procedure edDTFIMPropertiesEditValueChanged(Sender: TObject);
    procedure edDTINIPropertiesEditValueChanged(Sender: TObject);
    procedure qyRESCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grMovDBTableView1saldoCustomDrawCell
      (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grMovDBTableView1sd_antCustomDrawCell
      (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grMovDBTableView1Column1CustomDrawCell
      (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grMovDBTableView1sd_antCustomDrawFooterCell
      (Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure grMovDBTableView1saldoCustomDrawFooterCell
      (Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure grMovDBTableView1Column2CustomDrawFooterCell
      (Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    procedure Filtra;
  public
    { Public declarations }
  end;

var
  fResumoConta: TfResumoConta;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfResumoConta.grMovDBTableView1Column1CustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Value = 0 then
    ACanvas.Font.Color := clBlack
  else if AViewInfo.Value < 0 then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

end;

procedure TfResumoConta.grMovDBTableView1Column2CustomDrawFooterCell
  (Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  ADrawRect: TRect;
begin
  ADone := True;
  if AViewInfo.Text <> '0,00' then
    ACanvas.Font.Color := corValorC;
  // else  ACanvas.Font.Color:= clBlack;
  ADrawRect := AViewInfo.Bounds;
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawComplexFrame(ADrawRect, clGray, clGray, cxBordersAll, 1);
  ACanvas.DrawTexT(AViewInfo.Text + ' ', ADrawRect, cxAlignRight or
    cxAlignVCenter);
end;

procedure TfResumoConta.grMovDBTableView1saldoCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // ACanvas.Brush.Color:= clWhite;
  if AViewInfo.Value = 0 then
    ACanvas.Font.Color := clBlack
  else if AViewInfo.Value < 0 then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

end;

procedure TfResumoConta.grMovDBTableView1saldoCustomDrawFooterCell
  (Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  ADrawRect: TRect;
begin
  ADone := True;
  if AViewInfo.Text <> '0,00' then
    ACanvas.Font.Color := corValorD;
  // else  ACanvas.Font.Color:= clBlack;
  ADrawRect := AViewInfo.Bounds;
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawComplexFrame(ADrawRect, clGray, clGray, cxBordersAll, 1);
  ACanvas.DrawTexT(AViewInfo.Text + ' ', ADrawRect, cxAlignRight or
    cxAlignVCenter);
end;

procedure TfResumoConta.grMovDBTableView1sd_antCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Value = 0 then
    ACanvas.Font.Color := clBlack
  else if AViewInfo.Value < 0 then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

end;

procedure TfResumoConta.grMovDBTableView1sd_antCustomDrawFooterCell
  (Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  ADrawRect: TRect;
begin
  if rightstr(AViewInfo.Text, 1) = cNTDEB then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

  ADrawRect := AViewInfo.Bounds;
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawComplexFrame(ADrawRect, clGray, clGray, cxBordersAll, 1);
  ACanvas.DrawTexT(AViewInfo.Text + ' ', ADrawRect, cxAlignRight or cxAlignVCenter);
  ADone := True;
end;

procedure TfResumoConta.edDTFIMPropertiesEditValueChanged(Sender: TObject);
begin
  Filtra;
end;

procedure TfResumoConta.edDTINIPropertiesEditValueChanged(Sender: TObject);
begin
  Filtra;
end;

procedure TfResumoConta.Filtra;
var
  st: string;
begin
  if (edDTFIM.EditValue = null) or (edDTINI.EditValue = null) then
    exit;
{
  st := 'SELECT CAST(COALESCE(sum(valor), 0) AS DECIMAL(12,2)) as sd_ant, id_cnt, ' +
        'CAST((SELECT coalesce(sum(valor),0)  ' +
        ' FROM `plmovimento` as mov2 WHERE ' +
          'mov2.id_cnt = mov.id_cnt and ' +
          'st_mov = "' + cMovLiquidado + '" and ' +
          'st_fim="' + cSTNOR + '" and ' +
          'valor>0 and ' +
          'dt_mov BETWEEN "' + dataSQL(edDTINI.date) + '" AND "' +
             dataSQL(edDTFIM.date) + '") AS DECIMAL(12,2)) as vl_rec, ' +
          'CAST((SELECT coalesce(sum(valor),0)  ' +
    ' FROM `plmovimento` as mov2 WHERE ' +
      'mov2.id_cnt = mov.id_cnt and ' +
      'st_mov = "' + cMovLiquidado + '" and ' +
      'st_fim="' + cSTNOR + '" and ' +
      'valor<0 and ' +
      'dt_mov BETWEEN "' + dataSQL(edDTINI.date) + '" AND "' +
          dataSQL(edDTFIM.date) + '") AS DECIMAL(12,2)) as vl_des ' +
    'FROM `plmovimento` as mov WHERE ' +
      'st_mov = "' + cMovLiquidado + '" and ' +
      'st_fim="' + cSTNOR + '" and ' +
      'dt_mov < "' + dataSQL(edDTINI.date) +
    '" ' + 'GROUP BY id_cnt';
    }
  st:= 'SELECT id, cod, descr, tp_conta, ' +
         '(SELECT COALESCE(sum(valor), 0) FROM plmovimento as mov ' +
	         'WHERE mov.id_cnt = cnt.id and st_mov = "' + cMovLiquidado + '" and st_fim="' + cSTNOR + '" and ' +
             'dt_mov < "' + dataSQL(edDTINI.date) + '") as sd_ant, ' +
         '(SELECT coalesce(sum(valor),0) FROM plmovimento as mov ' +
           'WHERE mov.id_cnt = cnt.id and st_mov = "' + cMovLiquidado + '" and st_fim="' + cSTNOR + '" and valor>0 and ' +
             'dt_mov BETWEEN "' + dataSQL(edDTINI.date) + '" AND "' + dataSQL(edDTFIM.date) + '") as vl_rec, ' +
         '(SELECT coalesce(sum(valor),0) FROM plmovimento as mov ' +
           'WHERE mov.id_cnt = cnt.id and st_mov = "' + cMovLiquidado + '" and st_fim="' + cSTNOR + '" and valor<0 and ' +
             'dt_mov BETWEEN "' + dataSQL(edDTINI.date) + '" AND "' + dataSQL(edDTFIM.date) + '") as vl_des ' +
       'FROM tbcontas as cnt where ativo = 1;';
  qyRES.Open(st);
end;

procedure TfResumoConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyRES.Close;
  DM.qyCnt.Close;
end;

procedure TfResumoConta.FormCreate(Sender: TObject);
begin
  grMov.Align := alClient;
  DM.qyCnt.Open(DM.sqlTBCNT);
  edDTINI.date := DateOf(StartOfTheMonth(date));
  edDTFIM.date := DateOf(EndOfTheMonth(date));
end;

procedure TfResumoConta.qyRESCalcFields(DataSet: TDataSet);
var
  tp: integer;
begin
  DataSet['total'] := DataSet['sd_ant'] + DataSet['vl_rec'] + DataSet['vl_des'];

  DataSet['ds_cnt'] := DataSet['cod'] + ' - ' + DataSet['descr'];

    tp := DataSet['tp_conta'];

    if tp = 0 then
      DataSet['tp_cnt'] := '(CAIXA)'
    else if tp = 1 then
      DataSet.FieldByName('tp_cnt').AsString := 'CONTA CORRENTE'
    else
      DataSet.FieldByName('tp_cnt').AsString := 'INVESTIMENTO';

end;

end.
