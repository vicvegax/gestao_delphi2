unit cadContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, bancoEdit, contaEdit,
  agenciaEdit, zeroEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox; // , System.SysUtils;

type
  TfcadContas = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    gdRec: TDBGrid;
    Label1: TLabel;
    edDESCR: TEdit;
    Label5: TLabel;
    edID: TEdit;
    edAgencia: TagenciaEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbAtivo: TComboBox;
    Label4: TLabel;
    edObs: TMemo;
    Label6: TLabel;
    edNrConta: TcontaEdit;
    Label7: TLabel;
    edBanco: TbancoEdit;
    Label8: TLabel;
    edCod: TzeroEdit;
    Label9: TLabel;
    cbTPCNT: TComboBox;
    Label10: TLabel;
    edtpdes: TEdit;
    qyRecid: TWordField;
    qyReccod: TStringField;
    qyRecdescr: TStringField;
    qyRecbanco: TStringField;
    qyRecagencia: TStringField;
    qyRecnr_conta: TStringField;
    qyRectp_conta: TByteField;
    qyRectp_descr: TStringField;
    qyRecobs: TStringField;
    qyRecinfo1: TStringField;
    qyRecinfo2: TStringField;
    qyRecinfo3: TStringField;
    qyRecinfo4: TStringField;
    qyRecinfo5: TStringField;
    qyRecativo: TShortintField;
    qyRecus_inc: TWordField;
    qyRecdt_inc: TDateTimeField;
    qyRecus_alt: TWordField;
    qyRecdt_alt: TDateTimeField;
    qyRecus_exc: TWordField;
    qyRecdt_exc: TDateTimeField;
    qyRecvalor: TBCDField;
    qyRecsaldo: TBCDField;
    qyemp: TFDQuery;
    dsemp: TDataSource;
    qyRecid_emp: TSmallintField;
    qyReccalc_nrins: TStringField;
    qyReccalc_dsemp: TStringField;
    Label11: TLabel;
    edIDEMP: TEdit;
    cbIDEMP: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure gdRecDblClick(Sender: TObject);
    procedure edCodExit(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure edAgenciaExit(Sender: TObject);
    procedure edNrContaExit(Sender: TObject);
    procedure edDESCRExit(Sender: TObject);
    procedure qyRecnrinsGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyRecnr_contaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyRectp_contaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edIDEMPChange(Sender: TObject);
    procedure edIDEMPExit(Sender: TObject);
    procedure cbIDEMPPropertiesEditValueChanged(Sender: TObject);
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
  fcadContas: TfcadContas;

implementation

{$R *.dfm}

uses modDados;

function TfcadContas.ExeAcao: Boolean;
var
  bLocId, bLocReg: Boolean;
  permis: String;
begin
  Result := False;
  permis:= 'cadContas';
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
  //edRAZAO.Text := Trim(removeAcento(edRAZAO.Text));
  if (not ChkCampos) then
    Exit;
  // qyRec.DisableControls;
  bLocReg := qyRec.Locate('cod', edCod.Text, []);
  bLocId := False;
  if (wModo <> modoInc) then
    bLocId := qyRec.Locate('id', edID.Text, []);

  if not(wModo = modoExc) then begin
    if (wModo = modoInc) then begin

      if (bLocReg) then begin
        MsgErro(Format(kJaCad, ['Conta']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then Exit;
    end else begin

      if (not bLocId) then begin
        MsgErro(Format(kNaoLoc, ['Conta']));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then
        Exit;
    end; // if
    with qyRec do
    begin
      if (wModo = modoInc) then begin
        Append;
        FieldByName('US_INC').AsInteger := wUsuario;
        FieldByName('DT_INC').AsDateTime := Now;
      end else begin
        Edit;
        FieldByName('US_ALT').AsInteger := wUsuario;
        FieldByName('DT_ALT').AsDateTime := Now;
      end;
      FieldByName('cod').AsString := edCod.value;
      FieldByName('DESCR').AsString := edDESCR.Text;
      fieldvalues['id_emp']:= cbIDEMP.EditValue;

      //FieldByName('nrins').AsString := sonumero(edNRINS.Text);
      //FieldByName('razao').AsString := edRAZAO.Text;
      FieldByName('banco').AsString := edBanco.value;
      FieldByName('agencia').AsString := edAgencia.value;
      FieldByName('nr_conta').AsString := edNrConta.value;
      FieldByName('tp_conta').AsInteger := cbTPCNT.ItemIndex;
      FieldByName('tp_descr').AsString := edtpdes.Text;
      FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
      FieldByName('obs').AsString := edObs.Lines.Text;
      FieldByName('valor').AsFloat := 0;
      Post;
    end;
  end else begin

    if (not bLocId) then
    begin
      MsgErro(Format(kNaoLoc, ['Conta']));
      Exit;
    end;
    if (not perguntaSim(kMsgExc, kModo[wModo])) then
      Exit;
    if (not perguntaSim(kMsgExcCtz, kModo[wModo])) then
      Exit;

    // qyREC.Delete;
    qyRec.Edit;
    DM.marcaExclusao(qyRec);
    qyRec.Post;
  end;
  gdRec.Refresh;
  LimpaCampos;
  MudaModo(modoInc);
  Result := true;
end;

procedure TfcadContas.cbIDEMPPropertiesEditValueChanged(Sender: TObject);
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

function TfcadContas.ChkCampos: Boolean;
begin
  Result := False;
  if (length(edCod.Text) = 0) then begin
    msgPreen('C�digo');
    edCod.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then begin
    msgPreen('Nome da Conta');
    edDESCR.SetFocus;
    Exit;
  end;
  if cbIDEMP.EditValue = null then begin
    msgPreen('Empresa');
    edIDEMP.SetFocus;
    exit;
  end;
  Result := true;
end;

procedure TfcadContas.edAgenciaExit(Sender: TObject);
begin
  if edAgencia.value <> '' then
    if not checaConta(edAgencia.value, edBanco.value) then
    begin
      MsgErro('N�mero da Ag�ncia inv�lido! (Aten��o ao C�digo do Banco)');
      edAgencia.SetFocus;
    end;
end;

procedure TfcadContas.edCodExit(Sender: TObject);
var
  st: string;
begin
  st := Trim(edCod.Text);
  if length(st) > 0 then
    edCod.Text := st.PadLeft(3, '0');
end;

procedure TfcadContas.edNrContaExit(Sender: TObject);
begin
  if edNrConta.value <> '' then
    if not checaConta(edNrConta.value, edBanco.value) then
    begin
      MsgErro('N�mero da Conta inv�lido! (Aten��o ao C�digo do Banco)');
      edNrConta.SetFocus;
    end;

end;

procedure TfcadContas.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfcadContas.edDESCRKeyPress(Sender: TObject; var Key: Char);
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

procedure TfcadContas.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcadContas.edENTER_KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;
end;

procedure TfcadContas.edIDEMPChange(Sender: TObject);
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

procedure TfcadContas.edIDEMPExit(Sender: TObject);
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

procedure TfcadContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyRec.Close;
//  qyRec.Filtered := False;
  qyemp.Close;
end;

procedure TfcadContas.FormCreate(Sender: TObject);
begin
  qyemp.Open('select id, cod, nrins, descr from tbempresas where ativo = 1 order by nrins');
  qyRec.Filter := 'ativo >= 0';
  qyRec.Filtered := true;
  qyRec.Open('select * from tbcontas WHERE ativo >= 0 order by cod');
end;

procedure TfcadContas.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadContas.gdRecDblClick(Sender: TObject);
begin
  if qyRec.RecordCount > 0 then begin
    preCampos;
    mudaModo(modoAlt);
  end;
end;

procedure TfcadContas.LimpaCampos;
begin
  edCod.value := '';
  edDESCR.Text := '';

  //edIDEMP.Tag:= 1;
  //edIDEMP.Clear;
  //edIDEMP.Tag:= 0;
  cbIDEMP.Tag:= 0;
  cbIDEMP.EditValue:= null;
//  edIDEMP.Text:= '';

  edBanco.value := '';
  edAgencia.value := '';
  edNrConta.value := '';
  cbAtivo.ItemIndex := 1;
  cbTPCNT.ItemIndex := 1;
  edtpdes.Text := '';
  edObs.Lines.Clear;
  edID.Text := kNovoId;
  qtModoInc := 0;
end;

procedure TfcadContas.preCampos;
begin
  with qyRec do
  begin
    edCod.value := FieldByName('cod').AsString;
    edDESCR.Text := FieldByName('DESCR').AsString;

    cbIDEMP.Tag:= 0;
    cbIDEMP.EditValue:= FieldValues['id_emp'];

    edBanco.value := FieldByName('banco').AsString;
    edAgencia.value := FieldByName('agencia').AsString;
    edNrConta.Text := FieldByName('nr_conta').AsString;
    cbTPCNT.ItemIndex := FieldByName('tp_conta').AsInteger;
    edtpdes.Text := FieldByName('tp_descr').AsString;
    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edObs.Lines.Text := FieldByName('obs').AsString;

    if not(wModo = modoInc) then
      edID.Text := FieldByName('id').AsString;
  end;
end;

procedure TfcadContas.qyRecnrinsGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Mask('##.###.###/####-##', Sender.AsString);
end;

procedure TfcadContas.qyRecnr_contaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataNrConta(Sender.AsString)
end;

procedure TfcadContas.qyRectp_contaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := cbTPCNT.Items[Sender.AsInteger];
end;

procedure TfcadContas.WMACAO(var Msg: TMessage);
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