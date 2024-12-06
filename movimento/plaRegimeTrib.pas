unit plaRegimeTrib;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, dateutils, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxCalendar, StrUtils, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Buttons, frxClass, frxDBSet, MaskUtils, valorEdit;

type
  TfplRegimeTrib = class(TForm)
    qyfat: TFDQuery;
    qyfatid: TFDAutoIncField;
    viewFatura: TcxGridDBTableView;
    levelFatura: TcxGridLevel;
    gridMov: TcxGrid;
    qycfg: TFDQuery;
    dsfat: TDataSource;
    viewFaturaid: TcxGridDBColumn;
    viewFaturanfe: TcxGridDBColumn;
    viewFaturames: TcxGridDBColumn;
    viewFaturadtemi: TcxGridDBColumn;
    colValor: TcxGridDBColumn;
    colUANO: TcxGridDBColumn;
    colISS: TcxGridDBColumn;
    colIRPJRet: TcxGridDBColumn;
    Panel1: TPanel;
    edAcumulado: TvalorEdit;
    edExcAnterior: TvalorEdit;
    edExcAtual: TvalorEdit;
    edExcTotal: TvalorEdit;
    edAcumTotal: TvalorEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    viewFaturavlpis: TcxGridDBColumn;
    viewFaturavlcofins: TcxGridDBColumn;
    viewFaturavlcsll: TcxGridDBColumn;
    viewFaturavlirpj: TcxGridDBColumn;
    viewFaturavladic1: TcxGridDBColumn;
    fatvalor: TBCDField;
    fatvliss: TBCDField;
    fatvlirpj_ret: TBCDField;
    fatvlpis: TBCDField;
    fatvlcofins: TBCDField;
    fatvlcsll: TBCDField;
    fatvlirpj: TBCDField;
    fatvladic1: TBCDField;
    fatvladic2: TBCDField;
    fatvladic3: TBCDField;
    fatmes: TStringField;
    fatUANO: TBCDField;
    cfgid: TIntegerField;
    cfgiss: TBCDField;
    cfgirpj_ret: TBCDField;
    cfgpis: TBCDField;
    cfgcofins: TBCDField;
    cfgcsll: TBCDField;
    cfgirpj: TBCDField;
    cfgadic1: TBCDField;
    cfgadic2: TBCDField;
    cfgadic3: TBCDField;
    cfgabat1: TBCDField;
    cfgabat2: TBCDField;
    levelTrim: TcxGridLevel;
    viewTrim: TcxGridDBTableView;
    dstri: TDataSource;
    qry: TFDQuery;
    btModo: TButton;
    tbtri: TFDMemTable;
    flreceita: TCurrencyField;
    flpis: TCurrencyField;
    flcofins: TCurrencyField;
    flcsll: TCurrencyField;
    flirpj: TCurrencyField;
    fladic: TCurrencyField;
    flret: TCurrencyField;
    fliss: TCurrencyField;
    viewTrimmes: TcxGridDBColumn;
    viewTrimreceita: TcxGridDBColumn;
    viewTrimpis: TcxGridDBColumn;
    viewTrimcofins: TcxGridDBColumn;
    viewTrimcsll: TcxGridDBColumn;
    viewTrimirpj: TcxGridDBColumn;
    viewTrimadic: TcxGridDBColumn;
    viewTrimret: TcxGridDBColumn;
    viewTrimiss: TcxGridDBColumn;
    flmes: TIntegerField;
    fldsmes: TStringField;
    btAdicValor: TButton;
    fatAnoCompt: TSmallintField;
    fatMesCompt: TSmallintField;
    viewFaturaColumn1: TcxGridDBColumn;
    viewFaturaColumn2: TcxGridDBColumn;
    fltipo: TSmallintField;
    colTIPO: TcxGridDBColumn;
    pnBARRA: TPanel;
    Label7: TLabel;
    cbIDEMP: TcxLookupComboBox;
    edIDEMP: TEdit;
    dsemp: TDataSource;
    qyemp: TFDQuery;
    Label6: TLabel;
    cbANO: TComboBox;
    qycfgidemp: TSmallintField;
    qycfgano: TSmallintField;
    btCfg: TBitBtn;
    cfgcalc_adic1: TStringField;
    qycfgdtinc: TDateTimeField;
    qyfatdtinc: TDateTimeField;
    qyfatdtexc: TDateTimeField;
    qyfatdtalt: TDateTimeField;
    fatdtemi: TDateField;
    trigeral: TCurrencyField;
    triperc: TFloatField;
    viewTrimColumn1: TcxGridDBColumn;
    viewTrimColumn2: TcxGridDBColumn;
    frxdbFAT: TfrxDBDataset;
    frxdbTRI: TfrxDBDataset;
    btPDF: TButton;
    btXLS: TButton;
    qyfatcalc_compt: TStringField;
    viewTrimColumn3: TcxGridDBColumn;
    viewTrimColumn4: TcxGridDBColumn;
    tbtritot: TCurrencyField;
    tbtrirec: TCurrencyField;
    qyfatidemp: TSmallintField;
    qyfatnfe: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyfatBeforePost(DataSet: TDataSet);
    procedure btModoClick(Sender: TObject);
    procedure btAdicValorClick(Sender: TObject);
    procedure viewFaturaDblClick(Sender: TObject);
    procedure qyfatCalcFields(DataSet: TDataSet);
    procedure viewTrimCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure viewTrimreceitaGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cbIDEMPPropertiesEditValueChanged(Sender: TObject);
    procedure cbANOSelect(Sender: TObject);
    procedure edIDEMPChange(Sender: TObject);
    procedure edIDEMPExit(Sender: TObject);
    procedure btCfgClick(Sender: TObject);
    procedure btExportClick(Sender: TObject);
    procedure tbtriCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    // var
    // txiss: currency;
    // txirpj_ret: currency;
    procedure calcTotais;
    procedure LucroPresumido;
    procedure preparaFatura;
    procedure limpaTudo;
  public
    { Public declarations }
  end;

