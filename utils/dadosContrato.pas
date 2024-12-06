unit dadosContrato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxContainer, cxTextEdit,
  cxMaskEdit, cxSpinEdit, DateUtils, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxCurrencyEdit, cxCalendar, cxCheckBox,
  cxDBLookupComboBox, cxDropDownEdit; // , cxGridExportLink, Winapi.ShellAPI;

type
  TfDadosContrato = class(TForm)
    viewMov: TcxGridDBTableView;
    gridMovLevel1: TcxGridLevel;
    gridMov: TcxGrid;
    Panel1: TPanel;
    Label1: TLabel;
    cbMES: TComboBox;
    Label2: TLabel;
    edANO: TcxSpinEdit;
    BitBtn1: TBitBtn;
    DSREC: TDataSource;
    qyrec: TFDQuery;
    QYUNI: TFDQuery;
    QYEVE: TFDQuery;
    QYCTR: TFDQuery;
    TBR: TFDMemTable;
    TBRmes1: TBCDField;
    TBRent1: TDateField;
    TBRmes2: TBCDField;
    TBRent2: TDateField;
    TBRmes3: TBCDField;
    TBRent3: TDateField;
    TBRideve: TIntegerField;
    TBRiduni: TIntegerField;
    TBRidctr: TIntegerField;
    colMES1: TcxGridDBColumn;
    viewMovent1: TcxGridDBColumn;
    colMES2: TcxGridDBColumn;
    viewMovent2: TcxGridDBColumn;
    colMES3: TcxGridDBColumn;
    colENT3: TcxGridDBColumn;
    colDSEVE: TcxGridDBColumn;
    colDSUNI: TcxGridDBColumn;
    colNRCTR: TcxGridDBColumn;
    TBRcheck: TBooleanField;
    colCheck: TcxGridDBColumn;
    TBRid: TLongWordField;
    colID: TcxGridDBColumn;
    TBRvenc1: TDateField;
    TBRvenc2: TDateField;
    TBRvenc3: TDateField;
    viewMovColumn1: TcxGridDBColumn;
    viewMovColumn2: TcxGridDBColumn;
    colVENC3: TcxGridDBColumn;
    colSIT: TcxGridDBColumn;
    TBRsit: TStringField;
    TBRdsuni: TStringField;
    TBRnrctr: TStringField;
    TBRdseve: TStringField;
    TBRdspes: TStringField;
    TBRdstpd: TStringField;
    QYPES: TFDQuery;
    QYTPD: TFDQuery;
    colDSPES: TcxGridDBColumn;
    colDSTPD: TcxGridDBColumn;
    TBRinfodata: TDateField;
    TBRinfoinsc: TStringField;
    TBRinfoemail: TStringField;
    TBRinfo4: TStringField;
    colIDATA: TcxGridDBColumn;
    colIINSC: TcxGridDBColumn;
    colIEMAIL: TcxGridDBColumn;
    colIOBS: TcxGridDBColumn;
    Button1: TButton;
    viewMovColumn3: TcxGridDBColumn;
    TBRentreg: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbMESSelect(Sender: TObject);
    procedure viewMovEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure colMES3PropertiesChange(Sender: TObject);
    procedure colMES1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colCheckPropertiesEditValueChanged(Sender: TObject);
    procedure colMES2CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colSITCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edANOPropertiesChange(Sender: TObject);
    procedure TBRBeforePost(DataSet: TDataSet);
    procedure TBRinfoinscGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure colIINSCPropertiesChange(Sender: TObject);
    procedure TBRinfodataChange(Sender: TField);
    procedure Button1Click(Sender: TObject);
    procedure TBRAfterEdit(DataSet: TDataSet);
    procedure TBRCalcFields(DataSet: TDataSet);
    procedure viewMovColumn3CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    canUpdate: integer;
    procedure Filtra;
  public
    { Public declarations }
  end;

