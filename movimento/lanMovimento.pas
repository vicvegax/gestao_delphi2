unit lanMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.Buttons, valEdit, contaEdit, agenciaEdit,
  bancoEdit, zeroEdit, Vcl.ExtCtrls, strUtils, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxDBExtLookupComboBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, valorEdit, DateUtils;

type
  TflanMov = class(TForm)
    Label1: TLabel;
    edIDUNI: TzeroEdit;
    Label3: TLabel;
    edDTVEN: TcxDateEdit;
    Label4: TLabel;
    edVLBAS: TvalorEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edOBS: TMemo;
    btConf: TBitBtn;
    edDESCR: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    cbIDTPD: TcxLookupComboBox;
    btCancelar: TBitBtn;
    Label13: TLabel;
    cbCOMPT: TComboBox;
    chLiquidaDesativado: TCheckBox;
    edIDEVE: TMaskEdit;
    edCOMPT: TMaskEdit;
    lbNTREG: TLabel;
    edIDPES: TMaskEdit;
    edPTUNI: TzeroEdit;
    edIDTPD: TzeroEdit;
    Label17: TLabel;
    edNRDOC: TEdit;
    cbIDUNI: TcxLookupComboBox;
    cbIDPES: TcxLookupComboBox;
    lbPARC: TLabel;
    edQTPAR: TcxSpinEdit;
    lbINFO: TLabel;
    pnBanco: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    edBanco: TbancoEdit;
    edAgencia: TagenciaEdit;
    edNrConta: TcontaEdit;
    cbTpConta: TComboBox;
    pnPerio: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    edPerioIni: TcxDateEdit;
    Label21: TLabel;
    edPerioFim: TcxDateEdit;
    edIDCNT: TzeroEdit;
    cbIDCNT: TcxLookupComboBox;
    lbInicio: TLabel;
    edQtPar2: TcxSpinEdit;
    lbTotal: TLabel;
    lbQTPAR: TLabel;
    edQTPAR3: TcxSpinEdit;
    lbDIAUTILv: TLabel;
    gvRepo: TcxGridViewRepository;
    gvIDEVE: TcxGridDBTableView;
    evDESCR: TcxGridDBColumn;
    evCOD: TcxGridDBColumn;
    evNT: TcxGridDBColumn;
    cbIDEVE: TcxExtLookupComboBox;
    edTP: TcxGridDBColumn;
    chDIV: TCheckBox;
    chZero: TCheckBox;
    chsempreREPete: TCheckBox;
    chrcus: TCheckBox;
    chreve: TCheckBox;
    chrfav: TCheckBox;
    chrven: TCheckBox;
    chrvld: TCheckBox;
    chrcompt: TCheckBox;
    chrtpd: TCheckBox;
    chsrdes: TCheckBox;
    chsrobs: TCheckBox;
    chDiaUtil: TCheckBox;
    chrbco: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfClick(Sender: TObject);
    procedure cbCOMPTSelect(Sender: TObject);
    procedure edIDPESEnter(Sender: TObject);
    procedure edIDUNIChange(Sender: TObject);
    procedure edIDEVEChange(Sender: TObject);
    procedure edIDPESChange(Sender: TObject);
    procedure cbIDEVEPropertiesEditValueChanged(Sender: TObject);
    procedure edIDPESExit(Sender: TObject);
    procedure edIDEVEExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure edNrContaEnter(Sender: TObject);
    procedure edNrContaExit(Sender: TObject);
    procedure ProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edIDPESKeyPress(Sender: TObject; var Key: Char);
    procedure edIDTPDChange(Sender: TObject);
    procedure edIDTPDExit(Sender: TObject);
    procedure cbIDTPDPropertiesEditValueChanged(Sender: TObject);
    procedure edIDUNIExit(Sender: TObject);
    procedure edPTUNIChange(Sender: TObject);
    procedure edNRDOCKeyPress(Sender: TObject; var Key: Char);
    procedure edNRDOCChange(Sender: TObject);
    procedure edIDEVEClick(Sender: TObject);
    procedure edIDEVEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbIDUNIPropertiesEditValueChanged(Sender: TObject);
    procedure edPTUNIExit(Sender: TObject);
    procedure cbIDPESPropertiesEditValueChanged(Sender: TObject);
    procedure edIDUNIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edIDTPDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAgenciaExit(Sender: TObject);
    procedure edDTVENPropertiesEditValueChanged(Sender: TObject);
    procedure edIDCNTChange(Sender: TObject);
    procedure edIDCNTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbIDCNTPropertiesEditValueChanged(Sender: TObject);
    procedure edQTPARPropertiesEditValueChanged(Sender: TObject);
    procedure cbIDEVEEnter(Sender: TObject);
    procedure evCODCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edCOMPTExit(Sender: TObject);
    procedure chZeroClick(Sender: TObject);
    procedure edPerioIniPropertiesEditValueChanged(Sender: TObject);
    procedure edVLBASChange(Sender: TObject);
  private
    { Private declarations }
  var
    FModoMovimento: Integer;
    FTipoMovimento: Char;
    gIDCTR: Integer;
    filtroQYPES: String;
    filtroQYEVE: String;
    // QYMOV: TFDQuery;
    procedure AtuCaption;
    procedure LimpaCampos;
    procedure AlteraNTREG(NT: String);
    procedure PreInfPes;
    procedure AtivaDadosBco;
    procedure PreCampos;
    procedure cdrUnidade;
    procedure cdrPessoal;
    procedure AtivaCHR(valor: boolean);
    procedure processaAltLote;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Modo: Integer; TipoMovimento: Char;
      idctr, idcnt, iduni, ideve, idpes: Integer); reintroduce; overload;
    constructor Create(AOwner: TComponent; TipoMovimento: Char; idctr: Integer;
      idcnt: Integer; iduni: Integer; ideve: Integer; idpes: Integer;
      dtinc: TDate; qtpar: Integer; inpar: Integer); reintroduce; overload;
    constructor Create(AOwner: TComponent; idmov: Integer);
      reintroduce; overload;
  end;

var
  flanMov: TflanMov;

implementation

{$R *.dfm}

uses modDados, modFuncoes, cdrUnidades, cdrPessoal, dlgAgeFor,
  myMsgAltLote;

procedure TflanMov.AlteraNTREG(NT: String);
begin
  if NT = cNTCRE then
  begin
    lbNTREG.Caption := cDSCRE;
    lbNTREG.Font.Color := corValorC;
  end
  else if NT = cNTDEB then
  begin
    lbNTREG.Caption := cDSDEB;
    lbNTREG.Font.Color := corValorD;
  end
  else
  begin
    lbNTREG.Caption := cDSNAT;
    lbNTREG.Font.Color := corValorN;
  end;
  edVLBAS.Font.Color := lbNTREG.Font.Color;

end;

procedure TflanMov.AtivaCHR(valor: boolean);
var
  i: integer;
  st: string;
begin
  for i := 0 to Self.ControlCount-1 do begin
      if leftstr(self.Controls[i].Name, 3).ToLower = 'chr' then begin
        self.Controls[i].Enabled:= valor;
        TCheckBox(self.Controls[i]).Checked:= not valor;
      end;
  end;
end;

procedure TflanMov.AtivaDadosBco;
var
  FEnabled: Boolean;
begin
  if cbIDTPD.EditValue <> null then
  begin
    FEnabled := (DM.qyTPD.FieldByName('conta').AsInteger = 1);
    edBanco.Enabled := FEnabled;
    edAgencia.Enabled := FEnabled;
    edNrConta.Enabled := FEnabled;
    cbTpConta.Enabled := FEnabled;
    if FEnabled then
    begin
      PreInfPes;
    end
    else
    begin
      edBanco.Clear;
      edAgencia.Clear;
      edNrConta.Clear;
      cbTpConta.ItemIndex := 0;
    end;

  end;
end;

procedure TflanMov.AtuCaption;
begin
  if FTipoMovimento = cTipoContrato then
    Self.Caption := 'Lançamento de um CONTRATO';
  if FTipoMovimento = cTipoAvulso then
    Self.Caption := 'Lançamento AVULSO';
  if FTipoMovimento = cTipoParcela then
    Self.Caption := 'Lançamento PARCELADO';

  if FModoMovimento = modoAlt then // Modo de Alteração
    Self.Caption := Self.Caption + ' - Alteração (ID ' + DM.qymov.FieldByName('id')
      .AsString + ')';
end;

