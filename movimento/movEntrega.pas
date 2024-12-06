unit movEntrega;

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
  TfEntrega = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edDTVEN: TcxDateEdit;
    btConf: TBitBtn;
    btCancelar: TBitBtn;
    Label5: TLabel;
    edNRDOC: TEdit;
    edVALOR: TvalorEdit;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edIDUNI: TEdit;
    edIDPES: TEdit;
    edIDEVE: TEdit;
    lbNTREG: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfClick(Sender: TObject);
    procedure edNRDOCChange(Sender: TObject);
    procedure ProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edNRDOCKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor create(AOwner: TComponent; id: integer); reintroduce;
  end;

var
  fEntrega: TfEntrega;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfEntrega.btConfClick(Sender: TObject);
var
  st: string;
begin
  st := '';
  if edDTVEN.EditValue = null then
    st := st + '- Campo "Data da Vencimento" inv�lida!' + #13#10;

  // else if edDTVEN.Date < edDTEMI.Date then st := st + '- A Data de Vencimento n�o pode ser menor que a Data de Emiss�o.' + #13#10;
  if edVALOR.Value = 0 then
    st := st + '- Campo "Valor Efetivo" inv�lido!' + #13#10;

  if st <> '' then
  begin
    ShowMessage(st);
    exit;
  end;
  edDTVEN.EditValue := DM.proxDiaUtil(edDTVEN.EditValue);
  if not perguntaSim('Confirma Vencimento deste lan�amento em ' + edDTVEN.Text +
    ' com o valor de ' + edVALOR.Text + '?', 'Entrega de Documento') then
    exit;

  DM.DBCON.StartTransaction;
  with DM.QYMOV do begin
    // DisableControls;
////////////////////////////////////////////////////////    DM.criaLog(DM.QYMOV);
    DM.criaLogMov(DM.QYMOV, cSTENTREG);
    Edit;
////////////////////////////////////////////////////////    DM.adicionaLog(DM.QYMOV, logEntregue, FieldByName('nr_doc').AsString + ',' +
////////////////////////////////////////////////////////      FieldByName('vl_bas').AsString + ',' + FieldByName('dt_ven').AsString);
    FieldValues['st_ini']:= cSTENTREG;
    FieldValues['us_alt']:= wUsuario;
    FieldValues['dt_alt']:= Now;

    FieldByName('vl_bas').AsFloat := edVALOR.Value;
    FieldByName('nr_doc').AsString := sonumero(edNRDOC.Text);
    FieldByName('dt_ven').AsDateTime := edDTVEN.Date;
    // (incMonth(edDTVEN.Date, idpar-1));
    FieldByName('us_entreg').AsInteger := wUsuario;
    FieldByName('dt_entreg').AsDateTime := Now;
    Post;
    // EnableControls;
  end;
  DM.DBCON.Commit;

  // ShowMessage(st);
  ModalResult := mrOK;
end;

constructor TfEntrega.create(AOwner: TComponent; id: integer);
begin
  inherited create(AOwner);

  with DM.QYMOV do
  begin
    OnCalcFields := nil;
    open('select * from plmovimento where id = ' + inttostr(id));
    if recordcount <> 1 then
    begin
      msgerro('0510231702 - Ocorreu algum problema. Movimento ID' + inttostr(id)
        + ' n�o encontrado!');
      exit;
      btConf.Enabled := false;
    end;

    edIDUNI.Text := DM.DBCON.ExecSQLScalar
      ('select descr from tbunidades where id = :id',
      [FieldByName('id_uni').Value]);
    edIDPES.Text := DM.DBCON.ExecSQLScalar
      ('select descr from tbpessoal where id = :id',
      [FieldByName('id_pes').Value]);
    edIDEVE.Text := DM.DBCON.ExecSQLScalar
      ('select descr from tbeventos where id = :id',
      [FieldByName('id_eve').Value]);

    if FieldByName('valor').AsFloat > 0 then
    begin
      edVALOR.Font.Color := corValorC;
      lbNTREG.Caption := cDSCRE;
      lbNTREG.Font.Color := corValorC;
    end
    else
    begin
      edVALOR.Font.Color := corValorD;
      lbNTREG.Caption := cDSDEB;
      lbNTREG.Font.Color := corValorD;
    end;

    edVALOR.Value := FieldByName('vl_bas').AsFloat;
    edNRDOC.Text := formataNrDoc(FieldByName('nr_doc').AsString);
    edDTVEN.Date := DM.proxDiaUtil(FieldByName('dt_ven').AsDateTime);
    // DM.proxDiaUtil(date);
  end;

end;

procedure TfEntrega.edNRDOCChange(Sender: TObject);
begin
  edNRDOC.Text := formataNrDoc(sonumero(edNRDOC.Text));
  edNRDOC.SelStart := length(edNRDOC.Text);

end;

procedure TfEntrega.edNRDOCKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end
  else
  begin
    if not charinset(Key, ['0' .. '9', #8, ^C, ^V]) then
      Key := #0;
  end;

end;

procedure TfEntrega.ProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfEntrega.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.QYMOV.Close;
  DM.QYMOV.OnCalcFields := DM.QYMOVCalcFields;
end;

procedure TfEntrega.FormCreate(Sender: TObject);
begin
  // inherited
end;

end.
