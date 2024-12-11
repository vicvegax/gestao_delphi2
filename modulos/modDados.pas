unit modDados;

interface

uses
  System.SysUtils, System.Classes, System.Types, FireDAC.Stan.Intf,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IniFiles, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  Dialogs, Graphics, modFuncoes, frxExportXLSX, frxClass,
  frxExportBaseDialog, frxExportPDF, StrUtils, System.ImageList,
  Vcl.ImgList, Vcl.Controls, dxGDIPlusClasses, cxClasses, cxGraphics,
  fs_ijs, fs_iinterpreter, Vcl.Menus, Variants, Vcl.ExtCtrls,
  cxLookAndFeels, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param;

type
  TDM = class(TDataModule)
    DBCON: TFDConnection;
    qyCat: TFDQuery;
    qyUni: TFDQuery;
    qyEVE: TFDQuery;
    qyInv: TFDQuery;
    qyPes: TFDQuery;
    qyCnt: TFDQuery;
    DSUNI: TDataSource;
    DSPES: TDataSource;
    DSEVE: TDataSource;
    DSCNT: TDataSource;
    QYFER: TFDQuery;
    DSCAT: TDataSource;
    qyTPD: TFDQuery;
    DSTPD: TDataSource;
    qry: TFDQuery;
    linkMYSQL: TFDPhysMySQLDriverLink;
    qyTPC: TFDQuery;
    qyTPR: TFDQuery;
    DSTPC: TDataSource;
    DSTPR: TDataSource;
    DBTRANS: TFDTransaction;
    qyTCB: TFDQuery;
    DSTCB: TDataSource;
    qyLogin: TFDQuery;
    qyCFG: TFDQuery;
    frxPDF: TfrxPDFExport;
    frxXLS: TfrxXLSXExport;
    frxRel: TfrxReport;
    QYMOV: TFDQuery;
    QYCTR: TFDQuery;
    tbUsuNivel: TFDQuery;
    dsUsuNivel: TDataSource;
    tbUsuPerm: TFDQuery;
    QYCTRcalc_ds_uni: TStringField;
    QYCTRcalc_ds_eve: TStringField;
    QYCTRcalc_ds_tpc: TStringField;
    QYCTRcalc_ds_tpr: TStringField;
    QYCTRcalc_ds_pes: TStringField;
    QYMOVcalc_ValorDC: TFloatField;
    QYMOVcalc_idif: TStringField;
    QYMOVcalc_ds_uni: TStringField;
    QYMOVcalc_uf_uni: TStringField;
    QYMOVcalc_ds_eve: TStringField;
    QYMOVcalc_ds_pes: TStringField;
    QYMOVcalc_ds_tpd: TStringField;
    QYMOVcalc_ds_tp_conta: TStringField;
    tbUsuRel: TFDQuery;
    imageCol: TcxImageCollection;
    imgMostra: TcxImageCollectionItem;
    imgEsconde: TcxImageCollectionItem;
    fs1: TfsScript;
    fsJScript1: TfsJScript;
    qyUnicodpt: TStringField;
    popInfo: TPopupMenu;
    popPes: TMenuItem;
    popMov: TMenuItem;
    QYMOVcalc_descr: TStringField;
    QYMOVnr_doc: TStringField;
    QYMOVbanco: TStringField;
    QYMOVagencia: TStringField;
    QYMOVnr_conta: TStringField;
    popCtr: TMenuItem;
    QYMOVcalc_tp_ins: TSmallintField;
    qyCntcod_descr: TStringField;
    PingMySQL: TTimer;
    QYMOVidfull: TStringField;
    movSTFIM: TStringField;
    qymov_aud: TFDQuery;
    cxLFC: TcxLookAndFeelController;
    qytab_aud: TFDQuery;
    QYCTRcalc_dt_alt: TDateTimeField;
    qyEVEcod: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure QYFERCalcFields(DataSet: TDataSet);
    procedure QYMOVCalcFields(DataSet: TDataSet);
    procedure QYCTRCalcFields(DataSet: TDataSet);
    procedure QYMOVnr_contaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QYMOVagenciaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QYMOVnr_docGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyCntCalcFields(DataSet: TDataSet);
    procedure PingMySQLTimer(Sender: TObject);
    procedure DBCONRecover(ASender, AInitiator: TObject;
      AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
    procedure DBCONRestored(Sender: TObject);
    procedure DATASETAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sqlTBPES, sqlTBTPD, sqlTBEVE, sqlTBCNT, sqlTBUNI: string;
  var
    Erros_de_Conexao: integer;
    globalTbLog: TStringlist;
    function aceitaNivel(const nivel: integer): Boolean;
    procedure LoadReport(const Nome: String);
    function obsBox(ACaption, APrompt: String; out obs: string): boolean;
    procedure criaLog(tb: TFDQuery);
    procedure criaLogMov(tbmov: TFDQuery; stnova: char; fechar: boolean = true);
    procedure criaLogTab(origem: TFDQuery; tbname: string; stnova: char; fechar: boolean = true; campoIdAud: string = 'id_aud');
    function preparaLog(tb: TFDQuery): String;
    procedure adicionaLog(tb: TFDQuery; tpLog: TtipoLog; dados: String);
    function proxDiaUtil(Data: TDate): TDate;
    function retTipoConta(tipo: integer): String;
    procedure carregaConfig(fechaCFG: Boolean = true);
    procedure marcaExclusao(DataSet: TFDQuery);
    function permitido(flag: string): Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses myObsBox;

{$R *.dfm}

function TDM.aceitaNivel(const nivel: integer): Boolean;
begin
  result := (nivel = 0) or (DM.qyLogin.FieldByName('id_nivel').AsInteger
    <= nivel);
end;

procedure TDM.adicionaLog(tb: TFDQuery; tpLog: TtipoLog; dados: string);
var
  st: string;
begin
  st := '\' + tipoLog[ord(tpLog)] + '|' + FormatDateTime('dd/mm/yyyy hh:nn:ss',
    Now) + '|' + inttostr(wUsuario) + '|' + dados;
  st := st + #13#10 + tb.FieldByName('log').AsString;
  tb.FieldByName('log').AsString := st;

  // case tpLog of
  // eEXC:
  // st:= dados; //apenas uma obs
  // end;
  // st:= tipoLOG + ','+inttostr(wusuario)+','+formatdatetime(
