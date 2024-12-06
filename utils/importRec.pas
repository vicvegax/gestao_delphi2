unit importRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dateutils,
  cxCurrencyEdit, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  zeroEdit, Vcl.Mask, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, Vcl.Buttons, cxButtonEdit, StrUtils;

type
  TfImportRec = class(TForm)
    odCSV: TOpenDialog;
    gvCSV: TcxGridDBTableView;
    glCSV: TcxGridLevel;
    grImp: TcxGrid;
    tbcsv: TFDMemTable;
    tbcsvcnpj: TStringField;
    tbcsvchavej: TStringField;
    tbcsvvalorc: TCurrencyField;
    tbcsvvalord: TCurrencyField;
    dscsv: TDataSource;
    tbcsvid: TIntegerField;
    gvCSVRecId: TcxGridDBColumn;
    gvCSVid: TcxGridDBColumn;
    gvCSVcnpj: TcxGridDBColumn;
    gvCSVchavej: TcxGridDBColumn;
    gvCSVagente: TcxGridDBColumn;
    gvCSVvalorc: TcxGridDBColumn;
    gvCSVvalord: TcxGridDBColumn;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    qypes: TFDQuery;
    tbcsvnome: TStringField;
    tbcsvponto: TStringField;
    gvCSVColumn1: TcxGridDBColumn;
    gvCSVColumn2: TcxGridDBColumn;
    tbcsvid_pes: TIntegerField;
    Button2: TButton;
    tbcsvempresa: TStringField;
    tbcsvid_emp: TIntegerField;
    tbcsvid_uni: TIntegerField;
    tbcsvagente: TStringField;
    qyemp: TFDQuery;
    Panel2: TPanel;
    tbmov: TFDMemTable;
    IntegerField1: TIntegerField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    StringField5: TStringField;
    IntegerField2: TIntegerField;
    IntegerField4: TIntegerField;
    dsmov: TDataSource;
    tbmovchavej: TStringField;
    glMOV: TcxGridLevel;
    gvMov: TcxGridDBTableView;
    gvMovid: TcxGridDBColumn;
    gvMovponto: TcxGridDBColumn;
    gvMovvalorc: TcxGridDBColumn;
    gvMovvalord: TcxGridDBColumn;
    tbcsvobs: TStringField;
    colOBS: TcxGridDBColumn;
    btImport: TBitBtn;
    tbage: TFDMemTable;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    StringField4: TStringField;
    StringField7: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    dsage: TDataSource;
    tbageponto: TStringField;
    glAGE: TcxGridLevel;
    gvAGE: TcxGridDBTableView;
    gvAGEchavej: TcxGridDBColumn;
    gvAGEempresa: TcxGridDBColumn;
    gvAGEnome: TcxGridDBColumn;
    qyuni: TFDQuery;
    gvAGEColumn1: TcxGridDBColumn;
    dsuni: TDataSource;
    pnLoading: TPanel;
    pgLoading: TProgressBar;
    Button1: TButton;
    Label3: TLabel;
    edDTIMP: TcxDateEdit;
    gvCSVColumn3: TcxGridDBColumn;
    qychj: TFDQuery;
    tbcsvok_chavej: TBooleanField;
    tbcsvok_ponto: TBooleanField;
    tbcsvok: TBooleanField;
    colNRCTO: TcxGridDBColumn;
    tbcsvnr_cto: TStringField;
    tbcsvok_nrcto: TBooleanField;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbcsvCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure grImpActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure tbageAfterPost(DataSet: TDataSet);
    procedure btImportClick(Sender: TObject);
  private
    { Private declarations }
    function sonumero(st: string): string;
    procedure geraResumo();
    procedure loading(valor: boolean);
  public
    { Public declarations }
  end;

var
  fImportRec: TfImportRec;

implementation

{$R *.dfm}

uses csvparser, modDados, modFuncoes;

procedure TfImportRec.btImportClick(Sender: TObject);
var
  ok: integer;