var
  fDadosContrato: TfDadosContrato;

implementation

{$R *.dfm}

uses modDados, modFuncoes, movEntrega;

procedure TfDadosContrato.BitBtn1Click(Sender: TObject);
begin

  Filtra;

end;

procedure TfDadosContrato.Button1Click(Sender: TObject);
begin
  colSIT.FixedKind := fkNone;
  colDSUNI.FixedKind := fkNone;
  colMES3.FixedKind := fkNone;
  colVENC3.FixedKind := fkNone;
  colENT3.FixedKind := fkNone;
  colCheck.FixedKind := fkNone;
  colID.Visible := False;
  // ExportGridToXLSX('grid',gridMov, True,True, False);
  colID.Visible := True;
  colSIT.FixedKind := fkLeft;
  colDSUNI.FixedKind := fkLeft;
  colMES3.FixedKind := fkRight;
  colVENC3.FixedKind := fkRight;
  colENT3.FixedKind := fkRight;
  colCheck.FixedKind := fkRight;
  // ShellExecute(Handle, 'open', pchar('grid.xlsx'), nil, nil, SW_SHOW);

end;

procedure TfDadosContrato.cbMESSelect(Sender: TObject);
// var
// mes: TMesAno;
begin
  // mes.Mes:= cbMES.ItemIndex +1;
  // mes.Ano:= edANO.Value;
  Filtra;
end;

procedure TfDadosContrato.colCheckPropertiesEditValueChanged(Sender: TObject);
var
  st: string;
begin
  // ShowMessage(inttostr(colcheck.Tag));
  if colCheck.Tag <> 0 then
    exit;
  // if True then

  if colCheck.EditValue = True then begin
    with TfEntrega.create(Self, colID.EditValue) do begin
      if ShowModal = mrOK then begin
        // DM.QYMOV.Edit;
        colCheck.Tag := 1;
        colMES3.EditValue := edVALOR.Value;
        colVENC3.EditValue := edDTVEN.Date;
        colENT3.EditValue := Now;
        colCheck.Tag := 0;
      end else begin
        colCheck.Tag := 1;
        colCheck.EditValue := False;
        colCheck.Tag := 0;
      end;
      Free;
    end;
  end else begin
    if colMES3.EditValue <> null then begin
      colCheck.Tag := 1;
      if(perguntaNao('Cancelar Entrega do Documento?', 'Cancelar Entrega')) then begin
      {
        st := '\' + tipoLog[ord(logDevolvido)] + '|' +
          FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + '|' + inttostr(wUsuario) +
          '|' + #13#10;
        DM.qry.ExecSQL
          ('update plmovimento set us_entreg = 0, dt_entreg = null, log= concat(:id, log) where id = :id2 ',
          [st, colID.EditValue]);
          }
        st:= 'select * from plmovimento where id = ' + vartostr(colID.EditValue);
        DM.DBCON.StartTransaction;
        DM.qry.Open(st);
        DM.qry.First;
        DM.criaLogMov(DM.qry, cSTDEV);
        DM.qry.Edit;
        DM.qry['st_ini']:= cSTDEV;
        DM.qry['us_alt']:= wUsuario;
        DM.qry['dt_alt']:= Now;
        DM.qry['us_entreg']:= 0;
        DM.qry['dt_entreg']:= null;
        DM.qry.Post;
        DM.qry.Close;
        DM.DBCON.Commit;
        colENT3.EditValue := null;
      end else begin
        colCheck.EditValue:= True;
      end;
      colCheck.Tag := 0;
    end;
    // ShowMessage(colMes3.EditValue);
  end;

end;

procedure TfDadosContrato.colIINSCPropertiesChange(Sender: TObject);
begin
  with TcxTextEdit(Sender) do
  begin
    Text := soNumero(Text);
    SelStart := length(Text);
  end;

end;

procedure TfDadosContrato.colMES1CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if not AViewInfo.Selected then
    ACanvas.Brush.Color := $00F6F6F6;