end;

procedure TDM.carregaConfig(fechaCFG: Boolean = true);
begin
  qyCFG.Open();
  corMovLiquidado := TColor(qyCFG.FieldByName('corLiquidado').AsInteger);
  corMovEmconta := TColor(qyCFG.FieldByName('corEmconta').AsInteger);
  corMovAgendado := TColor(qyCFG.FieldByName('corAgendado').AsInteger);
  corDocEntregue := TColor(qyCFG.FieldByName('corEntregue').AsInteger);
  corUltMov := TColor(qyCFG.FieldByName('corUltMov').AsInteger);
  if fechaCFG then
    qyCFG.Close;
end;

procedure TDM.criaLog(tb: TFDQuery);
var
  i: integer;
begin
  globalTbLog.Clear;
  for i := 0 to tb.FieldCount - 1 do
  begin
    if tb.Fields[i].Tag = 77 then
      globalTbLog.Append(tb.Fields[i].AsString);
  end;

end;

procedure TDM.criaLogMov(tbmov: TFDQuery; stnova: char; fechar: boolean = true);
var
  i: integer;
  ativo: boolean;
  st: string;
begin
  ativo:= qymov_aud.Active;
  if not ativo then qymov_aud.Open('select * from plmovimento_aud where id = ' + vartostr(tbmov['id']) + ' limit 0');
  qymov_aud.Append;
  for i := 0 to qymov_aud.FieldCount-1 do begin
    st:= qymov_aud.Fields[i].FieldName.ToLower;
    if tbmov.FindField(st) = nil then continue
    else if st = 'valor' then continue
    else if st = 'dt_mov' then continue;

    qymov_aud.Fields[i].Value:= tbmov.FieldValues[st];
  end;
  qymov_aud['us_inc']:= wUsuario;
  qymov_aud['dt_inc']:= Now;
  qymov_aud['st_fim']:= stnova;
  qymov_aud.Post;
  if (not ativo) and (fechar) then qymov_aud.Close;
  
