unit cdrPessoal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, cxMaskEdit,
  cxSpinEdit, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, zeroEdit, bancoEdit, contaEdit,
  agenciaEdit, Vcl.ExtCtrls, foneEdit;

type
  TfcdrPessoal = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lbCOD: TLabel;
    edDESCR: TEdit;
    cbAtivo: TComboBox;
    edObs: TMemo;
    cbTPINS: TComboBox;
    edNRINS: TMaskEdit;
    edFone1: TfoneEdit;
    edFone2: TfoneEdit;
    edEmail: TEdit;
    edCOD: TEdit;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    edAgencia: TagenciaEdit;
    edNrConta: TcontaEdit;
    edBanco: TbancoEdit;
    cbTPCNT: TComboBox;
    pnIDUNI: TPanel;
    lbLOC: TLabel;
    edIDUNI: TzeroEdit;
    cbIDUNI: TcxLookupComboBox;
    edPTUNI: TzeroEdit;
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure edIDUNIChange(Sender: TObject);
    procedure edPTUNIChange(Sender: TObject);
    procedure edIDUNIExit(Sender: TObject);
    procedure cbIDUNIPropertiesEditValueChanged(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure btOKClick(Sender: TObject);
    procedure cbTPINSSelect(Sender: TObject);
    procedure edAgenciaExit(Sender: TObject);
    procedure edNrContaExit(Sender: TObject);
  private
    { Private declarations }
  var
    FiTPPES: Integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; iTPPES: Integer); reintroduce;
  end;

var
  fcdrPessoal: TfcdrPessoal;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfcdrPessoal.btOKClick(Sender: TObject);
begin
  if (FiTPPES = cTipoAgente) then
  begin
    if edCOD.Text = '' then
    begin
      MsgErro('Informe uma Chave J!');
      edCOD.SetFocus;
      exit;
    end;
    if cbIDUNI.EditValue = null then
    begin
      MsgErro('Informe uma Lotação!');
      edIDUNI.SetFocus;
      exit;
    end;
  end;

  if edDESCR.Text = '' then
  begin

    MsgErro('Informe um Nome!');
    edDESCR.SetFocus;
    exit;
  end;

  ModalResult := mrOk;
end;

procedure TfcdrPessoal.cbIDUNIPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDUNI.Tag = 0 then
  begin // permite o OnChange
    edIDUNI.Tag := 1; // DESATIVA o OnChange
    edIDUNI.Value := '';
    edPTUNI.Value := '1';
    if DM.qyUNI.Locate('id', cbIDUNI.EditValue, []) then
    begin
      edIDUNI.Value := DM.qyUNI.FieldByName('cod').AsString;
      edPTUNI.Value := DM.qyUNI.FieldByName('ponto').AsString;
    end;
    edIDUNI.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TfcdrPessoal.cbTPINSSelect(Sender: TObject);
begin
  if cbTPINS.ItemIndex = 0 then
    edNRINS.EditMask := mskCPF
  else
    edNRINS.EditMask := mskCNPJ;
end;

constructor TfcdrPessoal.Create(AOwner: TComponent; iTPPES: Integer);
begin
  inherited Create(AOwner);

  FiTPPES := iTPPES;
  Self.Caption := 'Cadastro Rápido de ';
  if FiTPPES = cTipoAgente then
    Self.Caption := Self.Caption + 'Agente'
  else
    Self.Caption := Self.Caption + 'Fornecedor';
  lbCOD.Visible := (FiTPPES = cTipoAgente);
  edCOD.Visible := (FiTPPES = cTipoAgente);
  pnIDUNI.Visible := (FiTPPES = cTipoAgente);
  edPTUNI.Value := '1';
end;

procedure TfcdrPessoal.edAgenciaExit(Sender: TObject);
begin
  if edAgencia.Value <> '' then
    if not checaConta(edAgencia.Value, edBanco.Value) then
    begin
      MsgErro('Número da Agência inválido! (Atenção ao Código do Banco)');
      edAgencia.SetFocus;
    end;

end;

procedure TfcdrPessoal.edDESCRKeyPress(Sender: TObject; var Key: Char);
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

procedure TfcdrPessoal.edIDUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Text) > 0 then
    begin
      if DM.qyUNI.Locate('cod;ponto', varArrayOf([edIDUNI.Value, edPTUNI.Value]
        ), []) then
      begin
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end
      else
        cbIDUNI.Tag := 0; // Ativa o OnChange
    end
    else
    begin // campo está vazio
      cbIDUNI.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TfcdrPessoal.edIDUNIExit(Sender: TObject);
begin
  edIDUNI.Tag := 1; // DESATIVA o OnChange
  if cbIDUNI.Tag = 1 then // não foi localizado
    edIDUNI.Clear; // limpa o campo
  cbIDUNI.Tag := 0; // Ativa o OnChange
  edIDUNI.Tag := 0; // Ativa o OnChange

end;

procedure TfcdrPessoal.edNrContaExit(Sender: TObject);
begin
  if edNrConta.Value <> '' then
    if not checaConta(edNrConta.Value, edBanco.Value) then
    begin
      MsgErro('Número da Conta inválido! (Atenção ao Código do Banco)');
      edNrConta.SetFocus;
    end;

end;

procedure TfcdrPessoal.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcdrPessoal.edPTUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then
    begin
      if DM.qyUNI.Locate('cod;ponto', varArrayOf([edIDUNI.Value, edPTUNI.Value]
        ), []) then
      begin
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end
      else
        cbIDUNI.Tag := 0;
    end
    else
      cbIDUNI.Tag := 0;
  end;

end;

end.