begin
  grImp.ActiveLevel:= glCSV;

  if tbcsv.RecordCount = 0 then btImport.Enabled:= false;

  if tbcsv.Locate('id_uni', 0, []) then begin
    MsgErro('Há registros sem Centro de Custo!');
    exit;
  end;

  if tbcsv.Locate('ok_ponto', false, [] ) then begin
    MsgErro('Há registros SEM definição do Centro de Custo!');
    exit;
  end;

  //if tbcsv.locate('ok_contrato', false, []) then begin
  //  if not perguntaSim('ATENÇÃO! Há contratos já Importados. Confima Alteração/Importação dos dados informados para a Data de ' + edDTIMP.Text + '?', 'ATENÇÃO!!! Importação de Receitas') then exit;
  //end else begin
    if not perguntaSim('Confima Importação dos dados informados para a Data de ' + edDTIMP.Text + '?', 'Importação de Receitas') then exit;
  //end;

  //with DM.qry do begin
    //open('select * from plimportrec where dt_ent = :dt', [edDTIMP.Date]);

    loading(true);
    pgLoading.Max:= tbcsv.RecordCount;
    tbcsv.DisableControls;
    tbcsv.first;
    dm.DBCON.StartTransaction;
    while not tbcsv.eof do begin

      {$IFDEF _DEBUG}
      //ocorria erros no MariaDB
      ok:= dm.DBCON.ExecSQL(
        'insert into plimportrec ' +
        '  (dt_ent, id_emp, chavej, id_pes, id_uni, vl_rec, vl_des, us_inc, us_alt, dt_alt) ' +
        'values ' +
        '  (:dt_ent, :id_emp, :chavej, :id_pes, :id_uni, :vl_rec, :vl_des, :us_inc, null, null) ' +
        'on duplicate key update ' +
        '  dt_ent = value(dt_ent), id_emp = value(id_emp), chavej = value(chavej), id_pes = value(id_pes), ' +
        '  id_uni = value(id_uni), vl_rec = value(vl_rec), vl_des = value(vl_des), ' +
        '  us_alt = value(us_inc), dt_alt = current_timestamp()',
        [edDTIMP.Date, tbcsv['id_emp'], tbcsv['chavej'], tbcsv['id_pes'],
         tbcsv['id_uni'], tbcsv['valorc'], tbcsv['valord'], wUsuario]);
      {$ELSE}
      //utilizado apenas com MySQL
      ok:= dm.DBCON.ExecSQL(
        'insert into plimportrec ' +
        '  ( nr_cto,  chavej,  dt_ent,  id_emp,  id_pes,  id_uni,  vl_rec,  vl_des,  us_inc, us_alt, dt_alt)' +
        'values ' +
        '  (:nr_cto, :chavej, :dt_ent, :id_emp, :id_pes, :id_uni, :vl_rec, :vl_des, :us_inc, null, null) as new ' +
        'on duplicate key update ' +
        '  dt_ent = new.dt_ent, id_emp = new.id_emp, chavej = new.chavej, id_pes = new.id_pes, ' +
        '  id_uni = new.id_uni, vl_rec = new.vl_rec, vl_des = new.vl_des, ' +
        '  us_alt = new.us_inc, dt_alt = current_timestamp()',
        [tbcsv['nr_cto'], tbcsv['chavej'], edDTIMP.Date, tbcsv['id_emp'], tbcsv['id_pes'],
         tbcsv['id_uni'], tbcsv['valorc'], tbcsv['valord'], wUsuario]);
      {$ENDIF}


      tbcsv.Edit;
      if ok = 1 then tbcsv['obs']:= 'Importado (NOVO)!'
      else if ok = 2 then tbcsv['obs']:= 'Importado (ALTERADO)!'
      else tbcsv['obs']:= 'ERRO NA IMPORTAÇÃO: ' + inttostr(ok);
      //tbcsv['ok_contrato']:= true;
      tbcsv.Post;

      tbcsv.Next;
      pgLoading.Position:= pgLoading.position+1;
    end;
    dm.DBCON.Commit;
    //close;
  //end;
  tbcsv.EnableControls;
  loading(false);
  btImport.Enabled := false;
  MsgBox('Importação Realizada com Sucesso!', 'Importação de Receita', MB_OK + MB_ICONINFORMATION);
end;

procedure TfImportRec.Button1Click(Sender: TObject);
var
  csv: TCsvparser;
  data: TDate;
  id, qtok: integer;
  id_uni, id_pes: integer;
  update: boolean;
  cnpj, chavej: string;
  agente, ponto: string;
  nr_cto: string; //era pra ser nome do arquivo
  nr_cto_jafoi: boolean;
  //valc, vald: double;
