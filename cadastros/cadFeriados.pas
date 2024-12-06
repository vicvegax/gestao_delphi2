unit cadFeriados;

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
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfcadFeriados = class(TForm)
    dsRec: TDataSource;
    gdRec: TDBGrid;
    Label1: TLabel;
    edDESCR: TEdit;
    Label2: TLabel;
    edDATA: TcxDateEdit;
    qyrec: TFDQuery;
    qyrecdiasem: TStringField;
    qyrecdata: TDateField;
    qyrecdescr: TStringField;
    qyrecativo: TShortintField;
    qyrecus_inc: TWordField;
    qyrecdt_inc: TDateTimeField;
    qyrecus_alt: TWordField;
    qyrecdt_alt: TDateTimeField;
    qyrecus_exc: TWordField;
    qyrecdt_exc: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure gdRecDblClick(Sender: TObject);
    procedure edDATAKeyPress(Sender: TObject; var Key: Char);
    procedure qyrecCalcFields(DataSet: TDataSet);
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
  fcadFeriados: TfcadFeriados;

implementation

{$R *.dfm}

uses modDados;

function TfcadFeriados.ExeAcao: Boolean;
var
  bLocReg: Boolean;
  permis: String;
begin
  Result := False;
  permis:= 'tabFeriados';
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
  bLocReg := qyrec.Locate('data', edDATA.Date, []);

  if not(wModo = modoExc) then
  begin
    if (wModo = modoInc) then
    begin
      if (bLocReg) then
      begin
        MsgErro(Format(kJaCad, ['Feriado']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocReg) then
      begin
        MsgErro(Format(kNaoLoc, ['Feriado']));
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
      end;
      FieldByName('DESCR').AsString := edDESCR.Text;
      FieldByName('DATA').AsDateTime := edDATA.Date;
      FieldByName('ativo').AsInteger := 1;
      Post;
    end;
  end
  else
  begin
    if (not bLocReg) then
    begin
      MsgErro(Format(kNaoLoc, ['Feriado']));
      Exit;
    end;
    if (not perguntaSim(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaSim(kMsgExcCtz, kModo[wModo])) then
      Exit;

    qyrec.Delete;
    // qyrec.Edit;
    // dm.marcaExclusao(qyrec);
    // qyrec.Post;
  end;
  gdRec.Refresh;
  LimpaCampos;
  MudaModo(modoInc);
  Result := true;
end;

function TfcadFeriados.ChkCampos: Boolean;
begin
  Result := False;
  if edDATA.EditValue = null then
  begin
    msgPreen('Data');
    edDATA.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Descrição do Feriado');
    edDESCR.SetFocus;
    Exit;
  end;
  Result := true;
end;

procedure TfcadFeriados.edDATAKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcadFeriados.edENTER_KeyPress(Sender: TObject; var Key: Char);
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

procedure TfcadFeriados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyrec.Close;
  qyrec.Filtered := False;
end;

procedure TfcadFeriados.FormCreate(Sender: TObject);
begin
  // qyrec:= DM.QYFER;
  qyrec.Filter := ' ativo >=0 ';
  qyrec.Filtered := true;
  qyrec.Open('SELECT * FROM tbferiados WHERE ativo >= 0 ORDER BY DATA');
  // dsrec.DataSet:= qyrec;
end;

procedure TfcadFeriados.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadFeriados.gdRecDblClick(Sender: TObject);
begin
  if qyrec.RecordCount > 0 then begin
    preCampos;
    mudaModo(modoAlt);
  end;
end;

procedure TfcadFeriados.LimpaCampos;
begin
  edDATA.Clear;
  edDESCR.Text := '';
  qtModoInc := 0;
end;

procedure TfcadFeriados.preCampos;
begin
  with qyrec do
  begin
    edDESCR.Text := FieldByName('DESCR').AsString;
    edDATA.Date := FieldByName('data').AsDateTime;
  end;
end;

procedure TfcadFeriados.qyrecCalcFields(DataSet: TDataSet);
begin
  qyrec.FieldByName('diasem').AsString :=
    dia_semana[dayofweek(qyrec.FieldByName('data').AsDateTime)];

end;

procedure TfcadFeriados.WMACAO(var Msg: TMessage);
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
      inc(qtModoInc);
      if (qtModoInc > 1) then
      begin
        LimpaCampos;
        qtModoInc := 0;
      end;
    end;
    edDATA.SetFocus;
  end;
  if Msg.wParam = wpConfirma then
  begin
    ExeAcao;
  end;

end;

end.
