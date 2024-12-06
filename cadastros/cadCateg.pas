unit cadCateg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, zeroEdit;

type
  TfcadCateg = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    gdRec: TDBGrid;
    Label1: TLabel;
    edDESCR: TEdit;
    Label5: TLabel;
    edID: TEdit;
    edCod: TzeroEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbAtivo: TComboBox;
    Label4: TLabel;
    edObs: TMemo;
    qyRecid: TWordField;
    qyReccod: TStringField;
    qyRecdescr: TStringField;
    qyRecobs: TStringField;
    qyRecativo: TShortintField;
    qyRecus_inc: TWordField;
    qyRecdt_inc: TDateTimeField;
    qyRecus_alt: TWordField;
    qyRecdt_alt: TDateTimeField;
    qyRecus_exc: TWordField;
    qyRecdt_exc: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure gdRecDblClick(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
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
  fcadCateg: TfcadCateg;

implementation

{$R *.dfm}

uses modDados;

function TfcadCateg.ExeAcao: Boolean;
var
  bLocId, bLocReg: Boolean;
  permis: String;
begin
  Result := False;
  permis:= 'cadTpBens';
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

  if (not ChkCampos) then
    Exit;
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
        MsgErro(Format(kJaCad, ['Categoria']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocId) then
      begin
        MsgErro(Format(kNaoLoc, ['Categoria']));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then
        Exit;
    end; // if
    with qyRec do
    begin
      DM.DBTRANS.StartTransaction;
      DisableControls;
      // gdrec.
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
        FieldByName('cod').AsString := edCod.Text;
        FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
        FieldByName('obs').AsString := edObs.Lines.Text;
        Post;
        DM.DBTRANS.Commit;
      except
        on E: Exception do
        begin
          ShowMessage('Erro: ' + E.Message);
          qyRec.Cancel; // .RevertRecord;// .CancelUpdates;
          DM.DBTRANS.Rollback;
        end;
      end;
      EnableControls;
    end;
  end
  else
  begin
    if (not bLocId) then
    begin
      MsgErro(Format(kNaoLoc, ['Categoria']));
      Exit;
    end;
    if (not perguntaSim(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaSim(kMsgExcCtz, kModo[wModo])) then
      Exit;

    qyRec.Delete;
  end;
  gdRec.Refresh;
  LimpaCampos;
  MudaModo(modoInc);
  Result := true;
end;

function TfcadCateg.ChkCampos: Boolean;
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
    msgPreen('Nome Completo');
    edDESCR.SetFocus;
    Exit;
  end;
  Result := true;
end;

procedure TfcadCateg.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcadCateg.edENTER_KeyPress(Sender: TObject; var Key: Char);
var
  pkey: Integer;
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end
  else
  begin
    pkey := pos(Key, comAcento);
    if pkey > 0 then
      Key := semacento[pkey];

  end;
end;

procedure TfcadCateg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyRec.Close;
end;

procedure TfcadCateg.FormCreate(Sender: TObject);
begin
  qyRec.Open();
end;

procedure TfcadCateg.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadCateg.gdRecDblClick(Sender: TObject);
begin
  if qyRec.RecordCount > 0 then begin
    preCampos;
    mudaModo(modoAlt);
  end;
end;

procedure TfcadCateg.LimpaCampos;
begin
  DM.qry.Open('SELECT COALESCE(MAX(cod), 0) AS MXCOD FROM tbcateg');
  // edCod.Value:= '1';
  // if DM.qry.RecordCount > 0 then
  edCod.Value := IntToStr(DM.qry.FieldByName('MXCOD').AsInteger + 1);
  DM.qry.Close;
  edDESCR.Text := '';
  cbAtivo.ItemIndex := 1;
  edObs.Lines.Clear;
  edID.Text := kNovoId;
  qtModoInc := 0;
end;

procedure TfcadCateg.preCampos;
begin
  with qyRec do
  begin
    edDESCR.Text := FieldByName('DESCR').AsString;
    edCod.Text := FieldByName('Cod').AsString;
    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edObs.Lines.Text := FieldByName('obs').AsString;
    if not(wModo = modoInc) then
      edID.Text := FieldByName('id').AsString;
  end;
end;

procedure TfcadCateg.WMACAO(var Msg: TMessage);
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
    // edCOD.SetFocus;
    edDESCR.SetFocus;
  end;
  if Msg.wParam = wpConfirma then
  begin
    ExeAcao;
  end;

end;

end.
