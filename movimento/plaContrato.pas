unit plaContrato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, Vcl.Buttons, MaskUtils, cxTextEdit, cxCurrencyEdit, cxCalendar;

type
  TfPlaContrato = class(TForm)
    Panel1: TPanel;
    btLanc: TButton;
    DSCTR: TDataSource;
    gviewCtr: TcxGridDBTableView;
    glevelCtr: TcxGridLevel;
    gridCtr: TcxGrid;
    gviewCtrdt_ini: TcxGridDBColumn;
    gviewCtrdt_fim: TcxGridDBColumn;
    gviewCtrvl_multa: TcxGridDBColumn;
    gviewCtrvl_rescisao: TcxGridDBColumn;
    gviewCtrperio: TcxGridDBColumn;
    gviewCtrind_reajus: TcxGridDBColumn;
    gviewCtrnr_contrato: TcxGridDBColumn;
    gvcDESCR: TcxGridDBColumn;
    gvcOBS: TcxGridDBColumn;
    gvcIDUNI: TcxGridDBColumn;
    gvcIDEVE: TcxGridDBColumn;
    gvcIDTPC: TcxGridDBColumn;
    gvcIDTPR: TcxGridDBColumn;
    gviewCtrvl_contrato: TcxGridDBColumn;
    gviewCtrvl_caucao: TcxGridDBColumn;
    btExcluir: TBitBtn;
    gviewCtrColumn1: TcxGridDBColumn;
    gviewCtrColumn2: TcxGridDBColumn;
    btAltera: TButton;
    colQTTOT: TcxGridDBColumn;
    colQTLIQ: TcxGridDBColumn;
    gvcIDPES: TcxGridDBColumn;
    Panel2: TPanel;
    Label1: TLabel;
    cbTPREG: TComboBox;
    colTPMOV: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLancClick(Sender: TObject);
    procedure gvContratoDblClick(Sender: TObject);
    procedure dbgContratoTitleClick(Column: TColumn);
    procedure cbTPREGSelect(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure colNRDOCGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure colNRDOCPropertiesChange(Sender: TObject);
    procedure btAlteraClick(Sender: TObject);
    procedure gvcIDPESHeaderClick(Sender: TObject);
    procedure colQTLIQCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gviewCtrvl_contratoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure gviewCtrvl_caucaoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure colQTTOTCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colQTTOTGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure colQTLIQGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
  private
    { Private declarations }
    procedure Filtra;
  public
    { Public declarations }
  end;

var
  fPlaContrato: TfPlaContrato;

implementation

{$R *.dfm}

uses modDados, modFuncoes, lanContrato;

procedure TfPlaContrato.btAlteraClick(Sender: TObject);
var
  modo: integer;
  stfim: string;

begin
  if not btAltera.Enabled then Exit;

  if DM.qyctr.RecordCount = 0 then Exit;

  stfim := DM.qyctr.FieldByName('st_fim').AsString;
  // if stfim = cSTPEN then modo := modoALT
  // else if stfim = cSTNOR then modo := modoNAV
  // else if stfim = cSTNOR then  modo := modoALT
  // else begin
  // MsgErro('2310310935 - Problemas neste Contrato. RowID do Registro: ' + DM.qyctr.FieldByName('rowid').AsString);
  // exit;
  // end;
  modo := modoALT;
  DM.qyctr.DisableControls;

  if DM.qyctr.FieldByName('tp_mov').AsString = cTipoContrato then begin
    with TflanContrato.Create(Self, modo, DM.qyctr.FieldByName('id').AsInteger) do begin
      if showModal <> mrCancel then begin
        // QYCTR.Refresh;
        // if qyctr.RecordCount = 0 then
        // qyMOV.Close;
      end;
      Free;
    end;
  end else begin
    MsgErro('Alteração/Visualização de Parcelamento ainda não foi ativado!');
  end;
  DM.qyctr.EnableControls;

end;

procedure TfPlaContrato.btExcluirClick(Sender: TObject);
var
  st: string;
  obs: string;
  qt: integer;
begin
  if DM.qyctr.RecordCount = 0 then
    Exit;

  st := 'SELECT count(id) FROM plmovimento ' + 'WHERE ' + '(id_ctr = ' +
    DM.qyctr.FieldByName('id').AsString + ') and ' + '(st_mov = "' +
    cMovLiquidado + '") and ' + '(st_fim = "' + cSTNOR + '")';
  qt := DM.DBCON.ExecSQLScalar(st);
  if qt > 0 then
  begin
    MsgErro('Este Contrato contêm ' + inttostr(qt) +
      ' registro(s) liquidado(s). Não pode ser excluído!');
    Exit;
  end;

  if not perguntaNao
    ('Deseja EXCLUIR este Contrato? Esta operação NÃO pode ser desfeita!',
    'Exclusão de Contrato') then
    Exit;
  if not perguntaNao
    ('TEM CERTEZA que deseja EXCLUIR este Contrato? NOVAMENTE: Esta operação NÃO pode ser desfeita!',
    'Exclusão de Contrato') then
    Exit;

  obs := inputbox('Motivo da Exclusão',
    'Informe por que está excluindo este contrato:', '');
  // qyCTR.AfterScroll:= nil;
  DM.DBTRANS.StartTransaction;
  DM.qyctr.DisableControls;
  DM.DBCON.ExecSQL('UPDATE plmovimento SET ' + 'st_fim = "' + cSTEXC + '", ' +
    'us_exc = ' + inttostr(wUsuario) + ', ' + 'dt_exc = :v1, ' +
    'obs_exc = :v2 ' + ' where ' + 'id_ctr = ' + DM.qyctr.FieldByName('id')
    .AsString, [now, obs]);

  with DM.qyctr do begin
    Edit;
    FieldByName('st_fim').AsString := cSTEXC;
    FieldByName('us_exc').AsInteger := wUsuario;
    FieldByName('dt_exc').AsDateTime := now;
    FieldByName('obs_exc').AsString := obs;
    Post;
    EnableControls;
  end;
  DM.DBTRANS.Commit;

  MsgBox('Contrato Excluído', 'Exclusão de Contrato',
    MB_OK + MB_ICONEXCLAMATION);
  btExcluir.Enabled := DM.qyctr.RecordCount > 0;
  gviewCtr.DataController.GotoFirst;

end;

procedure TfPlaContrato.btLancClick(Sender: TObject);
var
  idcontrato: integer;
begin
  DM.qry.Close;
  DM.qyctr.DisableControls;
  idcontrato := 0;
  if DM.qyctr.RecordCount > 0 then
    idcontrato := DM.qyctr.FieldByName('id').AsInteger;
  DM.qyctr.Filtered := false;
  // QYCTR.Filtered:= False;
  // ShowMessage(inttostr(self.Tag));
  with TflanContrato.Create(Self, modoInc, -1) do begin
    DM.qyctr.tag := idcontrato;
    showModal;
    idcontrato := DM.qyctr.tag;

    Free;
  end;
  // QYCTR.Filtered:= True;
  // QYCTR.Refresh;
  DM.qyctr.Filtered := true;
  if idcontrato > 0 then
    DM.qyctr.Locate('id', idcontrato, []);
  while DM.QYCTR.ControlsDisabled do DM.qyctr.EnableControls;
end;

procedure TfPlaContrato.cbTPREGSelect(Sender: TObject);
begin
  Filtra;
end;

procedure TfPlaContrato.colNRDOCGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := formataNrDoc(AText);

end;

procedure TfPlaContrato.colNRDOCPropertiesChange(Sender: TObject);
begin
  with TcxTextEdit(Sender) do
  begin
    Text := soNumero(Text);
    SelStart := length(Text);
  end;
end;

procedure TfPlaContrato.gvcIDPESHeaderClick(Sender: TObject);
begin
  // ShowMessage(inttostr(gvcIDPES.Width));
end;

procedure TfPlaContrato.gvContratoDblClick(Sender: TObject);
var
  APoint: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin
  GetCursorPos(APoint);
  with gridCtr.FocusedView.Site do begin
    APoint := ScreenToClient(APoint);
    AHitTest := ViewInfo.GetHitTest(APoint);
    if AHitTest is TcxGridRecordHitTest then begin
      btAltera.Click;
    end;
  end;

end;

procedure TfPlaContrato.gviewCtrvl_caucaoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then Atext:= '';

end;

procedure TfPlaContrato.gviewCtrvl_contratoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then Atext:= '';

end;

procedure TfPlaContrato.colQTLIQCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

  if not (AViewInfo.GridRecord is TcxGridFilterRow) then
    if cbTPREG.ItemIndex = 0 then
      if aviewinfo.GridRecord.Values[colQTTOT.Index] = AViewInfo.Value then begin
          ACanvas.Brush.Color:= corUltMov;
      end;

end;

procedure TfPlaContrato.colQTLIQGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
if AText = '' then AText:= 'ERRO';

end;

procedure TfPlaContrato.colQTTOTCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if not (AViewInfo.GridRecord is TcxGridFilterRow) then
    if cbTPREG.ItemIndex = 0 then
      if aviewinfo.GridRecord.Values[colQTTOT.Index] = null then begin
          ACanvas.Brush.Color:= clRed;
          ACanvas.Font.Style := [fsBold];
      end;

end;

procedure TfPlaContrato.colQTTOTGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
if AText = '' then AText:= 'ERRO';

end;

procedure TfPlaContrato.dbgContratoTitleClick(Column: TColumn);
begin
  DM.qyctr.IndexFieldNames := Column.FieldName; // + ';descr';
end;

procedure TfPlaContrato.Filtra;
var
  stfim: char;
  st: string;
begin
  Screen.Cursor := crHourglass;

  if cbTPREG.ItemIndex = 0 then
    stfim := cSTNOR
  else if cbTPREG.ItemIndex = 1 then
    stfim := cSTINA
  else
    stfim := cSTFIN;

  DM.qyctr.Filter := 'st_fim = ''' + stfim + '''';
  DM.qyctr.Filtered := true;
  st:= 'with qry as ( ' +
          'select id_ctr, count(id) as qttot, ' +
            'sum(if(st_mov = "' + cMovLiquidado + '", 1, 0)) as qtliq, sum(valor) as vltot, '+
            'sum(if(st_mov = "' + cMovLiquidado + '", valor, 0)) as vlliq from plmovimento ' +
          'where ' +
            'st_fim in ("' + stfim + '", "' + cSTNOR + '") and ' +
           	'tp_mov <> "' + cTipoAvulso + '" ' +
          'group by id_ctr ' +
          'order by id_ctr ' +
        ') ' +
        'SELECT *, qry.qttot, qry.qtliq, qry.vltot, qry.vlliq FROM `plcontratos` plc LEFT JOIN qry ON qry.id_ctr = plc.id ' +
          'WHERE ' +
            'st_fim = "' + stfim +'" ';// + ' and qry.qttot is not null';
  DM.qyctr.Open(st);
{
  DM.qyctr.Open('select * from plcontratos WHERE ' +
    'tp_mov in ("' + cTipoContrato + '", "' + cTipoParcela + '") and ' +
    '(st_fim = "' + stfim + '") ' +
    'order by id_uni');
}
  btExcluir.Enabled := DM.qyctr.RecordCount > 0;

  gviewCtr.DataController.GotoFirst;

  gvcIDUNI.ApplyBestFit();
  gvcIDEVE.ApplyBestFit();
  // gvcIDPES.ApplyBestFit();
  // if gvcIDPES.Width > 450 then
  // gvcIDPES.Width:= 450;
  Screen.Cursor := crDefault;
end;

procedure TfPlaContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qyctr.Close;
  DM.qyctr.Filtered := false;
  DM.qyctr.Filter := '';
  with DM do begin
    qyEVE.Close;
    qyPes.Close;
    qyCnt.Close;
    qyUni.Close;

    qyTPR.Close;
    qyTPC.Close;
    qyTPD.Close;
    qyTCB.Close;
  end;
end;

procedure TfPlaContrato.FormCreate(Sender: TObject);
begin
  DM.carregaConfig();
  gridCtr.Align := alClient;
  with DM do begin
    qyEVE.Open(sqlTBEVE);
    qyPes.Open(sqlTBPES);//SQL no ModDados 'select id, tp_pes, descr, tp_ins, nr_ins, banco, agencia, nr_conta, tp_conta, ativo from tbpessoal where ativo >= 0');
    qyTPD.Open(sqlTBTPD);//SQL no ModDados 'select id, cod, descr, conta, perio from tbtipodoc WHERE (ativo >= 0) ORDER BY id');
    //qyPes.Open;
    //showMessage(qycnt.SQL.CommaText);
    //qyCnt.Open; //ABERTO NO MENU
    qyUNI.Open(sqlTBUNI);//SQL no ModDados 'select id, cod, ponto, codpt, descr, uf, nivel from tbunidades where ativo >= 0');
    //qyUni.Open();
    //qyTPD.Open;
    qyTPC.Open;
    qyTPR.Open;
    qyTCB.Open();
  end;

  // qyctr.Filter:= ' (st_fim = ''' + cSTNOR + ''') ';
  // qyctr.Filtered:= true;
  DM.QYMOV.OnCalcFields:= DM.QYMOVCalcFields;
  cbTPREG.ItemIndex := 0;
  Filtra;

  gviewCtr.FilterRow.OperatorCustomization := true;
  gvcIDUNI.Options.FilterRowOperator := foContains;
  gvcIDEVE.Options.FilterRowOperator := foContains;
  gvcIDPES.Options.FilterRowOperator := foContains;
  gvcDESCR.Options.FilterRowOperator := foContains;
  gvcOBS.Options.FilterRowOperator := foContains;
  gvcIDTPC.Options.FilterRowOperator := foContains;
  gvcIDTPR.Options.FilterRowOperator := foContains;

  btLanc.Enabled:= DM.permitido('cadContratosI');
  btAltera.Enabled:= DM.permitido('cadContratosA');
  btExcluir.Enabled:= DM.permitido('cadContratosE');
  // QYMOV.Open();
end;

end.
