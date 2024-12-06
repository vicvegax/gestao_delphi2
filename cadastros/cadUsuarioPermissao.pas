unit cadUsuarioPermissao;

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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfCadUsuarioPermissao = class(TForm)
    dsRec: TDataSource;
    gdRec: TDBGrid;
    Label1: TLabel;
    edDESCR: TEdit;
    qyrec: TFDQuery;
    Label3: TLabel;
    edID: TcxSpinEdit;
    Label2: TLabel;
    edGRUPO: TcxSpinEdit;
    chREP: TCheckBox;
    cbGRUPO: TcxLookupComboBox;
    qygrp: TFDQuery;
    dsgrp: TDataSource;
    qyrecid: TWordField;
    qyrecid_grupo: TSmallintField;
    qyrecgrupo: TWordField;
    qyrecdescr: TStringField;
    qyrecus_inc: TWordField;
    qyrecdt_inc: TDateTimeField;
    qyrecus_alt: TWordField;
    qyrecdt_alt: TDateTimeField;
    qyrecus_exc: TDateTimeField;
    qyrecdt_exc: TWordField;
    qyrecobs_exc: TStringField;
    qyrecds_grupo: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure gdRecDblClick(Sender: TObject);
    procedure edIDKeyPress(Sender: TObject; var Key: Char);
    procedure gdRecTitleClick(Column: TColumn);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
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
    // FTabela: String;
  public
    { Public declarations }
  end;

var
  fCadUsuarioPermissao: TfCadUsuarioPermissao;

implementation

{$R *.dfm}

uses modDados;

function TfCadUsuarioPermissao.ExeAcao: Boolean;
var
  bLocReg: Boolean; // localiza registro cadastrado
  obs: string;
begin
  Result := False;

  if (not ChkCampos) then
    Exit;
  if (edID.tag > 0) then // alterando descr ou excluindo, ID > 0
    bLocReg := True
  else
  begin // incluindo ou alterando o código
    bLocReg := qyrec.Locate('id', edID.tag, []); // localiza um ID diferente
    if edID.tag > 0 then
    begin // alteração
      bLocReg := not bLocReg;
      qyrec.Locate('id', edID.tag, []);
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
      // FieldByName('ID').AsInteger:= edID.Value;
      FieldByName('id').AsInteger := edID.Value;
      FieldByName('grupo').AsInteger := edGRUPO.Value;
      FieldByName('id_grupo').AsInteger := cbGRUPO.EditValue;
      // FieldByName('ativo').AsInteger:= 1;
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

function TfCadUsuarioPermissao.ChkCampos: Boolean;
begin
  Result := False;
  {
    if edID.Value = null then begin
    msgPreen('Código');
    edID.SetFocus;
    Exit;
    end;
  }
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Descrição do Tipo de ' + FTitulo);
    edDESCR.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfCadUsuarioPermissao.edDESCRKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;
end;

procedure TfCadUsuarioPermissao.edENTER_KeyPress(Sender: TObject;
  var Key: Char);
// var
// pkey: integer;
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;

  end;
end;

procedure TfCadUsuarioPermissao.edIDKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfCadUsuarioPermissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qyrec.Close;
  qygrp.Close;
end;

procedure TfCadUsuarioPermissao.FormCreate(Sender: TObject);
begin
  qygrp.Open('select * from tbusuariogrupopermissao order by id');
  // qyrec.sql.Text:= ;
  qyrec.IndexFieldNames := 'id_grupo;id';
  qyrec.Open('select * from tbusuariopermissao order by grupo, id');

  // inherited
end;

procedure TfCadUsuarioPermissao.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfCadUsuarioPermissao.gdRecDblClick(Sender: TObject);
begin
  if qyrec.RecordCount > 0 then
    preCampos;
end;

procedure TfCadUsuarioPermissao.gdRecTitleClick(Column: TColumn);
begin
  qyrec.IndexFieldNames := Column.FieldName;

end;

procedure TfCadUsuarioPermissao.LimpaCampos;
begin
  // edID.Clear;
  if not chREP.Checked then
    edDESCR.Text := '';
  qtModoInc := 0;
end;

procedure TfCadUsuarioPermissao.preCampos;
begin
  with qyrec do
  begin
    edDESCR.Text := FieldByName('DESCR').AsString;
    edID.Value := FieldByName('id').AsInteger;
    edGRUPO.Value := FieldByName('grupo').AsInteger;
    cbGRUPO.EditValue := FieldByName('id_grupo').AsInteger;
    // edID.Value:= FieldByName('id').AsInteger;
    edID.tag := FieldByName('id').AsInteger; // edID.Value;
  end;
end;

procedure TfCadUsuarioPermissao.WMACAO(var Msg: TMessage);
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
      edID.tag := 0;
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