procedure TflanMov.btConfClick(Sender: TObject);
var
  st: string;
  ultpar: Integer;
  qtpar: Integer;
  inipar: Integer;
  incpar: Integer;
  descr: String;
  log: string;
  ValorBase: double;
  qt: Integer;
  chr: boolean;
  DTVEN: TDate;
  CHBCO: boolean;
begin
  st := '';
  if cbIDCNT.EditValue = null then
    st := st + '- Campo "Conta de Movimento" inválido!' + #13#10;
  if cbIDUNI.EditValue = null then
    st := st + '- Campo "Centro de Custo" inválido!' + #13#10;
  if cbIDEVE.EditValue = null then
    st := st + '- Campo "Evento" inválido!' + #13#10;
  if (edDTVEN.EditValue = null) then
    st := st + '- Campo "Data de Vencimento" inválido!' + #13#10;
  if leftstr(edCOMPT.Text, 1) = ' ' then
    st := st + '- Campo "Competência" inválido!' + #13#10;
  if cbIDPES.EditValue = null then
    st := st + '- Campo "Favorecido" inválido! (DÉBITO)' + #13#10;

  if cbIDTPD.EditValue = null then
    st := st + '- Informe o "Tipo de Documento"!' + #13#10
  else begin
    if DM.qyTPD.FieldByName('conta').AsInteger = 1 then begin
      if edBanco.Text = '' then
        st := st + '- Informe o "Banco"!' + #13#10;
      if edAgencia.Text = '' then begin
        st := st + '- Informe a "Agência"!' + #13#10
      end else begin
        //IMPL. UM POUCO ANTES DE 05/02/2024
        if not (rightstr(edagencia.Value,1)[1] in ['0'..'9']) then
          edAgencia.Value:= enchest(edAgencia.Value, '0', 5, kPSESQ);

        if (edBANCO.Text = cBB) or (length(edagencia.Value) = 5) then begin
          //if checaAgencia(edAgencia.Value, edBanco.Value) then begin
          if checaAgencia(edAgencia.Value, cBB) then begin
            edAgencia.Value:= enchest(edAgencia.Value, '0', 5, kPSESQ);
          end else begin
            st := st + ' - **** NÚMERO DA AGÊNCIA INVÁLIDO!!! ****' + #13#10;
          end;
        end else begin
          edAgencia.Value:= enchest(edAgencia.Value, '0', 4, kPSESQ);
        end;
      end;
      //if not checaAgencia(edAgencia.Value, edBanco.Value) then
      //  st := st + ' - **** NÚMERO DA AGÊNCIA INVÁLIDO!!!' + #13#10;
      if edNrConta.Text = '' then
        st := st + '- Informe o "Número da Conta"!' + #13#10
      ELSE if not checaConta(edNrConta.Value, edBanco.Value) then
        st := st + ' - **** NÚMERO DA CONTA INVÁLIDO!!! ****' + #13#10;

      if cbTpConta.ItemIndex <= 0 then
        st := st + '- Informe o "Tipo de Conta"!' + #13#10;
    end;
  end;

  if edVLBAS.Value = 0 then begin
    if not chZero.Checked then st := st + '- Informe um "Valor" ou marque "Valor Zerado"' + #13#10;
  end;

  if st <> '' then begin
    ShowMessage(st);
    exit;
  end;

  if edPerioFim.Date < edPerioIni.Date then begin
    if not perguntaSim('Período Final menor que Período Inicial. Continuar?', 'Período') then begin
      edPerioFim.SetFocus;
      exit;
    end;
  end;

  //verifica o ano de competência com uma margem de 5 anos
  if abs(strtoint(rightstr(edCOMPT.Text, 4)) - yearof(date)) > 5 then begin
    if not perguntasim('Confirma Competência para ' + edCOMPT.Text + '?', 'Competência') then begin
      edCOMPT.SetFocus;
      exit;
    end;
  end;


  DTVEN:= edDTVEN.Date;
  {
  if FTipoMovimento = cTipoAvulso then begin
    if DM.proxDiaUtil(DTVEN) <> DTVEN then begin
      if not perguntaNao('A data de ' + formataData(DTVEN) + ' NÃO É um dia útil! Deseja continuar?', 'DIA NÃO ÚTIL') then begin
        edDTVEN.SetFocus;
        exit;
      end;
    end;
  end;
  }

  //DTVEN:= DM.proxDiaUtil(edDTVEN.Date);
  if DTVEN < date then begin
    st:= 'select count(id) from plmovimento where ' +
         'st_fim = "' + cSTNOR + '" and ' +
         'st_mov <> "' + cMovLiquidado + '" and ' +
         'dt_ven = "' + DataSQL(DTVEN) + '"';
    if DM.DBCON.ExecSQLScalar(st) = 0 then begin

      if not perguntaNao('ATENÇÃO! O dia de ' + formataData(DTVEN) + ' ANTERIOR à Data Atual não possui Registros Agendados. Deseja incluir?', 'DIA ANTERIOR') then begin
        edDTVEN.SetFocus;
        exit;
      end;

    end;
  end;

  ValorBase := edVLBAS.Value;
  if FModoMovimento = 99 then begin // Lançamento da Pl. de Contratos
    qtpar := edQTPAR.Value;
    inipar := edQtPar2.Value;
    ultpar := edQTPAR3.Value;
    st := 'Confirma inclusão de ' + inttostr(qtpar) + ' das ' + edQTPAR3.Text +
      ' parcelas de ' + formataValor(ValorBase) + ' no Total de ' +
      formataValor(qtpar * ValorBase) + '? Serão incluídas as parcela de ' +
      edQtPar2.Text + ' até a ' + inttostr(edQTPAR.Value + edQtPar2.Value
      - 1) + '.';
  end else begin
    qtpar := edQTPAR.Value;
    inipar := 1;
    ultpar := qtpar;
    if chDIV.Checked then
      ValorBase := Trunc(ValorBase / qtpar * 100) / 100;
    st := 'Confirma inclusão de ' + inttostr(qtpar) + ' parcelas de ' +
      formataValor(ValorBase) + ' no Total de ' +
      formataValor(qtpar * ValorBase) + '?';
  end;

  if (edQTPAR.Value > 1) or (edQtPar2.Value > 1) or (edQTPAR3.Value > 1) then begin
    if not perguntaSim(st, 'Lançamento de Parcelas?') then exit;
  end;

  Self.Tag:= 0;
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //>>>>>>>>>>>>>> VERIFICA REGISTROS FUTUROS
  //
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  CHBCO:= false;
  if (DM.QYMOV['tp_conta'] > 0) then begin
    if (Dm.QYMOV['banco'] <> edBanco.Value) or
       (dm.QYMOV['agencia'] <> edAgencia.Value) or
       (dm.QYMOV['nr_conta'] <> edNrConta.Value) or
       (dm.QYMOV['tp_conta'] <> cbTpConta.ItemIndex) then begin
       CHBCO:= true;
       end;
  end;

  chr:= chrcus.checked or chreve.checked or chrfav.checked or chrven.checked or
        chrcompt.checked or chrvld.checked or chrtpd.checked or CHBCO;


  //chr:= False;

  if (FModoMovimento = modoAlt) and (FTipoMovimento <> cTipoAvulso) and CHR then begin
//    if DM.DBCON.ExecSQLScalar('SELECT count(id) FROM `plmovimento` WHERE ' +
    DM.qry.Open('SELECT * FROM `plmovimento` WHERE ' +
      'id_ctr = :ctr and ' +
      'st_fim = "' + cSTNOR + '" and ' +
      'st_mov = "' + cMovAgendado + '" and ' +
      'dt_ven > :dt ORDER BY dt_ven', [DM.qymov['id_ctr'], DM.qymov['dt_ven']]);
    qt:= dm.qry.RecordCount;
    if qt > 1 then begin

      with TfmsgAltLote.Create(Self) do begin
        lbDESCR.Caption:= Format(lbDESCR.Caption, [DM.qry.RecordCount]);
        lbCUS.Visible:= chrcus.checked;
        lbeve.Visible:= chreve.Checked;
        lbfav.Visible:= chrfav.Checked;
        lbven.Visible:= chrven.Checked;
        lbcompt.Visible:= chrcompt.Checked;
        lbvld.Visible:= chrvld.Checked;
        lbtpd.Visible:= chrtpd.Checked;
        lbBco.Visible := CHBCO;
        self.Tag:= showmodal;// Retorna 1-Este, 99-Todos, 2-Cancela
        free;

      end;

      if self.Tag = mrCancel then Self.Tag:= -1;

      //Self.Tag:= -1;
    end;

    if Self.Tag <= 0  then DM.qry.Close;
  end;
  if Self.Tag = -1 then Exit;  //Foi cancelado a Alteração em Lote


  DM.DBCON.StartTransaction;
  //
  //
  //Alteração de Regitros Futuros
  //
  //
  if Self.Tag = 99 then begin
    incpar:= 1;
    while not DM.qry.Eof do begin
