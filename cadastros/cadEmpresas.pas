unit cadEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, bancoEdit, contaEdit,
  agenciaEdit, zeroEdit; // , System.SysUtils;

type
  TfcadEmpresas = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    gdRec: TDBGrid;
    Label1: TLabel;
    edDESCR: TEdit;
    Label5: TLabel;
    edID: TEdit;
    Label3: TLabel;
    cbAtivo: TComboBox;
    Label4: TLabel;
    edObs: TMemo;
    Label8: TLabel;
    edCod: TzeroEdit;
    Label11: TLabel;
    edNRINS: TEdit;
    Label12: TLabel;
    edFANTA: TEdit;
    qyRecid: TSmallintField;
    qyReccod: TStringField;
    qyRecdescr: TStringField;
    qyRecnrins: TStringField;
    qyRecfanta: TStringField;
    qyRecobs: TStringField;
    qyRecativo: TShortintField;
    qyRecus_inc: TSmallintField;
    qyRecdt_inc: TDateTimeField;
    qyRecus_alt: TSmallintField;
    qyRecdt_alt: TDateTimeField;
    qyRecus_exc: TSmallintField;
    qyRecdt_exc: TDateTimeField;
    Label2: TLabel;
    edLOGRAD: TEdit;
    Label6: TLabel;
    edNUMERO: TzeroEdit;
    Label7: TLabel;
    edCOMPL: TEdit;
    Label9: TLabel;
    edCIDADE: TEdit;
    Label10: TLabel;
    edCEP: TMaskEdit;
    Label13: TLabel;
    cbUF: TComboBox;
    qyReclograd: TStringField;
    qyRecnumero: TStringField;
    qyReccompl: TStringField;
    qyReccidade: TStringField;
    qyRecCEP: TStringField;
    qyRecuf: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure gdRecDblClick(Sender: TObject);
    procedure edCodExit(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRExit(Sender: TObject);
    procedure edFANTAExit(Sender: TObject);
    procedure edNRINSChange(Sender: TObject);
    procedure edNRINSExit(Sender: TObject);
    procedure qyRecnrinsGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyRecnr_contaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
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
  fcadEmpresas: TfcadEmpresas;

implementation

{$R *.dfm}

uses modDados;

function TfcadEmpresas.ExeAcao: Boolean;
var
  bLocId, bLocReg: Boolean;
  permis: String;
begin
  Result := False;
  permis:= 'cadEmpresas';
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
  edFANTA.Text := Trim(removeAcento(edFANTA.Text));
  if (not ChkCampos) then
    Exit;
  // qyRec.DisableControls;
  bLocReg := qyRec.Locate('cod', edCod.Text, []);
  bLocId := False;
  if (wModo <> modoInc) then
    bLocId := qyRec.Locate('id', edID.Text, []);

  if not(wModo = modoExc) then begin //N�O � Exclus�o
    if (wModo = modoInc) then begin //� INCLUS�O

      if (bLocReg) then begin
        MsgErro(Format(kJaCad, ['Conta']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then Exit;
    end else begin //� ALTERA��O

      if (not bLocId) then begin
        MsgErro(Format(kNaoLoc, ['Conta']));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then Exit;
    end; // if

    with qyRec do begin
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
      FieldByName('nrins').AsString := sonumero(edNRINS.Text);
      FieldByName('fanta').AsString := edfanta.Text;
      FieldValues['lograd']:= edLOGRAD.Text;
      FieldValues['numero']:= edNumero.value;
      FieldValues['compl']:= edCOMPL.Text;
      FieldValues['cidade']:= edcidade.Text;
      FieldValues['cep']:= edcep.Text;
      FieldValues['uf']:= cbuf.Text;
      FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
      FieldByName('obs').AsString := edObs.Lines.Text;
      Post;
    end;
  end else begin  //� EXCLUS�O

    if (not bLocId) then begin
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

function TfcadEmpresas.ChkCampos: Boolean;
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
  if (length(edNRINS.Text) > 0) and
    (not checaNRINS(sonumero(edNRINS.Text), cTipoCNPJ)) then begin
    msgPreen('CNPJ');
    edNRINS.SetFocus;
    Exit;
  end;

  if length(edCEP.Text) < 8 then begin
    msgPreen('CEP');
    edCEP.SetFocus;
    exit;
  end;

  if cbUF.ItemIndex <0 then begin
    msgPreen('Estado');
    cbUF.SetFocus;
    exit;
  end;


  Result := true;
end;

procedure TfcadEmpresas.edCodExit(Sender: TObject);
var
  st: string;
begin
  st := Trim(edCod.Text);
  if length(st) > 0 then
    edCod.Text := st.PadLeft(3, '0');
end;

procedure TfcadEmpresas.edNRINSChange(Sender: TObject);
begin
  edNRINS.Text := Mask('##.###.###/####-##', sonumero(edNRINS.Text));
  edNRINS.SelStart := length(edNRINS.Text);
  if length(edNRINS.Text) = 18 then
    if checaNRINS(sonumero(edNRINS.Text), cTipoCNPJ) then
      edDESCR.SetFocus
    else
      edNRINS.SelectAll;

end;

procedure TfcadEmpresas.edNRINSExit(Sender: TObject);
begin
  if not checaNRINS(sonumero(edNRINS.Text), cTipoCNPJ) then
    edNRINS.Text := '';
end;

procedure TfcadEmpresas.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfcadEmpresas.edDESCRKeyPress(Sender: TObject; var Key: Char);
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

procedure TfcadEmpresas.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcadEmpresas.edENTER_KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;
end;

procedure TfcadEmpresas.edFANTAExit(Sender: TObject);
begin
  edFANTA.Text := Trim(removeAcento(edFANTA.Text));

end;

procedure TfcadEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyRec.Close;
  qyRec.Filtered := False;
end;

procedure TfcadEmpresas.FormCreate(Sender: TObject);
begin
  qyRec.Filter := 'ativo >= 0';
  qyRec.Filtered := true;
  qyRec.Open('select * from tbempresas WHERE ativo >= 0 order by cod');
end;

procedure TfcadEmpresas.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadEmpresas.gdRecDblClick(Sender: TObject);
begin
  if qyRec.RecordCount > 0 then begin
    preCampos;
    mudaModo(modoAlt);
  end;
end;

procedure TfcadEmpresas.LimpaCampos;
begin
  edCod.value := DM.DBCON.ExecSQLScalar('SELECT coalesce(MAX(cod),0)+1 FROM tbempresas');
  edDESCR.Text := '';
  edNRINS.Text := '';
  edFANTA.Text := '';
  edlograd.Text:= '';
  ednumero.Value:= '0';
  edcompl.Text:= '';
  edcidade.Text:= '';
  edcep.Text:= '';
  cbuf.ItemIndex:= -1;

  cbAtivo.ItemIndex := 1;
  edObs.Lines.Clear;
  edID.Text := kNovoId;
  qtModoInc := 0;
end;

procedure TfcadEmpresas.preCampos;
begin
  with qyRec do
  begin
    edCod.value := FieldByName('cod').AsString;
    edDESCR.Text := FieldByName('DESCR').AsString;
    edNRINS.Text := FieldByName('nrins').AsString;
    edFANTA.Text := FieldByName('fanta').AsString;

    edLOGRAD.Text:= FieldValues['lograd'];
    edNUMERO.value:= FieldValues['numero'];
    edCOMPL.Text:= FieldValues['compl'];
    edCIDADE.Text:= FieldValues['cidade'];
    edCEP.Text:= FieldValues['CEP'];
    cbUF.ItemIndex:= cbUF.Items.IndexOf(FieldValues['UF']);

    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edObs.Lines.Text := FieldByName('obs').AsString;

    if not(wModo = modoInc) then
      edID.Text := FieldByName('id').AsString;
  end;
end;

procedure TfcadEmpresas.qyRecnrinsGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Mask('##.###.###/####-##', Sender.AsString);
end;

procedure TfcadEmpresas.qyRecnr_contaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataNrConta(Sender.AsString)
end;

procedure TfcadEmpresas.WMACAO(var Msg: TMessage);
begin
  if Msg.wParam = wpModo then begin
    //btInc
    if Msg.LParam <> modoInc then begin
      if (qyRec.RecordCount > 0) then
        preCampos
      else
        MudaModo(modoInc);
      qtModoInc := 0;
    end else begin
      edID.Text := kNovoId;
      inc(qtModoInc);
      if (qtModoInc > 1) then begin
        LimpaCampos;
        qtModoInc := 0;
      end;

    end;
    edCod.SetFocus;
  end;
  if Msg.wParam = wpConfirma then begin
    ExeAcao;
  end;

end;

end.