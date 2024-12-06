unit cadUsuarioNivel;

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
  TfCadUsuarioNivel = class(TForm)
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
  fCadUsuarioNivel: TfCadUsuarioNivel;

implementation

{$R *.dfm}

uses modDados;

function TfCadUsuarioNivel.ExeAcao: Boolean;
var
  bLocReg: Boolean; // localiza registro cadastrado
  obs: string;
begin
  Result := False;

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
        MsgErro(Format(kJaCad, ['Nível de Usuário']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocReg) then
      begin
        MsgErro(Format(kNaoLoc, ['Nível de Usuário']));
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
      // FieldByName('ativo').AsInteger:= 1;
      Post;
    end;
  end
  else
  begin
    if (not bLocReg) then
    begin
      MsgErro(Format(kNaoLoc, ['Nível de Usuário']));
      Exit;
    end;
    if edID.Tag = 1 then
    begin
      MsgErro('Este Código não pode ser Excluído!');
      Exit;
    end;

    if (not perguntaSim(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaSim(kMsgExcCtz, kModo[wModo])) then
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

function TfCadUsuarioNivel.ChkCampos: Boolean;
begin
  Result := False;
  if (edID.Value = null) or (edID.Value = 0) then
  begin
    msgPreen('Código');
    edID.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Descrição do Nível de Usuário');
    edDESCR.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfCadUsuarioNivel.edENTER_KeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadUsuarioNivel.edIDKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfCadUsuarioNivel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // qyRec.Close;
end;

procedure TfCadUsuarioNivel.FormCreate(Sender: TObject);
begin
  qyrec.Open
    ('select *, lpad(id,3,"0") as cod from tbusuarionivel where (id > 0) ORDER BY cod');
end;

procedure TfCadUsuarioNivel.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfCadUsuarioNivel.gdRecDblClick(Sender: TObject);
begin
  if qyrec.RecordCount > 0 then
    preCampos;
end;

procedure TfCadUsuarioNivel.gdRecTitleClick(Column: TColumn);
begin
  qyrec.IndexFieldNames := Column.FieldName;

end;

procedure TfCadUsuarioNivel.LimpaCampos;
begin
  DM.qry.Open('SELECT MAX(id) AS MXCOD FROM tbusuarionivel');
  edID.Value := 1;
  if DM.qry.RecordCount > 0 then
    edID.Value := DM.qry.FieldByName('MXCOD').AsInteger + 1;
  DM.qry.Close;
  // edID.Clear;
  edDESCR.Text := '';
  qtModoInc := 0;
end;

procedure TfCadUsuarioNivel.preCampos;
begin
  with qyrec do
  begin
    edDESCR.Text := FieldByName('DESCR').AsString;
    edID.Value := FieldByName('id').AsInteger;
    edID.Tag := edID.Value;
  end;
end;

procedure TfCadUsuarioNivel.WMACAO(var Msg: TMessage);
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
