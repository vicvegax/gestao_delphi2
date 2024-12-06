unit cadUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, zeroEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfcadUnidades = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    Label1: TLabel;
    edDESCR: TEdit;
    Label5: TLabel;
    Label2: TLabel;
    edID: TEdit;
    edCod: TzeroEdit;
    Label3: TLabel;
    cbAtivo: TComboBox;
    Label4: TLabel;
    edObs: TMemo;
    Label6: TLabel;
    edLocal: TEdit;
    Label7: TLabel;
    cbUF: TComboBox;
    Label8: TLabel;
    qyRecid: TWordField;
    qyReccod: TStringField;
    qyRecponto: TStringField;
    qyReccodpt: TStringField;
    qyRecdescr: TStringField;
    qyReclocal: TStringField;
    qyRecuf: TStringField;
    qyRecfone1: TStringField;
    qyRecobs: TStringField;
    qyRecativo: TShortintField;
    qyRecus_inc: TWordField;
    qyRecdt_inc: TDateTimeField;
    qyRecus_alt: TWordField;
    qyRecdt_alt: TDateTimeField;
    qyRecus_exc: TWordField;
    qyRecdt_exc: TDateTimeField;
    qyReclog: TMemoField;
    Label9: TLabel;
    cbNIVEL: TcxLookupComboBox;
    dsNiv: TDataSource;
    qyNiv: TFDQuery;
    qyNivid: TWordField;
    qyNivdescr: TStringField;
    qyRecnivel: TByteField;
    viewRec: TcxGridDBTableView;
    levelRec: TcxGridLevel;
    gridRec: TcxGrid;
    viewReccod: TcxGridDBColumn;
    viewRecponto: TcxGridDBColumn;
    colDESCR: TcxGridDBColumn;
    viewReclocal: TcxGridDBColumn;
    viewRecuf: TcxGridDBColumn;
    viewRecobs: TcxGridDBColumn;
    colSIT: TcxGridDBColumn;
    viewRecnivel: TcxGridDBColumn;
    qyRecds_nivel: TStringField;
    colNivel: TcxGridDBColumn;
    cbIDEMP: TcxLookupComboBox;
    edIDEMP: TEdit;
    Label11: TLabel;
    qyemp: TFDQuery;
    dsemp: TDataSource;
    qyRecid_emp: TSmallintField;
    qyReccalc_dsemp: TStringField;
    viewRecColumn1: TcxGridDBColumn;
    edPONTO: TzeroEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRExit(Sender: TObject);
    procedure qyRecativoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure viewRecDblClick(Sender: TObject);
    procedure viewRecDataControllerFilterRecord(ADataController
      : TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
    procedure edIDEMPChange(Sender: TObject);
    procedure edIDEMPExit(Sender: TObject);
    procedure cbIDEMPPropertiesEditValueChanged(Sender: TObject);
    procedure edPONTOExit(Sender: TObject);
    procedure edDESCRChange(Sender: TObject);
    procedure colSITCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function ExeAcao: Boolean;
    function ChkCampos: Boolean;
    procedure preCampos;
    procedure WMACAO(var Msg: TMessage); message WM_ACAO;
    procedure LimpaCampos;

  var
    qtModoInc: Integer;
  public
    { Public declarations }
  end;

var
  fcadUnidades: TfcadUnidades;

implementation

{$R *.dfm}

uses modDados;

function TfcadUnidades.ExeAcao: Boolean;
var
  bLocId, bLocReg: Boolean;
  permis: String;
begin
  Result := False;
  permis:= 'cadUnidades';
  if (wModo = modoInc) and (not DM.permitido(permis + 'I')) then begin
      MsgErro(msgIncNaoPermitida);
      exit;
  end else if (wModo = modoAlt) and (not DM.permitido(permis + 'A')) then begin
      MsgErro(msgAltNaoPermitida);
      exit;
  end else if (wModo = modoExc) and (not DM.permitido(permis + 'E')) then begin
      MsgErro(msgExcNaoPermitida);
      exit;
  end;

  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
  if (not ChkCampos) then
    Exit;
  // qyRec.DisableControls;
  bLocReg := qyRec.Locate('cod;ponto',
    vararrayof([edCod.value, edPonto.Text]), []);
  bLocId := False;
  if (wModo <> modoInc) then
    bLocId := qyRec.Locate('id', edID.Text, []);

  if not(wModo = modoExc) then
  begin
    if (wModo = modoInc) then
    begin
      if (bLocReg) then
      begin
        MsgErro(Format(kJaCad, ['Prefixo com Ponto']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocId) then
      begin
        MsgErro(Format(kNaoLoc, ['Unidades']));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then
        Exit;
    end; // if
    with qyRec do
    begin
      DM.DBTRANS.StartTransaction;
      try
        if (wModo = modoInc) then
        begin
          Append;
          FieldByName('US_INC').AsInteger := wUsuario;
          FieldByName('DT_INC').AsDateTime := Now;
        end
        else
        begin
          Edit;
          FieldByName('US_ALT').AsInteger := wUsuario;
          FieldByName('DT_ALT').AsDateTime := Now;
        end;
        FieldByName('DESCR').AsString := edDESCR.Text;
        fieldvalues['id_emp']:= cbIDEMP.EditValue;

        FieldByName('cod').AsString := edCod.value;
        FieldByName('ponto').AsString := edPonto.Text;
        FieldByName('local').AsString := edLocal.Text;
        FieldByName('obs').AsString := edObs.Lines.Text;
        FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
        FieldByName('uf').AsString := cbUF.Text;
        FieldByName('nivel').AsInteger := cbNIVEL.editvalue;
        Post;
        DM.DBTRANS.Commit;
      except
        DM.DBTRANS.Rollback;
        ShowMessage('Uma operação foi Desfeita!');
      end;
    end;
  end
  else
  begin
    if (not bLocId) then
    begin
      MsgErro(Format(kNaoLoc, ['Texto']));
      Exit;
    end;
    if (not perguntaSim(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaSim(kMsgExcCtz, kModo[wModo])) then
      Exit;

    qyRec.Delete;
  end;
  // qyRec.EnableControls;
  // qyRec.Refresh;
  // if wModo = modoExc then gdRec.Repaint
  // else
  // gdRec.Refresh;
  LimpaCampos;
  MudaModo(modoInc);
  Result := true;
end;

procedure TfcadUnidades.cbIDEMPPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDEMP.Tag <> 0 then Exit;

  edIDEMP.Tag:= 1;
  edIDEMP.Text:= '';
  if cbIDEMP.EditValue <> null then begin
    if qyEMP.Locate('id', cbIDEMP.EditValue, []) then begin
      edIDEMP.Text:= formataCNPJ(qyemp['nrins']);
    end;
  end;
  edIDEMP.Tag:= 0;

end;

function TfcadUnidades.ChkCampos: Boolean;
begin
  Result := False;
  if (length(edDESCR.Text) = 0) then begin
    msgPreen('Nome da Unidade');
    edDESCR.SetFocus;
    Exit;
  end;
  if (edponto.Value = '') or (edponto.Value = '00') then begin
    edponto.Value:= '1';
  end;
//    msgPreen('Ponto');
    //edDESCR.SetFocus;
//    exit;
  //end;

  if (length(edCod.Text) = 0) then begin
    msgPreen('Código');
    edCod.SetFocus;
    Exit;
  end;
  if (cbNIVEL.editvalue = null) then begin
    cbNIVEL.editvalue := 0;
  end;
  if cbIDEMP.EditValue = null then begin
    msgPreen('Empresa');
    edIDEMP.SetFocus;
    exit;
  end;
  Result := true;
end;

procedure TfcadUnidades.edPONTOExit(Sender: TObject);
begin
if edPONTO.value = '' then edPONTO.Value:= '1';

end;

procedure TfcadUnidades.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin

  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcadUnidades.edDESCRChange(Sender: TObject);
begin
  if edDESCR.Tag = 0 then
    viewREC.DataController.Search.Locate(colDESCR.Index, edDESCR.Text, true);

end;

procedure TfcadUnidades.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfcadUnidades.edDESCRKeyPress(Sender: TObject; var Key: Char);
var
  pkey: Integer;
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end
  else
  begin
    pkey := pos(Key, comAcento);
    if pkey > 0 then
      Key := semacento[pkey];

  end;

end;

procedure TfcadUnidades.edENTER_KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;
end;

procedure TfcadUnidades.edIDEMPChange(Sender: TObject);
var
  st: string;
begin

  if edIDEMP.Tag <> 0 then Exit;

  cbIDEMP.Tag:= 1;
  st:= sonumero(edIDEMP.Text);
  edIDEMP.Text:= formataCNPJ(st);
  edIDEMP.SelStart := length(edIDEMP.Text);
  if st.Length > 0 then begin
    cbIDEMP.ItemIndex:= -1;
    if qyemp.Locate('nrins', st, [loPartialKey]) then begin
      cbIDEMP.EditValue:= qyemp['id'];
      cbIDEMP.Tag:= 2;
    end;

    //ProxFocus;
  end else begin
    cbIDEMP.tag:= 0;
  end;
end;

procedure TfcadUnidades.edIDEMPExit(Sender: TObject);
begin
  edIDEMP.Tag:= 1;
  if cbIDEMP.Tag = 2 then begin
    edIDEMP.Text:= formataCNPJ(qyemp['nrins']);
    cbIDEMP.Tag:= 0;
  end else if cbIDEMP.Tag = 1 then begin
    edIDEMP.Clear;
    cbIDEMP.Tag:= 0;
  end;
  edIDEMP.Tag:= 0;

end;

procedure TfcadUnidades.FormCreate(Sender: TObject);
begin
  qyemp.Open('select id, cod, nrins, descr from tbempresas where ativo = 1 order by nrins');
  qyNiv.Open('select id, descr from tbusuarionivel order by id');
  qyrec.Filter:= 'ativo >= 0';
  qyrec.Filtered:= true;
  qyRec.Open('select * from tbunidades where ativo >= 0 order by DESCR');
end;

procedure TfcadUnidades.FormDestroy(Sender: TObject);
begin
  qyRec.Close;
  qyNiv.Close;
  qyemp.Close;

end;

procedure TfcadUnidades.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadUnidades.LimpaCampos;
begin
  edDESCR.Tag:= 1;
  edDESCR.Text := '';
  edDESCR.Tag:= 0;
  cbIDEMP.Tag:= 0;
  cbIDEMP.EditValue:= null;

  edID.Text := kNovoId;
  edCod.value := '';
  edPonto.Value:= '1';
  edObs.Lines.Clear;
  cbAtivo.ItemIndex := 1;
  edLocal.Text := '';
  qtModoInc := 0;
  cbUF.ItemIndex := -1;
  cbNIVEL.ItemIndex := 0;
end;

procedure TfcadUnidades.preCampos;
begin
  with qyRec do begin
    cbIDEMP.Tag:= 0;
    cbIDEMP.EditValue:= FieldValues['id_emp'];

  edDESCR.Tag:= 1;
  edDESCR.Text := FieldByName('DESCR').AsString;
  edDESCR.Tag:= 0;
    edCod.value := FieldByName('cod').AsString;
    edLocal.Text := FieldByName('local').AsString;
    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edObs.Lines.Text := FieldByName('obs').AsString;
    cbUF.ItemIndex := cbUF.Items.IndexOf(FieldByName('uf').AsString);
    edPonto.value := FieldByName('ponto').AsString;
    if not(wModo = modoInc) then
      edID.Text := FieldByName('id').AsString;
    cbNIVEL.editvalue := FieldByName('nivel').AsInteger;
  end;
end;

procedure TfcadUnidades.qyRecativoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := 'ATIVO'
  else
    Text := 'INATIVO';
end;

procedure TfcadUnidades.colSITCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//    if colSIT.EditValue = 'INATIVO' then ACanvas.Font.Color:= clRed;
  if AViewInfo.Value = 0 then ACanvas.Font.Color:= clRed;

end;

procedure TfcadUnidades.viewRecDataControllerFilterRecord(ADataController
  : TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
begin
  Accept := DM.aceitaNivel(ADataController.Values[ARecordIndex,
    colNivel.Index]);

end;

procedure TfcadUnidades.viewRecDblClick(Sender: TObject);
var
  APoint: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin
  GetCursorPos(APoint);
  with gridRec.FocusedView.Site do
  begin
    APoint := ScreenToClient(APoint);
    AHitTest := ViewInfo.GetHitTest(APoint);

    if AHitTest is TcxGridRecordHitTest then
    begin
      preCampos;
      mudaModo(modoAlt);
    end;
  end;
end;

procedure TfcadUnidades.WMACAO(var Msg: TMessage);
begin
  if Msg.wParam = wpModo then
  begin
    if Msg.LParam <> modoInc then
    begin
      if (qyRec.RecordCount > 0) then
        preCampos
      else
        MudaModo(modoInc);
      qtModoInc := 0;
    end
    else
    begin
      edID.Text := kNovoId;
      inc(qtModoInc);
      if (qtModoInc > 1) then
      begin
        LimpaCampos;
        qtModoInc := 0;
      end;
    end;
    edCod.SetFocus;
  end;
  if Msg.wParam = wpConfirma then
  begin
    ExeAcao;
  end;

end;

end.