////////////////////////////////////////////////////////      DM.criaLog(DM.qry);
      DM.criaLogMov(DM.QYMOV, cSTALT, false); //não vai fechar de imediato
      DM.qry.Edit;
      DM.qry['st_ini'] := cSTALT;
      DM.qry['dt_alt'] := Now;
      DM.qry['us_alt'] := wUsuario;

      if chRCUS.Checked then DM.qry['id_uni']:= cbIDUNI.EditValue;
      if chREVE.Checked then DM.qry['id_eve']:= cbIDEVE.EditValue;
      if chRFAV.Checked then DM.qry['id_pes']:= cbIDPES.EditValue;
      if chRVEN.Checked then begin
        DM.qry['dt_ven_ori'] := incMonth(edDTVEN.Date, incpar);
        if chDiaUtil.Checked then DM.qry['dt_ven'] := DM.proxDiaUtil(DM.qry['dt_ven_ori'])
        else DM.qry['dt_ven']:= DM.qry['dt_ven_ori'];
      end;
      if chRCOMPT.Checked then begin
        if cbCOMPT.ItemIndex < 3 then
          //DM.qry['compt'] := FormatDateTime('mm/yyyy', incMonth(DM.qry['dt_ven_ori'], cbCOMPT.ItemIndex - 1))
          DM.qry['compt'] := FormatDateTime('mm/yyyy', incMonth(DM.qry['dt_ven'], cbCOMPT.ItemIndex - 1))
        else
          DM.qry['compt'] := edCOMPT.Text;
      end;

      if chRVLD.Checked then begin
        DM.qry['vl_bas'] := ValorBase; // edVLBAS.Value;
        DM.qry['nt_reg'] := DM.qyEVE['nt_reg'];
      end;

      //if chRTPD.Checked then begin
        DM.qry['id_tpd'] := cbIDTPD.EditValue;
        if DM.qyTPD.FieldByName('conta').AsInteger = 1 then begin  //Dados Bancarios
          DM.qry['banco'] := edBanco.Value;
          DM.qry['agencia'] := edAgencia.Value;
          DM.qry['nr_conta'] := edNrConta.Value;
          DM.qry['tp_conta'] := cbTpConta.ItemIndex;
        end else begin
          DM.qry['banco'] := '';
          DM.qry['agencia'] := '';
          DM.qry['nr_conta'] := '';
          DM.qry['tp_conta'] := 0;
        end;
        DM.qry['perio_ini']:= null;
        DM.qry['perio_fim']:= null;
        if edPerioIni.EditValue <> null then
          DM.qry['perio_ini'] := edPerioIni.EditValue + incpar * 30;
        if edPerioFim.EditValue <> null then
          DM.qry['perio_fim'] := edPerioFim.EditValue + incpar * 30;

      //end;

////////////////////////////////////////////////////////      log := DM.preparaLog(DM.qry);
////////////////////////////////////////////////////////      DM.adicionaLog(DM.qry, lotAltLote, log);

      DM.qry.Post;
      incpar:= incpar+1;
      DM.qry.Next;
    end;
//    DM.qymov_aud.Close
    DM.qry.Close;
  end;

  //
  //
  // Inclusão/Alteração PADRÃO
  //
  //
  incpar := 0;
  DM.QYMOV.OnCalcFields:= nil;
  with DM.qymov do begin
    while incpar < qtpar do begin

      descr := edDESCR.Text;
      if (FModoMovimento = modoInc) or (FModoMovimento = 99) then begin // Inclusão
        descr := stringreplace(edDESCR.Text, '%PARCELA', 'PARCELA %N DE %T',
          [rfReplaceAll, rfIgnoreCase]);
        descr := stringreplace(descr, '%n', inttostr(inipar + incpar),
          [rfReplaceAll, rfIgnoreCase]);
        descr := stringreplace(descr, '%t', inttostr(ultpar),
          [rfReplaceAll, rfIgnoreCase]);
        Append;
        FieldByName('tp_mov').AsString := FTipoMovimento;
        FieldByName('us_inc').AsInteger := wUsuario;
        FieldByName('dt_inc').AsDateTime := Now;
        if FTipoMovimento = cTipoAvulso then begin
          FieldByName('st_ini').AsString := cSTNOR;
          FieldByName('st_fim').AsString := cSTNOR;
        end else begin
          FieldByName('st_ini').AsString := cSTPEN;
          FieldByName('st_fim').AsString := cSTPEN;
        end;
        FieldByName('id_ctr').AsInteger := gIDCTR;

        FieldByName('qt_parc').AsInteger := qtpar;
        FieldByName('nr_parc').AsInteger := inipar + incpar;

      end else begin // Alteração
////////////////////////////////////////////////////////        DM.criaLog(DM.qymov);
        DM.criaLogMov(DM.QYMOV, cSTALT);
        Edit;
        FieldByName('st_ini').AsString := cSTALT;
        FieldByName('dt_alt').AsDateTime := Now;
        FieldByName('us_alt').AsInteger := wUsuario;
      end;
      FieldByName('st_mov').AsString := cMovAgendado;
      FieldByName('id_cnt').AsInteger := cbIDCNT.EditValue;
      FieldByName('id_uni').AsInteger := cbIDUNI.EditValue;
      FieldByName('id_EVE').AsInteger := cbIDEVE.EditValue;

      FieldByName('dt_ven_ori').AsDateTime := incMonth(edDTVEN.Date, incpar);
      if chDiaUtil.Checked then FieldByName('dt_ven').AsDateTime := DM.proxDiaUtil(FieldByName('dt_ven_ori').AsDateTime)
      else FieldByName('dt_ven').AsDateTime := FieldByName('dt_ven_ori').AsDateTime;
      if cbCOMPT.ItemIndex < 3 then
        //FieldByName('compt').AsString := FormatDateTime('mm/yyyy', incMonth(FieldByName('dt_ven_ori').AsDateTime, cbCOMPT.ItemIndex - 1))
        FieldByName('compt').AsString := FormatDateTime('mm/yyyy', incMonth(FieldByName('dt_ven').AsDateTime, cbCOMPT.ItemIndex - 1))
      else
        FieldByName('compt').AsString := edCOMPT.Text;

      FieldByName('vl_bas').AsFloat := ValorBase; // edVLBAS.Value;
      FieldByName('nt_reg').AsString := DM.qyEVE.FieldByName('nt_reg').AsString;

      FieldByName('id_pes').AsInteger := cbIDPES.EditValue;

      FieldByName('descr').AsString := descr; // edDESCR.Text;
      FieldByName('obs').AsString := edOBS.Lines.Text;

      FieldByName('nr_doc').AsString := soNumero(edNRDOC.Text);

      FieldByName('id_tpd').AsInteger := cbIDTPD.EditValue;
      if DM.qyTPD.FieldByName('conta').AsInteger = 1 then begin
        FieldByName('banco').AsString := edBanco.Value;
        FieldByName('agencia').AsString := edAgencia.Value;
        FieldByName('nr_conta').AsString := edNrConta.Value;
        FieldByName('tp_conta').AsInteger := cbTpConta.ItemIndex;
      end else begin
        FieldByName('banco').AsString := '';
        FieldByName('agencia').AsString := '';
        FieldByName('nr_conta').AsString := '';
        FieldByName('tp_conta').AsInteger := 0;
      end;
      FieldValues['perio_ini']:= null;
      FieldValues['perio_fim']:= null;
      if edPerioIni.EditValue <> null then
        FieldByName('perio_ini').AsVariant := edPerioIni.EditValue +
          incpar * 30;
      if edPerioFim.EditValue <> null then
        FieldByName('perio_fim').AsVariant := edPerioFim.EditValue +
          incpar * 30;

      if FModoMovimento = modoAlt then begin
////////////////////////////////////////////////////////        log := DM.preparaLog(DM.qymov);
////////////////////////////////////////////////////////        DM.adicionaLog(DM.qymov, logAlterado, log);
      end;
      Post;
      inc(incpar);
      if Self.Tag = 0 then
        if FModoMovimento = modoInc then
          Self.Tag := DM.DBCON.ExecSQLScalar('SELECT LAST_INSERT_ID()');
    end;
  end;
  DM.DBCON.Commit;
  DM.QYMOV.OnCalcFields:= DM.QYMOVCalcFields;
  if DM.QYMOV_aud.Active then dm.qymov_aud.Close; //se for mais de uma alteração, fecha a tabela agora

  ModalResult := mrOk;
