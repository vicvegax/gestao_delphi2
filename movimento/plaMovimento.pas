unit plaMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxLabel, cxTextEdit,
  cxCalendar, cxCurrencyEdit, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Buttons, cxDropDownEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, StrUtils,
  DateUtils;

type
  TfplaMov = class(TForm)
    gviewMov: TcxGridDBTableView;
    glevelMov: TcxGridLevel;
    gridMov: TcxGrid;
    DSMOV: TDataSource;
    Panel1: TPanel;
    btAvulso: TButton;
    colIDUNI: TcxGridDBColumn;
    colIDEVE: TcxGridDBColumn;
    gvmIDPES: TcxGridDBColumn;
    gvmCOMPT: TcxGridDBColumn;
    gvmVALOR: TcxGridDBColumn;
    colDTVEN: TcxGridDBColumn;
    gvmDESCR: TcxGridDBColumn;
    gvmOBS: TcxGridDBColumn;
    gvmSit: TcxGridDBColumn;
    gvmNTREG: TcxGridDBColumn;
    pnBar: TPanel;
    Label1: TLabel;
    edDTINI: TcxDateEdit;
    edDTFIM: TcxDateEdit;
    btEfetivar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    cbIDCNT: TcxLookupComboBox;
    btFiltra: TButton;
    gvmIDTPD: TcxGridDBColumn;
    btExcluir: TButton;
    Label4: TLabel;
    edSDANT: TcxCurrencyEdit;
    edSDATU: TcxCurrencyEdit;
    Label5: TLabel;
    colDTLIQ: TcxGridDBColumn;
    gvmNRDOC: TcxGridDBColumn;
    gvmBANCO: TcxGridDBColumn;
    gvmAGENCIA: TcxGridDBColumn;
    gvmCONTA: TcxGridDBColumn;
    gvmTIPO: TcxGridDBColumn;
    btAlterar: TButton;
    btParcela: TButton;
    colTPR: TcxGridDBColumn;
    colDTINC: TcxGridDBColumn;
    colIDFULL: TcxGridDBColumn;
    colNUM: TcxGridDBColumn;
    btRelDesembolso: TButton;
    gvmUF: TcxGridDBColumn;
    btRelConta: TButton;
    Label7: TLabel;
    edTOTC: TcxCurrencyEdit;
    Label8: TLabel;
    edTOTD: TcxCurrencyEdit;
    btEmConta: TButton;
    btEstornar: TButton;
    colNTREG: TcxGridDBColumn;
    Label9: TLabel;
    edSDPROJ: TcxCurrencyEdit;
    colDTENTREG: TcxGridDBColumn;
    imgMostra: TImage;
    imgSelo: TImage;
    pnGuia: TPanel;
    btCNAB240: TButton;
    Label6: TLabel;
    lbDSEMP: TLabel;
    colTPCNT: TcxGridDBColumn;
    colTPINS: TcxGridDBColumn;
    colID: TcxGridDBColumn;
    colIDCTR: TcxGridDBColumn;
    colUMOV: TcxGridDBColumn;
    btOrdem: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAvulsoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btEfetivarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure gviewMovDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure gvmVALORCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gviewMovCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvmNTREGCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edSALDOPropertiesChange(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btParcelaClick(Sender: TObject);
    procedure colNUMGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure gvmSaldoGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure btRelDesembolsoClick(Sender: TObject);
    procedure gviewMovColumn2PropertiesEditValueChanged(Sender: TObject);
    procedure btRelContaClick(Sender: TObject);
    procedure gvcSALDOCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvmSitCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edDTINIPropertiesEditValueChanged(Sender: TObject);
    procedure edDTFIMPropertiesEditValueChanged(Sender: TObject);
    procedure gvmVALORCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btEstornarClick(Sender: TObject);
    procedure btEmContaClick(Sender: TObject);
    procedure btFiltraClick(Sender: TObject);
    procedure colNTREGCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cbIDCNTPropertiesEditValueChanged(Sender: TObject);
    procedure gviewMovDataControllerFilterRecord(ADataController
      : TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
    procedure gviewMovSelectionChanged(Sender: TcxCustomGridTableView);
    procedure imgMostraClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btOrdemClick(Sender: TObject);
    procedure btCNAB240Click(Sender: TObject);
    procedure cbIDCNTPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure colDTVENCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colDTVENGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure gviewMovMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure colDTLIQGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure colDTLIQCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    // var
    // totalAcumulado: Double;
    saldoPROJ: Double;
    flagEmConta: boolean;
    flagAgendar: boolean;
    procedure efetivaSimples;
    procedure efetivaLote;
    procedure Filtra(id: Integer = 0);
    procedure mostraSaldo(mostra: Boolean);
    procedure popPesClick(Sender: TObject);
    procedure popMovClick(Sender: TObject);
    procedure popCtrClick(Sender: TObject);
    procedure popInfoPopup(Sender: TObject);
    procedure MostraSelo;
  public
    { Public declarations }
  end;

var
  fplaMov: TfplaMov;

implementation

{$R *.dfm}

uses modDados, lanMovimento, modFuncoes, bxaMovimento, lanParcela,
  relConta, relDesembolso, sinalConta, bxaLote, OrdenaGrid, visCNAB240,
  cfgCNAB240, detMovimento;

procedure TfplaMov.btAlterarClick(Sender: TObject);
var
  id: Integer;
  ok: Boolean;
begin

  if DM.qymov.FieldByName('st_mov').AsString = cMovLiquidado then begin //VISUALIZAR
    with TflanMov.Create(Self, 0) do
    begin
      ShowModal;
      Free;
    end;
    // MsgErro('Este Registro não pode ser Alterado! Ele precisa ser Estornado primeiro.');
    Exit;
  end;

  if not btAlterar.Enabled then
    Exit;

  gviewMov.Controller.ClearSelection;
  DM.qymov.DisableControls;
  // DM.qymov.AfterScroll:= nil;
  DM.qymov.OnCalcFields := nil;
  id := DM.qymov.FieldByName('id').AsInteger;
  with TflanMov.Create(Self, modoAlt, DM.qymov.FieldByName('tp_mov')
    .AsString[1], 0, cbIDCNT.EditValue, 0, 0, 0) do
  begin
    { Permitido a partir de 02/10/2023
      if DM.qymov.FieldByName('tp_mov').AsString <> cTipoAvulso then begin
      edIDUNI.TabStop:= False;
      edIDUNI.ReadOnly:= True;

      edPTUNI.TabStop:= False;
      edPTUNI.ReadOnly:= True;

      cbIDUNI.TabStop:= False;
      cbIDUNI.Properties.ReadOnly:= True;

      //
      edIDEVE.TabStop:= False;
      edIDEVE.ReadOnly:= True;

      cbIDEVE.TabStop:= False;
      cbIDEVE.Properties.ReadOnly:= True;
      //
      end;
    }
    ok := (ShowModal = mrOk);
    // else
    Free;
  end;
  if ok then
  begin
    Filtra(id)
  end
  else
  begin
    DM.qymov.OnCalcFields := DM.QYMOVCalcFields;
    DM.qymov.EnableControls;
    // DM.qymov.AfterScroll:= QYMOVAfterScroll;
  end;
  // DM.qymov.Locate('id', id, []);

end;

procedure TfplaMov.btEfetivarClick(Sender: TObject);
var
  qtd: Integer;
begin
  if not btEfetivar.Enabled then Exit;

  //DM.idDATE.SyncTime;  //Este aqui atualiza a data do sistema
  //if dateof(DM.idDATE.DateTime) <> date then begin
  //  msgErro('ALERTA! VERIFIQUE A DATA DO SISTEMA!');
    //Exit;
  //end;

  qtd := gviewMov.Controller.SelectedRowCount;
  if qtd > 0 then begin
    if qtd > 1 then
      efetivaLote //Não gera log, é apenas liquidado!
    else
      efetivaSimples;   //Gera um log, pois pode ser mudado alguns valores!
  end;
end;

procedure TfplaMov.btEmContaClick(Sender: TObject);
var
  mesVen, mesCompt: TMesAno;
  st: string;
  i: integer;
  saidofor: boolean;
  qtd: integer;
  id: integer;
  //posAtual, posAnt: integer;
  idArray: array of integer;
begin
  if not btEmConta.Enabled then Exit;
  id:= 0;
  saidofor:= false;
  qtd:= gviewMov.Controller.SelectedRowCount;
  if qtd = 0 then exit;

  setlength(idarray, qtd);
  for i := 0 to qtd-1 do begin
    idarray[i]:= gviewMov.Controller.SelectedRows[i].Values[colID.Index];
  end;
  //gviewMov.Controller.BeginUpdate;
  for i := 0 to qtd-1 do begin
    id:= idArray[i];// gviewMov.Controller.SelectedRows[i].Values[colID.Index];
    //if DM.QYMOV['id'] <> id then 
      DM.QYMOV.Locate('id', id, []);

    with TfsinalConta.Create(Self.Owner) do begin
      edIDUNI.Text := colIDUNI.EditValue;
      edIDPES.Text := gvmIDPES.EditValue;
      edIDEVE.Text := colIDEVE.EditValue;
      if DM.qymov['st_mov'] = cMovEmconta then
        cbSINAL.Tag := 1 // 0 - Agendado, 1 - Em Conta
      else
        cbSINAL.Tag := 0;
      cbSINAL.ItemIndex := 1 - cbSINAL.Tag;
      cbSINAL.Enabled:= False;
      // cbSINAL
      edNRDOC.Value := gvmNRDOC.EditValue;
      if DM.qymov.FieldByName('valor').AsFloat > 0 then begin
        edVLBAS.Font.Color := corValorC;
        lbNTREG.Caption := cDSCRE;
        lbNTREG.Font.Color := corValorC;
      end else begin
        edVLBAS.Font.Color := corValorD;
        lbNTREG.Caption := cDSDEB;
        lbNTREG.Font.Color := corValorD;
      end;

      edVLBAS.Value := gvmVALOR.EditValue;
      if edVLBAS.Value = 0 then chZero.Checked:= True;

      edVLAGE.Value := gvmVALOR.EditValue;
      edDTAGE.Date := colDTVEN.EditValue;
      edDTVEN.Date := DM.proxDiaUtil(colDTVEN.EditValue);

      st := DM.qymov.FieldByName('compt').AsString;
      if length(st) = 4 then begin // ANO
        cbCOMPT.ItemIndex := 4
      end else if st.length = 9 then begin // TRIMESTRE
        cbCOMPT.ItemIndex := 5;
      end else if st.length = 8 then begin // SEMESTRE
        cbCOMPT.ItemIndex := 6;
      end else begin // MÊS
        if leftstr(st, 2) = '13' then begin //13° MES
          cbCOMPT.ItemIndex := 3;
        end else begin
          mesVen.Create(DM.qymov.FieldByName('dt_ven').AsDateTime);
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
      if cbCOMPT.ItemIndex >= 3 then
      begin
        edCOMPT.Text := st;
      end;

      // cbCOMPT.ItemIndex:= 3;
      // edCOMPT.Text:= gvmCOMPT.EditValue;
      btOK.Enabled := True; // Precisa mudar para Confirmar
      if ShowModal = IDOK then begin
        // vlbas:= edVLBAS.Value;
        // if DM.QYMOV.FieldByName('nt_reg').AsString = cNTDEB then
        // vlbas:= -vlbas;
        DM.DBTRANS.StartTransaction;
  ////////////////////////////////////////////////////////      DM.criaLog(DM.qymov);
        if cbSINAL.ItemIndex = 1 then DM.criaLogMov(DM.qymov, cSTEMC)
        else DM.criaLogMov(DM.qymov, cSTREAG);
        DM.qymov.Edit;

        if cbSINAL.ItemIndex = 1 then
          DM.qymov.FieldByName('st_mov').AsString := cMovEmconta
        else
          DM.qymov.FieldByName('st_mov').AsString := cMovAgendado;
        DM.qymov.FieldByName('compt').AsString := edCOMPT.Text;
        DM.qymov.FieldByName('nr_doc').AsString := edNRDOC.Value;
        DM.qymov.FieldByName('vl_bas').AsFloat := edVLBAS.Value;
        DM.qymov.FieldByName('dt_ven').AsDateTime := edDTVEN.Date;
        DM.qymov.FieldByName('us_alt').AsInteger := wUSUARIO;
        DM.qymov.FieldByName('dt_alt').AsDateTime := now;
        if cbSINAL.ItemIndex = 1 then begin
          DM.QYMOV['st_ini']:= cSTEMC;
  ////////////////////////////////////////////////////////        DM.adicionaLog(DM.qymov, logEmConta, DM.preparaLog(DM.qymov))
        end else begin
          DM.QYMOV['st_ini']:= cSTREAG;
  ////////////////////////////////////////////////////////        DM.adicionaLog(DM.qymov, logReaberto, DM.preparaLog(DM.qymov));
        end;
        DM.qymov.post;
        DM.DBTRANS.Commit;
        if qtd = 1 then Filtra(id);
      end else begin
        saidofor:= true;
      end;
      // if cbSINAl.ItemIndex = 1 then edSDPROJ.Value:= edSDPROJ.Value + vlbas
      // else edSDPROJ.Value:= edSDPROJ.Value - vlbas;
      Free;

    end; // with

    if saidofor then begin
      break;
    end;
  end;//for

//  gviewMov.Controller.SelectedRecords[1].Selected
  //gviewMov.Controller.EndUpdate;
//  gviewMov.Controller.BeginUpdate()
  if qtd > 1 then begin
    btEmConta.Enabled:= False;
    Filtra(id);
  end;
  if i = qtd then btEfetivar.Enabled:= (btEfetivar.Tag = tagOk);
  if qtd > 1 then begin
    for i := 0 to qtd-1 do begin
      id:= idArray[i];// gviewMov.Controller.SelectedRows[i].Values[colID.Index];
      if gviewMov.DataController.LocateByKey(id) then begin
        gviewMov.Controller.FocusedRecord.Selected:= true;
      end;
    end;
  end;  
end;

procedure TfplaMov.btEstornarClick(Sender: TObject);
var
  obs: string;
  st: string;
begin
  if not btEstornar.Enabled then
    Exit;

  if not perguntaNao('Confirma Estorno deste Lançamento?', 'Estorno') then
    Exit;
  if not perguntaNao('Tem CERTEZA que desja ESTORNAR este Lançamento?',
    'Estorno') then
    Exit;
  if not DM.obsBox('Motivo do Estorno',
    'Informe por que está Estornando este Lançamento:', obs) then
    exit;
  DM.DBCON.StartTransaction;
  with DM.qymov do begin

    DM.criaLogMov(DM.QYMOV, cSTESTORN);
    if fieldvalues['tp_mov'] = cTipoParcela then begin
      DM.DBCON.ExecSQL('update plcontratos set st_fim = "' + cSTNOR + '" where id = :id and st_fim = "' + cSTFIN + '"', [FieldValues['id_ctr']]);
    end;
    Edit;
    FieldValues['st_ini']:= cSTESTORN;
    FieldValues['us_alt']:= wUsuario;
    FieldValues['dt_alt']:= Now;
    st:= vartostr(FieldValues['obs_exc']);
    if st <> '' then begin
      st:= st + #13#10;
    end;
    FieldValues['obs_exc']:= st + 'ESTORNO: ' + obs;

    FieldByName('st_mov').AsString := cMovAgendado; // kSTNOR;
    // vlefe:= FieldByName('vl_efe').AsFloat;
    // vlbas:= FieldByName('vl_bas').AsFloat;
    // if FieldByName('nt_reg').AsString = cNTDEB then begin
    // vlefe:= -vlefe;
    // vlbas:= -vlbas;
    // end;
    FieldByName('vl_efe').AsVariant := null;
    FieldByName('dt_bxa').AsVariant := null;
    FieldByName('id_cnt').AsInteger := cbIDCNT.EditValue;
    FieldByName('us_efe').AsVariant := null;
    FieldByName('dt_efe').AsVariant := null;

////////////////////////////////////////////////////////    DM.adicionaLog(DM.qymov, logEstornado, obs);
    post;
  end;
  DM.DBCON.Commit;
  // edSDATU.Value:= edSDATU.Value - vlefe;
  // edSDPROJ.Value:= edSDPROJ.Value - vlefe;
  // if vlbas > 0 then edTOTC.Value:= edTOTC.Value - vlbas
  // else edTOTD.Value:= edTOTD.Value - vlbas;
  Filtra(DM.qymov.FieldByName('id').AsInteger);
  ShowMessage('Estorno do Lançamento realizado!');

end;

procedure TfplaMov.btExcluirClick(Sender: TObject);
var
  obs: string;
  st: string;
begin
  if not btExcluir.Enabled then Exit;

  if DM.qymov.RecordCount = 0 then Exit;

  if (DM.qymov.FieldByName('TP_mov').Value = cTipoContrato) or
    (DM.qymov.FieldByName('st_mov').Value = cMovLiquidado) then begin
    MsgErro('(id' + DM.qymov.FieldByName('id').AsString +
      ') Este lançamento não pode ser Excluído por aqui!');
    Exit;
  end;

  if (not perguntaNao(kMsgExc, kModo[3])) then
    Exit;
  if (not perguntaNao(kMsgExcCtz, kModo[3])) then
    Exit;

  if not DM.obsBox('Motivo da Exclusão',
    'Informe por que está Excluindo este lançamento:', obs) then
    exit;

  DM.DBCON.StartTransaction;
  DM.qymov.Edit;
  DM.qymov.FieldByName('st_fim').AsString := cSTEXC;
  DM.qymov.FieldByName('us_exc').AsInteger := wUSUARIO;
  DM.qymov.FieldByName('dt_exc').AsDateTime := now;
  st:= DM.QYMOV.FieldByName('obs_exc').AsString;
  if st <> '' then begin
    st:= st + #13#10 + 'EXCLUSÃO: ';
  end;
  DM.QYMOV.FieldByName('obs_exc').AsString:= st + obs;

///  DM.adicionaLog(DM.qymov, logExcluido, obs);
  DM.qymov.post;
  DM.DBCON.Commit;
  Filtra;
  ShowMessage('Lançamento Excluído!');
end;

procedure TfplaMov.btFiltraClick(Sender: TObject);
begin
  if cbIDCNT.Tag = 1 then exit;
  startTickCount;
  Filtra;
  wTickStop1:= stopTickCount;
  if wModoDepuracao then MsgDepuracao('Tempo Gasto (mS): ' + inttostr(wTickStop1));

end;

procedure TfplaMov.btOrdemClick(Sender: TObject);
var
  st: string;
  i: integer;
  idxCOL, idxORD: integer;
begin
  with TfOrdenaGrid.Create(Self) do begin
    st:= '';
    for i := 0 to gviewMov.ColumnCount-1 do begin
      cbCOL.Items.Append(gviewMov.Columns[i].Caption);
    end;
    for i := 0 to gviewMov.DataController.GetSortingItemCount-1 do begin
      tbord.Append;
      ordID.Value:= i+1;
      ordCOL.Value:= gviewmov.Columns[gviewMov.DataController.GetSortingItemIndex(i)].Caption;
      ordORD.Value:= cbORD.Items[ord(gviewmov.Columns[gviewMov.DataController.GetSortingItemIndex(i)].SortOrder)-1];
      tbord.Post;
    end;
    if tbord.RecordCount = 0 then begin
      tbord.Append;
      tbord.Post;
    end;
    tbord.Last;

    if ShowModal = mrOk then begin
      gviewMov.BeginUpdate;
      gviewMov.DataController.ClearSorting(False);
      tbord.First;
      while not tbord.eof do begin
        idxCOL:= cbCOL.Items.IndexOf(ordCOL.Value);
        idxORD:= cbORD.Items.IndexOf(ordORD.Value)+1;

        gviewmov.Columns[idxCOL].SortOrder:= TdxSortOrder(idxORD);
        tbord.Next;
      end;

      gviewMov.EndUpdate;
    end;
    free;
  end;
//    ShowMessage(st);

end;

procedure TfplaMov.Filtra(id: Integer = 0);
var
  sdant: double;
  sdefe: double;
  //sdproj: double;
  totc, totd: double;

  st: string;
  //id2: Integer;
  //relogio: TStopWatch;
begin
  if cbIDCNT.Tag <> 0 then
    Exit;

  if (edDTFIM.EditValue = null) or (edDTINI.EditValue = null) or
    (cbIDCNT.EditValue = null) then
    Exit;
  //relogio := TStopWatch.StartNew;

  DM.qymov.OnCalcFields := nil;
  gviewMov.BeginUpdate;

  DM.qymov.Close;
  //DM.qymov.Filter := ' (st_fim = ''' + cSTNOR + ''') ';
  //DM.qymov.Filtered := True;


  st:= 'select *, ' +
//       'if(tp_mov <> "' + cTipoAvulso + '", ' +
       'if(tp_mov = "' + cTipoContrato + '", ' +
         'if((dt_ven = (select max(dt_ven) from plmovimento plm2 where plm2.id_ctr = plm.id_ctr and st_fim = "' + cSTNOR + '")) and ' +
            '((select st_fim from plcontratos plc where plc.id = plm.id_ctr) = "' + cSTNOR + '") , 1, 0), 0) as ultmov ' +
       'from plmovimento plm ' +
       ' where ' +
         '(st_fim = "' + cSTNOR + '") and ' +
         '(id_cnt = :id1) AND (' +

           '((dt_mov < "' + DataSQL(Date) + '") and ' +
            '(st_mov <> "' + cMovLiquidado + '")) or ' +

         {
           '((dt_mov < :id2) and ' +
           '(if(tp_mov = "' + cTipoContrato + '", ' +
            'if((dt_ven = (select max(dt_ven) from plmovimento plm2 where plm2.id_ctr = plm.id_ctr and st_fim = "' + cSTNOR + '")) and ' +
            '((select st_fim from plcontratos plc where plc.id = plm.id_ctr) = "' + cSTNOR + '") , 1, 0), 0) = 1)) or ' +
          }
           '(dt_mov BETWEEN :id3 and :id4)' +
         ') ';
//         , [cbIDCNT.EditValue, edDTINI.Date, edDTFIM.Date]);

  DM.qymov.Open(st, [cbIDCNT.EditValue, edDTINI.Date, edDTFIM.Date]);
//  DM.qymov.Open(st, [cbIDCNT.EditValue, edDTINI.Date, edDTINI.Date, edDTFIM.Date]);
  with DM.qry do begin
    Open('SELECT IFNULL(SUM(valor), 0) as sd_ant FROM plmovimento WHERE ' +
      '(st_fim = "' + cSTNOR + '") and ' + '(id_cnt = :id1) and ' +
      // linha desativada em 10/10/23 - apenas a st_fim "N" define os registros "OK"
      // '(tp_mov in ("' + cTipoAvulso + '", "' + cTipoContrato + '", "' + cTipoParcela + '")) and ' +
      '(dt_bxa < :id2) and ' + '(st_mov = "' + cMovLiquidado + '") ',
      [cbIDCNT.EditValue, edDTINI.Date]);
    sdant := FieldByName('sd_ant').AsFloat;
    Close;
  end;
  edSDANT.Value := sdant;

  with DM.qry do begin
    Open('SELECT ' +
      'COALESCE(sum(if(st_mov = "' + cMovLiquidado + '", if(valor>0, valor, 0),0)), 0) as totc, ' +
      'COALESCE(sum(if(st_mov = "' + cMovLiquidado + '", if(valor<0, valor, 0),0)), 0) as totd, ' +
      'COALESCE(sum(if(st_mov = "' + cMovLiquidado + '", valor, 0))) as sdefe ' +
      //'COALESCE(sum(if(st_mov = "' + cMovLiquidado + '" or st_mov = "' + cMovEmconta + '", valor, 0))) as sdproj ' +
      //'COALESCE(sum(if(st_mov <> "' + cMovLiquidado + '", valor, 0))) as sdage ' +
      ' FROM plmovimento WHERE '  +
      '(st_fim = "' + cSTNOR + '") and ' +
      '(id_cnt = :id1) AND ' +
      // linha desativada em 10/10/23 - apenas a st_fim "N" define os registros "OK"
      // '(tp_mov in ("' + cTipoAvulso + '", "' + cTipoContrato + '", "' + cTipoParcela + '")) AND ' +
      '(dt_mov BETWEEN :id2 and :id3) ', [cbIDCNT.EditValue, edDTINI.Date, edDTFIM.Date]);

    totc := FieldByName('totc').AsCurrency;
    totd := FieldByName('totd').AsCurrency;
    sdefe := FieldByName('sdefe').AsCurrency;
    //saldoPROJ := FieldByName('sdproj').AsCurrency;
    Close;

  end;
  saldoProj:= DM.DBCON.ExecSQLScalar('SELECT COALESCE(sum(valor), 0) as sdproj from plmovimento WHERE ' +
    '(st_fim = "' + cSTNOR + '") AND ' +
    '(st_mov = "' + cMovEmconta + '") and ' +
    '(id_cnt = :id1) AND ' +
    '(dt_mov <= :id2)', [cbIDCNT.EditValue, edDTFIM.Date]);
  saldoProj:= round((saldoProj + totc + totd)*100)/100;
  DM.qymov.OnCalcFields := DM.QYMOVCalcFields;
  gviewMov.EndUpdate;
  // gviewMov.DataController.Filter.Active:= True;
  // DM.qymov.AfterScroll:= QYMOVAfterScroll;
  while DM.qymov.ControlsDisabled do DM.qymov.EnableControls;
  if id = 0 then begin

    if gviewMov.DataController.FilteredRecordCount > 0 then begin
      gviewMov.DataController.GotoFirst;
      gviewMov.ViewData.Rows[0].Focused := True;
      gviewMov.ViewData.Rows[0].Selected := True;
      DM.qymov.Locate('id', gviewMov.ViewData.Rows[0].Values[colID.Index], []);
    end;

  end else begin
    if gviewMov.DataController.LocateByKey(id) then
      gviewMov.Controller.FocusedRecord.Selected := True;
  end;
  //
  edSDATU.Value := sdant + sdefe;
  edSDPROJ.Value := sdant + saldoPROJ;
  // edSDMOV.Value:= sdmov;
  // edSDEFE.Value:= sdefe;

  edTOTC.Value := totc;
  edTOTD.Value := totd;

  //relogio.Stop;

  // ShowMessage(inttostr(relogio.ElapsedMilliseconds));
end;

procedure TfplaMov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qymov.Close();
  // DM.QYMOV.AfterScroll:= nil;
  DM.qymov.Filtered := False;
  DM.qymov.Filter := '';
  DM.popPes.OnClick:= nil;
  with DM do begin
    qyUNI.close(); //SQL no ModDados
    qyTPD.close(); //SQL no ModDados
    qyEVE.close();
    qyPes.close(); //SQL no ModDados
    qyTCB.close; // tipo de conta bancaria
    qyCNT.Close;
  end;
end;

procedure TfplaMov.btAvulsoClick(Sender: TObject);
var
  idtag: Integer;
begin
  if DM.qyCnt['id'] <> cbIDCNT.EditValue then DM.qyCnt.Locate('id', cbIDCNT.EditValue, []);
  DM.qymov.DisableControls;
  with TflanMov.Create(Self, modoInc, cTipoAvulso, 0, cbIDCNT.EditValue,
    0, 0, 0) do
  begin
    ShowModal; // = mrOK then
    idtag := Tag;
    Free;
  end;
  if idtag > 0 then begin
    Filtra(idtag);
  end else begin
    while DM.qymov.ControlsDisabled do DM.qymov.EnableControls;
  end;
end;

procedure TfplaMov.btCNAB240Click(Sender: TObject);
var
  lst: TStringList;
  st: string;
  dv: string;
  //ag, dvag: string;
  idlote, tplote, qtlote: integer;
  idreg: integer;
  i, qtlin, incr: integer;
  totvalores: int64;
  tpser: string;

  harq,
  hlot,
  deta,
  detb,
  tlot,
  tarq: TCNAB;
  //relogio: TStopWatch;
  ok: boolean;

  qtcc: integer;
  qtcp: integer;
  tpcnt: integer;
  novocab: integer;
  anticab: integer;
  banco: string;
  AStream: TMemoryStream;
begin

  if gviewMov.Controller.SelectedRowCount = 0 then
    gviewMov.Controller.SelectAll; //Sempre seleciona Tudo - 18/02/2024
  //end;
  if gviewMov.Controller.SelectedRowCount = 0 then begin
    MsgErro('Não há Registros para o CNAB240!');
    Exit;
  end;

  qtlin := gviewMov.Controller.SelectedRowCount-1;

  qtcc:= 0;
  qtcp:= 0;
  for i := 0 to qtlin do begin
    tpcnt:= gviewMov.Controller.SelectedRows[i].Values[colTPCNT.Index];
    if tpcnt = 1 then qtcc:= qtcc+1
    else if tpcnt = 2 then qtcp:= qtcp+1;
  end;
  if qtcc+qtcp <> qtlin+1 then begin
    MsgErro('Há registros que não podem ser informados no CNAB240! Registros devem conter informação de uma Conta Bancária.');
    Exit;
  end;

  ok:= false;
  tpcnt:= 0;
  with TfcfgCNAB240.Create(Self) do begin
    edDSEMP.Text:= lbDSEMP.Caption;
    cbTPSER.ItemIndex:= 0;
    cbTPCNT.ItemIndex:= 0;
    edDTPAG.Date:= Date;
    if ShowModal = idOK then begin
      ok:= true;

      if cbTPSER.ItemIndex = 0 then tpser:= '98' //DIVERSOS
      else tpser:= '20';  //FORNECEDOR

      tpcnt:= cbTPCNT.ItemIndex;
    end;
    Free;
  end;
  if not ok then exit;

  //relogio := TStopWatch.StartNew;
  AStream := TMemoryStream.Create;
  gviewMov.BeginUpdate;
  gviewMov.StoreToStream(AStream, [gsoUseFilter]);
  gviewMov.DataController.ClearSorting(False);
  gvmBANCO.SortOrder:= soAscending;
  gvmTIPO.SortOrder := soAscending;
  colDTVEN.SortOrder:= soAscending;
  if tpser = '20' then //FORNECEDOR
    gviewMov.DataController.Filter.Root.AddItem(colTPINS, foEqual, 1, '1'); //SÓ CNPJ

  if tpcnt = 2 then
    gviewMov.DataController.Filter.Root.AddItem(colTPCNT, foEqual, 2, '2')  //SÓ POUPANÇA
  else if tpcnt = 1 then
    gviewMov.DataController.Filter.Root.AddItem(colTPCNT, foEqual, 1, '1'); //SÓ CORRENTE
  gviewMov.EndUpdate;

  //gviewMov.Controller.SelectAll;
    qtlin := gviewMov.Controller.SelectedRowCount-1;
  if qtlin = 0 then begin
    MsgErro('Não há Registros Selecionados para o CNAB240!');
    Exit;
  end;

  totValores:= 0;
  novoCab:= 0;
  idreg:= 0;
  gviewMov.BeginUpdate();

  if DM.qyCnt['id'] <> cbIDCNT.EditValue then DM.qyCnt.Locate('id', cbIDCNT.EditValue, []);
  DM.qry.Open('select * from tbempresas where id = :id', DM.qyCnt['id_emp']);

  lst:= TStringlist.Create;
  harq:= TCNAB.create([3,4,1,9,1,14,  20  ,5,1,12,1,1,30,30,10,1,8,6,6,3,5,20,20,29]);
  harq:= TCNAB.create([3,4,1,9,1,14,  9,4,2,3,2  ,5,1,12,1,1,30,30,10,1,8,6,6,3,5,20,20,29]);
  //cabeçalho do arquivo
  harq.grava(1, '001');
  harq.grava(2, '0000');
  harq.grava(3, '0');
  harq.grava(4, stringofchar(' ', 9));
  harq.grava(5, '2'); //tipo cnpj
  harq.grava(6, DM.qry['nrins']);
{
      st:= '000160263';
      st:= st + '0126';
      st:= st + '  ';
      st:= st + '   ';
      st:= st + '  ';
  harq.grava(7, st);
}
  harq.grava(7+0, '000160263');
  harq.grava(7+1, '0126');
  harq.grava(7+2, '  ');
  harq.grava(7+3, '   ');
  harq.grava(7+4, '  ');
    st:= dm.qycnt['agencia'];
    st:= st.PadLeft(6, '0');
  incr:= 4;
  harq.grava(8+incr, leftstr(st, 5));
  harq.grava(9+incr, rightstr(st, 1));
    st:= dm.qycnt['nr_conta'];
    st:= st.PadLeft(13, '0');
  harq.grava(10+incr, leftstr(st, 12));
  harq.grava(11+incr, rightstr(st, 1));
  harq.grava(12+incr, ' ');
  st:= leftstr(dm.qry['descr'], 30);
  harq.grava(13+incr, st.PadRight(30, ' '));
  st:= 'BANCO DO BRASIL S. A.';
  harq.grava(14+incr, st.PadRight(30, ' '));
  harq.grava(15+incr, stringofchar(' ', 10));
  harq.grava(16+incr, '1'); //remessa??
  harq.grava(17+incr, formatdatetime('ddmmyyyy', date));
  harq.grava(18+incr, formatdatetime('hhnnss', time));
  harq.grava(19+incr, stringofchar('0', 6));
  harq.grava(20+incr, '101');
  harq.grava(21+incr, stringofchar('0', 5));
  harq.grava(22+incr, stringofchar(' ', 20));
  harq.grava(23+incr, stringofchar(' ', 20));
  harq.grava(24+incr, stringofchar(' ', 29));
  lst.Append(harq.st);


//  hlot:= TCNAB.Create([3,4,1,1,2,2,3,1,1,14,  20  ,5,1,12,1,1,30,40,30,5,15,20,5,3,2,2,6,10]);
  hlot:= TCNAB.Create([3,4,1,1,2,2,3,1,1,14,  9,4,2,3,2  ,5,1,12,1,1,30,40,30,5,15,20,5,3,2,2,6,10]);
  tlot:= TCNAB.Create([3,4,1,9,6,18,18,6,165,10]);
  deta:= TCNAB.Create([3,4,1,5,1,1,2,3,3,5,1,12,1,1,30,20,8,3,15,15,20,8,15,40,2,5,2,3,1,10]);
  detb:= TCNAB.Create([3,4,1,5,1,3,1,14,35,60,99,6,8]);


  anticab:= 0;
  idlote:= 1;  //<<<<<<<<<<<< No máximo 2 (Corrente 1º e/ou Poupança)
  for i := 0 to qtlin do begin
    tpcnt:= gviewMov.Controller.SelectedRows[i].Values[colTPCNT.Index];
    banco:= gviewMov.Controller.SelectedRows[i].Values[gvmBANCO.Index];

    if banco = cBB then begin
      if novocab <> tpcnt then novocab:= tpcnt;  //1-corrente, 2-poupança
    end else begin
      novocab:= 3; //TED corrente, 4-ted poupança
    end;

    //if tpcnt <> gviewMov.Controller.SelectedRows[i].Values[colTPCNT.Index] then begin
    if anticab <> novocab then begin
      anticab:= novocab;

      //cabecalho do lote
      hlot.grava(1, '001');
      hlot.grava(2, inttostr(idlote).PadLeft(4, '0'));
      hlot.grava(3, '1');
      hlot.grava(4, 'C');
      hlot.grava(5, tpser); //<<<<<<<<<<<<  Tipo de Serviço (20 - Pag. de Fornecedor, 98 - Pag. Diversos)
      if banco = cBB then begin
        if tpcnt = 1 then
          hlot.grava(6, '01')  //<<<<<<<<<<<< Forma de Lançamento -> 01 - Corrente
        else
          hlot.grava(6, '05');  //<<<<<<<<<<<< Forma de Lançamento -> 05 - Poupança
      end else begin
          //hlot.grava(6, '41');  //<<<<<<<<<<<< Forma de Lançamento -> 41 - Outra Titularidade
          hlot.grava(6, '03');  //<<<<<<<<<<<< Forma de Lançamento -> 03 - TED/DOC
      end;
      hlot.grava(7, '045');
      hlot.grava(8, ' ');
      hlot.grava(9, '2'); //tipo cnpj
      hlot.grava(10, DM.qry['nrins']);
    {
        st:= '000160263';
        st:= st + '0126';
        st:= st + '  ';
        st:= st + '   ';
        st:= st + '  ';
      hlot.grava(11, st);
    }
      hlot.grava(11+0, '000160263');
      hlot.grava(11+1, '0126');
      hlot.grava(11+2, '  ');
      hlot.grava(11+3, '   ');
      hlot.grava(11+4, '  ');
        st:= dm.qycnt['agencia'];
        st:= st.PadLeft(6,'0');
      incr:= 4;
      hlot.grava(12+incr, leftstr(st, 5));
      hlot.grava(13+incr, rightstr(st, 1));
        st:= dm.qycnt['nr_conta'];
        st:= st.PadLeft(13,'0');
      hlot.grava(14+incr, leftstr(st, 12));
      hlot.grava(15+incr, rightstr(st, 1));
      hlot.grava(16+incr, ' ');
      hlot.grava(17+incr, leftstr(dm.qry['descr'], 30).PadRight(30, ' '));
      hlot.grava(18+incr, stringofchar(' ', 40));
      hlot.grava(19+incr, leftstr(dm.qry['lograd'], 30).PadRight(30, ' '));
      hlot.grava(20+incr, leftstr(dm.qry['numero'], 5).PadLeft(5, '0'));
      hlot.grava(21+incr, leftstr(dm.qry['compl'], 15).PadRight(15, ' '));
      hlot.grava(22+incr, leftstr(dm.qry['cidade'], 20).PadRight(20, ' '));
      hlot.grava(23+incr, leftstr(dm.qry['cep'], 5));
      hlot.grava(24+incr, rightstr(dm.qry['cep'], 3));
      hlot.grava(25+incr, leftstr(dm.qry['uf'], 2).PadRight(2, ' '));
      hlot.grava(26+incr, stringofchar(' ', 2));
      hlot.grava(27+incr, stringofchar(' ', 6));
      hlot.grava(28+incr, stringofchar(' ', 10));
      lst.Append(hlot.st);

      idreg:= 1;
      totvalores:= 0;
      qtlote:= 0;
    end;

    dm.QYMOV.Locate('id', gviewMov.Controller.SelectedRows[i].Values[colID.Index], []);
    DM.qyPes.Locate('id',  dm.QYMOV['id_pes'], []);

    deta.grava(1, '001');
    deta.grava(2, inttostr(idlote).PadLeft(4, '0'));
    deta.grava(3, '3');
    deta.grava(4, inttostr(idreg).PadLeft(5, '0'));
    deta.grava(5, 'A');
    deta.grava(6, '0');
    deta.grava(7, '00');
     //Camara Centralizadora
    if banco = cBB then
      deta.grava(8, '000')
    else   //TED
      deta.grava(8, '018');
    deta.grava(9, vartostr(dm.qymov['banco']).PadLeft(3, '0'));

    st:= dm.qymov['agencia'];
    //impl em 01/01/24 - Calculo padrao de Modulo 11
    //serao aceitos agencia com 4 digitos (sem DV) ou 5 digitos(com DV)

    if st.Length < 5 then st:= st + dvAgencia(st.PadLeft(4, '0') + '?', cBB);
    //st:= vartostr(dm.qymov['agencia']).Padleft(6, '0');
    st:= st.PadLeft(6, '0');
    deta.grava(10, leftstr(st, 5));
    deta.grava(11, rightstr(st, 1)); //dv agencia

    if (banco = cBB) and (tpcnt = 2) then begin  //Banco 001 e Poupança - VARIAÇÃO 51 - 16/02/2024
      st:= vartostr(dm.qymov['nr_conta']);
      dv:= rightstr(st, 1);
      st:= leftstr(st, st.Length-1);

      st:= '51' + stringofchar('0',7-st.Length) + st;
      if strtoint(dv) < 7 then dv:= inttostr(strtoint(dv)+3)
      else if dv = 'X' then dv:= '2'
      else if dv = '7' then dv:= 'X'
      else dv:= inttostr(strtoint(dv)-8);
      st:= st + dv;
      st:= st.PadLeft(13, '0');
    end else begin
      st:= vartostr(dm.qymov['nr_conta']).PadLeft(13, '0');
    end;
    deta.grava(12, leftstr(st, 12));
    deta.grava(13, rightstr(st, 1)); //dv conta

    deta.grava(14, ' ');
    deta.grava(15, leftstr(DM.qyPes['descr'], 30).PadRight(30, ' '));
    deta.grava(16, stringofchar(' ', 20));
    deta.grava(17, formatdatetime('ddmmyyyy', dm.qymov['dt_ven']));
    deta.grava(18, 'BRL');
    deta.grava(19,  stringofchar('0', 15));
    deta.grava(20, formatfloat(stringofchar('0', 15), dm.QYMOV['vl_bas']*100));
    totvalores:= totvalores  + dm.QYMOV['vl_bas']*100;

    deta.grava(21, stringofchar(' ', 20));
    deta.grava(22, stringofchar('0', 8));
    deta.grava(23, stringofchar('0', 15));
    deta.grava(24, stringofchar('0', 40));
    deta.grava(25, '  ');
    deta.grava(26, '     ');
    deta.grava(27, '  ');
    deta.grava(28, '   ');
    deta.grava(29, '0');
    deta.grava(30, stringofchar(' ', 10));
    lst.Append(deta.st);
    idreg:=idreg+1;

    detb.grava(1, '001');
    detb.grava(2, inttostr(idlote).PadLeft(4, '0'));
    detb.grava(3, '3');
    detb.grava(4, inttostr(idreg).PadLeft(5, '0'));
    detb.grava(5, 'B');
    detb.grava(6, '   ');
    detb.grava(7, inttostr(dm.qyPes['tp_ins']+1));
    st:= vartostr(dm.qypes['nr_ins']).PadLeft(14, '0');
    detb.grava(8, st);
    detb.grava(9, stringofchar(' ', 35));
    detb.grava(10, stringofchar(' ', 60));
    detb.grava(11, stringofchar(' ', 99));
    detb.grava(12, stringofchar('0', 6));
    detb.grava(13, stringofchar('0', 8));
    lst.Append(detb.st);
    idreg:=idreg+1;
    //qtlote:= qtlote+1;
    if i = qtlin then begin //ultimo detalhe
      novocab:= 5;
    end else begin
      //if tpcnt <> gviewMov.Controller.SelectedRows[i+1].Values[colTPCNT.Index] then
      //  tpcnt:= 3;
      if gviewMov.Controller.SelectedRows[i+1].Values[gvmBANCO.Index] = cBB then begin
        if tpcnt <> gviewMov.Controller.SelectedRows[i+1].Values[colTPCNT.Index] then
          novocab:= 5;  //1-corrente, 2-poupança
      end else begin
        if novocab < 3 then novocab:= 5;
      end;
    end;
    if novocab = 5 then begin //rodapé
      //rodapé do lote
      tlot.grava(1, '001');
      tlot.grava(2, inttostr(idlote).PadLeft(4,'0'));
      tlot.grava(3, '5');
      tlot.grava(4, stringofchar(' ',9));
      //tlot.grava(5, inttostr(idreg-1).PadLeft(6,'0'));
      tlot.grava(5, inttostr(idreg+1).PadLeft(6,'0'));
      tlot.grava(6, inttostr(totvalores).PadLeft(18,'0'));
      tlot.grava(7, stringofchar('0',18));
      tlot.grava(8, stringofchar('0',6));
      tlot.grava(9, stringofchar(' ', 165));
      tlot.grava(10, stringofchar(' ', 10));
      lst.Append(tlot.st);
      idlote:= idlote + 1;
    end;
  end; //for



  //rodapé do arquivo
  tarq.Create([3,4,1,9,6,6,6,205]);
  tarq.grava(1, '001');
  tarq.grava(2, '9999');
  tarq.grava(3, '9');
  tarq.grava(4, stringofchar(' ', 9));
  tarq.grava(5, inttostr(idlote-1).PadLeft(6, '0'));
  tarq.grava(6, inttostr(lst.Count+1).PadLeft(6, '0'));
  tarq.grava(7, stringofchar('0', 6));
  tarq.grava(8, stringofchar(' ', 205));
  lst.Append(tarq.st);

  //gviewMov.EndUpdate;
  //relogio.Stop;

  //ShowMessage(inttostr(relogio.ElapsedMilliseconds));
  with TfvisCNAB240.Create(Self) do begin
    lharq:= harq;
    lhlot:= hlot;
    ldeta:= deta;
    ldetb:= detb;
    ltlot:= tlot;
    ltarq:= tarq;
    ed1.Lines:= lst;
    ShowModal;
    free;
  end;
  lst.Free;

  AStream.Position := 0; // <<<<< Não Esquecer
  //gviewMov.BeginUpdate;
  gviewMov.RestoreFromStream(AStream);
  gviewMov.EndUpdate;
  FreeAndNil(AStream);
end;

procedure TfplaMov.btParcelaClick(Sender: TObject);
var
  st: string;
  ok: Boolean;
begin
  DM.qry.Close;
  // DM.QYMOV.AfterScroll:= nil;
  // DM.QYMOV.OnCalcFields:= nil;
  gviewMov.BeginUpdate();
  //st := DM.qymov.Filter;
  if DM.qyCnt['id'] <> cbIDCNT.EditValue then DM.qyCnt.Locate('id', cbIDCNT.EditValue, []);
  with TflanParcela.Create(Self, modoInc, -1, cbIDCNT.EditValue) do begin
    // DM.QYMOV.OnCalcFields:= DM.QYMOVCalcFields;
    ok := (ShowModal = IDOK);
    Free;
  end;
  gviewMov.EndUpdate;
  if ok then begin
    Filtra;
  //end else begin
    //DM.qymov.Filter := st;
  end;
  // DM.QYMOV.AfterScroll:= QYMOVAfterScroll;

end;

procedure TfplaMov.btRelDesembolsoClick(Sender: TObject);
var
  i, idacum: Integer;
  dia, diaaux: Integer;
  valoracum: double;
  valor, total: double;
  totais: array of record
    dia: Integer;
    valor:  double;
  end;
  qtlin: Integer;
  // FilterActive: Boolean;
  AStream: TMemoryStream;
  // AFilterStream
begin

  if gviewMov.Controller.SelectedRowCount = 0 then begin
    gviewMov.Controller.SelectAll;
  end;
  //if gviewMov.Controller.SelectedRowCount = 0 then begin
  //  MsgErro('Não há Registros Selecionados para o CNAB240!');
  //  Exit;
  //end;
  if gviewMov.Controller.SelectedRowCount = 0 then begin
    MsgErro('Não há Registros Selecionados para o Desembolso!');
    Exit;
  end;

  AStream := TMemoryStream.Create;
  try
    gviewMov.BeginUpdate;
    gviewMov.StoreToStream(AStream, [gsoUseFilter]);
    //gviewmov.DataController.Filter
    gviewMov.DataController.ClearSorting(False);
    colDTVEN.SortOrder := soAscending;
    colIDUNI.SortOrder := soAscending;
    colIDEVE.SortOrder := soAscending;
    gviewMov.EndUpdate;

    frelDesembolso := TfrelDesembolso.Create(Self.Owner);
    if DM.qyCnt['id'] <> cbIDCNT.EditValue then DM.qyCnt.Locate('id', cbIDCNT.EditValue, []);
    with frelDesembolso do begin

      edIDCNT.Text := cbIDCNT.Text;
      edIDCNT.Tag := cbIDCNT.EditValue;
      edDTI.Text := edDTINI.Text;
      edDTI.Tag := MonthOf(edDTINI.Date);
      edDTF.Text := edDTFIM.Text;
      edDTF.Tag := MonthOf(edDTFIM.Date);
    end;

    with frelDesembolso do begin

      gviewDesembolso.DataController.BeginUpdate;
      valoracum := 0; // gviewMov.ViewData.Rows[0].values[gvmVALOR.Index];
//        dia := DayOf(gviewMov.ViewData.Rows[0].Values[colDTVEN.Index]);
      dia := DayOf(gviewMov.Controller.SelectedRows[0].Values[colDTVEN.Index]);
      idacum := 0;
      total := 0;
      //qtlin := gviewMov.ViewData.RecordCount - 1;
      qtlin := gviewMov.Controller.SelectedRowCount-1;
      for i := 0 to qtlin do begin
        diaaux := DayOf(gviewMov.Controller.SelectedRows[i].Values[colDTVEN.Index]);
        tbr.Append;
        tbrIDUNI.AsVariant := gviewMov.Controller.SelectedRows[i].Values[colIDUNI.Index];
        tbrIDPES.AsVariant := gviewMov.Controller.SelectedRows[i].Values[gvmIDPES.Index];
        tbrIDEVE.AsVariant := gviewMov.Controller.SelectedRows[i].Values[colIDEVE.Index];
        tbrDIA.Value := diaaux;

        tbrCOMPT.Value :=
          uppercase(formataMesAno(gviewMov.Controller.SelectedRows[i].Values[gvmCOMPT.Index]));

        valor := gviewMov.Controller.SelectedRows[i].Values[gvmVALOR.Index];
        total := total + valor;
        tbrVALOR.Value := valor;
        tbrBANCO.AsVariant := gviewMov.Controller.SelectedRows[i].DisplayTexts[gvmBANCO.Index];
        tbrAgencia.AsVariant := gviewMov.Controller.SelectedRows[i].DisplayTexts[gvmAGENCIA.Index];
        tbrConta.AsVariant := gviewMov.Controller.SelectedRows[i].DisplayTexts[gvmCONTA.Index];
        tbrTipo.AsVariant := gviewMov.Controller.SelectedRows[i].DisplayTexts[gvmTipo.Index];

        tbrTPREG.Value := 1; // Dados
        tbr.post;
        if (dia <> diaaux) or (i = qtlin) then
        begin
          SetLength(totais, idacum + 1);
          totais[idacum].dia := dia;
          if (i = qtlin) then
            valoracum := valoracum + valor;

          totais[idacum].valor := valoracum;
          valoracum := 0;
          dia := diaaux;
          idacum := idacum + 1;
        end; // else begin
        valoracum := valoracum + valor;
        // end;
      end; //next - for
      tbr.Append;
      tbrIDEVE.Value := 'TOTAL';
      tbrVALOR.Value := total;
      tbrTPREG.Value := 3; // TOTAL
      tbr.post;

      tbr.Append;
      tbrTPREG.Value := 0; // TOTAL
      tbr.post;

      for i := 0 to idacum - 1 do
      begin
        tbr.Append;
        tbrDIA.Value := totais[i].dia;
        tbrVALOR.Value := totais[i].valor;
        tbrTPREG.Value := 2; // Por Dia
        tbr.post;
      end;
      tbr.Append;
      tbrVALOR.Value := total;
      tbrTPREG.Value := 3; // TOTAL
      tbr.post;
      gviewDesembolso.DataController.EndUpdate;
      gviewDesembolso.ApplyBestFit();

      //if gvdVALOR.Width < 110 then gvdValor.Width:= 110;
      // gvdIDUNI.ApplyBestFit();
      // gvdIDPES.ApplyBestFit();
      // gvdIDEVE.ApplyBestFit();
    end;

    frelDesembolso.ShowModal;
    frelDesembolso.Free;

    AStream.Position := 0; // <<<<< Não Esquecer
    gviewMov.BeginUpdate;
    gviewMov.RestoreFromStream(AStream);
    gviewMov.EndUpdate;
  finally
    FreeAndNil(AStream);
    // FreeAndNil(AFilterStream);
  end;
end;

procedure TfplaMov.btRelContaClick(Sender: TObject);
var
  i: Integer;
  vl, saldo, totc, totd: double;
  AStream: TMemoryStream;
  widthValor: integer;
begin

  if gviewMov.Controller.SelectedRowCount = 0 then
  begin
    MsgErro('Não há Registros Selecionados para o Relatorio de Movimento de Conta!');
    Exit;
  end;

  AStream := TMemoryStream.Create;
  try
    gviewMov.BeginUpdate;
    gviewMov.StoreToStream(AStream, [gsoUseFilter]);
    gviewMov.DataController.ClearSorting(False);
    colDTVEN.SortOrder := soAscending;
    colIDUNI.SortOrder := soAscending;
    colIDEVE.SortOrder := soAscending;

    gviewMov.EndUpdate;

    fRelConta := TfRelConta.Create(Self.Owner);
    if DM.qyCnt['id'] <> cbIDCNT.EditValue then DM.qyCnt.Locate('id', cbIDCNT.EditValue, []);
    with fRelConta do begin

      edIDCNT.Text := cbIDCNT.Text;
      edIDCNT.Tag := cbIDCNT.EditValue;
      edDTI.Text := edDTINI.Text;
      edDTF.Text := edDTFIM.Text;
    end;

    with fRelConta do begin
      gviewConta.DataController.BeginUpdate;

      totc := 0;
      totd := 0;
      // linha:= 0;
      tbr.Append;
      tbrData.Value := edDTINI.Date - 1;
      tbrIDUNI.Value := 'SALDO ANTERIOR';
      tbrSALDO.Value := edSDANT.Value;
      tbrTPREG.Value := 2; // Saldo Anterior
      tbr.post;
      saldo := edSDANT.Value;

      for i := 0 to gviewMov.Controller.SelectedRowCount - 1 do begin
        // linha:= i+ 1;
        tbr.Append;
        tbrData.AsVariant := gviewMov.Controller.SelectedRows[i].Values[colDTVEN.Index];
        tbrIDUNI.AsVariant := gviewMov.Controller.SelectedRows[i].Values[colIDUNI.Index];
        tbrIDPES.AsVariant := gviewMov.Controller.SelectedRows[i].Values[gvmIDPES.Index];
        tbrHIST.AsVariant := gviewMov.Controller.SelectedRows[i].Values[colIDEVE.Index];
        tbrUF.AsVariant := gviewMov.Controller.SelectedRows[i].DisplayTexts[gvmUF.Index];
        tbrNRDOC.AsVariant :=
          formataNRDOC(gviewMov.Controller.SelectedRows[i].Values[gvmNRDOC.Index]);
        vl := gviewMov.Controller.SelectedRows[i].Values[gvmVALOR.Index];
        saldo := saldo + vl;
        if vl < 0 then
        begin
          tbrVLD.Value := Abs(vl);
          totd := totd + Abs(vl);
        end;
        if vl > 0 then
        begin
          tbrVLC.Value := vl;
          totc := totc + vl;
        end;
        tbrSALDO.Value := saldo;
        tbrTPREG.Value := 1; // Registro Detalhe
        tbr.post;
      end; //next - for
      tbr.Edit;
      tbrTPREG.Value := 3; // Ultima linha, negrito no Saldo
      tbr.post;
      tbr.Append;
      tbrIDUNI.Value := 'TOTAIS';
      tbrVLD.Value := totd;
      tbrVLC.Value := totc;
      tbrTPREG.Value := 4; // Registro Totais
      tbr.post;

      gviewConta.DataController.EndUpdate;
      gviewConta.ApplyBestFit();
      widthValor:= gvcVLD.Width;
      if gvcVLC.Width > widthValor then widthValor:= gvcVLC.Width;
      if gvcSALDO.Width > widthValor then widthValor:= gvcSALDO.Width;
      if widthValor < 110 then widthValor:= 110;
      gvcVLD.Width:= widthValor;
      gvcVLC.Width:= widthValor;
      gvcSALDO.Width:= widthValor;

      if gvcIDPES.Width > 450 then
        gvcIDPES.Width := 450;
    end;
    //fRelConta.WindowState := wsMaximized;
    fRelConta.ShowModal;
    fRelConta.Free;

    AStream.Position := 0; // <<<<Não Esquecer
    gviewMov.RestoreFromStream(AStream);
  finally
    FreeAndNil(AStream);
  end;
end;

procedure TfplaMov.edDTFIMPropertiesEditValueChanged(Sender: TObject);
begin
  if edDTINI.Date > edDTFIM.Date then
    edDTINI.Date := edDTFIM.Date
  else
    //Filtra(); //
    btFiltra.Click;
end;

procedure TfplaMov.edDTINIPropertiesEditValueChanged(Sender: TObject);
begin
  if edDTFIM.Date < edDTINI.Date then
    edDTFIM.Date := edDTINI.Date
  else
    //Filtra; //
    btFiltra.Click;
end;

procedure TfplaMov.edSALDOPropertiesChange(Sender: TObject);
begin
  with TcxCurrencyEdit(Sender) do
  begin
    if Value < 0 then
      Style.Font.Color := corValorD
    else
      Style.Font.Color := corValorC;
  end;

end;

procedure TfplaMov.efetivaLote;
var
  i: Integer;
  qtd: Integer;
  vlt: double;
  idcnt: Integer;
  dtefe: TDate;
  lote: string;
  recidx: integer;
  recnum: string;
  selidx: integer;
//  st: string;
begin

  qtd := gviewMov.Controller.SelectedRowCount;
  vlt := 0;
  selidx:= qtd;
  for i := 0 to qtd - 1 do begin
    recidx:= gviewMov.Controller.SelectedRows[i].RecordIndex;
    recnum:= gviewMov.DataController.GetDisplayText(recidx, colNUM.Index);
    if gviewMov.DataController.Values[recidx, gvmSit.Index] = cMovAgendado then begin
      MsgErro('Registro Nº ' + recnum + ' ainda NÃO esta EM CONTA. Ele será removido da Seleção!');
      selidx:= i;
      //gviewMov.Controller.SelectedRows[i].Selected := False;
      //gridMov.SetFocus;
      //Exit;  //Sai da Rotina
    end;
    if gviewMov.DataController.Values[recidx, gvmSit.Index] = cMovLiquidado then begin
      MsgErro('Registro Nº ' + recnum + ' JÁ foi EFETIVADO. Ele será removido da Seleção!');
      selidx:= i;
      //gviewMov.Controller.SelectedRows[i].Selected := False;
      //gridMov.SetFocus;
      //Exit;  //Sai da Rotina
    end;
    if gviewMov.DataController.Values[recidx, colDTVEN.Index] > Date then begin
      MsgErro('Registro Nº ' + recnum + ' com VENCIMENTO para ' + gviewMov.DataController.GetDisplayText(recidx, colDTVEN.Index) + ' ainda não pode ser Efetivado. Ele será removido da Seleção!');
      selidx:= i;
      //gviewMov.Controller.SelectedRows[i].Selected := False;
      //gridMov.SetFocus;
      //Exit;  //Sai da Rotina
    end;
    if selidx < qtd then begin
      gviewMov.Controller.SelectedRows[i].Selected := False;
      gviewMov.DataController.FocusedRecordIndex := gviewMov.Controller.SelectedRows[0].RecordIndex;
      gridMov.SetFocus;
      Exit;  //Sai da Rotina
    end;
    vlt := vlt + gviewMov.DataController.Values[recidx, gvmVALOR.Index];
  end;

  dtefe := 0;
  idcnt := -1;
  fbxaLote := TfbxaLote.Create(Owner, qtd, vlt, cbIDCNT.EditValue);
  with fbxaLote do begin
    if ShowModal = IDOK then begin
      idcnt := fbxaLote.cbIDCNT.EditValue;
      dtefe := edDTBXA.Date;
    end;
    Free;
  end;

  if idcnt > 0 then begin
    DM.qymov.DisableControls;
    gviewMov.BeginUpdate();
    gviewMov.DataController.BeginLocate;
    DM.DBTRANS.StartTransaction;
    try
      lote := formatdatetime('ddmmyyhhNNss', now);
      with DM.qymov do begin
        DM.qymov.OnCalcFields := nil;
        DM.qymov.AfterScroll := nil;
        for i := 0 to qtd - 1 do begin
          if Locate('id', gviewMov.DataController.GetRecordId(gviewMov.Controller.SelectedRows[i].RecordIndex), []) then begin

            if FieldValues['tp_mov'] = cTipoParcela then begin
              if DM.DBCON.ExecSQLScalar('select count(id) from plmovimento plm where ' +
                'plm.id_ctr = :id and ' +
                'st_fim = "' + cSTNOR + '" and ' +
                'st_mov <> "' + cMovLiquidado + '";', [FieldValues['id_ctr']]) = 1 then begin
                DM.DBCON.ExecSQL('update plcontratos set st_fim = "' + cSTFIN + '" where id = :id', [FieldValues['id_ctr']]);
              end;

            end;

            //DM.criaLogMov(DM.QYMOV, cSTLIQ, False); //nao fecha entre cada
            Edit;
            //FieldValues['st_ini'] := cSTLIQ;
            //FieldValues['us_alt'] := wUsuario;
            //FieldValues['dt_alt'] := Now;

            FieldByName('st_mov').AsString := cMovLiquidado;
            FieldByName('vl_efe').AsFloat := FieldByName('vl_bas').AsFloat;
            FieldByName('dt_bxa').AsDateTime := dtefe;
            FieldByName('id_cnt').AsInteger := idcnt;
            FieldByName('us_efe').AsInteger := wUSUARIO;
            FieldByName('dt_efe').AsDateTime := now;
////////////////////////////////////////////////////////                  DM.adicionaLog(DM.qymov, logEfetivado, 'LOTE ' + lote);
            post;
          end else begin
            MsgErro('1209231108 - ID não localizado: ' +
              gviewMov.DataController.GetRecordId(gviewMov.Controller.SelectedRows[i].RecordIndex));
          end;
        end;
        DM.qymov_aud.Close; //fecha a tabela aud agora
      end;
    finally
      DM.DBTRANS.Commit;

      gviewMov.DataController.EndLocate;
      gviewMov.EndUpdate;
      // DM.qymov.EnableControls;
      Filtra;
    end;
  end;

end;

procedure TfplaMov.efetivaSimples;
begin

  if (Date < DM.qymov.FieldByName('dt_ven').AsDateTime) then begin
    MsgErro('O Registro Nº ' + gviewMov.DataController.GetDisplayText(gviewMov.Controller.FocusedRecordIndex, colNUM.Index) + ' ainda não pode ser Efetivado! Data do Vencimento: '
      + formataData(DM.qymov.FieldByName('dt_ven').AsDateTime));
    Exit;
  end;

  with TfBaixa.Create(Self, DM.qymov, cbIDCNT.EditValue) do begin
    if ShowModal = IDOK then begin
      Filtra(DM.qymov.FieldByName('id').AsInteger);
    end;
    Free;
  end;

end;

procedure TfplaMov.FormCreate(Sender: TObject);
begin
  //teste de auto-save e history
  with DM do begin
    qyTPD.Open(sqlTBTPD); //SQL no ModDados
    qyEVE.Open(sqlTBEVE);
    qyPes.Open(sqlTBPES); //SQL no ModDados

    qyUNI.Open(sqlTBUNI); //SQL no ModDados
    qyTCB.Open; // tipo de conta bancaria
  end;

  cbIDCNT.Tag := 1; // Desativa Atualização Automatica
  edDTINI.Date := DM.proxDiaUtil(Date);

  cbIDCNT.ItemIndex := 0; // Aciona rotina de Filtro e Abertura da TABELA
  edDTFIM.Date := DM.proxDiaUtil(Date);//edDTINI.Date; // date;
  cbIDCNT.Tag := 0; // Ativa Atualizacao Automatica - Filtro Executado no fim do FormCreate

  Filtra;
  wTickStop1:= stopTickCount;

  DM.carregaConfig();
  DM.popPes.OnClick:= popPesClick;
  DM.popMov.OnClick:= popMovClick;
  DM.popCtr.onClick:= popCtrClick;
  DM.popInfo.OnPopup:= popInfoPopup;

  gridMov.Align := alClient;

  edTOTC.Style.Font.Color := corValorC;
  edTOTD.Style.Font.Color := corValorD;

  mostraSaldo(False);

  imgMostra.Enabled := DM.permitido('MovSaldo');
  btAvulso.Enabled := DM.permitido('movLancAvulso');
  btParcela.Enabled := DM.permitido('movParc');
  flagEmConta:= DM.permitido('movEmConta');// then
  flagAgendar:= DM.permitido('movAgendar');// then
  if DM.permitido('movEfetivar') then
    btEfetivar.Tag := tagok;
  if DM.permitido('movEstornar') then
    btEstornar.Tag := tagok;
  if DM.permitido('movAlterar') then
    btAlterar.Tag := tagok;
  if DM.permitido('movExcluir') then
    btExcluir.Tag := tagok;

  btRelDesembolso.Enabled:= DM.permitido('movDesembolso');
  btRelConta.Enabled:= DM.permitido('movMovimento');
  btCNAB240.Enabled:= DM.permitido('movCNAB');

  {
  imgSelo.AutoSize:= True;
  imgSelo.AutoSize:= False;
  imgSelo.Height := imgSelo.Height * 70 div 100;
  imgSelo.Width := imgSelo.Width * 70 div 100;
  }
  MostraSelo;
  //btOrdem.Visible:= wUsuario<100;

  gviewMov.DataController.ClearSorting(False);
  colDTVEN.SortOrder:= soAscending;
  colIDUNI.SortOrder:= soAscending;
  colIDEVE.SortOrder:= soAscending;

  gviewMov.FilterRow.OperatorCustomization := True;
  colIDUNI.Options.FilterRowOperator := foContains;
  colIDEVE.Options.FilterRowOperator := foContains;
  gvmIDPES.Options.FilterRowOperator := foContains;
  gvmIDTPD.Options.FilterRowOperator := foContains;
  gvmDESCR.Options.FilterRowOperator := foContains;
  gvmOBS.Options.FilterRowOperator := foContains;
  gvmNRDOC.Options.FilterRowOperator := foContains;

  wTickStop2:= stopTickCount;
  {
  if wUsuario >= 100 then
    DM.DBCON.ExecSQL('INSERT INTO log_ticks ' +
                     '( idusu, local, descr, data, ping1, ping2, ping3 ) ' +
                     'VALUES ' +
                     '( :v1, :v2, :v3, :v4, :v5, :v6, :v7)',
                      [wUsuario, getPCName().GetHashCode, 'PL. MOVIMENTO', now, wTickStop1, wTickStop2, 0]
                     );
  }
  if wModoDepuracao then MsgDepuracao('Tempo Gasto (mS):'#13#10 +
     'Abrindo Tabela: ' + inttostr(wTickStop1) + #13#10 +
     'Abrindo a Planilha: ' + inttostr(wTickStop2));
end;

procedure TfplaMov.FormDestroy(Sender: TObject);
begin
  with DM do
  begin
    //qyCnt.Close();
    //qyUNI.Close();
    //qyTPD.Close();
    // qyFER.Close();
    // qyInv.Close();
    //qyEVE.Close();
    //qyPes.Close();
    //qyTCB.Close; // tipo de conta bancaria
  end;
end;

procedure TfplaMov.FormHide(Sender: TObject);
begin
  MostraSelo;
end;

procedure TfplaMov.FormResize(Sender: TObject);
begin
  imgSelo.Left := pnGuia.Left + ((pnBar.Width - pnGuia.Left - imgSelo.Width) div 2);
  if imgSelo.Left < pnGuia.Left then imgSelo.Left := pnGuia.Left;

end;

procedure TfplaMov.FormShow(Sender: TObject);
begin
  // btLanc.Click;
end;

procedure TfplaMov.gvcSALDOCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Value < 0 then
    ACanvas.Font.Color := clRed
  else
    ACanvas.Font.Color := clBlue;

end;

procedure TfplaMov.colDTLIQCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if not (AViewInfo.GridRecord is TcxGridFilterRow) then
    if vartostr(aviewinfo.GridRecord.Values[gvmSIT.Index]) <> 'L' then begin
      if aviewinfo.GridRecord.Values[colDTVEN.Index] < Date then begin
        ACanvas.Brush.Color:= clRED;
      end;
    end;

end;

procedure TfplaMov.colDTLIQGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
//  if AText = '' then
//    Atext := 'Vencido';
end;

procedure TfplaMov.colDTVENCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin


  if vartostr(aviewinfo.GridRecord.Values[colUMOV.Index]) = '1' then begin
      ACanvas.Brush.Color:= corUltMov;
  end;

end;

procedure TfplaMov.colDTVENGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
{
if(Sender.GridView.DataController.GetValue(ARecord.Index, colTPR.index) = cTipoContrato) then
AText:= DM.DBCON.ExecSQLScalar('SELECT count(id) FROM plmovimento where ' +
      'tp_mov = "' + cTipoContrato + '" and ' +
      'st_fim = "' + cSTNOR + '" and ' +
      'id_ctr = ' + vartostr(Sender.GridView.DataController.GetValue(ARecord.Index, colIDCTR.index))) ;
}
end;

procedure TfplaMov.colNUMGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
var
  AIndex: Integer;
begin
  AIndex := TcxGridTableView(Sender.GridView)
    .DataController.GetRowIndexByRecordIndex(ARecordIndex, False);
  AText := IntToStr(AIndex + 1);
end;

procedure TfplaMov.gvmSaldoGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
// var
// AIndex: Integer;
// rowInfo: TcxRowInfo;
begin
  {
    //  TcxGridTableView(Sender.GridView).row
    AIndex := TcxGridTableView(Sender.GridView).DataController.GetRowIndexByRecordIndex(ARecordIndex, False);
    if AIndex > 0 then begin
    //rowInfo:= TcxGridTableView(Sender.GridView).DataController.GetRowInfo(AIndex-1);
    TotalAcumulado:= TotalAcumulado +
    TcxGridTableView(Sender.GridView).DataController.GetRowValue(TcxGridTableView(Sender.GridView).DataController.GetRowInfo(AIndex) , gcValor.Index);
    AText:= formataValorDC(TotalAcumulado);
    end else begin
    TotalAcumulado:= TcxGridTableView(Sender.GridView).DataController.GetRowValue(TcxGridTableView(Sender.GridView).DataController.GetRowInfo(AIndex) , gcValor.Index);
    AText:= formataValorDC(TotalAcumulado);
    end;
  }
  // AText := IntToStr(AIndex + 1);
end;

procedure TfplaMov.gvmSitCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
// var
// cor: TColor;
begin
  ACanvas.Font.Color := clBlack;
  // cor:= ACanvas.Font.Color;
  if AViewInfo.Value = cMovLiquidado then
    ACanvas.Brush.Color := corMovLiquidado
  else if AViewInfo.Value = cMovEmconta then
    ACanvas.Brush.Color := corMovEmconta // TColor($00A5FF)
  else if AViewInfo.Value = cMovAgendado then
    ACanvas.Brush.Color := corMovAgendado;
  // else ACanvas.Font.Color:= cor;//TColor($0000FF);
end;

procedure TfplaMov.colNTREGCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Brush.Color := clWhite;
  if AViewInfo.Value = cNTDEB then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

end;

procedure TfplaMov.gviewMovColumn2PropertiesEditValueChanged(Sender: TObject);
begin
  with TcxTextEdit(Sender) do
  begin
    Text := soNumero(Text);
    SelStart := length(Text);
  end;

end;

procedure TfplaMov.gviewMovCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin

  if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex,
    gvmSit.Index) = cMovAgendado then
    if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex,
      colDTENTREG.Index) <> null then
      ACanvas.Brush.Color := corDocEntregue;

  // ACanvas.Font.Color:= clred;