begin
  qtok:= 0;
  if odCSV.Execute() then begin
    nr_cto:= extractfilename(odCSV.FileName).ToLower;
    if rightstr(nr_cto, 4) = '.csv' then nr_cto:= leftstr(nr_cto, nr_cto.Length-4);
    nr_cto_jafoi:= dm.DBCON.ExecSQLScalar('SELECT EXISTS(select id from plimportrec where nr_cto = :nr_cto limit 1)',[nr_cto]) = 1;
    btImport.Enabled:= false;
    loading(true);

    tbcsv.Close;
    //tbmov.Close;
    tbage.Close;
    grImp.ActiveLevel:= glCSV;
    csv := TCSVParser.Create;
    try
      csv.SetDataFile := odCSV.FileName;
      csv.Open;
      label1.Caption := 'Qt. Colunas: ' + inttostr(csv.FieldCount);
      label2.Caption := 'Qt. Linhas: ' + inttostr(csv.RowCount-1);
      if(csv.FieldCount > 4) then begin
        csv.Free;
        loading(false);
        MsgErro('Arquivo deve conter apenas 5 colunas, nesta ordem: Empresa(CNPJ), Chave J, Colaborador(Nome), Vl. Receita(C) e Vl. Comissão(D)');
        exit;
      end;
      //showmessage(inttostr(csv.RowCount));


      pgLoading.Max:= csv.RowCount;

      //csv.Next;
      tbage.DisableControls;
      tbage.Open;
      tbage.Tag:= 1;

      tbcsv.DisableControls;
      tbcsv.Filter:= '';
      tbcsv.Filtered:= false;
      tbcsv.Open;

      id:= 1;
      //vald:= 0;
      while not csv.Eof do begin
        cnpj:= sonumero(csv.Fields[0]);
        if cnpj.Length  = 14	then begin
          tbcsv.Append;
          //tbcsv['ok_contrato']:= false;
          tbcsv['ok_chavej']:= false;
          tbcsv['ok_ponto']:= false;

          //tbcsv['contrato']:= csv.Fields[1];
          //tbcsv['ok']:= true;

          tbcsv['id']:= id;
          tbcsv['cnpj']:= cnpj;
          if qyemp.Locate('nrins', cnpj, []) then begin
            tbcsv['empresa']:= qyemp['descr'];
            tbcsv['id_emp']:= qyemp['id'];
  //          tbcsv['id_cnt']:= 0;
          end;

          tbcsv['chavej']:= csv.Fields[1];
          if(qypes.Locate('cod', tbcsv['chavej'], [])) then begin
            //chave j localizada na tabela de pessoal

            tbcsv['id_pes']:= qypes['id_pes'];
            tbcsv['id_uni']:= qypes['id_uni'];
            tbcsv['agente']:= qypes['nome'];
            tbcsv['ponto']:= qypes['ponto'];
            tbcsv['obs']:= 'OK!';
            tbcsv['ok_chavej']:= true;
            tbcsv['ok_ponto']:= true;
            inc(qtok);
          end else begin
            tbcsv['id_uni']:= 0;
            tbcsv['id_pes']:= 0;
            tbcsv['agente']:= trim(csv.Fields[2]);
            tbcsv['ponto']:= '';

            tbcsv['obs']:= 'CHAVE J NÃO ENCONTRADA NA BASE DE DADOS!';
            //tbcsv['ok']:= false;
            if qychj.Locate('chavej', tbcsv['chavej'], []) then begin
              if qyuni.Locate('id', qychj['id_uni'], []) then begin
                tbcsv['ponto']:= qyuni['descr'];
                tbcsv['id_uni']:= qychj['id_uni'];
                tbcsv['obs']:= 'OK! Usando último Centro de Custo informado.';
                tbcsv['ok_chavej']:= true;
                tbcsv['ok_ponto']:= true;;
              end;
            end;
            if not tbage.Locate('chavej', tbcsv['chavej'], []) then begin
              tbage.Append;
              tbage['id_pes']:= 0;
              tbage['chavej']:= tbcsv['chavej'];
              tbage['nome']:= tbcsv['agente'];
              tbage['ponto']:= tbcsv['ponto'];
              tbage['empresa']:= tbcsv['empresa'];
              tbage['id_uni']:= tbcsv['id_uni'];
              tbage.Post;
            end;
          end;

          tbcsv['valorc']:= strToValor(csv.Fields[3]);// strtoint('0' + sonumero(csv.Fields[4]))/100;
          tbcsv['valord']:= strToValor(csv.Fields[4]);// abs(strtoint('0' + sonumero(csv.Fields[5]))/100);

          tbcsv['nr_cto']:= nr_cto; //NOME DO ARQUIVO

          //vald:= vald + tbcsv['valord'];
          //tbcsv['ok_contrato']:= true;
          //if DM.DBCON.ExecSQLScalar('select count(id) from plimportrec where nr_cto = :id', [tbcsv['contrato']]) > 0 then begin
          if nr_cto_jafoi then begin
            if DM.DBCON.ExecSQLScalar('SELECT EXISTS(select id from plimportrec where nr_cto = :nr_cto and chavej = :chavej)', [tbcsv['nr_cto'], tbcsv['chavej']]) = 1 then begin
              tbcsv['ok_nrcto']:= false;
              tbcsv['obs']:= 'Registro já importado. Será ALTERADO!';
            end;
          end;
          tbcsv.Post;
          inc(id);
        end;
        csv.Next;
        pgLoading.Position:= pgLoading.Position + 1;
      end;
      //showmessage(floattostr(vald));
      //glCSV.Caption:= 'Registros OK (' + inttostr(qtok) + ')';
      //glPROB.Caption:= 'Registros com Problema (' + inttostr(tbcsv.RecordCount - qtok) + ')';

      geraResumo();

      btImport.Enabled:= true;
    finally
      csv.Free;
      //tbcsv.Filter:= ' id_pes > 0';
      tbcsv.IndexFieldNames:= '';
      tbcsv.EnableControls;
      tbage.Tag:= 0;
      tbage.EnableControls;

      loading(false);
      ///tbcsv.Close;
    end;

    if tbcsv.RecordCount = 0 then begin
      msgErro('Não há registros válidos no Arquivo Escolhido!');
    end;

  end;

