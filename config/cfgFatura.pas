unit cfgFatura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, valorEdit,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dateutils, fs_synmemo;

type
  TfCfgFatura = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edPIS: TvalorEdit;
    edCOFINS: TvalorEdit;
    edCSLL: TvalorEdit;
    edIRPJ: TvalorEdit;
    edADI1: TvalorEdit;
    edABAT: TvalorEdit;
    edRET: TvalorEdit;
    Label8: TLabel;
    cbANO: TComboBox;
    btConf: TBitBtn;
    btCancelar: TBitBtn;
    Bevel1: TBevel;
    Label9: TLabel;
    edADI2: TvalorEdit;
    qycfg: TFDQuery;
    ed1: TfsSyntaxMemo;
    Label10: TLabel;
    edREC: TvalorEdit;
    Button1: TButton;
    Label11: TLabel;
    Label12: TLabel;
    edISS: TvalorEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbANOSelect(Sender: TObject);
    procedure btConfClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  fCfgFatura: TfCfgFatura;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfCfgFatura.btConfClick(Sender: TObject);
begin
  if not perguntaSim('Salvar os valores para o Ano de ' + cbANO.Text + '?', 'Salvar') then exit;

  if not qycfg.Locate('ano', cbANO.Text, []) then begin
    msgerro('2312111720 Erro ao Localizar os Encargos para o Ano ' + cbANO.Text);
    Exit;
  end;
  qycfg.Edit;
  qycfg['PIS']:= edPIS.Value;
  qycfg['COFINS']:= edCOFINS.Value;
  qycfg['CSLL']:= edCSLL.Value;
  qycfg['IRPJ']:= edIRPJ.Value;
  qycfg['adic1']:= edADI1.Value;
  qycfg['adic2']:= edADI2.Value;
  qycfg['abat1']:= edABAT.Value;
  qycfg['irpj_ret']:= edRET.Value;
  qycfg['iss']:= edISS.Value;
  qycfg['calc_adic1']:= ed1.Lines.Text;
  qycfg.Post;
  ModalResult:= mrok;
end;

procedure TfCfgFatura.Button1Click(Sender: TObject);
begin
with DM do begin
 // fs1.Variables['result', 'variant', 0);
  fs1.Variables['receita']:= edREC.Value;
  fs1.Variables['adic1']:= edADI1.Value/100;
  fs1.Variables['adic2']:= edADI2.Value/100;
  fs1.Variables['abat']:= edABAT.Value;
  fs1.Lines.Text:= ed1.Lines.Text;
  if fs1.Compile then begin
    fs1.Execute;
    showmessage('Valor Adicional: ' + formatfloat(',0.00', fs1.Variables['result']));
  end else begin
    msgerro(fs1.ErrorMsg);
  end;
end;
end;

procedure TfCfgFatura.Button2Click(Sender: TObject);
var
  anoant: string;
begin
with DM.qry do begin
  anoant:= inttostr(strtoint(cbano.Text)-1);
  open('select * from cfgfatura where ano = :id1', [anoant]);
  if recordcount = 0 then begin
    MsgErro('Ano de ' + anoant + ' não localizado!');
    close;
    exit;
  end;

  edPIS.Value:= FieldValues['PIS'];
  edCOFINS.Value:= FieldValues['COFINS'];
  edCSLL.Value:= FieldValues['CSLL'];
  edIRPJ.Value:= FieldValues['IRPJ'];
  edADI1.Value:= FieldValues['adic1'];
  edADI2.Value:= FieldValues['adic2'];
  edABAT.Value:= FieldValues['abat1'];
  edRET.Value:= FieldValues['irpj_ret'];
  edISS.Value:= FieldValues['iss'];
  ed1.Lines.Text:= FieldValues['calc_adic1'];


end;
end;

procedure TfCfgFatura.cbANOSelect(Sender: TObject);
begin
  if not qycfg.Locate('ano', cbANO.Text, []) then begin
    if perguntaSim('Configuração para o Ano ' + cbANo.Text + ' não foi localizada!. Deseja cadastrar?', 'Novo Ano') then begin
      qycfg.Append;
      qycfg['ano']:= cbANO.Text;
      qycfg.Post;
    end else begin
      qycfg.Last;
      cbANO.ItemIndex:= cbANO.Items.IndexOf(qycfg['ano']);
      cbANOSelect(nil);
      exit;
    end;
  end;
  edPIS.Value:= qycfg['PIS'];
  edCOFINS.Value:= qycfg['COFINS'];
  edCSLL.Value:= qycfg['CSLL'];
  edIRPJ.Value:= qycfg['IRPJ'];
  edADI1.Value:= qycfg['adic1'];
  edADI2.Value:= qycfg['adic2'];
  edABAT.Value:= qycfg['abat1'];
  edRET.Value:= qycfg['irpj_ret'];
  edISS.Value:= qycfg['iss'];
  ed1.Lines.Text:= qycfg['calc_adic1'];
end;

procedure TfCfgFatura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qycfg.Close;
end;

procedure TfCfgFatura.FormCreate(Sender: TObject);
begin
  ed1.Lines.Clear;
  qycfg.Open('select * from cfgfatura order by ano');
  qycfg.First;
  while not qycfg.Eof do begin
    cbANO.Items.Append(qycfg['ano']);
    qycfg.Next;
  end;
  if cbANO.GetCount = 0 then cbANO.Items.Append(inttostr(yearof(date)));
  cbANO.Items.Append(inttostr(strtoint(cbANO.Items[cbANO.GetCount-1])+1));
  cbANO.ItemIndex:= cbANO.GetCount-2;
  cbANOSelect(nil);
  {
  Configura vem da tela anterior - mesmas variaveis
  with DM do begin
    fs1.Clear;
    fs1.addvariable('result', 'variant', 0);
    fs1.AddVariable('receita', 'variant', edREC.Value);
    fs1.AddVariable('adic1', 'variant', edADI1.Value/100);
    fs1.AddVariable('adic2', 'variant', edADI2.Value/100);
    fs1.AddVariable('abat', 'variant', edABAT.Value);
  end;
  }
end;

end.