end;

procedure TfplaMov.gviewMovDataControllerFilterRecord(ADataController
  : TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
begin
  //Accept := DM.aceitaNivel(ADataController.Values[ARecordIndex, colNIVEL.Index]);
end;

procedure TfplaMov.gviewMovDblClick(Sender: TObject);
var
  APoint: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin

  GetCursorPos(APoint);
  with gridMov.FocusedView.Site do
  begin
    APoint := ScreenToClient(APoint);
    AHitTest := ViewInfo.GetHitTest(APoint);
    if AHitTest is TcxGridRecordCellHitTest then
    begin
      if TcxGridRecordCellHitTest(AHitTest).Item.Index = gvmSit.Index then
      begin
        if (gvmSit.EditValue = cMovAgendado) or (gvmSit.EditValue = cMovEmconta)
        then
        begin // Sinalizar em Conta
          btEmConta.Click;
          Exit;
        end;
      end;

    end;

    if AHitTest is TcxGridRecordHitTest then
    begin
      btAlterar.Click;
    end;

    if AHitTest is TcxGridFooterCellHitTest then
    begin // Summary Footer cell
      // ShowMessage('Double Click no Footer!');
      gvmVALOR.Tag := 1 - gvmVALOR.Tag;
    end;

  end;

end;

procedure TfplaMov.gviewMovMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
begin
    if (Button <> mbRight) then exit;



    AHitTest := gviewMov.GetHitTest(x, y);
    if AHitTest.HitTestCode = htCell then begin
      gviewMov.PopupMenu:= DM.popInfo;
    end else begin
      gviewMov.PopupMenu:= nil;
    end;
    if AHitTest.HitTestCode = htColumnHeader then begin
      //showMessage('Coluna ' + TcxGridColumnHeaderHitTest(AHitTest).Column.Caption);
    end;

    //if AHitTest is
    //    this.gridView.GridControl.ContextMenu = this.rightClickContextMenu;
    //else
    //    this.gridView.GridControl.ContextMenu = null;

end;

procedure TfplaMov.gviewMovSelectionChanged(Sender: TcxCustomGridTableView);
var
  liquid: Boolean;
  emconta: boolean;
  qtsel: integer;
  tot: double;
  tipo: string;
  i: integer;
  recidx: integer;
begin

  qtsel:= gviewMov.Controller.SelectedRowCount;

  //
  //showmessage(gviewMov.DataController.GetDisplayText(recidx, colID.Index));
  if qtsel = 1 then begin
    //liquid := (DM.qymov.FieldByName('st_mov').AsString = cMovLiquidado);
    //emconta := (DM.qymov.FieldByName('st_mov').AsString = cMovEmconta);
    recidx:= gviewMov.Controller.SelectedRows[0].RecordIndex;
    liquid := (gviewMov.DataController.Values[recidx, gvmSIT.Index] = cMovLiquidado);
    emconta := (gviewMov.DataController.Values[recidx, gvmSIT.Index] = cMovEmconta);
    btEstornar.Enabled := (liquid) and (btEstornar.Tag = tagok);
    btAlterar.Enabled := (not liquid) and (btAlterar.Tag = tagok);
    btExcluir.Enabled := (not liquid) and (btExcluir.Tag = tagok);
    btEfetivar.Enabled := (emconta) and (btEfetivar.Tag = tagok);

    btExcluir.Enabled := (not liquid) and
      (gviewMov.DataController.Values[recidx, colTPR.Index] <> cTipoContrato) and
      (btExcluir.Tag = tagok);
    btEmConta.Enabled := False;
    if not liquid and not emconta then begin
      btEmConta.Enabled :=  flagEmConta;//DM.permitido('MovEmConta');// (btEmConta.Tag = tagok);
      btEmConta.Caption := 'Agendar em Conta';
    end else if emconta then begin
      btEmConta.Enabled := flagAgendar;//DM.permitido('MovAgendar');// (btEmConta.Tag = tagok);
      btEmConta.Caption := 'Agendar';
    end;
{
    btExcluir.Enabled := (not liquid) and
      (DM.qymov.FieldByName('tp_mov').AsString <> cTipoContrato) and
      (btExcluir.Tag = tagok);
    btEmConta.Enabled := False;
    if (DM.qymov.FieldByName('st_mov').AsString = cMovAgendado) then begin
      btEmConta.Enabled := (btEmConta.Tag = tagok);
      btEmConta.Caption := 'Agendar em Conta';
    end else if (DM.qymov.FieldByName('st_mov').AsString = cMovEmconta) then begin
      btEmConta.Enabled := (btEmConta.Tag = tagok);
      btEmConta.Caption := 'Agendar';
    end;
}
  end else begin
    btEfetivar.Enabled := (btEfetivar.Tag = tagok) and (qtsel <> 0);
    btAlterar.Enabled := False;
    btExcluir.Enabled := False;
    // btEfetivar.Enabled:= False;
    btEstornar.Enabled := False;
    //btEmConta.Enabled := False;
    btEmConta.Enabled := flagEmConta and (qtsel <> 0);
  end;

  if qtsel > 1 then begin
    tot:= 0;
    for I := 0 to qtsel-1 do begin
      tipo:= gviewMov.Controller.SelectedRows[i].Values[gvmSIT.Index];
      if (tipo = cMovEmConta) or (tipo = cMovLiquidado) then tot:= tot + gviewMov.Controller.SelectedRows[i].Values[gvmValor.Index];
      btEmConta.Enabled:= btEmconta.Enabled and (tipo = cMovAgendado);
      btEfetivar.Enabled:= btEfetivar.Enabled and (tipo = cMovEmConta);
    end;
    edSDPROJ.Value:= edSDANT.Value + tot;

  end else begin
    edSDPROJ.Value:= edSDANT.Value + saldoPROJ;
  end;

end;

procedure TfplaMov.gvmNTREGCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Text = cNTDEB then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

end;

procedure TfplaMov.gvmVALORCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin

  // if Sender.DataController.DisplayTexts[AViewinfo.GridRecord.RecordIndex, gcNTREG.Index] = 'D' then  ACanvas.Font.Color:= clRed
  ACanvas.Brush.Color := clWhite;
  if AViewInfo.Value = 0 then
    ACanvas.Font.Color := clBlack
  else if AViewInfo.Value < 0 then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;

  // Adone:= true;
end;

procedure TfplaMov.gvmVALORCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var
  ADrawRect: TRect;
  valor: string;
begin
  // ACanvas.Brush.Color:= clWhite;
  ADone := True;
  if rightstr(AViewInfo.Text, 1) = cNTDEB then
    ACanvas.Font.Color := corValorD
  else
    ACanvas.Font.Color := corValorC;
  // ACanvas.DrawComplexFrame(AViewInfo.Bounds,
  ADrawRect := AViewInfo.Bounds;
  // ACanvas.FillRect(AViewInfo.Bounds, clYellow);
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawComplexFrame(ADrawRect, clGray, clGray, cxBordersAll, 1);
  // if gvmValor.Tag = 1 then valor:= AViewInfo.Text+' '
  if imgMostra.Tag = 0 then
    valor := AViewInfo.Text + ' '
  else
    valor := StringOfChar('*', length(AViewInfo.Text) + 1);;

  ACanvas.DrawTexT(valor, ADrawRect, cxAlignRight or cxAlignVCenter);
  // ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.Bounds, taRightJustify, taVCenter, False, False);
end;

procedure TfplaMov.imgMostraClick(Sender: TObject);
begin
  // if True then

  mostraSaldo(imgMostra.Tag = 1);
  //imgMostra.Tag:= 1 - imgMostra.Tag;
  //if imgMostra.Tag = 0 then imgMostra.Picture:= DM.imgMostra.Picture
  //else imgMostra.Picture:= DM.imgEsconde.picture;

end;

procedure TfplaMov.mostraSaldo(mostra: Boolean);
begin
  if mostra then begin
    edSDANT.Properties.EchoMode := eemNormal;
    imgMostra.Tag:= 0;
    imgMostra.Picture:= DM.imgEsconde.picture;
  end else begin
    edSDANT.Properties.EchoMode := eemPassword;
    imgMostra.Tag:= 1;
    imgMostra.Picture:= DM.imgMostra.picture;
  end;
  edSDATU.Properties.EchoMode := edSDANT.Properties.EchoMode;
  edSDPROJ.Properties.EchoMode := edSDANT.Properties.EchoMode;
  edTOTC.Properties.EchoMode := edSDANT.Properties.EchoMode;
  edTOTD.Properties.EchoMode := edSDANT.Properties.EchoMode;

  //imgEsconde.Visible := mostra;
  //imgMostra.Visible := not mostra;
  // gridMov.Repaint;
  // gvmValor.Summary
  gviewMov.DataController.Summary.Recalculate;
end;

procedure TfplaMov.MostraSelo;
var
  sSelo: TStringStream;
begin
  if DM.DBCON.ExecSQLScalar('SELECT NOT ISNULL(selo) FROM config where id = 1') then begin
    sSelo:= TStringStream.Create(Vartostr(DM.DBCON.ExecSQLScalar('select selo from config where id = 1')));
    imgSelo.Picture.LoadFromStream(sSelo);
    sSelo.Free;
  end;
  imgSelo.Top := (pnBar.Height - imgSelo.Height) div 2;
  imgSelo.Left := pnGuia.Left + ((pnBar.Width - pnGuia.Left - imgSelo.Width) div 2);
  if imgSelo.Left < pnGuia.Left then imgSelo.Left := pnGuia.Left;

end;

procedure TfplaMov.popCtrClick(Sender: TObject);
begin
//
  with TfdetMovimento.Create(Self, dm.QYMOV['id_ctr']) do begin
    showModal;
    free;
  end;

end;

procedure TfplaMov.popInfoPopup(Sender: TObject);
var
  ok: boolean;
begin
  ok:= gviewMov.ViewInfo.VisibleRecordCount > 0;
  DM.popPes.Enabled:= ok;
  DM.popMov.Enabled:= ok;
  DM.popCtr.Visible:= ok and (DM.qyMov['tp_mov'] <> cTipoAvulso) and (wUsuario <= 100);
end;

procedure TfplaMov.popMovClick(Sender: TObject);
begin
  with TflanMov.Create(Self, 0) do begin
    ShowModal;
    Free;
  end;

end;

procedure TfplaMov.popPesClick(Sender: TObject);
var
  tppes: string;
begin
  if DM.qyPes['tp_pes'] = cTipoAgente then tppes:= '(AGENTE)'
  else tppes:= '(FORNECEDOR)';

  ShowMessage(vartostr(DM.qyPes['id']) + ' - ' + tppes + ' ' + gViewMov.Controller.FocusedRow.Values[gvmIDPES.Index]);
end;

procedure TfplaMov.cbIDCNTPropertiesEditValueChanged(Sender: TObject);
var
  sql: string;
  dt: variant;
  itag: integer;
begin
{
  sql := 'select min(dt_ven) from plmovimento where ' + 'st_mov <> "' +
    cMovLiquidado + '" and ' + 'st_fim = "' + cSTNOR + '" and ' + 'id_cnt = "' +
    VarToStr(cbIDCNT.EditValue) + '" and ' + 'dt_ven BETWEEN "' +
    datasql(StartOfTheMonth(Date)) + '" and "' +
    datasql(EndOfTheMonth(Date)) + '"';
}

  if not DM.qyCnt.Locate('id', cbIDCNT.EditValue, []) then begin
    MsgErro('ERRO2401151217 - Conta ' + vartostr(cbIDCNT.EditValue) + ' não localizada!');
    cbIDCNT.SetFocus;
    cbIDCNT.ItemIndex:= 0;
    Exit;
  end;
  lbDSEMP.Caption:=  vartostr(DM.DBCON.ExecSQLScalar('select descr from tbempresas where id = :id', [DM.qyCnt['id_emp']]));
  //////
  {
  sql := 'select min(dt_ven) from plmovimento where ' +
    'st_mov <> "' + cMovLiquidado + '" and ' +
    'st_fim = "' + cSTNOR + '" and ' +
    'id_cnt = "' + VarToStr(cbIDCNT.EditValue) + '"';
  dt := DM.DBCON.ExecSQLScalar(sql);
  if (dt <> null) and (dt < edDTINI.Date) then begin
    itag:= cbIDCNT.Tag;
    cbIDCNT.Tag := 1;
    edDTINI.Date := dt;
    cbIDCNT.Tag := itag;
    // edDTFIM.Date:= dt;
  end;
  }
  //////
  //Filtra();
  btFiltra.Click();
end;

procedure TfplaMov.cbIDCNTPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if (DisplayValue = Null) or (DisplayValue = '') then begin
    DisplayValue:= '(CONTA INVÁLIDA)';
    ErrorText:= 'Informe uma Conta de Movimento Válida!';
    Error:= true;
  end;
end;

end.
