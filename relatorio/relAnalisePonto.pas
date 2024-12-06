unit relAnalisePonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, zeroEdit, Data.DB,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, dxGDIPlusClasses, strutils, frxClass,
  frxDBSet, valorEdit;

type
  TfrelAnalisePonto = class(TForm)
    dsMov: TDataSource;
    qyMov: TFDQuery;
    pnBar: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    imgMostra: TImage;
    imgSelo: TImage;
    Label6: TLabel;
    lbDSEMP: TLabel;
    edSDATU: TcxCurrencyEdit;
    edSDANT: TcxCurrencyEdit;
    btFiltra: TButton;
    cbIDCNT: TcxLookupComboBox;
    edDTFIM: TcxDateEdit;
    edDTINI: TcxDateEdit;
    edTOTC: TcxCurrencyEdit;
    edTOTD: TcxCurrencyEdit;
    pnGuia: TPanel;
    tab1: TTabControl;
    grMov: TcxGrid;
    gvMov: TcxGridDBTableView;
    glMov: TcxGridLevel;
    colPONTO: TcxGridDBColumn;
    colEVENTO: TcxGridDBColumn;
    colVLD: TcxGridDBColumn;
    colVLC: TcxGridDBColumn;
    gvMovColumn1: TcxGridDBColumn;
    colSALDO: TcxGridDBColumn;
    Label9: TLabel;
    edSDPER: TcxCurrencyEdit;
    Panel1: TPanel;
    btPDF: TButton;
    btXLS: TButton;
    frxDBR: TfrxDBDataset;
    tbR: TFDMemTable;
    btSEL: TBitBtn;
    chIncRec: TCheckBox;
    edVLI: TvalorEdit;
    Label10: TLabel;
    colPONTO2: TcxGridDBColumn;
    gvMovColumn2: TcxGridDBColumn;
    qyMovsaldo: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure colValorDCCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvMovColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure btFiltraClick(Sender: TObject);
    procedure gvMovColumn1GetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure colVLCGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure colVLDGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure colSALDOGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure colVLCCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colVLDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colSALDOCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colSALDOCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure cbIDCNTPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cbIDCNTPropertiesEditValueChanged(Sender: TObject);
    procedure edDTFIMPropertiesEditValueChanged(Sender: TObject);
    procedure edDTINIPropertiesEditValueChanged(Sender: TObject);
    procedure tab1Change(Sender: TObject);
    procedure edTOTCPropertiesChange(Sender: TObject);
    procedure btXLSClick(Sender: TObject);
    procedure btSELClick(Sender: TObject);
    procedure chIncRecClick(Sender: TObject);
    procedure colVLCCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure colVLDCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure edVLIExit(Sender: TObject);
    procedure cbIDCNTPropertiesInitPopup(Sender: TObject);
    procedure cbIDCNTExit(Sender: TObject);
    procedure qyMovCalcFields(DataSet: TDataSet);
    procedure gvMovColumn2CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvMovColumn2CustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    selConta: array of integer;
    percImposto: single;
    procedure selVariasContas;
  public
    { Public declarations }
  end;

var
  frelAnalisePonto: TfrelAnalisePonto;

implementation

{$R *.dfm}

uses modDados, selConta;

procedure TfrelAnalisePonto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
qymov.Close;
with DM do begin
  qycnt.Close;
end;
end;

procedure TfrelAnalisePonto.FormCreate(Sender: TObject);
var
  sql: string;