var
  fplRegimeTrib: TfplRegimeTrib;

implementation

{$R *.dfm}

uses modDados, modFuncoes, lanFatura, cfgFatura;

procedure TfplRegimeTrib.btAdicValorClick(Sender: TObject);
begin
  with TflanFatura.Create(Self) do begin
    edNFE.Text := DM.DBCON.ExecSQLScalar('select coalesce(max(0+nfe)+1,1) from plfatura where idemp = :id1', [cbIDEMP.EditValue]);
    edNFE.Tag:= strtoint(edNFE.Text);
    edUANO.Tag:= cbIDEMP.EditValue;
    //if strtoint(edNFE.Text) > 0 then edNFE.ReadOnly:= true;

    edDTEMI.Date:= date;
    edDTEMI.Tag:= strtoint(cbANO.Text);
    if showModal = mrok then begin
      qyfat.Append;
      qyfat['idemp']:= cbIDEMP.EditValue;
      qyfat['nfe'] := edNFE.Text;
      qyfat['dtemi'] := edDTEMI.EditValue;
      qyfat['valor'] := edVALOR.Value;
      qyfat['dtinc'] := now;
      qyfat['ult12']:= edUANO.value;
      qyfat.post;
      //preComboAno;
    end;
    Free;
  end;
end;

procedure TfplRegimeTrib.btCfgClick(Sender: TObject);
begin
  with TfcfgFatura.Create(Self) do begin
    if showModal = mrok then begin
      Self.qycfg.Refresh;
//      Self.qycfg.
    end;
    free;
  end;

end;

procedure TfplRegimeTrib.btModoClick(Sender: TObject);
var
  i: integer;
begin
  if btModo.Tag = 0 then begin
    btModo.Tag := 1;
    btModo.Caption := 'Faturamento';
    LucroPresumido;
  end else begin
    btModo.Tag := 0;
    btModo.Caption := 'Lucro Presumido';
    gridMov.ActiveLevel := levelFatura;
    tbtri.Close;
    qry.Close;
  end;
  btAdicValor.Enabled := btModo.Tag = 0;
  pnBARRA.Enabled:= btAdicValor.Enabled;
  //btPDF.Enabled:= pnBARRA.Enabled;
  //btXLS.Enabled:= btPDF.Enabled;
  for i := 0 to pnBARRA.ControlCount-1 do
    pnBARRA.Controls[i].Enabled:= pnBARRA.Enabled;
end;

procedure TfplRegimeTrib.btExportClick(Sender: TObject);
var
  nrins, dsemp: string;
begin
if btModo.Tag = 1 then begin
  if TComponent(Sender).Tag = 0 then
    //DM.frxRel.LoadFromFile('D:\Projetos\Delphi\GestaoCRM\source\relatorio\LucroPresumido.fr3')
    DM.LoadReport('LUCROPRESUMIDO')
  else
    //DM.frxRel.LoadFromFile('D:\Projetos\Delphi\GestaoCRM\source\relatorio\LucroPresumidoXLS.fr3');
    DM.LoadReport('LUCROPRESUMIDOXLS');