end;

procedure TfDadosContrato.colMES2CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if not AViewInfo.Selected then
    ACanvas.Brush.Color := $00FBFBFB;

end;

procedure TfDadosContrato.colMES3PropertiesChange(Sender: TObject);
begin
  // colMES3.EditValue:= FormatFloat(',0.00', StrToFloat(Copy(soNumero(colMES3.EditValue),1, 11))/100);
  // colMes3
  // colMES3.EditValue:= StrToFloat(soNumero(colMES3.EditValue))/100;
  // TcxCurrencyEditProperties(colMES3.Properties).
end;

procedure TfDadosContrato.colSITCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin

  ACanvas.Font.Color := clBlack;
  // cor:= ACanvas.Font.Color;
  if AViewInfo.Value = cMovLiquidado then
    ACanvas.Brush.Color := corMovLiquidado
  else if AViewInfo.Value = cMovEmconta then
    ACanvas.Brush.Color := corMovEmconta // TColor($00A5FF)
  else if AViewInfo.Value = cMovAgendado then
    ACanvas.Brush.Color := corMovAgendado;

end;

procedure TfDadosContrato.viewMovColumn3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Value = 'SIM' then begin
    ACanvas.Font.Color:= clBlue
  end else ACanvas.Font.Color:= clRed;
  if(AViewInfo.GridRecord.Values[colSIT.Index] = cMovLiquidado) then
    ACanvas.Brush.Color := corMovLiquidado
  else if (AViewInfo.GridRecord.Values[colSIT.Index] = cMovEmconta) then
    ACanvas.Brush.Color := corMovEmconta;




  //if Sender.DataController.Values[AViewInfo. then


end;

procedure TfDadosContrato.viewMovEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  AAllow := (Sender.DataController.Values
    [Sender.DataController.FocusedRecordIndex, colMES3.Index] <> null) and
    (Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,
    colSIT.Index] = cMovAgendado);
end;

procedure TfDadosContrato.edANOPropertiesChange(Sender: TObject);
begin
  Filtra;

end;

procedure TfDadosContrato.Filtra;
var
//  AItemList: TcxFilterCriteriaItemList;
  sqlquery: string;
  mes, tmp: TMesAno;
  mesI, mesF: string;
  idctr: integer;
  id: integer;