begin

  percImposto:= 20;
  edVLI.Value:= percImposto;

  qymov.UpdateOptions.EnableDelete:= false;
  qymov.UpdateOptions.EnableInsert:= false;
  qymov.UpdateOptions.EnableUpdate:= false;

  btSEL.Enabled:= wUsuario <= 100;

  btFiltra.Tag:= tagDISABLED;

  tab1.Align := alClient;
  colPONTO.Options.FilterRowOperator := foContains;
  colEVENTO.Options.FilterRowOperator := foContains;

  with DM do begin
    sql:=
      'select ' +
      '  0 as id, 0 as id_emp, "000" as cod, "(SELEÇÃO MÚLTIPLA)" as descr, "" as nrins, "" as dsemp ' +
      'union ' +
      'SELECT ' +
      '  c.id, c.id_emp, c.cod, c.descr, e.nrins, e.descr ' +
      'FROM `tbcontas` c ' +
      '  left join tbempresas e on c.id_emp = e.id ' +
      'where c.ativo >= 0 order by id ';
    qycnt.Open(sql);
    qycnt.FieldByName('nrins').EditMask := '00.000.000/0000-00;0;_';
  end;
  //setLength(selConta, 1);
  cbIDCNT.ItemIndex:= 1;//0;

  //if length(selConta) = 0 then begin
//  selConta[0]:= cbIDCNT.EditValue;
  //end;


  edDTINI.Date:= TmesAno.Create(date).priDia;
  edDTFIM.Date:= TmesAno.Create(date).ultDia;

  tab1.TabIndex := 0;
  btFiltra.Tag:= tagENABLED;
  btFiltra.Click();


end;

procedure TfrelAnalisePonto.gvMovColumn1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: string);
var
  AIndex: Integer;
begin
  AIndex := TcxGridTableView(Sender.GridView).DataController.GetRowIndexByRecordIndex(ARecordIndex, False);
  AText := IntToStr(AIndex + 1);
end;

procedure TfrelAnalisePonto.gvMovColumn2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  //ACanvas.Brush.Color := clWhite;
  //if AViewInfo.Value = 0 then
  //  ACanvas.Font.Color := clBlack
  //else
  if AViewInfo.Value < 0 then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;
  ACanvas.Font.Style := [fsbold];
end;

procedure TfrelAnalisePonto.gvMovColumn2CustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if rightstr(AViewInfo.Text, 1) = cNTDEB then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;
//  ACanvas.Font.Color := corValorC;
  ACanvas.Font.Style := [fsBold];

  ACanvas.DrawComplexFrame(AViewInfo.Bounds, clGray, clGray, cxBordersAll, 1);
  ACanvas.DrawTexT(AViewInfo.Text + ' ', AViewInfo.Bounds, cxAlignRight or cxAlignVCenter);
  ADone := True;

end;

procedure TfrelAnalisePonto.btXLSClick(Sender: TObject);
var
  nrins, dsemp: string;
begin

  DM.qyCnt.Locate('id', cbIDCNT.EditValue, []);
  gvMov.BeginUpdate();
  //qyMov.IndexFieldNames:= 'ponto; evento';
//{$IFDEF DEBUG}
//
//  if TComponent(Sender).Tag = 0 then
//    DM.frxRel.LoadFromFile('c:\temp\rel.fr3')
//  else
//    DM.frxRel.LoadFromFile('c:\temp\relxls.fr4');
//{$ELSE}
  if TComponent(Sender).Tag = 0 then
    DM.LoadReport('AnalisePonto')
  else
    DM.LoadReport('AnalisePontoXLS');
//{$ENDIF}

  dsemp:= lbDSEMP.Caption;
  //nrins:=  vartostr(DM.DBCON.ExecSQLScalar('select nrins from tbempresas where id = :id', [DM.qyCnt['id_emp']]));
  DM.frxRel.Variables['CNPJ'] := QuotedStr(formataNRINS(dM.qycnt['nrins'], cTipoCNPJ));
  DM.frxRel.Variables['NOME'] := QuotedStr(dsemp);
  DM.frxRel.Variables['MES'] := QuotedStr(edDTINI.Text + ' à ' + edDTFIM.Text);