end else begin
  if TComponent(Sender).Tag = 0 then
    //DM.frxRel.LoadFromFile('D:\Projetos\Delphi\GestaoCRM\source\relatorio\LucroPresumido.fr3')
    DM.LoadReport('FATURAMENTO')
  else
    //DM.frxRel.LoadFromFile('D:\Projetos\Delphi\GestaoCRM\source\relatorio\LucroPresumidoXLS.fr3');
    DM.LoadReport('FATURAMENTOXLS');

  DM.frxRel.Variables['vlacu'] :=  edAcumulado.Value;
  DM.frxRel.Variables['vlexcant'] := edExcAnterior.Value;
  DM.frxRel.Variables['vlexcatual'] := edExcAtual.Value;
  DM.frxRel.Variables['vlexctotal'] := edExcTotal.Value;
  DM.frxRel.Variables['vlacutotal'] := edAcumTotal.Value;
end;

  nrins:= edIDEMP.Text;
  dsemp:= cbIDEMP.Text;

  DM.frxRel.Variables['CNPJ'] := QuotedStr(nrins);
  DM.frxRel.Variables['NOME'] := QuotedStr(dsemp);
  DM.frxRel.Variables['ANO'] := QuotedStr(cbano.Text);
  DM.frxRel.PrepareReport();

  if TComponent(Sender).Tag = 0 then begin
    DM.frxPDF.ShowDialogOptions := [doShowSaveDialog];
    DM.frxPDF.OpenAfterExport := true;
    if btModo.Tag = 1 then
      DM.frxPDF.FileName := 'LUCROPRES.PDF'
    else
      DM.frxPDF.FileName := 'FATURAMENTO.PDF';

    DM.frxRel.Export(DM.frxPDF);
  end else begin
    DM.frxXLS.ShowDialogOptions := [doShowSaveDialog];
    DM.frxXLS.OpenAfterExport := true;
    if btModo.Tag = 1 then
      DM.frxXLS.FileName := 'LUCROPRES.XLSX'
    else
      DM.frxXLS.FileName := 'FATURAMENTO.XLSX';
    DM.frxRel.Export(DM.frxXLS);
  end;
//  gviewDesembolso.EndUpdate;
end;

procedure TfplRegimeTrib.calcTotais;
var
  vlAcum, vlExcAnt, vlExcAtual, vlExcTotal, vlAcumTotal: currency;

  dt: string;
  st: string;
begin
  qyfat.Last;
//  dt := formatdatetime('yyyy-mm-', fatdtemi.Value) + '01';
  qyfat.Last;
  dt := formatdatetime('yyyy-mm-', fatdtemi.Value) + '01';
  vlAcum := DM.DBCON.ExecSQLScalar
    ('select coalesce(sum(valor),0) from plfatura where idemp = :id1 and year(dtemi) <= ' + cbANO.Text, [cbIDEMP.EditValue]);
  st := 'select coalesce(sum(valor),0) from plfatura where idemp = :id1 and dtemi < DATE_SUB("' +
    dt + '", INTERVAL 1 YEAR)';
  vlExcAnt := DM.DBCON.ExecSQLScalar(st, [cbIDEMP.EditValue]);
  vlExcAtual := DM.DBCON.ExecSQLScalar('select coalesce(sum(valor),0) from plfatura where idemp = :id0 and month(dtemi) = :id1 and year(dtemi) = :id2', [cbIDEMP.EditValue, monthof(fatDTEMI.Value), yearof(fatdtemi.Value)]);
  vlExcTotal := vlExcAnt + vlExcAtual;
  vlAcumTotal := vlAcum - vlExcTotal;

  edAcumulado.Value := vlAcum;
  edExcAnterior.Value := vlExcAnt;
  edExcAtual.Value := vlExcAtual;
  edExcTotal.Value := vlExcTotal;
  edAcumTotal.Value := vlAcumTotal;
end;

