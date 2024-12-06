unit bxaMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, valEdit, Vcl.StdCtrls, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Buttons, Vcl.ExtCtrls, valorEdit;

type
  TfBaixa = class(TForm)
    DSCNT: TDataSource;
    Label12: TLabel;
    cbIDCNT: TcxLookupComboBox;
    Label3: TLabel;
    edDTVEN: TcxDateEdit;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edDTBXA: TcxDateEdit;
    btConf: TBitBtn;
    btCancelar: TBitBtn;
    Label5: TLabel;
    edNRDOC: TEdit;
    edVLBAS: TvalorEdit;
    edVLEFE: TvalorEdit;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edIDUNI: TEdit;
    edIDPES: TEdit;
    edIDEVE: TEdit;
    lbNTREG: TLabel;
    chZero: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNRDOCChange(Sender: TObject);
    procedure ProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edNRDOCKeyPress(Sender: TObject; var Key: Char);
    procedure edDTBXAExit(Sender: TObject);
    procedure chZeroClick(Sender: TObject);
  private
    { Private declarations }
  var
    QYMOV: TFDQuery;
  public
    { Public declarations }
    constructor create(AOwner: TComponent; qry: TFDQuery; idcnt: integer);
      reintroduce;
  end;

var
  fBaixa: TfBaixa;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfBaixa.btConfClick(Sender: TObject);
var
  st: string;
  dt: TDate;
begin
  st := '';
  if edDTBXA.EditValue = null then
    st := st + '- Campo "Data da Efetivação" inválido!' + #13#10
  else if edDTBXA.EditValue < edDTVEN.Date then
    st := st +
      '- Campo "Data da Efetivação" não pode ser menor que a Data de Vencimento!'
      + #13#10;
  if edNRDOC.Text = '' then st:= st + '- Campo "Número do Documento" inválido!'#13#10;

  // else if edDTVEN.Date < edDTEMI.Date then st := st + '- A Data de Vencimento não pode ser menor que a Data de Emissão.' + #13#10;
  if edVLEFE.Value = 0 then
    if not chZero.Checked then
      st := st + '- Campo "Valor Efetivo" inválido!' + #13#10;
  if cbIDCNT.EditValue = null then
    st := st + '- Campo "Conta" inválido!' + #13#10;

  if st <> '' then
  begin
    ShowMessage(st);
    exit;
  end;
  if not perguntaSim('Confirma Efetivação deste lançamento em ' + edDTBXA.Text +
    '?', 'Efetivação') then
    exit;

  dt := DM.proxDiaUtil(edDTBXA.EditValue); // Baixa efetuada em dia útil
  DM.DBCON.StartTransaction;
  with QYMOV do begin
    // DisableControls;
    if FieldValues['tp_mov'] = cTipoParcela then begin
      if DM.DBCON.ExecSQLScalar('select count(id) from plmovimento plm where ' +
        'plm.id_ctr = :id and ' +
        'st_fim = "' + cSTNOR + '" and ' +
        'st_mov <> "' + cMovLiquidado + '";', [FieldValues['id_ctr']]) = 1 then begin
        DM.DBCON.ExecSQL('update plcontratos set st_fim = "' + cSTFIN + '" where id = :id', [FieldValues['id_ctr']]);
      end;

    end;

////////////////////////////////////////////////////////    DM.criaLog(QYMOV);
    DM.criaLogMov(dm.QYMOV, cSTLIQ);
    Edit;
    FieldValues['st_ini']:= cSTLIQ;
    FieldValues['us_alt']:= wUsuario;
    FieldValues['dt_alt']:= now;

    FieldByName('st_mov').AsString := cMovLiquidado; // kSTNOR;
    FieldByName('vl_efe').AsFloat := edVLEFE.Value;
    FieldByName('nr_doc').AsString := sonumero(edNRDOC.Text);
    FieldByName('dt_bxa').AsDateTime := dt;
    // (incMonth(edDTVEN.Date, idpar-1));
    FieldByName('id_cnt').AsInteger := cbIDCNT.EditValue;
    FieldByName('us_efe').AsInteger := wUsuario;
    FieldByName('dt_efe').AsDateTime := Now;
////////////////////////////////////////////////////////    DM.adicionaLog(QYMOV, logEfetivado, DM.preparaLog(QYMOV));
    Post;
    // EnableControls;
  end;
  DM.DBCON.Commit;

  if dt <> edDTBXA.Date then
    st := 'Efetivação será Efetuada na data de ' + formataData(dt) + '!'
  else
    st := 'Efetivação efetuada em ' + formataData(dt) + '!';

  // ShowMessage(st);
  ModalResult := mrOK;
end;

procedure TfBaixa.chZeroClick(Sender: TObject);
begin
  edVLEFE.Value := 0;
  edVLEFE.Enabled := not chZero.Checked;

end;

constructor TfBaixa.create(AOwner: TComponent; qry: TFDQuery; idcnt: integer);
begin
  inherited create(AOwner);
  QYMOV := qry;
  cbIDCNT.EditValue := idcnt;
end;

procedure TfBaixa.edDTBXAExit(Sender: TObject);
begin
  if edDTBXA.EditValue <> null then
    edDTBXA.EditValue := DM.proxDiaUtil(edDTBXA.EditValue);
end;

procedure TfBaixa.edNRDOCChange(Sender: TObject);
begin
  edNRDOC.Text := formataNrDoc(sonumeroAlpha(edNRDOC.Text));
  edNRDOC.SelStart := length(edNRDOC.Text);

end;

procedure TfBaixa.edNRDOCKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end
  else
  begin
    if not charinset(Key, ['0' .. '9','a'..'z', 'A'..'Z', #8, ^C, ^V]) then
      Key := #0;
  end;

end;

procedure TfBaixa.ProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfBaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QYMOV := nil;
  with DM do
  begin
    // qycnt.Close;
  end;
end;

procedure TfBaixa.FormCreate(Sender: TObject);
begin
  // inherited
end;

procedure TfBaixa.FormShow(Sender: TObject);
begin
  with QYMOV do
  begin

    edIDUNI.Text := FieldByName('calc_ds_uni').AsString;
    edIDPES.Text := FieldByName('calc_ds_pes').AsString;
    edIDEVE.Text := FieldByName('calc_ds_eve').AsString;

    if FieldByName('valor').AsFloat > 0 then
    begin
      edVLEFE.Font.Color := corValorC;
      lbNTREG.Caption := cDSCRE;
      lbNTREG.Font.Color := corValorC;
    end
    else
    begin
      edVLEFE.Font.Color := corValorD;
      lbNTREG.Caption := cDSDEB;
      lbNTREG.Font.Color := corValorD;
    end;

    edVLBAS.Value := FieldByName('vl_bas').AsFloat;
    if edVLBAS.Value = 0 then
      chZero.Checked := true;

    edVLEFE.Value := edVLBAS.Value;
    edNRDOC.Text := formataNrDoc(FieldByName('nr_doc').AsString);
    edDTVEN.Date := FieldByName('dt_ven').AsDateTime;
    edDTBXA.Date := DM.proxDiaUtil(edDTVEN.Date); // DM.proxDiaUtil(date);
    cbIDCNT.EditValue := FieldByName('id_cnt').AsInteger;
  end;

end;

end.