begin
  canUpdate := 0;
  mes.mes := cbMES.ItemIndex + 1;
  mes.Ano := edANO.Value;
  colMES1.Caption := cMeses[mes.mesAnt.mesAnt.mes];
  colMES2.Caption := cMeses[mes.mesAnt.mes];
  colMES3.Caption := cMeses[mes.mes];

  // colCHECK.Options.Editing:= not ((monthof(date) <> mes.Mes) or (yearof(date) <> mes.Ano));

  mesI := dataSql(mes.mesAnt.mesAnt.priDia);
  mesF := dataSql(mes.ultDia);
  sqlquery :=
    'SELECT id, id_ctr, id_uni, id_eve, id_pes, id_tpd, st_mov, st_fim, vl_bas, dt_ven, dt_entreg, us_entreg FROM plmovimento '
    + ' WHERE ' +
  // 'id_eve IN (SELECT id FROM tbeventos WHERE ativo = 1 and dados = 1) and ' +
    '(st_fim = "' + cSTNOR + '") and ' + '(tp_mov = "' + cTipoContrato +
    '") AND ' + '((st_mov = "' + cMovAgendado +
    '") or (dt_entreg IS NOT NULL)) and ' + '(dt_ven BETWEEN "' + mesI +
    '" AND "' + mesF + '") ' + 'ORDER BY id_ctr ASC, dt_ven DESC';

  TBR.DisableControls;
  TBR.Close;
  TBR.Open;
  with qyrec do
  begin
    Open(sqlquery);
    // ShowMessage(inttostr(recordcount));
    idctr := -1;
    TBRsit.Tag := 1;
    while not Eof do begin
      if idctr <> fieldbyname('id_ctr').AsInteger then begin
        idctr := fieldbyname('id_ctr').AsInteger;
        TBR.Append;
        TBRideve.AsInteger := fieldbyname('id_eve').AsInteger;
        if QYEVE.Locate('id', TBRideve.AsInteger, []) then
          TBRdseve.AsString := QYEVE.fieldbyname('descr').AsString;
        TBRiduni.AsInteger := fieldbyname('id_uni').AsInteger;
        if QYUNI.Locate('id', TBRiduni.AsInteger, []) then
          TBRdsuni.AsString := QYUNI.fieldbyname('descr').AsString;

        TBRidctr.AsInteger := fieldbyname('id_ctr').AsInteger;
        if QYCTR.Locate('id', TBRidctr.AsInteger, []) then begin
          TBRnrctr.AsString := QYCTR.fieldbyname('nr_contrato').AsString;
          TBRinfodata.AsVariant := QYCTR.fieldbyname('infodata').AsVariant;
          TBRinfoinsc.AsVariant := QYCTR.fieldbyname('infoinsc').AsVariant;
          TBRinfoemail.AsVariant := QYCTR.fieldbyname('infoemail').AsVariant;
          TBRinfo4.AsVariant := QYCTR.fieldbyname('info4').AsVariant;
        end;

        id := fieldbyname('id_pes').AsInteger;
        if QYPES.Locate('id', id, []) then
          TBRdspes.Value := QYPES.fieldbyname('descr').AsString;
        id := fieldbyname('id_tpd').AsInteger;
        if QYTPD.Locate('id', id, []) then
          TBRdstpd.Value := QYTPD.fieldbyname('descr').AsString;

        TBRid.Value := 0;
        TBRcheck.Value := False;
      end else begin
        TBR.Edit;
      end;
      tmp.create(fieldbyname('dt_ven').AsDateTime);
      if TBRsit.IsNull then
        TBRsit.Value := fieldbyname('st_mov').AsString;
      if tmp.mes = mes.mes then begin
        TBRsit.Value := fieldbyname('st_mov').AsString;
        TBRmes3.Value := fieldbyname('vl_bas').AsCurrency;
        TBRvenc3.Value := fieldbyname('dt_ven').AsDateTime;
        TBRent3.AsVariant := fieldbyname('dt_entreg').AsVariant;
        TBRid.Value := fieldbyname('id').AsInteger;
        // o primeiro registro é o mês atual

        if TBRent3.AsVariant <> null then
          TBRcheck.Value := True;

      end else if tmp.mes = mes.mesAnt.mes then begin
        TBRmes2.Value := fieldbyname('vl_bas').AsCurrency;
        TBRvenc2.Value := fieldbyname('dt_ven').AsDateTime;
        // tbrID.Value:= fieldbyname('id').AsInteger;
        TBRent2.AsVariant := fieldbyname('dt_entreg').AsVariant;
      end else if tmp.mes = mes.mesAnt.mesAnt.mes then begin
        TBRmes1.Value := fieldbyname('vl_bas').AsCurrency;
        TBRvenc1.Value := fieldbyname('dt_ven').AsDateTime;
        // tbrID.Value:= fieldbyname('id').AsInteger;
        TBRent1.AsVariant := fieldbyname('dt_entreg').AsVariant;
      end;
      TBR.Post;
      Next;
    end;
    TBRsit.Tag := 0;
    Close;
  end;
  TBR.EnableControls;
  viewMov.BeginUpdate();
  {
    with viewMov.DataController.Filter do
    begin
    BeginUpdate;
    try
    Root.Clear;
    AItemList:= Root.AddItemList(fboOR);
    //Root.BoolOperatorKind := fboOr;
    //Root.AddItem(colSit, foEqual, cMovAgendado, cMovAgendado);
    //Root.AddItem(colSit, foEqual, cMovEmConta, cMovEmConta);
    AItemList.AddItem(colSit, foEqual, cMovAgendado, cMovAgendado);
    AItemList.AddItem(colSit, foEqual, cMovEmConta, cMovEmConta);
    Active:= true;
    finally
    EndUpdate;
    end;
    end;
  }
  colDSUNI.ApplyBestFit();
  // colDSEVE.ApplyBestFit();
  colNRCTR.ApplyBestFit();
  // colDSPES.ApplyBestFit();
  // colDSTPD.ApplyBestFit();
  viewMov.Controller.GoToFirst();
  viewMov.EndUpdate;
  canUpdate := 1;