procedure TfplRegimeTrib.cbANOSelect(Sender: TObject);
begin
  //if cbANO.ItemIndex < cbANO.Items.Count-1 then begin
    if not qycfg.Locate('ano', cbANO.Text, []) then begin
      //MsgErro('ERRO2312061443 Erro ao Localizar Configurações para o Ano ' + cbANO.Text);
      //Exit;
      qycfg.Append;
      qycfg['ano']:= cbANO.Text;
      qycfg.Post;
      //showMessage(qycfg['ano']);
    end;
    colISS.Caption := 'ISS: ' + formatfloat(',0.00', cfgiss.Value);
    colIRPJRet.Caption := 'IRPJ Retido: ' + formatfloat(',0.00', cfgirpj_ret.Value);
    qyfat.Open('select * from plfatura where idemp = :id1 and year(dtemi) = :dt', [cbIDEMP.EditValue, cbANO.Text]);
    calcTotais;
    btAdicValor.Enabled:= True;
    btModo.Enabled:= True;
  //end else begin
  //  ShowMessage('Novo Ano está sendo implementado!');
  //end;
end;

procedure TfplRegimeTrib.cbIDEMPPropertiesEditValueChanged(Sender: TObject);
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

  preparaFatura;
end;

procedure TfplRegimeTrib.edIDEMPChange(Sender: TObject);
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
      preparaFatura;
    end else begin
      limpaTudo;
    end;

    //ProxFocus;
  end else begin
    cbIDEMP.tag:= 0;
  end;

end;

procedure TfplRegimeTrib.edIDEMPExit(Sender: TObject);
begin
  edIDEMP.Tag:= 1;
  if cbIDEMP.Tag = 2 then begin
    edIDEMP.Text:= formataCNPJ(qyemp['nrins']);
    cbIDEMP.Tag:= 0;
  end else if cbIDEMP.Tag = 1 then begin
    edIDEMP.Clear;
    cbIDEMP.Tag:= 0;
    cbANO.Clear;
    limpaTudo;
  end;
  edIDEMP.Tag:= 0;

end;

procedure TfplRegimeTrib.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyfat.Close;
  qycfg.Close;
  // dbcon.Close;
end;

procedure TfplRegimeTrib.FormCreate(Sender: TObject);
begin
  colTIPO.Visible:= (wUsuario < 100);
  gridMov.Align := alClient;
  qycfg.Open('select * from cfgfatura order by ano');
  qyemp.Open('select id, cod, nrins, descr from tbempresas where ativo = 1 order by cod');
  if qyemp.RecordCount > 0 then cbIDEMP.ItemIndex:= 0;

  //define as variaveis padroes
  with DM do begin
    fs1.Clear;
    fs1.addvariable('result', 'variant', 0);
    fs1.AddVariable('receita', 'variant', 0);
    fs1.AddVariable('adic1', 'variant', 0);
    fs1.AddVariable('adic2', 'variant', 0);
    fs1.AddVariable('abat', 'variant', 0);
  end;
  //btPDF.Enabled:= false;
  //btXLS.Enabled:= btPDF.Enabled;
end;

procedure TfplRegimeTrib.limpaTudo;
begin
  qyfat.Close;
  edAcumulado.Text := '';
  edExcAnterior.Text := '';
  edExcAtual.Text := '';
  edExcTotal.Text := '';
  edAcumTotal.Text := '';
  btAdicValor.Enabled:= False;
  btModo.Enabled:= False;

end;

procedure TfplRegimeTrib.LucroPresumido;
var
  st: string;
  i: integer;
  trimestre: integer;
  totTrim: array[1..4] of record
    receita,
    pis,
    cofins,
    csll,
    irpj,
    adic,
    ret,
    iss: double;
  end;
begin
  st := 'SELECT month(dtemi) as mes, sum(valor) as receita, sum(vlpis) as pis, sum(vlcofins) as cofins, '
    + 'sum(vlcsll) as csll, sum(vlirpj) as irpj, sum(vladic1) as adic, sum(vlirpj_ret) as ret, '
    + 'sum(vliss) as iss from plfatura WHERE year(dtemi) = ' + cbANO.Text +  ' and ' +
    'idemp = ' + vartostr(cbIDEMP.EditValue) + ' ' +
    'GROUP by month(dtemi)';
  qry.Open(st);

  tbtri.Close;
  tbtri.Open;
  trimestre := 0;
  for i := 1 to 12 do begin
    if (i mod 3) = 1 then begin
      inc(trimestre);
      tbtri.Append;
      fldsmes.Value := inttostr(trimestre) + 'º TRIMESTRE';
      {
      flreceita.Value := null;
      flpis.Value := null;
      flcofins.Value := null;
      flcsll.Value := null;
      flirpj.Value := null;
      fladic.Value := null;
      flret.Value := null;
      fliss.Value := null;
      }
      fltipo.Value:= 0;
      tbtri.post;
    end;
    tbtri.Append;
    flmes.Value := i;
    fldsmes.Value := cMESES[i].ToUpper;

    if qry.Locate('mes', i, []) then begin

      flreceita.Value := qry['receita'];
      flpis.Value := qry['pis'];
      flcofins.Value := qry['cofins'];
      flcsll.Value := qry['csll'];
      flirpj.Value := qry['irpj'];
      fladic.Value := qry['adic'];