end;

procedure TDM.criaLogTab(origem: TFDQuery; tbname: string; stnova: char; fechar: boolean; campoIdAud: string);
var
  i: integer;
  ativo: boolean;
  st: string;
begin

  ativo:= qytab_aud.Active;
  if not ativo then qytab_aud.Open('select * from ' + tbname + ' where ' + campoIdAud + ' = ' + vartostr(origem['id']) + ' limit 0');
  qytab_aud.Append;
  for i := 0 to qytab_aud.FieldCount-1 do begin
    st:= qytab_aud.Fields[i].FieldName.ToLower;
    if origem.FindField(st) = nil then continue;

    qytab_aud.Fields[i].Value:= origem.FieldValues[st];
  end;
  qytab_aud[campoIdAud]:= origem['id']; //ordenar por id ASC, id_aud DESC
  qytab_aud['us_inc']:= wUsuario;
  qytab_aud['dt_inc']:= Now;
  qytab_aud['st_fim']:= stnova;
  qytab_aud.Post;
{
  tb.Edit;
  tb['id_aud']:= id_aud;
  tb['us_alt']:= wUsuario;
  tb['dt_alt']:= Now;
  tb['st_ini']:= stnova;
  tb['st_fim']:= cSTNOR;
  tb.Post;
}
  if (not ativo) and (fechar) then qytab_aud.Close;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  F: TextFile;
  st: String;