end;

procedure TfImportRec.Button2Click(Sender: TObject);
begin
tcxGriddbtableview(grIMp.FocusedView).CopyToClipboard(false);  //false copia apenas selecionados
//gvmov.CopyToClipboard()
end;

procedure TfImportRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
qychj.Close;
qyuni.Close;
qypes.Close;
qyemp.Close;
with DM do begin
  qycnt.Close;
  qyeve.Close;
end;
end;

procedure TfImportRec.FormCreate(Sender: TObject);
begin
//  with Dm do begin
//  end;

  colNRCTO.Visible:= wUsuario <= 100;
  qychj.Open('select * from tbchavejtmp order by chavej');
  btImport.Enabled:= False;
  loading(false);
  grImp.Align := alClient;
  grImp.ActiveLevel:= glCSV;

  qyuni.IndexFieldNames:= 'descr';
  qyuni.Open('select id, codpt, descr from tbunidades where ativo >= 0');
  with qyuni.FieldByName('codpt') do begin
    EditMask:= '9999.99;0;_';
    alignment:= taRightJustify;
  end;


  qypes.IndexFieldNames := 'cod';
  qypes.Open('select p.id id_pes, p.cod, p.descr nome, ' +
    'p.id_uni, u.codpt, u.descr ponto from tbpessoal p left join tbunidades u on u.id = p.id_uni where ' +
    'tp_pes = ' + inttostr(cTipoAgente) + ' ' +
    'order by p.cod');

  qyemp.IndexFieldNames := 'nrins';
  qyemp.Open('select id, nrins, descr from tbempresas where (ativo >= 0)');
  edDTIMP.Date:= Date;

  tbcsv.Filtered:= False;
  tbcsv.IndexFieldNames:= 'id_uni;chavej';
  tbmov.IndexFieldNames:= 'id_uni;chavej';
  //with DM do begin
    //qypes.Open('select id, id_uni, cod, descr, ')
  //end;
end;

procedure TfImportRec.geraResumo;
  var
    id_uni: integer;
    chavej,
    agente,
    ponto: string;
    valc, vald: double;
    update: boolean;
    id: integer;

begin
  if(tbcsv.RecordCount = 0) then exit;

  //tbcsv.Filter:= ' id_pes > 0';
  tbcsv.First;

  tbmov.DisableControls;
  tbmov.Close;
  tbmov.Open;
  id_uni:= tbcsv['id_uni'];
  chavej:= tbcsv['chavej'];
  valc:= 0;
  vald:= 0;
  update:= false;
  id:= 1;
  while not tbcsv.eof do begin
    valc:= valc + tbcsv['valorc'];
    vald:= vald + tbcsv['valord'];
    agente:= tbcsv['agente'];
    ponto:= tbcsv['ponto'];
    tbcsv.Next;
    update:= tbcsv.Eof;
    if not update then begin