end;

procedure TflanMov.cbCOMPTSelect(Sender: TObject);
begin
  chRCOMPT.Checked:= true;
  edCOMPT.EditMask := '99/9999;1;_';
  edCOMPT.Text := '';
  if cbCOMPT.ItemIndex < 3 then begin
    if edDTVEN.EditValue <> null then
      edCOMPT.Text := FormatDateTime('mm/yyyy', incMonth(edDTVEN.Date, cbCOMPT.ItemIndex - 1));
    edCOMPT.Enabled := False;
  end else begin
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

procedure TflanMov.cbIDCNTPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDCNT.Tag = 0 then
  begin // permite o OnChange
    edIDCNT.Tag := 1; // DESATIVA o OnChange
    edIDCNT.Text := '';
    if DM.qyCNT.Locate('id', cbIDCNT.EditValue, []) then
    begin
      edIDCNT.Text := DM.qyCNT.FieldByName('cod').AsString;
    end;
    edIDCNT.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanMov.cbIDEVEEnter(Sender: TObject);
begin
  // cbIDEVE.SelectAll;
  // cbIDEVE.DroppedDown:= True;
end;

procedure TflanMov.cbIDEVEPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDEVE.Tag = 0 then begin // permite o OnChange
    chREVE.Checked:= true;
    edIDEVE.Tag := 1; // DESATIVA o OnChange
    edIDEVE.Text := '';
    AlteraNTREG(cNTNEU);
    if DM.qyEVE.Locate('id', cbIDEVE.EditValue, []) then
    begin
      edIDEVE.Text := DM.qyEVE.FieldByName('cod').AsString;
      AlteraNTREG(DM.qyEVE.FieldByName('nt_reg').AsString);
    end;
    edIDEVE.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanMov.cbIDPESPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDPES.Tag = 0 then
  begin // permite o OnChange
    chRFAV.Checked:= true;
    edIDPES.Tag := 1; // DESATIVA o OnChange
    edIDPES.Text := '';
    if DM.qyPES.Locate('id', cbIDPES.EditValue, []) then begin
      PreInfPes;
      edIDPES.Text := DM.qyPES.FieldByName('nr_ins').AsString;
    end;
    edIDPES.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanMov.cbIDTPDPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDTPD.Tag = 0 then
  begin // permite o OnChange
    edIDTPD.Tag := 1; // DESATIVA o OnChange
    edIDTPD.Value := '';
    if DM.qyTPD.Locate('id', cbIDTPD.EditValue, []) then
    begin
      chRTPD.Checked:= true;
      edIDTPD.Value := DM.qyTPD.FieldByName('cod').AsString;
      AtivaDadosBco;
    end;
    edIDTPD.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanMov.cbIDUNIPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDUNI.Tag = 0 then
  begin // permite o OnChange
    edIDUNI.Tag := 1; // DESATIVA o OnChange
    edIDUNI.Value := '';
    if DM.qyUNI.Locate('id', cbIDUNI.EditValue, []) then begin
      chRCUS.Checked:= True;
      edIDUNI.Value := DM.qyUNI.FieldByName('cod').AsString;
      edPTUNI.Value := DM.qyUNI.FieldByName('ponto').AsString;
    end;
    edIDUNI.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanMov.cdrPessoal;
var
  iTPINS: Integer;
  iTPPES: Integer;
  // sTPPES: String;
  sTPINS: String;
  sNRINS: String;
begin
  if length(edIDPES.Text) = 14 then
  begin
    iTPINS := cTipoCNPJ;
    // sTPPES:= 'Fornecedor';
    sTPINS := 'CNPJ';
  end
  else
  begin
    iTPINS := cTipoCPF;
    // sTPPES:= 'Documento';
    sTPINS := 'CPF';
  end;
  sNRINS := formataNRINS(soNumero(edIDPES.Text), iTPINS);

  with TfdlgAgeFor.Create(Self, iTPINS, sTPINS + ': ' + sNRINS) do
  begin
    iTPPES := ShowModal;
    Free;
  end;
  if iTPPES = idCancel then
  begin
    edIDPES.SetFocus;
    edIDPES.SelectAll;
    exit;
  end;
  iTPPES := 100 - iTPPES;
  // Retorna 100 - Agente, 99 - Fornecedor  e Transf. em 0 e 1

  with TfcdrPessoal.Create(Self, iTPPES) do
  begin
    cbTPINS.ItemIndex := iTPINS;
    cbTPINSSelect(nil);
    edNRINS.Text := soNumero(edIDPES.Text);
    // edPonto.Text:= edPTUNI.Value;
    if ShowModal = mrOk then
    begin // Cadastrado
      with DM.qyPES do
      begin
        DM.DBCON.StartTransaction;
        Append;
        FieldByName('tp_pes').AsInteger := iTPPES;
        FieldByName('tp_ins').AsInteger := iTPINS;
        FieldByName('nr_ins').AsString := soNumero(edIDPES.Text);
        if iTPPES = cTipoAgente then
        begin
          FieldByName('cod').AsString := edCod.Text;
          FieldByName('id_uni').AsInteger := cbIDUNI.EditValue;
        end;
        FieldByName('descr').AsString := edDESCR.Text;
        FieldByName('banco').AsString := edBanco.Value;
        FieldByName('agencia').AsString := edAgencia.Value; // , 'X');
        FieldByName('nr_conta').AsString := edNrConta.Value; // , 'X');
        // FieldByName('tp_conta').AsString:= cTipoCC;
        // if cbTPCNT.ItemIndex = 1 then FieldByName('tp_conta').AsString:= cTipoCP;
        FieldByName('tp_conta').AsInteger := cbTPCNT.ItemIndex;

        FieldByName('fone1').AsString := edfone1.Value;
        FieldByName('fone2').AsString := edfone2.Value;
        FieldByName('email').AsString := edemail.Text;
        // FieldByName('local').AsString:= edLocal.Text;
        // FieldByName('uf').AsString:= cbUF.Text;
        FieldByName('obs').AsString := edOBS.Text;
        FieldByName('ativo').AsInteger := 1;
        FieldByName('us_inc').AsInteger := wUsuario;
        FieldByName('dt_inc').AsDateTime := Now;
        Post;
        DM.DBCON.Commit;
        Last;
        cbIDPES.Tag := 1;
        cbIDPES.EditValue := FieldByName('id').AsInteger;
        cbIDPES.Tag := 0;
        Self.edBanco.Value := FieldByName('banco').AsString;
        Self.edAgencia.Value := FieldByName('agencia').AsString;
        Self.edNrConta.Value := FieldByName('nr_conta').AsString;
      end;
      // ShowMessage('Cadastro realizado!');
      ProxFocus;
    end
    else
    begin
      edIDPES.SetFocus;
      edIDPES.SelectAll;
      cbIDPES.Tag := 1; //
    end;
    Free;
  end;

end;