begin
  fs1.Parent := fsGlobalUnit; // use standard classes and methods

  { 24/04/2023 - Atualização funcionou - removi o o arquivo dos resources }
  // if not fileexists('.\libmysql.dll') then begin
  // res:= TResourceStream.Create(hInstance, 'mysql', RT_RCDATA);
  // res.SaveToFile('.\libmysql.dll');
  // res.Free;
  // end;

  //Uma alteração para o githun 06/12/2024 09:44

  wBDLOCAL := False;  //Mudado para base de dados externa em 06/03/2024 - PADRÃO

  globalTbLog := TStringlist.Create;
  if fileexists(appdir('DEV.MOD')) then
  begin
    wModoDev := 1;

    // Checa se vai pedir o login - 23/08/2023
    AssignFile(F, appdir('DEV.MOD'));
    reset(F);
    while not eof(F) do
    begin
      readln(F, st);
      if st = 'NOLOGIN' then
        wModoDev := 2;
      if st = 'LOCAL' then  //Usar a minha base local
        wBDLOCAL := True;
      if st = 'NODEV' then
        wModoDev := 0;
    end;
    CloseFile(F);

  end else begin
    wModoDev := 0;
  end;

  Erros_de_Conexao:= 0;
  with DBCON do begin
    Close;
    // create temporary connection definition
    with Params do begin
      Clear;
      Add('DriverID=MySQL');
      if wBDLOCAL then begin
        //Add('Server=gestaocrm.ddns.net')
        //Add('Server=10.0.0.121')
        //Add('Server=192.168.155.3')
        Add('Server=127.0.0.1');
        Add('Port=13306');
      end else begin
        //Add('Server=191.252.196.65');  //ANTIGO BD
        Add('Server=46.202.146.82'); //NOVO BD - APÓS 10/12/2024
        Add('Port=3306');
      end;
      if wModoDev = 0 then
        Add('Database=gestaocrm')      //Será desativado
      else
        Add('Database=gestaocrm_dev');

      Add('CharacterSet=latin1'); // definir quando gerar tudo
    end;
    if wBDLOCAL then
      //Open('gestaomaster', 'Master2354_')
      //Open('admin', 'admin123')
      Open('root', 'admin')
    else
      Open('sys_crm_user', 'F!6p#2@L$xZ8s&9');
  end;
  DBCON.ExecSQL('SET time_zone = "-03:00";');   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TIMEZONE

  // except
  // raise Exception.Create('Problemas ao conectar no Bando de Dados. Contate o Desenvolvedor!');
  // Application.terminate;
  // end;

  dia_semana[1] := 'DOMINGO';
  dia_semana[2] := 'SEGUNDA-FEIRA';
  dia_semana[3] := 'TERÇA-FEIRA';
  dia_semana[4] := 'QUARTA-FEIRA';
  dia_semana[5] := 'QUINTA-FEIRA';
  dia_semana[6] := 'SEXTA-FEIRA';
  dia_semana[7] := 'SÁBADO';

  {
    a partir de 08/09/2023, acredito que aprendi q as tabelas são pesquisadas pelo ID,
    sendo esta a ORDEM natural. usando as propriedades locais, pelo proprio Delphi, eu informo a ORDEM
    de EXIBIÇÃO(??? MOSTRAGEM :) ???)
  }
  qyTCB.SQL.Text := 'SELECT * from tbtipocontabanc ORDER BY id';
  qyCat.SQL.Text := 'SELECT * FROM tbcateg WHERE (ativo >= 0) ORDER BY id';
  // cod';
  QYFER.SQL.Text := 'SELECT * FROM tbferiados WHERE (ativo >= 0) ORDER BY data';
  qyTPD.SQL.Text := 'SELECT * FROM tbtipodoc WHERE (ativo >= 0) ORDER BY id';
  qyTPC.SQL.Text :=
    'SELECT * FROM tbtipocontrato WHERE (ativo >= 0) ORDER BY id';
  qyTPR.SQL.Text := 'SELECT * FROM tbtiporeajus WHERE (ativo >= 0) ORDER BY id';

  sqlTBCNT := 'SELECT * FROM tbcontas WHERE (ativo >= 0) ORDER BY id';
  qyCnt.SQL.Text:= '';//sqlTBCNT;
  sqlTBUNI:= 'select id, cod, ponto, codpt, descr, uf, nivel from tbunidades where ativo >= 0';
  qyuni.SQL.Text:= '';//sqlTBUNI;
  sqlTBTPD:= 'select id, cod, descr, conta, perio from tbtipodoc WHERE (ativo >= 0) ORDER BY id';
  qytpd.SQL.Text:= '';//sqlTBTPD;
  sqlTBPES:= 'select id, tp_pes, descr, tp_ins, nr_ins, banco, agencia, nr_conta, tp_conta, ativo from tbpessoal where ativo >= 0';
  qyPes.SQL.Text := '';//sqlTBPES;
  sqlTBEVE:= 'SELECT *, IF(LEFT(cod, 1) = "1", "DES", "REC") as tipo, RIGHT(cod, 2) as rgtCOD FROM tbeventos WHERE (ativo >= 0) ORDER BY id';
  qyEVE.SQL.Text := '';//sqlTBEVE;


  qyEVE.FieldByName('cod').EditMask := mskEVENTO; // utilizado nos combos
  qyUni.FieldByName('CODPT').EditMask := mskCODPT;

  qyCFG.SQL.Text := 'SELECT * FROM config WHERE id = 1'; // apenas 1 registro

  tbUsuNivel.SQL.Text := 'select * from tbusuarionivel WHERE (id > 0) ORDER BY id';
  tbUsuPerm.SQL.Text := 'select * from tbusuariopermissao ORDER BY grupo, id';
  qymov.OnCalcFields:= nil;

  {
    // 22/04/2023 - Estas tabelas não podem ser abertas direto,
    pois o programa é operado em rede, pode sofrer modificações
    na base de dados em qualquer momento.
    Elas devem ser abertas no ato da utilização, como em qualquer pagina
    da internet.

    qyFER.Open();  //é carregado de imediato, está sempre disponível
    qyTPD.Open();  //é carregado de imediato, está sempre disponível
    qyUNI.Open();
  }


  PingMySql.Interval:= DM.DBCON.ExecSQLScalar('select ping from config') * 1000;
  if PingMySql.Interval = 0  then pingMySql.Enabled:= False
  else begin
    if PingMySql.Interval < 20000 then PingMySql.Interval:= 20000;

    PingMySql.Enabled:= true;
  end;
  //ShowMessage(inttostr(PingMySQl.Interval));
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  globalTbLog.Free;
  QYFER.Close;
  qyTPD.Close;
  tbUsuRel.Close;
  DBCON.Close;
end;

