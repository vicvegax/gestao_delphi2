unit sinalConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, numeroDocEdit,
  Vcl.ExtCtrls, Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, valEdit,
  valorEdit, Vcl.Mask, StrUtils;

type
  TfsinalConta = class(TForm)
    Label1: TLabel;
    cbSINAL: TComboBox;
    Label2: TLabel;
    edNRDOC: TnumeroDocEdit;
    Panel1: TPanel;
    Label3: TLabel;
    edIDUNI: TEdit;
    Label4: TLabel;
    edIDPES: TEdit;
    Label5: TLabel;
    edIDEVE: TEdit;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    edVLBAS: TvalorEdit;
    Label6: TLabel;
    Label7: TLabel;
    edDTVEN: TcxDateEdit;
    lbNTREG: TLabel;
    Label8: TLabel;
    edVLAGE: TvalorEdit;
    Label9: TLabel;
    edDTAGE: TcxDateEdit;
    Label13: TLabel;
    cbCOMPT: TComboBox;
    edCOMPT: TMaskEdit;
    chZero: TCheckBox;
    procedure cbSINALChange(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure edDTVENExit(Sender: TObject);
    procedure cbCOMPTSelect(Sender: TObject);
    procedure edCOMPTExit(Sender: TObject);
    procedure edDTVENPropertiesEditValueChanged(Sender: TObject);
    procedure chZeroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fsinalConta: TfsinalConta;

implementation

{$R *.dfm}

uses modFuncoes, modDados;

procedure TfsinalConta.btOKClick(Sender: TObject);
var
  data: TDate;
begin
  if cbSINAL.ItemIndex = 1 then
  begin
    if edNRDOC.Value = '' then
    begin
      MsgErro('Informe um Número de Documento!');
      edNRDOC.SetFocus;
      exit;
    end;
  end;

  if leftstr(edCOMPT.Text, 1) = ' ' then
  begin
    MsgErro('Campo "Competência" inválido!');
    edCOMPT.SetFocus;
    exit;
  end;

  if not chZero.Checked then
  begin
    if edVLBAS.Value = 0 then
    begin
      MsgErro('Informe um Valor!');
      edVLBAS.SetFocus;
      exit;
    end;
  end;

  data := DM.proxDiaUtil(edDTVEN.Date);
  if edDTVEN.Date <> data then
  begin
    edDTVEN.Date := data;
    ShowMessage('Data será atualizada para o Dia Útil de ' +
      edDTVEN.Text + '!');
  end;

  ModalResult := mrOK;
end;

procedure TfsinalConta.cbCOMPTSelect(Sender: TObject);
begin
  edCOMPT.EditMask := '99/9999;1;_';
  edCOMPT.Text := '';
  if cbCOMPT.ItemIndex < 3 then
  begin
    if edDTVEN.EditValue <> null then
      edCOMPT.Text := FormatDateTime('mm/yyyy',
        incMonth(edDTVEN.Date, cbCOMPT.ItemIndex - 1));
    edCOMPT.Enabled := False;
  end
  else
  begin
    edCOMPT.Enabled := True;
    if cbCOMPT.ItemIndex = 4 then
      edCOMPT.EditMask := '9999;1;_'
    else if cbCOMPT.ItemIndex = 5 then
      edCOMPT.EditMask := '9TRIM9999;1;_'
    else if cbCOMPT.ItemIndex = 6 then
      edCOMPT.EditMask := '9SEM9999;1;_';
    if edCOMPT.Tag = 0 then
      edCOMPT.Tag := 1
    else
      edCOMPT.SetFocus;
  end;

end;

procedure TfsinalConta.cbSINALChange(Sender: TObject);
begin
  btOK.Enabled := (cbSINAL.ItemIndex <> cbSINAL.Tag);
end;

procedure TfsinalConta.chZeroClick(Sender: TObject);
begin
  edVLBAS.Value := 0;
  edVLBAS.Enabled := not chZero.Checked;

end;

procedure TfsinalConta.edCOMPTExit(Sender: TObject);
var
  dt: TDateTime;
  st: string;
  num: string;
begin
  st := edCOMPT.Text;
  num:= sonumero(st);
  if cbCOMPT.ItemIndex = 3 then begin // MES/ANO - Até o 13
    if leftstr(num, 2) = '13' then begin
      if num.Length = 2 then begin
        edCOMPT.Text:= '13/' + FormatDateTime('yyyy', date);
      end else begin
        if not TryStrToDate('01/01/' + rightstr(num, num.Length-2), dt) then
          edCOMPT.Text := ''
        else
          edCOMPT.Text := '13/' + FormatDateTime('yyyy', dt);
      end;
    end else begin
      if not TryStrToDate('01/' + edCOMPT.Text, dt) then
        edCOMPT.Text := ''
      else
        edCOMPT.Text := FormatDateTime('mm/yyyy', dt);
    end;
  end else if cbCOMPT.ItemIndex = 4 then begin // ANO
    if not TryStrToDate('01/01/' + soNumero(edCOMPT.Text), dt) then
      edCOMPT.Text := ''
    else
      edCOMPT.Text := FormatDateTime('yyyy', dt);
  end
  else if cbCOMPT.ItemIndex = 5 then begin // TRIMESTRE
    if (st[1] = ' ') or (strtoint(st[1]) = 0) or (strtoint(st[1]) > 4) then
      edCOMPT.Text := ''
    else begin
      if not TryStrToDate('01/01/' + soNumero(rightstr(edCOMPT.Text, 4)), dt) then
        edCOMPT.Text := ''
      else
        edCOMPT.Text := leftstr(edCOMPT.Text, 5) + FormatDateTime('yyyy', dt);
    end;

  end;
end;

procedure TfsinalConta.edDTVENExit(Sender: TObject);
begin
  if edDTVEN.EditValue = null then
    edDTVEN.Date := edDTAGE.Date;

  edDTVEN.Date := DM.proxDiaUtil(edDTVEN.Date);
end;

procedure TfsinalConta.edDTVENPropertiesEditValueChanged(Sender: TObject);
begin
  if cbCOMPT.ItemIndex < 3 then
    if edDTVEN.EditValue <> null then
      edCOMPT.Text := FormatDateTime('mm/yyyy',
        incMonth(edDTVEN.Date, cbCOMPT.ItemIndex - 1))
    else
      edCOMPT.Text := '';

end;

end.
