unit cadUsuarioNivelPermis;

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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.CheckLst, strutils;

type
  TfCadUsuarioNivelPermis = class(TForm)
    cbNivel: TcxLookupComboBox;
    Label5: TLabel;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    lsPERM: TCheckListBox;
    cbGRUPO: TcxLookupComboBox;
    Label1: TLabel;
    qygrp: TFDQuery;
    dsgrp: TDataSource;
    qyrelacao: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbNivelPropertiesEditValueChanged(Sender: TObject);
    procedure lsPERMClickCheck(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure cbGRUPOPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    procedure preCampos;
    procedure WMACAO(var Msg: TMessage); message WM_ACAO;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  fCadUsuarioNivelPermis: TfCadUsuarioNivelPermis;

implementation

{$R *.dfm}

uses modDados;

procedure TfCadUsuarioNivelPermis.btSalvarClick(Sender: TObject);
var
  i: integer;
  st: string;
begin
  st := '';
  for i := 0 to lsPERM.Count - 1 do
  begin
    if lsPERM.Checked[i] then
    begin
      if DM.tbUsuPerm.Locate('descr', lsPERM.Items[i], []) then
        st := st + '.' + DM.tbUsuPerm.FieldByName('id').AsString;
    end;
  end;
  if st <> '' then
  begin
    st := st + '.';
    if perguntaSim('Salvar Permissões para o Nível ' + cbNivel.Text + '?',
      'Salvar') then
    begin
      DM.tbUsuNivel.Edit;
      DM.tbUsuNivel.FieldByName('permis').AsString := st;
      DM.tbUsuNivel.Post;
    end;
    btSalvar.Enabled := false;

  end;
end;

procedure TfCadUsuarioNivelPermis.cbGRUPOPropertiesEditValueChanged
  (Sender: TObject);
begin
  preCampos;

end;

procedure TfCadUsuarioNivelPermis.cbNivelPropertiesEditValueChanged
  (Sender: TObject);
begin
  // btSalvar.Enabled:= false;
  // if DM.tbUsuNivel.Locate('id',cbNivel.EditValue, []) then begin
  preCampos;
  // lsPERM.Enabled:= cbNivel.EditValue <> 1;
  // end else
  // lsPERM.Clear;
end;

procedure TfCadUsuarioNivelPermis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.tbUsuNivel.Close;
  DM.tbUsuPerm.Close;

  DM.tbUsuPerm.Filtered := false;
  DM.tbUsuPerm.Filter := '';
  qygrp.Close;
end;

procedure TfCadUsuarioNivelPermis.FormCreate(Sender: TObject);
begin
  qygrp.Open('select * from tbusuariogrupopermissao order by id');
  DM.tbUsuNivel.Open('select * from tbusuarionivel where (id > 0) order by id' );
  //DM.tbUsuPerm.Filtered := True;
  //DM.tbUsuPerm.Open();
  cbNivel.Tag := 1;
  if DM.tbUsuNivel.RecordCount > 0 then
    cbNivel.ItemIndex := 0;
  cbNivel.Tag := 0;
  if qygrp.RecordCount > 0 then
    cbGRUPO.ItemIndex := 0;

  // qyrec.Open('select *, lpad(id,3,"0") as cod from tbusuarionivel ORDER BY cod');
end;

procedure TfCadUsuarioNivelPermis.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfCadUsuarioNivelPermis.LimpaCampos;
begin
end;

procedure TfCadUsuarioNivelPermis.lsPERMClickCheck(Sender: TObject);
begin
  // btSalvar.Enabled:= true;
  // showmessage(lsperm.Items[lsperm.ItemIndex]);
  if not DM.tbUsuPerm.Locate('descr', lsPERM.Items[lsPERM.ItemIndex], []) then
  begin
    MsgErro('ERR2314111001 - Erro com a Permissão: ' + lsPERM.Items
      [lsPERM.ItemIndex]);
    exit;
  end;

  if lsPERM.Checked[lsPERM.ItemIndex] then begin
    DM.DBCON.ExecSQL
      ('insert into usuarionivelpermissao SET nivel = :d1, permissao = :d2',
      [cbNivel.EditValue, DM.tbUsuPerm['id']]);
  end else begin
    DM.DBCON.ExecSQL
      ('DELETE from usuarionivelpermissao where nivel = :d1 and permissao = :d2',
      [cbNivel.EditValue, DM.tbUsuPerm['id']]);
  end;

end;

procedure TfCadUsuarioNivelPermis.preCampos;
var
  checa: boolean;
begin

  if cbNivel.Tag <> 0 then
    exit;

  //DM.tbUsuPerm.Filter := 'id_grupo = ' + vartostr(cbGRUPO.EditValue);
  DM.tbUsuPerm.Open('select * from usuariopermissao where (idgrp = ' + vartostr(cbGRUPO.EditValue) +') order by ord, cod');
  if cbNivel.EditValue <> 1 then
    qyrelacao.Open('select nivel, permissao from usuarionivelpermissao ' +
      'where nivel = ' + vartostr(cbNivel.EditValue) + ' order by permissao');

  lsPERM.Clear;
  DM.tbUsuPerm.First;
  while not DM.tbUsuPerm.eof do begin
    lsPERM.Items.Append(DM.tbUsuPerm.FieldByName('descr').AsString);
    checa := cbNivel.EditValue = 1;
    if not checa then
      if qyrelacao.Locate('permissao', DM.tbUsuPerm['id'], []) then
        checa := True;
    lsPERM.Checked[lsPERM.Count - 1] := checa;
    DM.tbUsuPerm.Next;
  end;
  lsPERM.Enabled := cbNivel.EditValue <> 1;
  qyrelacao.Close;

  {
    st:= DM.tbUsuNivel.FieldByName('permis').AsString;
    tudo:= (st = TudoPermitido);
    with DM.tbUsuPerm do begin
    First;
    lsPERM.Clear;
    while not Eof do begin
    lsPERM.Items.Append(FieldByName('descr').AsString);
    lsPERM.Checked[lsPERM.Count-1]:= tudo or ContainsText(st, '.'+FieldByName('id').AsString+'.');
    Next;
    end;
    end;
  }
end;

procedure TfCadUsuarioNivelPermis.WMACAO(var Msg: TMessage);
begin

end;

end.