//      fltot
      flret.Value := qry['ret'];
      fliss.Value := qry['iss'];
      fltipo.Value:= 1;

      totTrim[trimestre].receita:= totTrim[trimestre].receita + flreceita.Value;
      totTrim[trimestre].pis:= totTrim[trimestre].pis + flpis.Value;
      totTrim[trimestre].cofins:= totTrim[trimestre].cofins + flcofins.Value;
      totTrim[trimestre].csll:= totTrim[trimestre].csll + flcsll.Value;
      totTrim[trimestre].irpj:= totTrim[trimestre].irpj + flirpj.Value;
      totTrim[trimestre].adic:= totTrim[trimestre].adic + fladic.Value;
      totTrim[trimestre].ret:= totTrim[trimestre].ret + flret.Value;
      totTrim[trimestre].iss:= totTrim[trimestre].iss + fliss.Value;
    end;
    tbtri.post;
    if (i mod 3) = 0 then
    begin
      tbtri.Append;
      fldsmes.Value := 'TOTAL TRIMESTRAL';
      flreceita.Value := totTrim[trimestre].receita;
      flpis.Value := totTrim[trimestre].pis;
      flcofins.Value := totTrim[trimestre].cofins;
      flcsll.Value := totTrim[trimestre].csll;
      flirpj.Value := totTrim[trimestre].irpj;
      fladic.Value := totTrim[trimestre].adic;
      flret.Value := totTrim[trimestre].ret;
      fliss.Value := totTrim[trimestre].iss;
      trigeral.Value:= flpis.Value+flcofins.Value+flcsll.Value+flirpj.Value+fladic.Value+fliss.Value;
      triperc.Value:= trigeral.Value / flreceita.Value * 100;
      fltipo.Value:= 2;
      tbtri.post;
    end;
  end;
  tbtri.Append;
  fldsmes.Value := 'TOTAL ANUAL';
  for i := 1 to 4 do begin
    flreceita.Value := flreceita.Value + totTrim[i].receita;
    flpis.Value := flpis.Value + totTrim[i].pis;
    flcofins.Value := flcofins.Value + totTrim[i].cofins;
    flcsll.Value := flcsll.Value + totTrim[i].csll;
    flirpj.Value := flirpj.Value + totTrim[i].irpj;
    fladic.Value := fladic.Value + totTrim[i].adic;
    flret.Value := flret.Value + totTrim[i].ret;
    fliss.Value := fliss.Value + totTrim[i].iss;
  end;
  trigeral.Value:= flpis.Value+flcofins.Value+flcsll.Value+flirpj.Value+fladic.Value+fliss.Value;
  triperc.Value:= trigeral.Value / flreceita.Value * 100;
  fltipo.Value:= 3;
  tbtri.post;
  qry.Close;
  // while not qry.Eof do begin

  // end;
  gridMov.ActiveLevel := levelTrim;
end;

procedure TfplRegimeTrib.preparaFatura;
begin
  // dbcon.Open();
  limpaTudo;
  DM.qry.Open('SELECT distinct year(dtemi) as ano fROM plfatura WHERE idemp = :id', [cbIDEMP.EditValue]);
  cbANO.Clear;
  while not DM.qry.eof do begin
    cbANO.Items.Append(DM.qry['ano']);
    DM.qry.Next;
  end;
  DM.qry.Close;
  if cbANO.GetCount = 0 then cbANO.Items.Append(inttostr(yearof(date)));
  cbANO.Items.Append(inttostr(strtoint(cbANO.Items[cbANO.GetCount-1])+1));

  //cbANO.Items.Append('ADICIONAR');
  //if cbANO.Items.Count > 1 then begin
    cbANO.ItemIndex:= cbANO.GetCount-2;
    cbANOSelect(nil);
  //end;

end;