procedure TflanMov.cdrUnidade;
begin
  if Application.MessageBox(PWideChar('Unidade "' + edIDUNI.Value +
    '" não existe. Deseja cadastrá-la?'), 'Nova Unidade',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    edIDUNI.SetFocus;
    exit;
  end;

  with TfcdrUnidades.Create(Self) do
  begin
    edCod.Text := edIDUNI.Value;
    edPonto.Text := edPTUNI.Value;
    if ShowModal = mrOk then begin // Cadastrado
      DM.DBCON.StartTransaction;
      DM.qyUNI.Append;
      DM.qyUNI.FieldByName('cod').AsString := edCod.Text;
      DM.qyUNI.FieldByName('ponto').AsString := edPonto.Text;
      DM.qyUNI.FieldByName('descr').AsString := edDESCR.Text;
      DM.qyUNI.FieldByName('local').AsString := edLocal.Text;
      DM.qyUNI.FieldByName('uf').AsString := cbUF.Text;
      DM.qyUNI.FieldByName('obs').AsString := edOBS.Text;
      DM.qyUNI.FieldByName('ativo').AsInteger := 1;
      DM.qyUNI.FieldByName('us_inc').AsInteger := wUsuario;
      // DM.qyUni.FieldByName('dt_inc').AsDateTime:= Now;
      DM.qyUNI.Post;
      DM.DBCON.Commit;
      DM.qyUNI.Last;
      // cbIDUNI.Properties
      // edIDUNI.Tag:= 0; //ativa OnChange
      // edDSUNI.Tag:= DM.qyUni.FieldByName('id').AsInteger;
      // edDSUNI.Text:= DM.qyUni.FieldByName('descr').AsString;
      cbIDUNI.Tag := 1;
      edIDUNI.Value := DM.qyUNI.FieldByName('cod').AsString;
      edPTUNI.Value := DM.qyUNI.FieldByName('ponto').AsString;
      cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
      cbIDUNI.Tag := 0;
      // ShowMessage('Cadastro realizado!');
      edIDEVE.SetFocus;
    end else begin
      edIDUNI.SetFocus;
      edIDUNI.SelectAll;
      cbIDUNI.Tag := 1; //
    end;
    Free;
  end;
end;

procedure TflanMov.chZeroClick(Sender: TObject);
begin
  chRVLD.Checked:= true;
  edVLBAS.Value := 0;
  edVLBAS.Enabled := not chZero.Checked;
end;

constructor TflanMov.Create(AOwner: TComponent; TipoMovimento: Char;
  idctr, idcnt, iduni, ideve, idpes: Integer; dtinc: TDate; qtpar: Integer;
  inpar: Integer);
begin
  // Criado pela Pl. de Contratos
  inherited Create(AOwner); // Criação com Base em data de incorporação
  FModoMovimento := 99; // Modo Exclusivo
  FTipoMovimento := TipoMovimento;

  // QYMOV:= qry;
  gIDCTR := idctr; // id do contrato, 0 para avulso - 04/08/2023
  if idcnt > 0 then begin
    cbIDCNT.EditValue := idcnt;
    edIDCNT.Enabled := False;
    cbIDCNT.Enabled := False;
  end;

  if iduni > 0 then begin
    cbIDUNI.EditValue := iduni;
    edIDUNI.Enabled := False;
    edPTUNI.Enabled := False;
    cbIDUNI.Enabled := False;
  end;
  if ideve > 0 then begin
    cbIDEVE.EditValue := ideve;
    edIDEVE.Enabled := False;
    cbIDEVE.Enabled := False;
  end;
  if idpes > 0 then begin
    cbIDPES.EditValue := idpes;
    //edIDPES.Enabled := False;
    //cbIDPES.Enabled := False;
  end;

  with DM do begin
    filtroQYPES:= '';
    if qypes.Filtered then filtroQYPES:= qypes.Filter;

    //qyPES.Filter := 'ativo >= 0';
    //qyPES.Filtered := True; // esta aberta an Pl. Mov

    filtroQYEVE:= '';
    if qyEVE.Filtered then filtroQYEVE:= qyEVE.Filter;
    qyEVE.Filter := '(ativo = 1) and (rgtCod <> ''00'')';
    qyEVE.Filtered := True; // esta aberta an Pl. Mov
  end;

  Self.Caption := 'Lançamento de ' + inttostr(qtpar) + ' Parcelas';
  ativachr(false);
  LimpaCampos;

  lbInicio.Visible := True; // invisivel por padrao
  edQtPar2.Visible := True;
  edQtPar2.Value := inpar;

  lbTotal.Visible := True;
  edQTPAR3.Value := qtpar;
  edQTPAR3.Visible := True;
  // lbQtParc.Caption:= Inttostr(qtpar-inpar+1) + ' PARCELA(S)';
  // lbQtParc.Visible:= true;
  // edQtPar.Enabled:= False;
  // edQtPar2.Enabled:= False;
  if qtpar > 1 then
    edDESCR.Text := '%PARCELA';
  if dtinc > 0 then begin
    edDTVEN.Date := dtinc;
    edDTVEN.Enabled := False;
  end;
  lbQTPAR.Caption := 'Serão geradas ' + inttostr(qtpar) + ' parcelas!';

  chDiautil.Checked:= False;
  chDiaUtil.Enabled:= false;
end;

constructor TflanMov.Create(AOwner: TComponent; Modo: Integer;
  TipoMovimento: Char; idctr: Integer; idcnt: Integer; iduni: Integer;
  ideve: Integer; idpes: Integer);

var
  FEnabled: Boolean;
begin

  // Criado pela Pl. de Movimento  e Parcelamento
  inherited Create(AOwner); // Criação Padrão
  LimpaCampos;

  FModoMovimento := Modo; // 1=Inclusão, 2=Alteração
  FTipoMovimento := TipoMovimento;

  // QYMOV:= qry;
  gIDCTR := idctr; // id do contrato, 0 para avulso - 04/08/2023

  with DM do begin
    filtroQYPES:= '';
    if qypes.Filtered then filtroQYPES:= qypes.Filter;

    //qyPES.Filter := 'ativo >= 0';
    //qyPES.Filtered := True; // esta aberta an Pl. Mov

    filtroQYEVE:= '';
    if qyEVE.Filtered then filtroQYEVE:= qyEVE.Filter;
    qyEVE.Filter := '(ativo = 1) and (rgtCod <> ''00'')';
    qyEVE.Filtered := True; // esta aberta an Pl. Mov
  end;
  chDIV.Visible := (FTipoMovimento = cTipoParcela) and
    (FModoMovimento = modoInc);
  if FModoMovimento = modoAlt then begin // Modo de Alteração
    // chRep.Checked:= False;
    // chRep.Enabled:= False;
    edQTPAR.Enabled := False;
    edQTPAR.Visible := False;
    lbPARC.Visible := False;
    PreCampos;
    ativachr(DM.QYMOV['tp_mov'] <> cTipoAvulso );
  end else begin
    ativachr(false);
   // end else begin //Modo de Inclusão
  end;


  FEnabled := (FModoMovimento = modoInc) and (FTipoMovimento = cTipoAvulso);
  if (idcnt > 0) then begin
    cbIDCNT.EditValue := idcnt;
    edIDCNT.Enabled := FEnabled;
    cbIDCNT.Enabled := FEnabled;
  end;

  if iduni > 0 then begin
    cbIDUNI.EditValue := iduni;
    edIDUNI.Enabled := FEnabled;
    edPTUNI.Enabled := FEnabled;
    cbIDUNI.Enabled := FEnabled;
  end;

  if ideve > 0 then begin
    cbIDEVE.EditValue := ideve;
    // if gTPMOV <>  cTipoAvulso then begin
    // edIDEVE.Enabled:= FEnabled;
    // cbIDEVE.Enabled:= FEnabled;
    // end;
  end;

  if idpes > 0 then begin
    cbIDPES.EditValue := idpes;
  end;


  if FTipoMovimento = cTipoAvulso then begin
    edQTPAR.Visible := False;
    lbPARC.Visible := False;
  end;

  AtuCaption;

  //if FTipoMovimento then

  chDiautil.Checked:= (FTipoMovimento = cTipoAvulso);
  chDiaUtil.Enabled:= (FTipoMovimento = cTipoAvulso);
end;

procedure TflanMov.evCODCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  st: string;
begin
  st := leftstr(AViewInfo.Value, 1);
  if st = '1' then
    ACanvas.Font.Color := clRed
  else if st = '2' then
    ACanvas.Font.Color := clBlue;
end;

procedure TflanMov.edAgenciaExit(Sender: TObject);
begin
  //Será usado o Calculo Módulo 11 como Padrão!!!! - (09/01/2024)
  //Agência devem ter 4 digitos (sem o DV) ou os 5 digitos (com DV) completos
  if edAgencia.Value <> '' then begin
    if not (rightstr(edagencia.Value,1)[1] in ['0'..'9']) then
      edAgencia.Value:= enchest(edAgencia.Value, '0', 5, kPSESQ);

    if (edBANCO.Text = cBB) or (length(edagencia.Value) = 5) then begin
      //if checaAgencia(edAgencia.Value, edBanco.Value) then begin
      if checaAgencia(edAgencia.Value, cBB) then begin
        edAgencia.Value:= enchest(edAgencia.Value, '0', 5, kPSESQ);
      end else begin
        MsgErro('Número da Agência inválido! (Cálculo Módulo 11)');
        edAgencia.SetFocus;
      end;
    end else begin
      edAgencia.Value:= enchest(edAgencia.Value, '0', 4, kPSESQ);
    end;
  end;

end;

procedure TflanMov.edCOMPTExit(Sender: TObject);
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
  end else if cbCOMPT.ItemIndex = 5 then begin // TRIMESTRE
    if (st[1] = ' ') or (strtoint(st[1]) = 0) or (strtoint(st[1]) > 4) then
      edCOMPT.Text := ''
    else begin
      if not TryStrToDate('01/01/' + soNumero(rightstr(edCOMPT.Text, 4)), dt) then
        edCOMPT.Text := ''
      else
        edCOMPT.Text := leftstr(edCOMPT.Text, 5) + FormatDateTime('yyyy', dt);
    end;

  end else if cbCOMPT.ItemIndex = 6 then begin // SEMESTRE
    if (st[1] = ' ') or (strtoint(st[1]) = 0) or (strtoint(st[1]) > 2) then
      edCOMPT.Text := ''
    else begin
      if not TryStrToDate('01/01/' + soNumero(rightstr(edCOMPT.Text, 4)), dt) then
        edCOMPT.Text := ''
      else
        edCOMPT.Text := leftstr(edCOMPT.Text, 4) + FormatDateTime('yyyy', dt);
    end;

  end;

end;

procedure TflanMov.edDESCRKeyPress(Sender: TObject; var Key: Char);
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

procedure TflanMov.edDTVENPropertiesEditValueChanged(Sender: TObject);
begin
  chrVEN.Checked:= True;
  if cbCOMPT.ItemIndex < 3 then
    if edDTVEN.EditValue <> null then
      edCOMPT.Text := FormatDateTime('mm/yyyy',
        incMonth(edDTVEN.Date, cbCOMPT.ItemIndex - 1))
    else
      edCOMPT.Text := '';

end;

procedure TflanMov.ProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then begin
    Key := #0;
    ProxFocus;
  end;
end;

procedure TflanMov.edIDCNTChange(Sender: TObject);
begin
  if edIDCNT.Tag = 0 then
  begin // permite o OnChange
    cbIDCNT.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDCNT.Clear;
    if length(edIDCNT.Text) > 0 then
    begin
      if DM.qyCNT.Locate('cod', edIDCNT.Text, []) then
      begin
        cbIDCNT.EditValue := DM.qyCNT.FieldByName('id').AsInteger;
        cbIDCNT.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end
    else
    begin // campo está vazio
      cbIDCNT.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TflanMov.edIDCNTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyCNT;
  ok := False;
  if (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    if qry.RecordCount > 0 then
    begin
      ok := True;

      if TCustomEdit(Sender).Text = '' then
        qry.First
      else
      begin
        if Key = VK_DOWN then
        begin
          if not qry.Eof then
            qry.Next
          else
            qry.First;
        end
        else
        begin // VK_DWON
          if not qry.Bof then
            qry.Prior
          else
            qry.Last;
        end;
      end;
    end;
  end;

  if ok then
  begin
    desativatags([edIDCNT, cbIDCNT]);
    edIDCNT.Text := qry.FieldByName('cod').AsString;
    cbIDCNT.EditValue := qry.FieldByName('id').AsInteger;
    ativatags([edIDCNT, cbIDCNT]);

  end;
end;

procedure TflanMov.edIDEVEChange(Sender: TObject);
var
  iSelStart: Integer;
begin
  if edIDEVE.Tag = 0 then
  begin // permite o OnChange
    cbIDEVE.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    AlteraNTREG(cNTNEU);
    cbIDEVE.Clear;
    if length(edIDEVE.Text) > 0 then
    begin
      if DM.qyEVE.Locate('cod', edIDEVE.Text, [loPartialKey]) then begin
        chREVE.Checked:= true;
        cbIDEVE.EditValue := DM.qyEVE.FieldByName('id').AsInteger;
        cbIDEVE.Tag := 2; // confirma que localizou, usado no OnExit
        AlteraNTREG(DM.qyEVE.FieldByName('nt_reg').AsString);
        edIDEVE.Tag := 1; // DESATIVA onChange
        iSelStart := edIDEVE.SelStart;
        edIDEVE.Text := DM.qyEVE.FieldByName('cod').AsString;
        edIDEVE.SelStart := iSelStart;
        edIDEVE.SelLength := 1;
        edIDEVE.Tag := 0; // ATIVA onChange
        cbIDEVE.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end
    else
    begin // campo está vazio
      cbIDEVE.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TflanMov.edIDEVEClick(Sender: TObject);
begin
  if edIDEVE.Text = '' then
    edIDEVE.SelStart := 0;

end;

procedure TflanMov.edIDEVEExit(Sender: TObject);
begin
  edIDEVE.Tag := 1; // DESATIVA o OnChange
  if cbIDEVE.Tag = 2 then // se localizou
    edIDEVE.Text := DM.qyEVE.FieldByName('cod').AsString // preenche o campo
  else if cbIDEVE.Tag = 1 then // não foi localizado
    edIDEVE.Clear; // limpa o campo
  cbIDEVE.Tag := 0; // Ativa o OnChange
  edIDEVE.Tag := 0; // Ativa o OnChange

end;

procedure TflanMov.edIDEVEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyEVE;
  ok := False;
  if (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    if qry.RecordCount > 0 then
    begin
      ok := True;

      if TMaskEdit(Sender).Text = '' then
        qry.First
      else
      begin
        if Key = VK_DOWN then
        begin
          if not qry.Eof then
            qry.Next
          else
            qry.First;
        end
        else
        begin // VK_UP
          if not qry.Bof then
            qry.Prior
          else
            qry.Last;
        end;
      end;
    end;
  end;

  if ok then
  begin
    desativatags([edIDEVE, cbIDEVE]);
    edIDEVE.Text := qry.FieldByName('cod').AsString;
    cbIDEVE.EditValue := qry.FieldByName('id').AsInteger;
    AlteraNTREG(DM.qyEVE.FieldByName('nt_reg').AsString);
    ativatags([edIDEVE, cbIDEVE]);

  end;
  // qry:= nil;
end;

procedure TflanMov.edIDPESChange(Sender: TObject);
begin
  if edIDPES.Tag = 0 then
  begin // If OnChange Ativado
    chRFAV.Checked:= true;
    cbIDPES.Tag := 1; // desativa OnChange - nao encontrado
    edBanco.Clear;
    edAgencia.Clear;
    edNrConta.Clear;
    cbIDPES.Clear;
    if length(edIDPES.Text) > 0 then
    begin
      if DM.qyPES.Locate('nr_ins', edIDPES.Text, [loPartialKey]) then
      begin
        cbIDPES.EditValue := DM.qyPES.FieldByName('id').AsInteger;
        cbIDPES.Tag := 2; // encontrado - OnExit

        edBanco.Value := DM.qyPES.FieldByName('banco').AsString;
        edAgencia.Value := DM.qyPES.FieldByName('agencia').AsString;
        edNrConta.Value := DM.qyPES.FieldByName('nr_conta').AsString;
        cbTpConta.ItemIndex := DM.qyPES.FieldByName('tp_conta').AsInteger;
        // end else begin
        // cbIDPES.Clear;
      end;
    end
    else
    begin
      cbIDPES.Tag := 0;
    end;
  end;

end;

procedure TflanMov.edIDPESEnter(Sender: TObject);
begin
  edIDPES.Tag := 1; // Desativar OnChange
  edIDPES.EditMask := ''; // 99999999999999;0;_';
  edIDPES.SelectAll;
  edIDPES.Tag := 0; // Ativar OnChange
end;

procedure TflanMov.edIDPESExit(Sender: TObject);
var
  tpPes: Integer;
begin
  if cbIDPES.Tag = 2 then
  begin // Foi localizado
    edIDPES.Tag := 1; // desativa OnChange
    edIDPES.EditMask := '';
    if DM.qyPES.FieldByName('tp_ins').AsInteger = cTipoCPF then
      edIDPES.EditMask := mskCPF
    else
      edIDPES.EditMask := mskCNPJ;
    edIDPES.Text := DM.qyPES.FieldByName('nr_ins').AsString;
    cbIDPES.Tag := 0;
    edIDPES.Tag := 0; // ativa OnChange
  end
  else
  begin
    tpPes := 2;
    edIDPES.Tag := 1;
    if length(edIDPES.Text) = 11 then
    begin
      edIDPES.EditMask := mskCPF;
      tpPes := cTipoCPF
    end
    else if length(edIDPES.Text) = 14 then
    begin
      edIDPES.EditMask := mskCNPJ;
      tpPes := cTipoCNPJ;
    end;
    edIDPES.Tag := 0;

    if cbIDPES.Tag = 1 then
    begin // não foi localizado
      if length(edIDPES.Text) > 0 then
      begin
        if (tpPes = 2) or not checaNRINS(edIDPES.Text, tpPes) then
        begin
          MsgErro('CPF/CNPJ inválido! Corrija ou apague.');
          edIDPES.SetFocus;
          edIDPES.SelectAll;
        end
        else
        begin
          cdrPessoal;
        end;
      end
      else
      begin
        cbIDPES.Tag := 0;
      end;
    end;
  end;
end;

procedure TflanMov.edIDPESKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end
  else
  begin
    if not charinset(Key, setNum) then
      Key := #0;

  end;

end;

procedure TflanMov.edIDTPDChange(Sender: TObject);
begin
  if edIDTPD.Tag = 0 then
  begin // permite o OnChange
    cbIDTPD.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDTPD.Clear;
    if length(edIDTPD.Value) > 0 then
    begin
      if DM.qyTPD.Locate('id', edIDTPD.Value, []) then
      begin
        chRTPD.Checked:= True;
        cbIDTPD.EditValue := DM.qyTPD.FieldByName('id').AsInteger;
        cbIDTPD.Tag := 2; // confirma que localizou, usado no OnExit
        AtivaDadosBco;
      end;
    end
    else
    begin // campo está vazio
      cbIDTPD.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TflanMov.edIDTPDExit(Sender: TObject);
begin
  edIDTPD.Tag := 1; // DESATIVA o OnChange
  if cbIDTPD.Tag = 1 then // não foi localizado
    edIDTPD.Clear; // limpa o campo
  cbIDTPD.Tag := 0; // Ativa o OnChange
  edIDTPD.Tag := 0; // Ativa o OnChange

end;

procedure TflanMov.edIDTPDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyTPD;
  ok := False;
  if (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    if qry.RecordCount > 0 then
    begin
      ok := True;

      if TCustomEdit(Sender).Text = '' then
        qry.First
      else
      begin
        if Key = VK_DOWN then
        begin
          if not qry.Eof then
            qry.Next
          else
            qry.First;
        end
        else
        begin // VK_UP
          if not qry.Bof then
            qry.Prior
          else
            qry.Last;
        end;
      end;
    end;
  end;

  if ok then
  begin
    desativatags([edIDTPD, cbIDTPD]);
    edIDTPD.Text := qry.FieldByName('cod').AsString;
    cbIDTPD.EditValue := qry.FieldByName('id').AsInteger;
    ativatags([edIDTPD, cbIDTPD]);

  end;
  // qry:= nil;
end;

procedure TflanMov.edIDUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then begin
      if DM.qyUNI.Locate('cod;ponto', VarArrayOf([edIDUNI.Value, edPTUNI.Value]), []) then begin
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        chRCUS.Checked:= True;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end else begin // campo está vazio
      cbIDUNI.Tag := 0; // Ativa o OnChange
    end;
  end;
end;

procedure TflanMov.edIDUNIExit(Sender: TObject);
begin
  edIDUNI.Tag := 1; // DESATIVA o OnChange
  if cbIDUNI.Tag = 1 then
  begin // não foi localizado
    cdrUnidade;
    // edIDUNI.Clear; //limpa o campo
    // edPTUNI.Value:='1'
  end;
  // cbIDUNI.Tag := 0; //Ativa o OnChange
  edIDUNI.Tag := 0; // Ativa o OnChange

end;

procedure TflanMov.edIDUNIKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyUNI;
  ok := False;
  if (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    if qry.RecordCount > 0 then
    begin
      ok := True;

      if TCustomEdit(Sender).Text = '' then
        qry.First
      else
      begin
        if Key = VK_DOWN then
        begin
          if not qry.Eof then
            qry.Next
          else
            qry.First;
        end
        else
        begin // VK_UP
          if not qry.Bof then
            qry.Prior
          else
            qry.Last;
        end;
      end;
    end;
  end;

  if ok then
  begin
    desativatags([edIDUNI, cbIDUNI]);
    edIDUNI.Text := qry.FieldByName('cod').AsString;
    edPTUNI.Value := qry.FieldByName('ponto').AsString;
    cbIDUNI.EditValue := qry.FieldByName('id').AsInteger;
    ativatags([edIDUNI, cbIDUNI]);

  end;
  // qry:= nil;
end;

procedure TflanMov.edNrContaEnter(Sender: TObject);
begin
  // ednrconta.Text:= SoNumeroX(ednrconta.Text);

end;

procedure TflanMov.edNrContaExit(Sender: TObject);
begin
  if edNrConta.Value <> '' then
    if not checaConta(edNrConta.Value, edBanco.Value) then
    begin
      MsgErro('Número da Conta inválido! (Atenção ao Código do Banco)');
      edNrConta.SetFocus;
    end;
end;

procedure TflanMov.edNRDOCChange(Sender: TObject);
{ var
  st, res: string;
  p, i: integer;
  begin
  st:= soNumero(edNRDOC.Text);
  res:= copy(st, st.Length+1-3, 3);
  if st.Length > 3 then begin
  p:= 0;
  res:= '.' + res;
  for i := st.Length-1 downto 4 do begin
  res:= st[i] + res;
  inc(p);
  if p = 3 then begin
  res:= '.' + res;
  p:= 0;
  end;

  end;
  res:= st[1] + res;
  end;
  edNRDOC.Text:= res;
}
begin
  edNRDOC.Text := formataNrDoc(soNumeroAlpha(edNRDOC.Text));
  edNRDOC.SelStart := length(edNRDOC.Text);
end;

procedure TflanMov.edNRDOCKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end
  else
  begin
    if not charinset(Key, ['0' .. '9', 'a'..'z','A'..'Z', #8, ^C, ^V]) then
      Key := #0;
  end;

end;

procedure TflanMov.edPerioIniPropertiesEditValueChanged(Sender: TObject);
{var
  diai, mesi, anoi: Word;
  dt: TDate;
begin
  if edPerioIni.EditValue = null then exit;

  DecodeDate(edPerioIni.Date, anoi, mesi, diai);
  dt:= incmonth(edPerioIni.Date, 1);
  edPerioFim.Date:= encodeDate(yearof(dt), monthof(dt), 1)-1 ;
}
var
  dt: TDate;
  imdt: TDate;
  qtmes, qtano, qtdia: integer;
  diai, mesi, anoi: Word;
  diaf, mesf, anof: Word;

begin
  if edPerioIni.EditValue = null then exit;

  if edPerioFim.EditValue = null then begin
   imdt:= incmonth(edPerioIni.Date, 1);
   edPerioFim.Date:= encodeDate(yearof(imdt), monthof(imdt), 1)-1 ;
  end else if edPerioFim.Date < edPerioIni.Date then begin
    DecodeDate(edPerioIni.Date, anoi, mesi, diai);
    DecodeDate(edPerioFim.Date, anof, mesf, diaf);

    qtano:= anoi - anof;
    qtmes:= mesi - mesf;
    qtdia:= 0;
    if diaf < diai then qtdia:= diai - diaf;
    dt:= incmonth(incyear(edPerioFim.Date, qtano), qtmes);
    dt:= dt + qtdia;
    edPerioFim.Date:= dt;

  end;

end;

procedure TflanMov.edPTUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then begin // permite o OnChange
    if length(edIDUNI.Value) > 0 then begin
      cbIDUNI.Tag := 1;
      // DESATIVA o OnChange, usado no OnExit e marca como Não localizado
      cbIDUNI.Clear;
      if DM.qyUNI.Locate('cod;ponto', VarArrayOf([edIDUNI.Value, edPTUNI.Value]), []) then begin
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        chRCUS.Checked:= True;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end;
  end;
end;

procedure TflanMov.edPTUNIExit(Sender: TObject);
begin
  edIDUNI.Tag := 1; // DESATIVA o OnChange
  if cbIDUNI.Tag = 1 then
  begin // não foi localizado
    cdrUnidade;
    // edIDUNI.Clear; //limpa o campo
    // edPTUNI.Value:='1'
  end;
  cbIDUNI.Tag := 0; // Ativa o OnChange
  edIDUNI.Tag := 0; // Ativa o OnChange

end;

procedure TflanMov.edQTPARPropertiesEditValueChanged(Sender: TObject);
var
  descr: string;
begin
  descr := edDESCR.Text;
  edQTPAR3.Properties.MinValue := edQTPAR.Value;
  if edQTPAR.Value = 1 then
  begin
    descr := ReplaceText(descr, flagPARCELA, '');
    // , [rfReplaceAll, rfIgnoreCase]);
    // descr:= descr + ' ,';
  end
  else if edQTPAR.Value > 1 then
  begin
    if not ContainsText(descr, flagPARCELA) then
      descr := flagPARCELA + descr;
  end;

  edDESCR.Text := descr;

end;

procedure TflanMov.edVLBASChange(Sender: TObject);
begin
  chRVLD.Checked:= true;
end;

procedure TflanMov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if filtroQYEVE <> '' then DM.qyEVE.Filter:= filtroQYEVE
  else DM.qyEVE.Filtered := False; // esta aberta an Pl. Contrato  / Movimento
  if filtroQYPES <> '' then DM.qyPes.Filter:= filtroQYPES
  else DM.qyPES.Filtered := False; // esta aberta an Pl. Contrato  / Movimento

  //if dm.DBCON.InTransaction then

  // QYMOV:= nil;
end;

procedure TflanMov.FormCreate(Sender: TObject);
begin
  // inherited create
  // Self.Height:= 631;
end;

procedure TflanMov.LimpaCampos;
begin
  chZero.Checked := False;
  if cbIDCNT.TabStop and cbIDCNT.Enabled then
  begin
    cbIDCNT.EditValue := null;
  end;

  if cbIDUNI.TabStop and cbIDUNI.Enabled then
  begin
    edIDUNI.Tag := 0;
    edIDUNI.Clear;
    edPTUNI.Value := '1';
    cbIDUNI.Clear;
  end;

  // if cbIDEVE.TabStop and cbIDEVE.Enabled then begin
  // cbIDEVE.EditValue:= null;
  // end;

  {
    edIDPES.Clear;
    edIDPES.EditMask:= '';
    edIDPES.Tag:= 0;
    cbIDPES.Clear;
  }
  // edDTEMI.Date:= Date;
  cbCOMPT.ItemIndex := 1; // Mês Vigente
  cbCOMPTSelect(nil);
  edDTVEN.Date := Date;;
  edVLBAS.Value := 0;
  cbIDTPD.ItemIndex := -1;
  edNRDOC.Text := '';

  edDESCR.Clear;
  edOBS.Clear;
  // chREP.Checked:= False;
  // chLiquida.Checked:= False;
  edBanco.Clear;
  edAgencia.Clear;
  edNrConta.Clear;
  cbTpConta.ItemIndex := 0;
  edPerioIni.Clear;
  edPerioFim.Clear;

  // cbFREQ.ItemIndex:= 0;
  edQTPAR.Value := 1;
  if FTipoMovimento = cTipoAvulso then
    edQTPAR.Enabled := False;

end;

procedure TflanMov.PreCampos;
var
  st: String;
  // mesAnt, mesPos, mesCompt, mesVen: integer;
  mesVen, mesCompt: TMesAno;
  id: Integer;
  // TPMOV: Char;
begin
  with DM.qymov do begin
    if cbIDCNT.Enabled then
      cbIDCNT.EditValue := FieldByName('id_cnt').AsInteger;
    if cbIDUNI.Enabled then
      cbIDUNI.EditValue := FieldByName('id_uni').AsInteger;
    if cbIDEVE.Enabled then
      cbIDEVE.EditValue := FieldByName('id_eve').AsInteger;

    id := FieldByName('id_pes').AsInteger;
    if id > 0 then begin
      cbIDPES.EditValue := id;
    end;

    if (FieldByName('st_mov').AsString = cMovLiquidado) then
      edDTVEN.EditValue := FieldByName('dt_bxa').AsVariant
    else
      //edDTVEN.EditValue := FieldByName('dt_ven_ori').AsVariant; //alterado em 04/04/2024
      edDTVEN.EditValue := FieldByName('dt_ven').AsVariant; //alterado em 04/04/2024

    st := FieldByName('compt').AsString;
    if length(st) = 4 then begin // ANO
      cbCOMPT.ItemIndex := 4
    end else if st.length = 9 then begin // TRIMESTRE  1TRIM2024
      cbCOMPT.ItemIndex := 5;
    end else if st.Length = 8 then begin  // SEMESTRE 1SEM2024
      cbCOMPT.ItemIndex := 6;

    end else begin // MÊS
      if leftstr(st, 2) = '13' then begin //13° MES
        cbCOMPT.ItemIndex := 3;
      end else begin
        mesVen.Create(FieldByName('dt_ven').AsDateTime);
        mesCompt.Create(StrToDate('13/' + st));
        if mesCompt.Mes = mesVen.mesAnt.Mes then
          cbCOMPT.ItemIndex := 0
        else if mesCompt.Mes = mesVen.Mes then
          cbCOMPT.ItemIndex := 1
        else if mesCompt.Mes = mesVen.proxMes.Mes then
          cbCOMPT.ItemIndex := 2
        else
          cbCOMPT.ItemIndex := 3;
      end;
    end;
    cbCOMPTSelect(nil);
    if cbCOMPT.ItemIndex >= 3 then edCOMPT.Text := st;

    if (FieldByName('st_mov').AsString = cMovLiquidado) then
      edVLBAS.Value := FieldByName('vl_efe').AsFloat
    else
      edVLBAS.Value := FieldByName('vl_bas').AsFloat;
    if edVLBAS.Value = 0 then
      chZero.Checked;

    cbIDTPD.EditValue := FieldByName('id_tpd').AsInteger;
    edNRDOC.Text := formataNrDoc(FieldByName('nr_doc').AsString);

    if DM.qyTPD.FieldByName('conta').AsInteger = 1 then
    begin
      edBanco.Value := FieldByName('banco').AsString;
      edAgencia.Value := FieldByName('agencia').AsString;
      edNrConta.Value := FieldByName('nr_conta').AsString;
      cbTpConta.ItemIndex := FieldByName('tp_conta').AsInteger;
    end;
    edPerioIni.EditValue := FieldByName('perio_ini').AsVariant;
    edPerioFim.EditValue := FieldByName('perio_Fim').AsVariant;
    edDESCR.Text := FieldByName('descr').AsString;
    edOBS.Text := FieldByName('obs').AsString;

    // chLiquida.Checked:= (FieldByName('st_mov').AsString = cMovLiquidado);
    // chREP.Enabled:= False;
  end;
end;

procedure TflanMov.PreInfPes;
begin
  edBanco.Clear;
  edAgencia.Clear;
  edNrConta.Clear;
  cbTpConta.ItemIndex := 0;
  if cbIDPES.EditValue <> null then
  begin
    with DM.qyPES do
    begin
      if FieldByName('tp_ins').AsInteger = cTipoCPF then
        edIDPES.EditMask := mskCPF
      else
        edIDPES.EditMask := mskCNPJ;

      if cbIDTPD.EditValue <> null then
        if DM.qyTPD.FieldByName('conta').AsInteger = 1 then
        begin
          edBanco.Value := FieldByName('banco').AsString;
          edAgencia.Value := FieldByName('agencia').AsString;
          edNrConta.Value := formataNrConta(FieldByName('nr_conta').AsString);
          cbTpConta.ItemIndex := FieldByName('tp_conta').AsInteger;
        end;
    end;
  end;
end;

procedure TflanMov.processaAltLote;
begin

end;

constructor TflanMov.Create(AOwner: TComponent; idmov: Integer);
begin
  inherited Create(AOwner);
  //CRIADO APENAS PARA VISUALIZAÇÃO DOS DADOS

  PreCampos;
  ativachr(false);
  lbPARC.Visible := False;
  lbInicio.Visible := False;
  lbTotal.Visible := False;
  edQTPAR.Visible := False;
  edQtPar2.Visible := False;
  edQTPAR3.Visible := False;
  btConf.Visible := False;
  //lbDIAUTIL.Visible := False;
  chDiaUtil.Visible:= false;
  lbINFO.Visible := False;
  chDIV.Visible := False;
  // btCancelar.Top:= 408;
  btCancelar.Cancel := True;
  Self.ClientHeight := edOBS.Top + edOBS.Height + btCancelar.Height * 2;
  FTipoMovimento:= DM.qymov.FieldByName('tp_mov').AsString[1];
  if FTipoMovimento = cTipoContrato then
    Self.Caption := 'Lançamento de um CONTRATO (IDC ' + DM.qymov.FieldByName('id_ctr').AsString + ')';
  if FTipoMovimento = cTipoAvulso then
    Self.Caption := 'Lançamento AVULSO';
  if FTipoMovimento = cTipoParcela then
    Self.Caption := 'Lançamento PARCELADO (IDC ' + DM.qymov.FieldByName('id_ctr').AsString + ')';
  Self.Caption := Self.Caption + ' - Consulta (IDR ' + DM.qymov.FieldByName('id').AsString + ')';
end;

end.
