unit cadTipoGenerico;

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
  cxMaskEdit, cxSpinEdit;

type
  TfCadTipoGen = class(TForm)
    dsRec: TDataSource;
    gdRec: TDBGrid;
    Label1: TLabel;
    edDESCR: TEdit;
    Label2: TLabel;
    qyrec: TFDQuery;
    edID: TcxSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure gdRecDblClick(Sender: TObject);
    procedure edIDKeyPress(Sender: TObject; var Key: Char);
    procedure gdRecTitleClick(Column: TColumn);
    procedure edDESCRExit(Sender: TObject);
  private
    { Private declarations }
    function ExeAcao: Boolean;
    function ChkCampos: Boolean;
    procedure preCampos;
    procedure WMACAO(var Msg: TMessage); message WM_ACAO;
    procedure LimpaCampos;

  var
    qtModoInc: Integer;
    FTitulo: String;
    FTabela: String;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; tab: String; tit: String);
      reintroduce;
  end;

var
  fCadTipoGen: TfCadTipoGen;

implementation

{$R *.dfm}

uses modDados;

function TfCadTipoGen.ExeAcao: Boolean;
var
  bLocReg: Boolean; // localiza registro cadastrado
  obs: string;
  permis: String;
begin
  Result := False;
  permis:= 'tab' + FTitulo;
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
  if (edID.Tag = edID.Value) and (edID.Tag > 0) then
  // alterando descr ou excluindo, ID > 0
    bLocReg := True
  else
  begin // incluindo ou alterando o código
    bLocReg := qyrec.Locate('id', edID.Value, []); // localiza um ID diferente
    if edID.Tag > 0 then
    begin // alteração
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
        MsgErro(Format(kJaCad, ['Tipo de ' + FTitulo]));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocReg) then
      begin
        MsgErro(Format(kNaoLoc, ['Tipo de ' + FTitulo]));
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
      FieldByName('ID').AsInteger := edID.Value;
      FieldByName('ativo').AsInteger := 1;
      Post;
    end;
  end
  else
  begin
    if (not bLocReg) then
    begin
      MsgErro(Format(kNaoLoc, ['Tipo de ' + FTitulo]));
      Exit;
    end;
    if (not perguntaNao(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaNao(kMsgExcCtz, kModo[wModo])) then
      Exit;

    if not DM.obsBox('Motivo da Exclusão',
      'Informe por que está Excluindo este lançamento:', obs) then
      exit;
    qyrec.Edit;
    DM.marcaExclusao(qyrec);
    qyrec.FieldByName('obs_exc').AsString := obs;
    qyrec.Post;
  end;
  gdRec.Refresh;
  LimpaCampos;
  MudaModo(modoInc);
  Result := True;
end;

function TfCadTipoGen.ChkCampos: Boolean;
begin
  Result := False;
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
  if edID.Value = null then
  begin
    msgPreen('Código');
    edID.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Descrição do Tipo de ' + FTitulo);
    edDESCR.SetFocus;
    Exit;
  end;
  Result := True;
end;

constructor TfCadTipoGen.Create(AOwner: TComponent; tab: String; tit: String);
begin
  inherited Create(AOwner);

  FTabela := tab;
  FTitulo := tit;
  Self.Caption := Self.Caption + FTitulo;
  qyrec.Filter := ' ativo > 0';
  qyrec.Filtered := True;
  qyrec.Open('select * from ' + FTabela + ' ORDER BY cod');
  // qyrec.Open();
  // dsrec.DataSet:= qyrec;

end;

procedure TfCadTipoGen.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfCadTipoGen.edENTER_KeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadTipoGen.edIDKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfCadTipoGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // qyRec.Close;
end;

procedure TfCadTipoGen.FormCreate(Sender: TObject);
begin
  // inherited
end;

procedure TfCadTipoGen.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfCadTipoGen.gdRecDblClick(Sender: TObject);
begin
  if qyrec.RecordCount > 0 then begin
    preCampos;
    mudaModo(modoAlt);
  end;
end;

procedure TfCadTipoGen.gdRecTitleClick(Column: TColumn);
begin
  qyrec.IndexFieldNames := Column.FieldName;

end;

procedure TfCadTipoGen.LimpaCampos;
begin
  DM.qry.Open('SELECT MAX(id) AS MXCOD FROM ' + FTabela);
  edID.Value := 1;
  if DM.qry.RecordCount > 0 then
    edID.Value := DM.qry.FieldByName('MXCOD').AsInteger + 1;
  DM.qry.Close;
  // edID.Clear;
  edDESCR.Text := '';
  qtModoInc := 0;
end;

procedure TfCadTipoGen.preCampos;
begin
  with qyrec do
  begin
    edDESCR.Text := FieldByName('DESCR').AsString;
    edID.Value := FieldByName('id').AsInteger;
    edID.Tag := edID.Value;
  end;
end;

procedure TfCadTipoGen.WMACAO(var Msg: TMessage);
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