//      update:= ((id_uni <> tbcsv['id_uni']) and (tbcsv['id_uni'] > 0)) or
//         ((chavej <> tbcsv['chavej']) and (tbcsv['id_uni'] = 0));
      update:= (id_uni <> tbcsv['id_uni']) and (tbcsv['id_uni'] > 0);
      if not update then
        update:= (chavej <> tbcsv['chavej']) and (tbcsv['id_uni'] = 0);
      {
      if (id_uni <> tbcsv['id_uni']) and (tbcsv['id_uni'] > 0) then begin
        update:= true;
      end else begin
        update:= (chavej <> tbcsv['chavej']) and (tbcsv['id_uni'] = 0);
      end;
      }
    end;

    if update then begin
      tbmov.Append;
      tbmov['id']:= id;
      tbmov['id_uni']:= id_uni;
      if id_uni >0 then begin
        tbmov['ponto']:= ponto
      end else begin
        tbmov['ponto']:= '(A) ' + agente;
        tbmov['chavej']:= chavej;
      end;
      tbmov['valorc']:= valc;
      tbmov['valord']:= vald;
      tbmov.Post;
      inc(id);
      valc:= 0;
      vald:= 0;
      if not tbcsv.Eof then begin
        chavej:= tbcsv['chavej'];
        id_uni:= tbcsv['id_uni'];
      end;
      update:= false;
    end;
  end;
  tbmov.EnableControls;

end;

procedure TfImportRec.grImpActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
{
  colOBS.Visible:= (ALevel = glProb);
  if ALevel = glProb then begin
    tbcsv.Filter:= ' id_pes = 0';
    glProb.GridView:= gvCSV;
  end else if ALevel = glCSV then begin
    tbcsv.Filter:= ' id_pes > 0';
    glCSV.GridView:= gvCSV;
  end;
}
end;

procedure TfImportRec.loading(valor: boolean);
begin
  if pnLoading.Visible <> valor then begin
    pnLoading.Left:= (Self.ClientWidth - pnLoading.Width) div 2;
    pnLoading.Top:= (Self.ClientHeight - pnLoading.Height) div 2;
    pnLoading.Visible:= valor;
    pgLoading.Position:= 0;
    application.ProcessMessages;
  end;
end;

function TfImportRec.sonumero(st: string): string;
var
  I: Integer;
begin
  result:= '';
  for I := 1 to st.length do begin
     if st[i] in ['0'..'9'] then result:= result + st[i];

  end;

end;

procedure TfImportRec.tbageAfterPost(DataSet: TDataSet);
var
  pontoAnt: string;
begin
  if tbAge.Tag <> 0 then exit;

  //showmessage(qycnt['descr']);
  if not qyuni.Locate('id', dataset['id_uni'], []) then begin
    msgerro('ERR202407241029 - Erro, Contate o Desenvolvedor!');
    exit;
  end;

  screen.Cursor:= crHourglass;
  if not qychj.Locate('chavej', dataset['chavej'], []) then begin
    qychj.Append;
  end else if qychj['id_uni'] <> dataset['id_uni'] then begin
    qychj.Edit;
  end;
  if qychj.State in [dsedit, dsinsert] then begin
    qychj['chavej']:= dataset['chavej'];
    qychj['id_uni']:= dataset['id_uni'];
    if qychj.State = dsinsert then begin
      qychj['dt_inc']:= now;
      qychj['us_inc']:= wUsuario;
    end;
    qychj.Post;
  end;


  tbcsv.DisableControls;
  tbcsv.Filter:= 'chavej = ' + quotedstr(dataset['chavej']);
  tbcsv.Filtered:= true;
  if tbcsv.RecordCount = 0 then begin
    msgerro('ERR202407241035 - Erro, Contate o Desenvolvedor!');
    exit;
  end;
  tbcsv.First;
  while not tbcsv.Eof do begin
    tbcsv.Edit;
    tbcsv['id_uni']:= dataset['id_uni'];
    pontoAnt:= tbcsv['ponto'];
    tbcsv['ponto']:= qyuni['descr'];
    //tbcsv['obs']:= 'Centro de Custo alterado de "' + pontoAnt + '" para "' + tbcsv['ponto'] + '"';
    tbcsv['ok_chavej']:= true;
    tbcsv['ok_ponto']:= true;
    if(tbcsv['ok']) then tbcsv['obs']:= 'OK!';
    tbcsv.post;
    tbcsv.Next;
  end;
  tbcsv.Filtered:= false;
  tbcsv.Filter:= '';

  geraResumo();

  tbcsv.EnableControls;


  screen.Cursor:= crDefault;
end;

procedure TfImportRec.tbcsvCalcFields(DataSet: TDataSet);
begin
//  if qry.Locate('cod', dataset['chavej'], []) then begin
//    dataset['nome']:= qry['nome'];
//    dataset['ponto']:= qry['ponto'];
//  end;
  //dataset['ok']:= dataset['ok_chavej'] and dataset['ok_contrato'] and dataset['ok_ponto'];
  dataset['ok']:= dataset['ok_chavej'] and dataset['ok_ponto'];
end;

end.