end;

procedure TfDadosContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyrec.Close;
  TBR.Close;
  QYUNI.Close;
  QYEVE.Close;
  QYCTR.Close;
  QYPES.Close;
  QYTPD.Close;

end;

procedure TfDadosContrato.FormCreate(Sender: TObject);
begin
  gridMov.Align := alClient;
  DM.carregaConfig;
  QYUNI.Open('select id, descr from tbunidades');
  QYEVE.Open('select id, descr from tbeventos');
  QYCTR.Open
    ('select id, nr_contrato, infodata, infoinsc, infoemail, info4 from plcontratos '
    + 'WHERE ' + 'TP_MOV = "' + cTipoContrato + '" AND ' + 'ST_FIM = "' +
    cSTNOR + '"');
  QYPES.Open('select id, descr from tbpessoal');
  QYTPD.Open('select id, descr from tbtipodoc');
  TBR.CreateDataSet;
  cbMES.ItemIndex := MonthOf(Now) - 1;
  edANO.Value := YearOf(Now);
//  if wModoDev <> 0 then
  if wUsuario <= 100 then
    colID.Visible := True;

  // Filtra;
end;

procedure TfDadosContrato.TBRAfterEdit(DataSet: TDataSet);
begin
  // if tbrSIT.Tag = 0 then
  // if tbrSIT.Value <> cMovAgendado then DataSet.Cancel;

end;

procedure TfDadosContrato.TBRBeforePost(DataSet: TDataSet);
begin
  {
    DM.DBCON.ExecSQL('update plContratos ' +
    'SET infodata = :d1, infoinsc = :d2, infoemail = :d3, info4 = :d4 WHERE ' +
    'id_ctr = :d5',[tbrINFODATA.Value, tbrINFOINSC.Value, tbrINFOEMAIL.Value, tbrINFO4.Value, tbrIDCTR.Value]);
  }
end;

procedure TfDadosContrato.TBRCalcFields(DataSet: TDataSet);
begin
if tbrCHECK.Value then tbrENTREG.Value:= 'SIM'
else tbrENTREG.Value:= 'NÃO';

end;

procedure TfDadosContrato.TBRinfodataChange(Sender: TField);
var
  qt: integer;
begin
  if canUpdate > 0 then
  begin
    // showmessage('ondata change ' + Sender.FieldName + ' - ' + Sender.AsString + ' - ' + tbrIDCTR.AsString);
    // canUpdate:= 2+Sender.Tag;
    qt := DM.DBCON.ExecSQL('update plContratos ' + 'SET ' + Sender.FieldName +
      ' = :d1 WHERE ' + 'id = :d2', [Sender.Value, TBRidctr.Value]);
    if qt <> 1 then
      MsgErro('2310300832 - Erro na atualização deste Campo! - ' +
        inttostr(qt));
  end;
end;

procedure TfDadosContrato.TBRinfoinscGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if length(Sender.AsString) = 11 then
    Text := FormataNRINS(Sender.AsString, cTIPOCPF)
  else if length(Sender.AsString) = 14 then
    Text := FormataNRINS(Sender.AsString, cTIPOCNPJ)
  else
    Text := soNumero(Sender.AsString);

end;

end.