//  DM.frxRel.Variables['BCO'] := QuotedStr(DM.qyCnt.FieldByName('banco')
//    .AsString);
  DM.frxRel.PrepareReport();

  {$IFDEF DEBUG}
    DM.frxRel.ShowReport(true);
  {$ELSE}
    if TComponent(Sender).Tag = 0 then begin
      DM.frxPDF.ShowDialogOptions := [doShowSaveDialog];
      DM.frxPDF.OpenAfterExport := true;
      DM.frxPDF.FileName := 'AnalisePonto.PDF';
      DM.frxRel.Export(DM.frxPDF);
    end else begin
      DM.frxXLS.ShowDialogOptions := [doShowSaveDialog];
      DM.frxXLS.OpenAfterExport := true;
      DM.frxXLS.FileName := 'AnalisePonto.XLSX';
      DM.frxRel.Export(DM.frxXLS);
    end;
  {$ENDIF}

  gvMov.DataController.GotoFirst;

  gvMov.EndUpdate;
end;

procedure TfrelAnalisePonto.cbIDCNTExit(Sender: TObject);
begin
  try
    if cbIDCNT.itemindex = -1 then begin
      if dm.qyCnt.Active then cbIDCNT.ItemIndex:= 0;
    end;
  finally

  end;

end;

procedure TfrelAnalisePonto.cbIDCNTPropertiesEditValueChanged(
  Sender: TObject);
var
  sql: string;
  dt: variant;
  itag: integer;
  //ok: boolean;
begin
  if cbIDCNT.ItemIndex < 0 then Exit;




  //setLength(selConta, 0);
  if cbIDCNT.EditValue = 0 then begin
    selVariasContas();
  end else begin
    if not DM.qyCnt.Locate('id', cbIDCNT.EditValue, []) then begin
      cbIDCNT.SetFocus;
      MsgErro('ERRO2401151217 - Conta ' + vartostr(cbIDCNT.EditValue) + ' não localizada!');
      Exit;
    end;

    if length(selConta) <> 1 then setLength(selConta, 1);
    selConta[0]:= cbIDCNT.EditValue;

    lbDSEMP.Caption:= dm.qyCnt['dsemp'];//vartostr(DM.DBCON.ExecSQLScalar('select descr from tbempresas where id = :id', [DM.qyCnt['id_emp']]));
  end;
  btFiltra.Click();
end;

procedure TfrelAnalisePonto.cbIDCNTPropertiesInitPopup(Sender: TObject);
begin
  if cbIDCNT.ItemIndex = 0 then cbIDCNT.ItemIndex:= -1;

end;

procedure TfrelAnalisePonto.cbIDCNTPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if (DisplayValue = Null) or (DisplayValue = '') or (cbIDCNT.ItemIndex = -1) then begin
    ErrorText:= 'Informe uma Conta de Movimento Válida!';
    Error:= true;
  end;

end;

procedure TfrelAnalisePonto.chIncRecClick(Sender: TObject);
begin
  btFiltra.Click;
end;

procedure TfrelAnalisePonto.colSALDOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if rightstr(aviewinfo.text, 1) = cNTCRE  then
    ACanvas.Font.Color := corValorC
  else
    ACanvas.Font.Color := corValorD;

end;

procedure TfrelAnalisePonto.colSALDOCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  ADrawRect: TRect;
  valor: double;
begin
  ADone := True;
  valor:= edTOTC.Value + edTOTD.Value;
  if valor < 0 then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

  ADrawRect := AViewInfo.Bounds;
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawComplexFrame(ADrawRect, clGray, clGray, cxBordersAll, 1);

  ACanvas.DrawTexT(formataValorDC(valor), ADrawRect, cxAlignRight or cxAlignVCenter);

end;

procedure TfrelAnalisePonto.colSALDOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  Col: TcxCustomGridTableItem;
  I: Integer;
  valor: double;
begin
  valor:= 0;
  with Sender.GridView do begin
    //Col := TcxDBDataController(DataController).GetItemByFieldName(ValueColumnFieldName) as TcxCustomGridTableItem;
    for I := ARecord.Index downto 0 do
      if ((TcxGridViewData(ViewData).Rows[I].IsData)) then begin // and (TcxGridViewData(ViewData).Rows[I].Values[ColIndex] <> Null)) then
        valor := valor +
          TcxGridViewData(ViewData).Rows[I].Values[colVLC.Index] -
          TcxGridViewData(ViewData).Rows[I].Values[colVLD.Index];
      end else
        Break;

    AText := formataValorDC(valor);
  end;
