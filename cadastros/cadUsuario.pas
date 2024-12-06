unit cadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, MyComboBox2022,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfcadUsuario = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    gdRec: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    edDESCR: TEdit;
    Label3: TLabel;
    edCPF: TMaskEdit;
    edSENHA: TEdit;
    Label4: TLabel;
    cbAtivo: TComboBox;
    cbNivel: TcxLookupComboBox;
    Label5: TLabel;
    qyRecds_nivel: TStringField;
    Label6: TLabel;
    qyRecid: TWordField;
    qyReccpf: TStringField;
    qyRecdescr: TStringField;
    qyRecsenha: TStringField;
    qyRecid_nivel: TWordField;
    qyRecult_log: TIntegerField;
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
    procedure gdRecDblClick(Sender: TObject);
    procedure edENTERKeyPress(Sender: TObject; var Key: Char);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
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
    // var
  public
    { Public declarations }
    // lModo: Integer;
  end;

var
  fcadUsuario: TfcadUsuario;

implementation

{$R *.dfm}

uses modDados;

function TfcadUsuario.ExeAcao: Boolean;
var
  bLocReg: Boolean;
  permis: String;
begin
  Result := False;
  permis:= 'utiUsuarios';
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
  // qyRec.DisableControls;
  bLocReg := qyRec.Locate('cpf', edCPF.Text, []);

  if not(wModo = modoExc) then
  begin
    if (wModo = modoInc) then
    begin
      if (bLocReg) then
      begin
        MsgErro(Format(kJaCad, ['Usuário']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then
        Exit;
    end
    else
    begin
      if (not bLocReg) then
      begin
        MsgErro(Format(kNaoLoc, ['Usuário']));
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
      FieldByName('CPF').AsString := edCPF.Text;
      if length(edSENHA.Text) > 0 then
        FieldByName('senha').AsString := CodificaH(edSENHA.Text, 0);
      FieldByName('id_nivel').AsInteger := cbNivel.EditValue;
      FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
      Post;
    end;
  end
  else
  begin
    // (VERIFICAR)
    MsgErro('Exclusão de Usuário ainda não permitida! Entre em contato com o desenvolvedor.');
    Exit;

    if (not bLocReg) then
    begin
      MsgErro(Format(kNaoLoc, ['Usuário']));
      Exit;
    end;

    if qyRec.FieldByName('id').AsInteger = wUsuarioAdm then
    begin
      MsgErro('Este Usuário não pode ser excluído!');
      Exit;
    end;
    if qyRec.FieldByName('id').AsInteger = wUsuario then
    begin
      MsgErro('Este Usuário não pode ser excluído!');
      Exit;
    end;
    if (not perguntaNao(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaNao(kMsgExcCtz, kModo[wModo])) then
      Exit;

    // obs:= DM.obsBox('Motivo da Exclusão', 'Informe por que está Excluindo este lançamento:');

    qyRec.Edit;
    DM.marcaExclusao(qyRec);
    // qyrec.FieldByName('obs_exc').AsString:= obs;
    qyRec.Post;
    // qyREC.Delete;
  end;
  // qyRec.EnableControls;
  // qyRec.Refresh;
  // if wModo = modoExc then gdRec.Repaint
  // else
  gdRec.Refresh;
  LimpaCampos;
  MudaModo(modoInc);
  Result := true;
end;

function TfcadUsuario.ChkCampos: Boolean;
begin
  Result := False;
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
  // if(wModo <>modoExc) and (length(edSENHA.Text) < 4) then begin
  if ((wModo = modoAlt) and (length(edSENHA.Text) > 0)) or (wModo = modoInc)
  then
    if (length(edSENHA.Text) < 4) then
    begin
      MsgErro('Senha precisa ter 4 dígitos ou mais.');
      edSENHA.SetFocus;
      Exit;
    end;

  if not checaNRINS(edCPF.Text, cTipoCPF) then
  begin
    MsgErro('Informe um CPF válido!');
    edCPF.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Nome');
    edDESCR.SetFocus;
    Exit;
  end;
  if (cbNivel.ItemIndex < 0) then
  begin
    MsgErro('Informe o Nível do Usuário!');
    cbNivel.SetFocus;
    Exit;
  end;
  Result := true;
end;

procedure TfcadUsuario.edProxFocusKeyPress(Sender: TObject; var Key: Char);
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

procedure TfcadUsuario.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfcadUsuario.edENTERKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;
end;

procedure TfcadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyRec.Close;
  DM.tbUsuNivel.Close;
end;

procedure TfcadUsuario.FormCreate(Sender: TObject);
begin
  DM.tbUsuNivel.Open();
  qyRec.Filter := '(ativo >= 0)';
  qyRec.Filtered := true;
  qyRec.Open
    ('SELECT * FROM tbusuario WHERE (ativo >=0) and (id > 100) ORDER BY ATIVO DESC, DESCR ASC');
  qyRec.FieldByName('cpf').EditMask := mskCPF;
  edCPF.EditMask := mskCPF;
end;

procedure TfcadUsuario.FormShow(Sender: TObject);
begin
  edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadUsuario.gdRecDblClick(Sender: TObject);
begin
  // if(wModo = modoInc) then
  if qyRec.RecordCount > 0 then begin
    preCampos;
    mudaModo(modoAlt);
  end;
end;

procedure TfcadUsuario.LimpaCampos;
begin
  edDESCR.Text := '';
  edCPF.Text := '';
  edSENHA.Text := '';
  cbAtivo.ItemIndex := 1;
  cbNivel.ItemIndex := -1;
  qtModoInc := 0;
end;

procedure TfcadUsuario.preCampos;
begin
  with qyRec do
  begin
    edDESCR.Text := FieldByName('DESCR').AsString;
    edCPF.Text := FieldByName('CPF').AsString;
    cbNivel.EditValue := FieldByName('id_nivel').AsInteger;
    edSENHA.Text := '';
  end;
end;

procedure TfcadUsuario.WMACAO(var Msg: TMessage);
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
      inc(qtModoInc);
      if (qtModoInc > 1) then
      begin
        LimpaCampos;
        qtModoInc := 0;
      end;
    end;
    edCPF.SetFocus;
  end;
  if Msg.wParam = wpConfirma then
  begin
    ExeAcao;
  end;

end;

end.