procedure TDM.DBCONRecover(ASender, AInitiator: TObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
begin
  Erros_de_Conexao:= Erros_de_Conexao + 1;
  if wUsuario <= 100 then
    ShowMessage('Entrou em modo de recuperação! Tentativa ' + inttostr(Erros_de_Conexao));
  if Erros_de_Conexao < 2 then begin
    AAction := faRetry;
  end else begin
    MsgErro('NÃO FOI POSSÍVEL CONECTAR AO BANCO DE DADOS! O SISTEMA SERÁ FINALIZADO.');
    AAction :=  faCloseAbort;
  end;
end;

procedure TDM.DBCONRestored(Sender: TObject);
begin
  Erros_de_Conexao:= 0;
  if wUsuario <= 100 then
    ShowMessage('Modo de recuperação concluído!');

end;

procedure TDM.LoadReport(const Nome: String);
var
//  m: TResourceStream;
  m: TStream;
  st: string;
begin
{
  m := TResourceStream.Create(HInstance, Nome, RT_RCDATA);
  try
    m.Position := 0;
    frxRel.LoadFromStream(m);
  finally
    m.Free;
  end;
}
{$IFDEF DEBUG}
  st:= 'D:\Projetos\Delphi\GestaoCRM\source\relatorios_fr3\'+nome + '.fr3';
  if not fileexists(st) then begin
    msgErro(st + ' não existe!');
    exit;
  end;

  frxRel.LoadFromFile(st);
{$ELSE}
  m:= TStringStream.Create(vartostr(DBCON.ExecSQLScalar('select dados from cfgrelatorio where lower(nome) = "' + nome.ToLower + '"')));
  frxRel.LoadFromStream(m);
  freeandnil(m);
{$ENDIF}
end;

procedure TDM.marcaExclusao(DataSet: TFDQuery);
begin
  DataSet.FieldByName('us_exc').AsInteger := wUsuario;
  DataSet.FieldByName('dt_exc').AsDateTime := Now;
  DataSet.FieldByName('ativo').AsInteger := -1;

end;

function TDM.obsBox(ACaption, APrompt: String; out obs: string): boolean;
begin
  with TfmyObsBox.Create(nil, ACaption, APrompt) do begin
    result:= (ShowModal = mrOK);
    if result then obs:= edPROMPT.Text;
    Free;
  end;
end;

function TDM.permitido(flag: string): Boolean;
begin

  if wTudoPermitido then
    result := true
  else
    result := DM.tbUsuRel.Locate('descr', flag.ToUpper, []);
  // ContainsText(wPermissao, '.' + inttostr(tag) + '.');

end;

procedure TDM.PingMySQLTimer(Sender: TObject);
begin
  //ENABLED NO LOAD DO DM
//try
  if not DBCON.InTransaction then
    //DBCON.ExecSQL('DO 0;');
    DBCON.Ping;
//    DBCON.ExecSQLScalar('SELECT id from plmovimento where 0;');
//except

//end;

end;

function TDM.preparaLog(tb: TFDQuery): String;
var
  i: integer;
begin
  for i := 0 to tb.FieldCount - 1 do
  begin
    if tb.Fields[i].Tag = 77 then
    begin
      if tb.Fields[i].AsString = globalTbLog[i] then
        globalTbLog[i] := '';
    end;
  end;
  // ShowMessage(globalTbLog.CommaText);
  // globalTbLog.SaveToFile('c:\temp\teste.lst');

  result := globalTbLog.CommaText;
end;

function TDM.proxDiaUtil(Data: TDate): TDate;
var
  feriado: Boolean;
  // diautil: Boolean;
begin

  // diaUtil:= false;
  // while diaUtil = False do

  if DayOfWeek(Data) = 7 then // Sabado
    Data := Data + 2
  else if DayOfWeek(Data) = 1 then // Domingo
    Data := Data + 1
  else begin
    //DM.qry.Open('SELECT COUNT(DATA) AS QT FROM tbferiados WHERE (DATA = :v1)',
    //  [FormatDateTime('yyyy-mm-dd', Data)]);
    //feriado := DM.qry.FieldByName('qt').AsInteger > 0;
    //DM.qry.Close;
    //if feriado then
    if DM.DBCON.ExecSQLScalar('SELECT COUNT(DATA) AS QT FROM tbferiados WHERE (DATA = :v1)',
      [FormatDateTime('yyyy-mm-dd', Data)]) > 0 then
      Data := Data + 1
    else begin // é um dia comercial
      result := Data;
      exit; // finaliza função
    end;
  end;

  result := proxDiaUtil(Data);
end;

procedure TDM.qyCntCalcFields(DataSet: TDataSet);
begin
DataSet['cod_descr']:= DataSet['cod'] + ' - ' + DataSet['DESCR'];
end;

procedure TDM.QYCTRCalcFields(DataSet: TDataSet);
begin
  if DM.qyUni.Locate('id', DataSet.FieldByName('id_uni').AsInteger, []) then
    DataSet.FieldByName('calc_ds_uni').AsString :=
      DM.qyUni.FieldByName('descr').AsString;

  if DM.qyEVE.Locate('id', DataSet.FieldByName('id_eve').AsInteger, []) then
    DataSet.FieldByName('calc_ds_eve').AsString :=
      DM.qyEVE.FieldByName('descr').AsString;

  if DataSet.FieldByName('id_tpc').AsInteger > 0 then
    if DM.qyTPC.Locate('id', DataSet.FieldByName('id_tpc').AsInteger, []) then
      DataSet.FieldByName('calc_ds_tpc').AsString :=
        DM.qyTPC.FieldByName('descr').AsString;

  if DataSet.FieldByName('id_tpr').AsInteger > 0 then
    if DM.qyTPR.Locate('id', DataSet.FieldByName('id_tpr').AsInteger, []) then
      DataSet.FieldByName('calc_ds_tpr').AsString :=
        DM.qyTPR.FieldByName('descr').AsString;

{
  if DataSet.FieldByName('id_pes2').AsInteger > 0 then
  begin // Outro titular
    if DM.qyPes.Locate('id', DataSet.FieldByName('id_pes2').AsInteger, []) then
      DataSet.FieldByName('calc_ds_pes').AsString :=
        DM.qyPes.FieldByName('descr').AsString;
  end
  else if DataSet.FieldByName('id_pes').AsInteger > 0 then
}
  if DM.qyPes.Locate('id', DataSet.FieldByName('id_pes').AsInteger, []) then
    DataSet.FieldByName('calc_ds_pes').AsString :=
      DM.qyPes.FieldByName('descr').AsString;

  if dataset['dt_alt'] = null then dataset['calc_dt_alt']:= dataset['dt_inc']
  else dataset['calc_dt_alt']:= dataset['dt_alt'];
end;

procedure TDM.QYFERCalcFields(DataSet: TDataSet);
begin
  // qyFer.FieldByName('diasem').AsString:= dia_semana[dayofweek(qyFer.FieldByName('data').AsDateTime)];
end;

procedure TDM.DATASETAfterClose(DataSet: TDataSet);
begin
  //A partir de 10/07/2024 é obrigado a informar a SQL de abertura da tabela
  //ela sempre é limpa no fechamento, pois acabava ficando resíduo e dava erros indefinidos
  //showmessage(TFDQuery(Dataset).Name  + ': ' + TFDQuery(Dataset).SQL.Text );
  TFDQuery(Dataset).SQL.Clear; //
end;

procedure TDM.QYMOVagenciaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataAGencia(Sender.AsString);

end;

procedure TDM.QYMOVCalcFields(DataSet: TDataSet);
var
  st: string;
begin
  if Dataset.State  in [dsInsert] then  Exit;
  if DataSet['st_fim'] = 'X' then Exit;

  if DataSet.FieldByName('vl_efe').AsFloat > 0 then
    DataSet.FieldByName('calc_valorDC').AsFloat :=
      DataSet.FieldByName('vl_efe').AsFloat
  else
    DataSet.FieldByName('calc_valorDC').AsFloat :=
      DataSet.FieldByName('vl_bas').AsFloat;

  if DataSet.FieldByName('nt_reg').AsString = cNTDEB then
    DataSet.FieldByName('calc_valorDC').AsFloat :=
      -DataSet.FieldByName('calc_valorDC').AsFloat;

  DataSet.FieldByName('calc_idif').AsString := DataSet.FieldByName('id')
    .AsString + '-' + DataSet.FieldByName('st_ini').AsString + '/' +
    DataSet.FieldByName('st_fim').AsString;

  if DM.qyUni.Locate('id', DataSet.FieldByName('id_uni').AsInteger, []) then
  begin
    DataSet.FieldByName('calc_ds_uni').AsString :=
      DM.qyUni.FieldByName('descr').AsString;
    DataSet.FieldByName('calc_uf_uni').AsString :=
      DM.qyUni.FieldByName('uf').AsString;
    //DataSet.FieldByName('calc_nivel_uni').AsInteger :=
      //DM.qyUni.FieldByName('nivel').AsInteger;
  end;

  if DataSet.FieldByName('id_eve').AsInteger > 0 then
    if DM.qyEVE.Locate('id', DataSet.FieldByName('id_eve').AsInteger, []) then
      DataSet.FieldByName('calc_ds_eve').AsString :=
        DM.qyEVE.FieldByName('descr').AsString;

  if DataSet.FieldByName('id_pes').AsInteger > 0 then begin
    with DM.qyPes do begin
      if Locate('id', DataSet.FieldByName('id_pes').AsInteger, []) then begin
        st := FieldByName('descr').AsString;
        if length(DataSet.FieldByName('banco').AsString) >= 3 then
          if DataSet.FieldByName('banco').AsString <> '001' then begin
            if FieldByName('tp_ins').AsInteger = cTipoCNPJ then
              st := st + ' (CNPJ: '
            else
              st := st + ' (CPF: ';

            st := st + formataNRINS(FieldByName('nr_ins').AsString,
              FieldByName('tp_ins').AsInteger) + ')';
          end;
        DataSet.FieldByName('calc_ds_pes').AsString := st;
        DataSet['calc_tp_ins']:= fieldvalues['tp_ins'];
      end;
    end;
  end;
  if DataSet.FieldByName('id_tpd').AsInteger > 0 then
    if DM.qyTPD.Locate('id', DataSet.FieldByName('id_tpd').AsInteger, []) then
      DataSet.FieldByName('calc_ds_tpd').AsString :=
        DM.qyTPD.FieldByName('descr').AsString;

  // if Dataset.FieldByName('valor').AsFloat > 0 then Dataset.FieldByName('valor_c').AsFloat:= Dataset.FieldByName('valor').AsFloat;
  // if Dataset.FieldByName('valor').AsFloat < 0 then Dataset.FieldByName('valor_d').AsFloat:= Dataset.FieldByName('valor').AsFloat;

  if DataSet.FieldByName('tp_conta').AsInteger > 0 then
    if DM.qyTCB.Locate('id', DataSet.FieldByName('tp_conta').AsInteger, []) then
      DataSet.FieldByName('calc_ds_tp_conta').AsString :=
        DM.qyTCB.FieldByName('sigla').AsString;

  //st:= vartostr(DataSet['id']);
  st:= vartostr(DataSet['descr']);
  if not varisnull(DataSet['perio_ini']) then begin
    if st <> '' then st:= st + ' - ';
    if DataSet['perio_ini'] <> null then
      st:= st + 'DE ' + formatdatetime('dd/mm/yy', DataSet['perio_ini']);
    if DataSet['perio_fim'] <> null then
      st:= st + ' A ' + formatdatetime('dd/mm/yy', DataSet['perio_fim'])
  end;
  DataSet['calc_descr']:= st;

  st:= vartostr(dataset['id']);
  if vartostr(dataset['tp_mov']) <> cTipoAvulso then
    st:= st + '/' + vartostr(dataset['id_ctr']);
  dataset['idfull']:= st;

end;

procedure TDM.QYMOVnr_contaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataNrConta(Sender.AsString);

end;

procedure TDM.QYMOVnr_docGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataNrDoc(Sender.AsString);
end;

function TDM.retTipoConta(tipo: integer): String;
begin
  result := '';
  if tipo > 0 then
  begin
    if tipo = 1 then
      result := cTipoCC
    else
      result := cTipoCP;
  end;

end;

end.