end;

procedure TfrelAnalisePonto.gvMovColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
//acolumn.Caption:= inputbox('Novo Título', 'Coluna ' + Tcxgriddbcolumn(acolumn).DataBinding.FieldName , acolumn.Caption);


end;

procedure TfrelAnalisePonto.qyMovCalcFields(DataSet: TDataSet);
begin
dataset['saldo']:= dataset['tot_credito'] - dataset['tot_debito'];
end;

procedure TfrelAnalisePonto.selVariasContas;
var
  i: integer;
  ok: boolean;
begin
    lbDSEMP.Caption:= 'VÁRIAS SELECIONADAS!';

    dm.qyCnt.Filter:= 'id > 0';
    dm.qyCnt.Filtered:= true;
    with TfSelConta.Create(self) do begin
      for I := low(selConta) to High(selConta) do begin
        if gvSel.DataController.LocateByKey(selConta[i]) then begin
          gvSel.Controller.FocusedRecord.Selected:= true;
        end;
      end;
      ok:= ShowModal = mrOk;
      if ok then begin
        setLength(selConta, gvSel.Controller.SelectedRowCount);
        for i := 0 to gvSel.Controller.SelectedRowCount-1 do
          selConta[i]:= gvSel.Controller.SelectedRows[i].Values[colID.index];
      end;

      Free;
    end;
    dm.qyCnt.Filtered:= false;

    if ok then begin

      if length(selConta) > 1 then btFiltra.Click()
      else cbIDCNT.EditValue:= selConta[0];
    end else begin
      cbIDCNT.ItemIndex:= 1;
    end;

end;

procedure TfrelAnalisePonto.tab1Change(Sender: TObject);
begin
  btFiltra.Click;
end;

procedure TfrelAnalisePonto.colVLCCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Color := corValorC;

end;

procedure TfrelAnalisePonto.colVLCCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Color := corValorC;
  ACanvas.Font.Style := [fsBold];

  ACanvas.DrawComplexFrame(AViewInfo.Bounds, clGray, clGray, cxBordersAll, 1);
  ACanvas.DrawTexT(AViewInfo.Text + ' ', AViewInfo.Bounds, cxAlignRight or cxAlignVCenter);
  ADone := True;
end;

procedure TfrelAnalisePonto.colVLCGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
if Atext = '0,00' then AText:= '';

end;

procedure TfrelAnalisePonto.colVLDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Color := corValorD;

end;

procedure TfrelAnalisePonto.colVLDCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Color := corValorD;
  ACanvas.Font.Style := [fsBold];

  ACanvas.DrawComplexFrame(AViewInfo.Bounds, clGray, clGray, cxBordersAll, 1);
  ACanvas.DrawTexT(AViewInfo.Text + ' ', AViewInfo.Bounds, cxAlignRight or cxAlignVCenter);
  ADone := True;
end;

procedure TfrelAnalisePonto.colVLDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
if Atext = '0,00' then AText:= '';

end;

procedure TfrelAnalisePonto.edDTFIMPropertiesEditValueChanged(
  Sender: TObject);
begin
  if edDTINI.Date > edDTFIM.Date then
    edDTINI.Date := edDTFIM.Date
  else
    btFiltra.Click;

end;

procedure TfrelAnalisePonto.edDTINIPropertiesEditValueChanged(
  Sender: TObject);
begin
  if edDTFIM.Date < edDTINI.Date then
    edDTFIM.Date := edDTINI.Date
  else
    btFiltra.Click;

end;

procedure TfrelAnalisePonto.edTOTCPropertiesChange(Sender: TObject);
begin
  with TcxCurrencyEdit(Sender) do begin
    if Value < 0 then
      Style.Font.Color := corValorD
    else
      Style.Font.Color := corValorC;
  end;

