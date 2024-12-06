unit cadEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, StrUtils,
  Data.SqlTimSt,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxContainer;

type
  TfcadEventos = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    Label1: TLabel;
    edDESCR: TEdit;
    Label5: TLabel;
    edID: TEdit;
    edCod: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbAtivo: TComboBox;
    Label4: TLabel;
    edObs: TMemo;
    Label6: TLabel;
    cbNTREG: TComboBox;
    gridREC: TcxGrid;
    viewREC: TcxGridDBTableView;
    levelREC: TcxGridLevel;
    viewRECtp_reg: TcxGridDBColumn;
    viewRECcod: TcxGridDBColumn;
    colDESCR: TcxGridDBColumn;
    viewRECnt_reg: TcxGridDBColumn;
    viewRECobs: TcxGridDBColumn;
    viewRECativo: TcxGridDBColumn;
    chDADOS: TCheckBox;
    viewRECColumn1: TcxGridDBColumn;
    qyRecid: TWordField;
    qyReccod: TStringField;
    qyRectp_reg: TStringField;
    qyRecdescr: TStringField;
    qyRecnt_reg: TStringField;
    qyRecativo: TShortintField;
    qyRecobs: TStringField;
    qyRecus_inc: TWordField;
    qyRecdt_inc: TDateTimeField;
    qyRecus_alt: TWordField;
    qyRecdt_alt: TDateTimeField;
    qyRecus_exc: TWordField;
    qyRecdt_exc: TDateTimeField;
    qyRecdados: TShortintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure edCodChange(Sender: TObject);
    procedure qyRecativoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure viewRECtp_regCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure viewRECnt_regCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure viewRECDblClick(Sender: TObject);
    procedure edDESCRExit(Sender: TObject);
    procedure edDESCRChange(Sender: TObject);
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
  fcadEventos: TfcadEventos;

implementation

{$R *.dfm}

uses modDados;

function TfcadEventos.ExeAcao: Boolean;
var
  bLocId, bLocReg: Boolean;
  permis: String;
