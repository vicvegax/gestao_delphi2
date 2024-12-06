unit cadTipoDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, cxGraphics,
  cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox;

type
  TfCadTipoDoc = class(TForm)
    dsRec: TDataSource;
    Label1: TLabel;
    edDESCR: TEdit;
    Label2: TLabel;
    qyrec: TFDQuery;
    edID: TcxSpinEdit;
    Label3: TLabel;
    cbCONTA: TComboBox;
    Label4: TLabel;
    cbPERIO: TComboBox;
    qyrecid: TWordField;
    qyreccod: TStringField;
    qyrecdescr: TStringField;
    qyrecconta: TShortintField;
    qyrecperio: TShortintField;
    qyrecativo: TShortintField;
    qyrecus_inc: TWordField;
    qyrecdt_inc: TDateTimeField;
    qyrecus_alt: TWordField;
    qyrecdt_alt: TDateTimeField;
    qyrecus_exc: TWordField;
    qyrecdt_exc: TDateTimeField;
    qyrecobs_exc: TStringField;
    viewREC: TcxGridDBTableView;
    gridRecLevel1: TcxGridLevel;
    gridRec: TcxGrid;
    viewRECcod: TcxGridDBColumn;
    colDESCR: TcxGridDBColumn;
    viewRECconta: TcxGridDBColumn;
    viewRECperio: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure edIDKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure qyrecperioGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyreccontaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edDESCRExit(Sender: TObject);
    procedure viewRECDblClick(Sender: TObject);
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
  fCadTipoDoc: TfCadTipoDoc;

implementation

{$R *.dfm}

uses modDados;

function TfCadTipoDoc.ExeAcao: Boolean;
var
  bLocReg: Boolean; // localiza registro cadastrado
  obs: string;
  permis: String;
begin
  Result := False;
  permis:= 'tabDocumentos';
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
  if (edID.Tag = edID.Value) and (edID.Tag > 0) then
  // alterando descr ou excluindo, ID > 0
    bLocReg := True
  else
  begin // incluindo ou alterando o c�digo
    bLocReg := qyrec.Locate('id', edID.Value, []); // localiza um ID diferente
    if edID.Tag > 0 then
    begin // altera��o
      bLocReg := not bLocReg;
      qyrec.Locate('id', edID.Tag, []);
      // localiza o que vai ser alterado/apagado
    end;
  end;

  if not(wModo = modoExc) then
  begin
    if (wModo = modoInc) then
    begin
      if (bLocReg) then
      begin
        MsgErro(Format(kJaCad, ['Tipo de Documento']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocReg) then
      begin
        MsgErro(Format(kNaoLoc, ['Tipo de Documento']));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then
        Exit;
    end; // if
    with qyrec do
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
        // FieldByName('DT_ALT').AsString:= 'current_timestamp()';

      end;
      FieldByName('DESCR').AsString := edDESCR.Text;
      FieldByName('CONTA').AsInteger := cbCONTA.ItemIndex;
      FieldByName('PERIO').AsInteger := cbPERIO.ItemIndex;
      FieldByName('ID').AsInteger := edID.Value;
      FieldByName('ativo').AsInteger := 1;
      Post;
    end;
  end
  else
  begin
    if (not bLocReg) then
    begin
      MsgErro(Format(kNaoLoc, ['Tipo de Documento']));
      Exit;
    end;
    if (not perguntaNao(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaNao(kMsgExcCtz, kModo[wModo])) then
      Exit;
    if not DM.obsBox('Motivo da Exclus�o',
      'Informe por que est� Excluindo este lan�amento:', obs) then
      exit;

    qyrec.Edit;
    DM.marcaExclusao(qyrec);
    qyrec.FieldByName('obs_exc').AsString := obs;
    qyrec.Post;
  end;
  // gdRec.Refresh;
  LimpaCampos;
  MudaModo(modoInc);
  Result := True;
end;

function TfCadTipoDoc.ChkCampos: Boolean;
begin
  Result := False;
  if edID.Value = null then
  begin
    msgPreen('C�digo');
    edID.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Descri��o do Tipo de Documento');
    edDESCR.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfCadTipoDoc.viewRECDblClick(Sender: TObject);
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

procedure TfCadTipoDoc.edDESCRChange(Sender: TObject);
begin
  if edDESCR.Tag = 0 then
    viewREC.DataController.Search.Locate(colDESCR.Index, edDESCR.Text, true);

end;

procedure TfCadTipoDoc.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfCadTipoDoc.edDESCRKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadTipoDoc.edENTER_KeyPress(Sender: TObject; var Key: Char);
// var
// pkey: integer;
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;
end;

procedure TfCadTipoDoc.edIDKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfCadTipoDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyrec.Close;
end;

procedure TfCadTipoDoc.FormCreate(Sender: TObject);
begin
  qyrec.Filter := 'ativo > 0';
  qyrec.Filtered := True;

  qyrec.Open('select * from tbtipodoc ORDER BY cod');
  // dsrec.DataSet:= qyrec;
end;

procedure TfCadTipoDoc.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfCadTipoDoc.LimpaCampos;
begin
  DM.qry.Open('SELECT MAX(id) AS MXCOD FROM tbtipodoc');
  edID.Value := 1;
  if DM.qry.RecordCount > 0 then
    edID.Value := DM.qry.FieldByName('MXCOD').AsInteger + 1;
  DM.qry.Close;
  // edID.Clear;
  edDESCR.Tag:= 1;
  edDESCR.Text := '';
  edDESCR.Tag:= 0;
  cbCONTA.ItemIndex := 0;
  cbPERIO.ItemIndex := 0;
  qtModoInc := 0;
end;

procedure TfCadTipoDoc.preCampos;
begin
  with qyrec do
  begin
    edDESCR.Tag:= 1;
    edDESCR.Text := FieldByName('DESCR').AsString;
    edDESCR.Tag:= 0;
    cbCONTA.ItemIndex := FieldByName('CONTA').AsInteger;
    cbPERIO.ItemIndex := FieldByName('PERIO').AsInteger;
    edID.Value := FieldByName('id').AsInteger;
    edID.Tag := edID.Value;
  end;
end;

procedure TfCadTipoDoc.qyreccontaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := 'SIM'
  else
    Text := 'N�O';

end;

procedure TfCadTipoDoc.qyrecperioGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := 'SIM'
  else
    Text := 'N�O';

end;

procedure TfCadTipoDoc.WMACAO(var Msg: TMessage);
begin
  if Msg.wParam = wpModo then
  begin
    if Msg.LParam <> modoInc then
    begin
      if (qyrec.RecordCount > 0) then
        preCampos
      else
        MudaModo(modoInc);
      qtModoInc := 0;
    end
    else
    begin
      // edID.Text:= kNovoID;
      edID.Tag := 0;
      inc(qtModoInc);
      if (qtModoInc > 1) then
      begin
        LimpaCampos;
        qtModoInc := 0;
      end;
    end;
    edDESCR.SetFocus;
  end;
  if Msg.wParam = wpConfirma then
  begin
    ExeAcao;
  end;

end;

end.