end;

procedure TfrelAnalisePonto.edVLIExit(Sender: TObject);
begin
  if edVLI.Value <> percImposto then begin
    if (edVLI.Value = 0) or (edVLI.Value > 100) then begin
      edVLI.Value:= percImposto;
      exit
    end;

    percImposto:= edVLI.Value;
    btFiltra.Click;
  end;

end;

procedure TfrelAnalisePonto.btSELClick(Sender: TObject);
var
  I: integer;
  ok: boolean;
begin
  lbDSEMP.Caption:= 'VÁRIAS SELECIONADAS!';
  if length(selConta) = 1 then selConta[0]:= cbIDCNT.EditValue;

  dm.qyCnt.Filter:= 'id > 0';
  dm.qyCnt.Filtered:= true;
  with TfSelConta.Create(self) do begin
    for I := low(selConta) to High(selConta) do begin
      if gvSel.DataController.LocateByKey(selConta[i]) then begin
        gvSel.Controller.FocusedRecord.Selected:= true;
      end;
    end;
    ok:= ShowModal = mrOk;
    if ok then begin
      setLength(selConta, gvSel.Controller.SelectedRowCount);
      for i := 0 to gvSel.Controller.SelectedRowCount-1 do
        selConta[i]:= gvSel.Controller.SelectedRows[i].Values[colID.index];
    end;

    Free;
  end;
  dm.qyCnt.Filtered:= false;

  if ok then begin
    if length(selConta) > 1 then btFiltra.Click()
    else cbIDCNT.EditValue:= selConta[0];
  end;
end;

procedure TfrelAnalisePonto.btFiltraClick(Sender: TObject);
var
  sqlSintetico: string;
  sqlAnalitico: string;
  sql, sqlCTE, sqlUNION: string;
  totc, totd,
  sdant, sdefe: double;
  inCNT: string;
  i: integer;
begin

  if btFiltra.Tag <> tagENABLED then exit;

  inCNT:= '';
  for I := 0 to Length(selConta)-1 do
    inCNT:= inttostr(selConta[i]) + ',' + incnt;
  setlength(inCNT, length(inCNT)-1);

  sql:=
    'SELECT ' +
    '  IFNULL(SUM(valor), 0) as sd_ant ' +
    'FROM plmovimento WHERE ' +
    '  (st_fim = "' + cSTNOR + '") and ' +
    '  (id_cnt in (' + inCNT + ')) and ' +
    '  (dt_bxa < "' + dataSQL(edDTINI.Date) + '") and ' +
    '  (st_mov = "' + cMovLiquidado + '") ';
  DM.qry.Open(sql);
  sdant := DM.qry['sd_ant'];
  DM.qry.Close;
  edSDANT.Value := sdant;
  edSDANT.Value:= sdant;

  with DM.qry do begin
    Open('SELECT ' +
      'COALESCE(sum(if(valor>0, valor, 0)), 0) as totc, ' +
      'COALESCE(sum(if(valor<0, valor, 0)), 0) as totd, ' +
      'COALESCE(sum(valor), 0) as sdefe ' +
      ' FROM plmovimento WHERE '  +
      '(st_fim = "' + cSTNOR + '") and ' +
      '(st_mov = "' + cMovLiquidado + '") and ' +
      '(id_cnt in (' + inCNT + ')) and ' +
      '(dt_mov BETWEEN :id2 and :id3) ', [edDTINI.Date, edDTFIM.Date]);

    totc := FieldByName('totc').AsCurrency;
    totd := FieldByName('totd').AsCurrency;
    sdefe := FieldByName('sdefe').AsCurrency;
    Close;
  end;

  sqlCTE:= 'WITH cte as (' +
      'SELECT ' +
      '  uni.descr as ponto, ' +
      '  sum(vl_des) as tot_debito, ' +
      '  sum(vl_rec) as tot_credito ' +
      'FROM `plimportrec` mov ' +
      '  left join tbunidades uni on uni.id = mov.id_uni ' +
      'where ' +
      '  (dt_ent between "' + DataSQL(edDTINI.Date) + '" and "' + DataSQL(edDTFIM.Date) + '") ' +
      'group by id_uni ' +
  ') ';

  sqlUNION:=
      'UNION ALL ' +
      'select ' +
      '  cte.ponto, ' +
      '  "X. RECEITA" as evento, ' +
      '  0 as tot_debito,' +
      '  cte.tot_credito ' +
      'from cte ' +
      'UNION ALL ' +
      'select ' +
      '  cte.ponto, ' +
      '  "Y. COMISSÃO PAGA" as evento, ' +
      '  cte.tot_debito,' +
      '  0 as tot_credito ' +
      'from cte ' +
      'UNION ALL ' +
      'select ' +
      '  cte.ponto, ' +
      '  "Z. IMPOSTO SOBRE RECEITA" as evento, ' +
      '  (cte.tot_credito * ' + FloatToStr(trunc(edVLI.Value * 100)) + ' / 10000) as tot_debito, ' +
      '  0 as tot_credito ' +
      'from cte ';

  edSDANT.Value:= sdant;
  edSDATU.Value:= sdant + sdefe;
  edTOTC.Value:= totc;
  edTOTD.Value := totd;
  edSDPER.Value:= totc + totd;
  qymov.Close;
  sqlSintetico := sqlCTE +