procedure TfplRegimeTrib.qyfatBeforePost(DataSet: TDataSet);
var
//  dt: string;
//  st: string;
  vl: currency;
begin
  fatvliss.Value := fatvalor.Value * cfgiss.Value / 100;
  fatvlirpj_ret.Value := fatvalor.Value * cfgirpj_ret.Value / 100;
  fatmes.Value := formatdatetime('mmyyyy', fatdtemi.Value);

  fatvlpis.Value := fatvalor.Value * cfgpis.Value / 100;
  fatvlcofins.Value := fatvalor.Value * cfgcofins.Value / 100;
  fatvlcsll.Value := fatvalor.Value * cfgcsll.Value / 100;
  fatvlirpj.Value := fatvalor.Value * cfgirpj.Value / 100;
  //vl := fatvalor.Value * cfgadic2.Value / 100;
  //if vl > cfgabat1.Value then
  //  vl := vl - cfgabat1.Value;
  //fatvladic1.Value := vl * cfgadic1.Value / 100;
  vl:= -1;
//  DM.fs1.Clear;
  DM.fs1.Variables['result']:= 0;
  DM.fs1.Variables['receita']:= fatvalor.Value;
  DM.fs1.Variables['adic1']:= cfgadic1.Value/100;
  DM.fs1.Variables['adic2']:= cfgadic2.Value/100;
  DM.fs1.Variables['abat']:= cfgabat1.Value;
  DM.fs1.Lines.Text:= cfgcalc_adic1.Value;
  if DM.fs1.Compile then begin
    DM.fs1.Execute;
    vl:= DM.fs1.Variables['result'];
  end else begin
    MsgErro(dm.fs1.ErrorMsg);
  end;
  fatvladic1.Value := vl;// * cfgadic1.Value / 100;

  {
  dt := formatdatetime('yyyy-mm-', fatdtemi.Value) + '01';
  st := 'select sum(valor) from plfatura ' + 'where (dtemi < date("' + dt +
    '")) and ' + '(dtemi >= date_sub("' + dt + '", interval 1 year))';
  fatUANO.Value := DM.DBCON.ExecSQLScalar(st);
  }
end;

procedure TfplRegimeTrib.qyfatCalcFields(DataSet: TDataSet);
begin
  if not fatmes.IsNull then begin
    fatAnoCompt.Value:= strtoint(rightstr(fatmes.Value, 4));
    fatMesCompt.Value:= strtoint(leftstr(fatmes.Value, 2));
  end;
  DataSet['calc_compt']:= FormatMaskText('99/9999;0;_', vartostr(DataSet['compt']));
end;

procedure TfplRegimeTrib.tbtriCalcFields(DataSet: TDataSet);
begin
Dataset['tot']:= dataset['irpj']+dataset['adic'];
dataset['rec']:= dataset['tot']-dataset['ret'];
end;

procedure TfplRegimeTrib.viewFaturaDblClick(Sender: TObject);
var
  APoint: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin

  GetCursorPos(APoint);
  with gridMov.FocusedView.Site do begin
    APoint := ScreenToClient(APoint);
    AHitTest := ViewInfo.GetHitTest(APoint);

    if AHitTest is TcxGridRecordHitTest then begin
      with TflanFatura.Create(Self) do begin
        edNFE.Tag:= 1;
        edNFE.Enabled:= False;
        edNFE.Text := qyfat['nfe'];
        edDTEMI.EditValue := qyfat['dtemi'];
        edVALOR.Value := qyfat['valor'];
        edUANO.Value:= qyfat['ult12'];
        if showModal = mrok then begin
          qyfat.Edit;
          qyfat['nfe'] := edNFE.Text;
          qyfat['dtemi'] := edDTEMI.EditValue;
          qyfat['valor'] := edVALOR.Value;
          qyfat['dtalt'] := now;
          qyfat.post;
        end;
        Free;
      end;
    end;
  end;

end;

procedure TfplRegimeTrib.viewTrimCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin

  if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, colTIPO.Index) = 0 then begin
    ACanvas.Font.Style:= [fsBold];
//    ADone:= True;
  end else begin
    if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, colTIPO.Index) = 2 then
      ACanvas.Font.Style:= [fsBold];
    if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, colTIPO.Index) = 3 then
      ACanvas.Font.Style:= [fsBold];
  end;

end;

procedure TfplRegimeTrib.viewTrimreceitaGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if ARecord.Values[colTIPO.Index] = 0 then
    AText:= '';
end;

end.
