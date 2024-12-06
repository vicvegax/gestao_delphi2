unit moverInvent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls, zeroEdit, Vcl.Buttons, Data.DB,
  Vcl.Mask;

type
  TfMoverInvent = class(TForm)
    edIDUNI: TzeroEdit;
    edPTUNI: TzeroEdit;
    cbIDUNI: TcxLookupComboBox;
    edIDCAT: TzeroEdit;
    cbIDCAT: TcxLookupComboBox;
    Label1: TLabel;
    edDESCR: TEdit;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    Label2: TLabel;
    edUNI: TEdit;
    Label3: TLabel;
    edCAT: TEdit;
    Label4: TLabel;
    edOBS: TMemo;
    Label23: TLabel;
    edIDPES: TMaskEdit;
    cbIDPES: TcxLookupComboBox;
    edPES: TEdit;
    chCAT: TCheckBox;
    chUNI: TCheckBox;
    chPES: TCheckBox;
    procedure cbIDUNIPropertiesEditValueChanged(Sender: TObject);
    procedure edIDUNIChange(Sender: TObject);
    procedure edPTUNIChange(Sender: TObject);
    procedure cbIDCATPropertiesEditValueChanged(Sender: TObject);
    procedure edIDCATChange(Sender: TObject);
    procedure edIDUNIExit(Sender: TObject);
    procedure edPTUNIExit(Sender: TObject);
    procedure edIDCATExit(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure ProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure cbIDUNIKeyPress(Sender: TObject; var Key: Char);
    procedure cbIDPESPropertiesEditValueChanged(Sender: TObject);
    procedure chPESClick(Sender: TObject);
    procedure chCATClick(Sender: TObject);
    procedure chUNIClick(Sender: TObject);
  private
    { Private declarations }
    procedure mudaUni;
  public
    { Public declarations }
  end;

var
  fMoverInvent: TfMoverInvent;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfMoverInvent.btOKClick(Sender: TObject);
begin
//MsgErro('Opção ainda não está funcionando!');
//Exit;
if chUNI.Checked and (cbIDUNI.EditValue = null) then begin
  MsgErro('Informe uma Locação ou desmarque a Opção!');
  cbIDUNI.SetFocus;
  Exit;
end;

if chCAT.Checked and (cbIDCAT.EditValue = null) then begin
  MsgErro('Informe uma Categoria ou desmarque a Opção!');
  cbIDCAT.SetFocus;
  Exit;
end;

if chPES.Checked and (cbIDPES.EditValue = null) then begin
  MsgErro('Informe um Promotor ou desmarque a Opção!');
  cbIDPES.SetFocus;
  Exit;
end;

//if (cbIDUNI.EditValue <> edUNI.Tag) or (cbIDCAT.EditValue <> edCAT.Tag) then begin
if chUNI.Checked or chPES.Checked or chCAT.Checked then begin
  if not perguntaNao('Confirma MOVER o item ' + edDESCR.Text +'?', 'Mover Item') then Exit;

end else begin
  MsgErro('Informe um Locação E/OU uma Categoria E/OU um Promotor diferente!');
  cbIDUNI.SetFocus;
  Exit;
end;

ModalResult:= mrOK;
end;

procedure TfMoverInvent.cbIDCATPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDCAT.Tag = 0 then begin // permite o OnChange
    edIDCAT.Tag := 1; // DESATIVA o OnChange
    edIDCAT.Value := '';
    if cbIDCAT.Properties.ListSource.DataSet.Locate('id', cbIDCAT.EditValue, []) then begin
      edIDCAT.Value := cbIDCAT.Properties.ListSource.DataSet['cod'];
      chCAT.Checked:= true;
    end;
    edIDCAT.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TfMoverInvent.cbIDPESPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDPES.Tag = 0 then begin // permite o OnChange
    edIDPES.Tag := 1; // DESATIVA o OnChange
    edIDPES.Text := '';
    if cbIDPES.Properties.ListSource.DataSet.Locate('id', cbIDPES.EditValue, []) then begin
      edIDPES.Text := cbIDPES.Properties.ListSource.DataSet['nr_ins'];

      chPES.Checked:= true;
    end;
    edIDPES.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TfMoverInvent.cbIDUNIKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then begin
    Key := #0;
    btOK.Click;
  end;

end;

procedure TfMoverInvent.cbIDUNIPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDUNI.Tag = 0 then begin // permite o OnChange
    edIDUNI.Tag := 1; // DESATIVA o OnChange
    edIDUNI.Value := '';
    edPTUNI.Value := '1';
    if cbIDUNI.Properties.ListSource.DataSet.Locate('id', cbIDUNI.EditValue, []) then begin
      edIDUNI.Value := cbIDUNI.Properties.ListSource.DataSet['cod'];//).AsString;
      edPTUNI.Value := cbIDUNI.Properties.ListSource.DataSet['ponto'];//).AsString;
      chUNI.Checked := true;
      //FiltraTabela;
    end;
    edIDUNI.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TfMoverInvent.chCATClick(Sender: TObject);
begin
  if not chCAT.Checked then cbIDCAT.ItemIndex:= -1;

end;

procedure TfMoverInvent.chPESClick(Sender: TObject);
begin
  if not chPES.Checked then cbIDPES.ItemIndex:= -1;

end;

procedure TfMoverInvent.chUNIClick(Sender: TObject);
begin
  if not chUNI.Checked then cbIDUNI.ItemIndex:= -1;

end;

procedure TfMoverInvent.edIDCATChange(Sender: TObject);
begin
  if edIDCAT.Tag = 0 then begin // permite o OnChange
    cbIDCAT.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDCAT.Clear;
    if length(edIDCAT.Value) > 0 then begin
      if cbIDCAT.Properties.ListSource.DataSet.Locate('cod', edIDCAT.Value, [loPartialKey]) then begin
        cbIDCAT.EditValue := cbIDCAT.Properties.ListSource.DataSet['id'];
        cbIDCAT.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end else begin // campo está vazio
      cbIDCAT.Tag := 0; // Ativa o OnChange
    end;
  end;


end;

procedure TfMoverInvent.edIDCATExit(Sender: TObject);
begin
  edIDCAT.Tag := 1; // DESATIVA o OnChange
  if cbIDCAT.Tag = 2 then // se localizou
    edIDCAT.Value := cbIDCAT.Properties.ListSource.DataSet['cod']// preenche o campo
  else if cbIDCAT.Tag = 1 then // NÃO localizou
    edIDCAT.Clear; // limpa o campos
  cbIDCAT.Tag := 0; // Ativa o OnChange
  edIDCAT.Tag := 0; // Ativa o OnChange

end;

procedure TfMoverInvent.edIDUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then begin
      if cbIDUNI.Properties.ListSource.DataSet.Locate('codpt', edIDUNI.Value + edPTUNI.Value, []) then begin
        cbIDUNI.EditValue := cbIDUNI.Properties.ListSource.DataSet['id'];
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end else begin // campo está vazio
      cbIDUNI.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TfMoverInvent.edIDUNIExit(Sender: TObject);
begin
  edIDUNI.Tag := 1; // DESATIVA o OnChange
  if cbIDUNI.Tag = 1 then
  begin // não foi localizado
    edIDUNI.Clear; // limpa o campo
    edPTUNI.Value := '1'
  end;
  cbIDUNI.Tag := 0; // Ativa o OnChange
  edIDUNI.Tag := 0; // Ativa o OnChange

end;

procedure TfMoverInvent.ProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfMoverInvent.edPTUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then begin // permite o OnChange
    cbIDUNI.Tag := 1;
    // DESATIVA o OnChange, usado no OnExit e marca como Não localizado
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then begin
      if cbIDUNI.Properties.ListSource.DataSet.Locate('codpt', edIDUNI.Value+ edPTUNI.Value, []) then begin
        cbIDUNI.EditValue := cbIDUNI.Properties.ListSource.DataSet['id'];
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end else
      cbIDUNI.Tag := 0;
  end;

end;

procedure TfMoverInvent.edPTUNIExit(Sender: TObject);
begin
  edIDUNI.Tag := 1; // DESATIVA o OnChange
  if cbIDUNI.Tag = 1 then
  begin // não foi localizado
    edIDUNI.Clear; // limpa o campo
    edPTUNI.Value := '1'
  end;
  cbIDUNI.Tag := 0; // Ativa o OnChange
  edIDUNI.Tag := 0; // Ativa o OnChange

end;

procedure TfMoverInvent.mudaUni;
begin
  //edIDUNI;
end;

end.