//  '(select ' +
  'select ' +
  '  uni.descr as ponto, ' +
  '  eve.descr as evento, ' +
  '  sum(if(mov.valor<0,abs(mov.valor),0)) as tot_debito, ' +
  '  sum(if(mov.valor>0,mov.valor,0)) as tot_credito  ' +
  'from plmovimento mov ' +
  '  left join tbcontas cnt on cnt.id = mov.id_cnt ' +
  '  left join tbunidades uni on uni.id = mov.id_uni ' +
  '  left join tbeventos eve on eve.id = mov.id_eve ' +
  'where ' +
  '  (st_fim = "' + cSTNOR + '") and ' +
  '  (st_mov = "' + cMovLiquidado + '") and ' +
  '  (dt_mov between :dti and :dtf) and ' +
    '(mov.id_cnt in (' + inCNT + ')) ' +
  'group by uni.id, eve.id ';// +
  //'order by ponto, evento) ';
  if chIncRec.Checked then begin
    sqlSintetico:= sqlSintetico + sqlUNION;
  end;

  sqlAnalitico:=
//  '(select ' +
  'select ' +
  '  uni.descr as ponto, ' +
  '  eve.descr as evento, ' +
  '  if(mov.valor<0,abs(mov.valor),0) as tot_debito, ' +
  '  if(mov.valor>0,mov.valor,0) as tot_credito ' +
  'from plmovimento mov ' +
  '  left join tbcontas cnt on cnt.id = mov.id_cnt ' +
  '  left join tbeventos eve on eve.id = mov.id_eve ' +
  '  left join tbunidades uni on uni.id = mov.id_uni ' +
  'where ' +
  '  (st_fim = "' + cSTNOR + '") and ' +
  '  (st_mov = "' + cMovLiquidado + '") and ' +
  '  (dt_mov between :dti and :dtf) and ' +
    '(mov.id_cnt in (' + inCNT + ')) ';
//  'order by ponto, evento)';

  if chIncRec.Checked then begin
    sqlAnalitico:= sqlAnalitico +  sqlUNION;
  end;

  if tab1.TabIndex = 0 then sql:= sqlSintetico
  else sql:= sqlAnalitico;

  qymov.Open(sql + ' order by ponto, evento', [edDTINI.Date	, edDTFIM.Date]);
  //gvMov.DataController.KeyFieldNames:= 'id';

end;

procedure TfrelAnalisePonto.colValorDCCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Value  = 0 then ACanvas.Font.Color := clBlack
  else if aviewinfo.Value	 < 0 then ACanvas.Font.Color:= corValorD
  else ACanvas.Font.Color:= corValorC;


end;

end.