begin
  Result := False;
  permis:= 'tabEventos';
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
  bLocReg := qyRec.Locate('cod', edCod.Text, []);
  bLocId := False;
  if (wModo <> modoInc) then
    bLocId := qyRec.Locate('id', edID.Text, []);

  if not(wModo = modoExc) then
  begin
    if (wModo = modoInc) then
    begin
      if (bLocReg) then
      begin
        MsgErro(Format(kJaCad, ['Plano de Contas']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocId) then
      begin
        MsgErro(Format(kNaoLoc, ['Plano de Contas']));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then
        Exit;
    end; // if
    with qyRec do
    begin
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
      FieldByName('cod').AsString := edCod.Text;
      FieldByName('dados').AsInteger := 0;
      if chDADOS.Checked then
        FieldByName('dados').AsInteger := 1;
      FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
      FieldByName('obs').AsString := edObs.Lines.Text;
      FieldByName('nt_reg').AsString := cbNTREG.Text[1];
      Post;
    end;
  end
  else
  begin
    if (not bLocId) then
    begin
      MsgErro(Format(kNaoLoc, ['Plano de Contas']));
      Exit;
    end;
    if (not perguntaSim(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaSim(kMsgExcCtz, kModo[wModo])) then
      Exit;

    qyRec.Edit;
    DM.marcaExclusao(qyRec);
    qyRec.Post;

    // qyREC.Delete; //cancelado em 06/09/2023
  end;
  // qyRec.Close;
  // qyRec.Open;
  // qyRec.Refresh;
  // qyRec.EnableControls;
  // qyRec.ApplyUpdates();
  // gdRec.Invalidate;
  // gdRec.Refresh;
  // if wModo = modoExc then gdRec.Repaint
  // else
  // gdRec.Refresh;
  viewRec.DataController.Filter.Root.Clear;
  LimpaCampos;
  MudaModo(modoInc);
  Result := true;
end;

procedure TfcadEventos.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    proxFocus;
  end;

end;

procedure TfcadEventos.edCodChange(Sender: TObject);
begin
  if edCod.Tag = 0 then
  begin
    // if edCOD.Modified then ShowMessage('modificado');

    if length(edCod.Text) = 1 then
    begin
      if charinset(edCod.Text[1], ['1', '2']) then
      begin
        DM.qry.Open
          ('select MAX(cod) as MXCOD FROM tbeventos WHERE LEFT(COD, 1) = "' +
          edCod.Text[1] + '"');
        if DM.qry.RecordCount > 0 then
        begin
          edCod.Tag := 1;
          edCod.Text := inttostr(DM.qry.FieldByName('MXCOD').AsInteger + 1);
          edCod.Tag := 0;
        end;
        DM.qry.Close;
        cbNTREG.ItemIndex := 0;
        if edCod.Text[1] = '2' then
          cbNTREG.ItemIndex := 1;

      end;
    end;
  end;
end;

procedure TfcadEventos.edDESCRChange(Sender: TObject);
begin
  if edDESCR.Tag = 0 then begin
    //viewREC.DataController.Search.Locate(colDESCR.Index, edDESCR.Text, true);
    with viewREC do
    begin
      DataController.Filter.BeginUpdate;
      try
        DataController.Filter.Root.Clear;
        DataController.Filter.Root.AddItem(colDESCR, foContains, edDESCR.Text, edDESCR.Text);
      finally
        DataController.Filter.EndUpdate;
        DataController.Filter.Active := true;
      end;
    end;
  end;

end;

procedure TfcadEventos.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfcadEventos.edDESCRKeyPress(Sender: TObject; var Key: Char);
var
  pkey: Integer;
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    proxFocus;
  end
  else
  begin
    pkey := pos(Key, comAcento);
    if pkey > 0 then
      Key := semacento[pkey];

  end;

end;

procedure TfcadEventos.edENTER_KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;

end;

function TfcadEventos.ChkCampos: Boolean;
begin
  Result := False;
  if (length(edCod.Text) = 0) then
  begin
    msgPreen('Código');
    edCod.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Descrição');
    edDESCR.SetFocus;
    Exit;
  end;
  Result := true;
end;

procedure TfcadEventos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyRec.Close;
  qyRec.Filtered := False;
end;

procedure TfcadEventos.FormCreate(Sender: TObject);
begin
  edCod.EditMask := mskEVENTO;
  qyRec.FieldByName('cod').EditMask := mskEVENTO;
  qyRec.Filter := 'ativo >= 0';
  qyRec.Filtered := true;
  qyRec.Open('select * from tbeventos WHERE ativo >= 0');
end;

procedure TfcadEventos.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadEventos.LimpaCampos;
begin
  edDESCR.Tag := 1;
  edDESCR.Text := '';
  edDESCR.Tag := 0;
  edCod.Text := '';
  cbAtivo.ItemIndex := 1;
  edObs.Lines.Clear;
  edID.Text := kNovoId;
  chDADOS.Checked := False;
  qtModoInc := 0;
end;

procedure TfcadEventos.preCampos;
begin
  with qyRec do
  begin
  edDESCR.Tag := 1;
    edDESCR.Text := FieldByName('DESCR').AsString;
  edDESCR.Tag := 0;
    edCod.Text := FieldByName('Cod').AsString;
    cbNTREG.ItemIndex := 0;
    if FieldByName('nt_reg').AsString = cNTCRE then
      cbNTREG.ItemIndex := 1;
    chDADOS.Checked := (FieldByName('dados').AsInteger = 1);
    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edObs.Lines.Text := FieldByName('obs').AsString;
    if not(wModo = modoInc) then
      edID.Text := FieldByName('id').AsString;
  end;
end;

procedure TfcadEventos.qyRecativoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := 'SIM'
  else
    Text := 'NÃO';
end;

procedure TfcadEventos.viewRECDblClick(Sender: TObject);
var
  APoint: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin
  GetCursorPos(APoint);
  with gridREC.FocusedView.Site do
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

procedure TfcadEventos.viewRECnt_regCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Value = cNTDEB then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

end;

procedure TfcadEventos.viewRECtp_regCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Value = 'D' then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

end;

procedure TfcadEventos.WMACAO(var Msg: TMessage);
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
