unit lanContrato;

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
  bancoEdit, zeroEdit, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, StrUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, DateUtils, Math, cxLabel, valorEdit;

type
  TflanContrato = class(TForm)
    Label1: TLabel;
    edIDUNI: TzeroEdit;
    Label2: TLabel;
    edDTINI: TcxDateEdit;
    Label3: TLabel;
    edDTFIM: TcxDateEdit;
    Label5: TLabel;
    gpRep: TGroupBox;
    Label8: TLabel;
    edOBS: TMemo;
    btConf: TBitBtn;
    edDSCTR: TEdit;
    Label11: TLabel;
    btVoltar: TBitBtn;
    edIDEVE: TMaskEdit;
    edPTUNI: TzeroEdit;
    cbIDEVE: TcxLookupComboBox;
    Label18: TLabel;
    edIDTPC: TzeroEdit;
    cbIDTPC: TcxLookupComboBox;
    Label19: TLabel;
    edNrCtr: TEdit;
    Label20: TLabel;
    edIDTPR: TzeroEdit;
    cbIDTPR: TcxLookupComboBox;
    Label21: TLabel;
    edPERIO: TEdit;
    Label22: TLabel;
    edIndReajus: TvalorEdit;
    DSMOV: TDataSource;
    lbIDCTR: TLabel;
    edVlMulta: TvalorEdit;
    Label26: TLabel;
    Label27: TLabel;
    edQtMeses: TEdit;
    Label28: TLabel;
    Label25: TLabel;
    edVLCTR: TvalorEdit;
    Label29: TLabel;
    edVLCAUCAO: TvalorEdit;
    cbCAUCAO: TComboBox;
    cbIDUNI: TcxLookupComboBox;
    pnMov: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    edQTD: TEdit;
    edVLD: TEdit;
    gviewMov: TcxGridDBTableView;
    glevelMov: TcxGridLevel;
    gridMov: TcxGrid;
    btInc: TBitBtn;
    btAlterar: TBitBtn;
    btExc: TBitBtn;
    colCOMPT: TcxGridDBColumn;
    colVLBAS: TcxGridDBColumn;
    colDTVEN: TcxGridDBColumn;
    colBANCO: TcxGridDBColumn;
    colAGENCIA: TcxGridDBColumn;
    colDESCR: TcxGridDBColumn;
    colTPD: TcxGridDBColumn;
    colNRCONTA: TcxGridDBColumn;
    colNRDOC: TcxGridDBColumn;
    colTPCONTA: TcxGridDBColumn;
    colMovID: TcxGridDBColumn;
    pnAguarde: TPanel;
    lbNTREG: TLabel;
    lbMeses: TLabel;
    colOBS: TcxGridDBColumn;
    Label12: TLabel;
    edIDCNT: TzeroEdit;
    cbIDCNT: TcxLookupComboBox;
    Label4: TLabel;
    edDtIncorp: TcxDateEdit;
    btGeraParcelas: TButton;
    colSTMOV: TcxGridDBColumn;
    colNUM: TcxGridDBColumn;
    btAplicarReajuste: TButton;
    Label6: TLabel;
    edIDPES: TMaskEdit;
    cbIDPES: TcxLookupComboBox;
    Label7: TLabel;
    cbSIT: TComboBox;
    lbIDPES2: TLabel;
    edIDPES2: TMaskEdit;
    cbIDPES2: TcxLookupComboBox;
    chTITULAR: TCheckBox;
    colNRPAR: TcxGridDBColumn;
    colSTFIM: TcxGridDBColumn;
    btFechar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfClick(Sender: TObject);
    procedure edIDUNIChange(Sender: TObject);
    procedure edIDEVEChange(Sender: TObject);
    procedure cbIDEVEPropertiesEditValueChanged(Sender: TObject);
    procedure edIDEVEExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDSCTRKeyPress(Sender: TObject; var Key: Char);
    procedure edNrContaEnter(Sender: TObject);
    procedure edNrContaExit(Sender: TObject);
    procedure ProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edIDUNIExit(Sender: TObject);
    procedure edPTUNIChange(Sender: TObject);
    procedure edNRDOCKeyPress(Sender: TObject; var Key: Char);
    procedure edIDTPCChange(Sender: TObject);
    procedure edIDTPRChange(Sender: TObject);
    procedure edIDTPRExit(Sender: TObject);
    procedure edIDTPCExit(Sender: TObject);
    procedure cbIDTPCPropertiesEditValueChanged(Sender: TObject);
    procedure cbIDTPRPropertiesEditValueChanged(Sender: TObject);
    procedure edIDEVEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edIDEVEClick(Sender: TObject);
    procedure edPERIOKeyPress(Sender: TObject; var Key: Char);
    procedure btVoltarClick(Sender: TObject);
    procedure cbCAUCAOSelect(Sender: TObject);
    procedure cbIDUNIPropertiesEditValueChanged(Sender: TObject);
    procedure edIDTPCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edIDTPRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edIDUNIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDTINIPropertiesEditValueChanged(Sender: TObject);
    procedure colNRDOCPropertiesChange(Sender: TObject);
    procedure btModoClick(Sender: TObject);
    procedure edIDCNTChange(Sender: TObject);
    procedure edIDCNTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbIDCNTPropertiesEditValueChanged(Sender: TObject);
    procedure btGeraParcelasClick(Sender: TObject);
    procedure edDtIncorpExit(Sender: TObject);
    procedure btExcClick(Sender: TObject);
    procedure colNUMGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure gviewMovDblClick(Sender: TObject);
    procedure colSTMOVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edIDPESChange(Sender: TObject);
    procedure edIDPESEnter(Sender: TObject);
    procedure edIDPESExit(Sender: TObject);
    procedure edIDPESKeyPress(Sender: TObject; var Key: Char);
    procedure cbIDPESPropertiesEditValueChanged(Sender: TObject);
    procedure edIDPES2Change(Sender: TObject);
    procedure edIDPES2Enter(Sender: TObject);
    procedure edIDPES2Exit(Sender: TObject);
    procedure cbIDPES2PropertiesEditValueChanged(Sender: TObject);
    procedure chTITULARClick(Sender: TObject);
    procedure cbSITSelect(Sender: TObject);
    procedure colNUMCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
  var
    FqtD: Integer;
    FvlD: Double;
    FidContrato: Integer;
    FmodoContrato: Integer;
    localSQLMOV: string;
    procedure IncluiAlteraContrato;
    procedure AlteraContrato(sit: String);
    procedure cdrUnidade;

    procedure novoContrato;

    procedure LimpaCamposCtr;
    procedure PreCamposCtr;
    procedure AtuValores;
    procedure AtuDadosContrato;
    procedure AlteraNTREG(NT: String);
    function checaHeader: Boolean;
    procedure AtivaTitular;
    function cdrPessoal(tpins: Integer; nrins: string): Boolean;
    // function ExeAcaoMov: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; modoContrato: Integer;
      idContrato: Integer); reintroduce;
  end;

var
  flanContrato: TflanContrato;

implementation

{$R *.dfm}

uses modDados, modFuncoes, cdrUnidades, myInputBox, lanMovimento,
  dlgAgeFor, cdrPessoal;

procedure TflanContrato.AlteraContrato(sit: String);
var
  sitant: string;
  qt: Integer;
begin
  DM.DBCON.StartTransaction;
  DM.QYCTR.Edit;
  DM.QYCTR.FieldByName('st_fim').AsString := sit;
  DM.QYCTR.Post;
  // qt:= DM.DBCON.ExecSQL('update plcontratos set st_fim = "' + sit + '" where id = ' + inttostr(FidContrato));
  // if qt <> 1 then begin
  // MsgErro('2310310856 - Erro ao atualizar contrato id: ' + inttostr(FidContrato));
  // DM.DBCON.Rollback;
  // exit;
  // end;
  if sit <> cSTFIN then begin

    if sit = cSTNOR then
      sitant := cSTINA
    else
      sitant := cSTNOR;

    qt := DM.DBCON.ExecSQL('update plmovimento set ' + 'st_fim = "' + sit +
      '" where ' + 'id_ctr = ' + inttostr(FidContrato) + ' and ' + 'st_fim = "'
      + sitant + '" and ' + 'st_mov <> "' + cMovLiquidado + '"');
    ShowMessage('Registros atualizados: ' + inttostr(qt + 1));
  end;
  DM.DBCON.Commit;
end;

procedure TflanContrato.AlteraNTREG(NT: String);
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

end;

procedure TflanContrato.AtivaTitular;
begin
  lbIDPES2.Enabled := not chTITULAR.Checked;
  edIDPES2.Enabled := not chTITULAR.Checked;
  cbIDPES2.Enabled := not chTITULAR.Checked;
  if chTITULAR.Checked then begin
    cbIDPES2.ItemIndex := -1;
    edIDPES2.Tag := 1;
    edIDPES2.EditMask := '';
    edIDPES2.Text := '';
    edIDPES2.Tag := 0;
  end;
end;

procedure TflanContrato.AtuDadosContrato;
begin
  with DM.QYCTR do
  begin
    if FmodoContrato = modoInc then
    begin //
      Edit;
      FieldByName('st_ini').AsString := cSTNOR;
      // FieldByName('st_fim').AsString:= cSTNOR; //Saido daqui em 31/10/23
      FieldByName('dt_inc').AsDateTime := Now;
    end
    else if FmodoContrato = modoAlt then
    begin
      Edit;
      FieldByName('dt_alt').AsDateTime := Now;
      FieldByName('us_alt').AsInteger := wUsuario;
    end
    else if FmodoContrato = modoExc then
    begin
      Edit;
      FieldByName('st_fim').AsString := cSTEXC;
      FieldByName('dt_exc').AsDateTime := Now;
      FieldByName('us_exc').AsInteger := wUsuario;
      Post;
      Exit; // Sair de imediato ao "excluir"
    end
    else
    begin
      MsgErro('2306271429 - Modo Inválido: ' + inttostr(FmodoContrato));
    end;
    FieldByName('st_fim').AsString := cSTNOR; // Vindo para ca em 31/10/23
    FieldByName('st_mov').AsString := cCtrAberto;
    FieldByName('id_cnt').AsInteger := cbIDCNT.EditValue;
    FieldByName('id_uni').AsInteger := cbIDUNI.EditValue;
    FieldByName('id_EVE').AsInteger := cbIDEVE.EditValue;
    FieldByName('id_pes').AsInteger := cbIDPES.EditValue;

    if chTITULAR.Checked then
      FieldByName('id_pes2').AsInteger := 0
    else
      FieldByName('id_pes2').AsInteger := cbIDPES2.EditValue;

    FieldByName('id_pes').AsInteger := cbIDPES.EditValue;
    FieldByName('nr_contrato').AsString := edNrCtr.Text;
    FieldByName('dt_ini').AsVariant := edDTINI.EditValue;
    FieldByName('dt_fim').AsVariant := edDTFIM.EditValue;
    FieldByName('dt_incorp').AsVariant := edDtIncorp.EditValue;
    FieldByName('vl_contrato').AsFloat := edVLCTR.Value;
    FieldByName('vl_caucao').AsFloat := edVLCAUCAO.Value;
    FieldByName('id_tpc').AsVariant := cbIDTPC.EditValue;
    FieldByName('id_tpr').AsVariant := cbIDTPR.EditValue;
    FieldByName('perio').AsInteger := StrToInt('0' + edPERIO.Text);
    FieldByName('ind_reajus').AsFloat := edIndReajus.Value;
    // FieldByName('id_pes').AsInteger:= 0;//edDSPES.Tag;

    FieldByName('vl_multa').AsFloat := edVlMulta.Value;
    FieldByName('qt_meses').AsInteger := StrToInt('0' + edQtMeses.Text);
    FieldByName('qt_pen').AsInteger := DM.qymov.RecordCount;

    FieldByName('qtd_mov').AsInteger := FqtD;
    FieldByName('vlt_mov').AsFloat := FvlD;

    FieldByName('descr').AsString := edDSCTR.Text; // edDESCR.Text;
    FieldByName('obs').AsString := edOBS.Text;
    Post;
  end;

end;

procedure TflanContrato.AtuValores;
begin
  with DM.qry do
  begin
    Open('SELECT COALESCE(SUM(vl_bas),0) as VlD, count(id) as QtD FROM plmovimento WHERE '
      + '(id_ctr = ' + inttostr(FidContrato) + ') and ' + '((st_fim = "' +
      cSTPEN + '") or (st_fim = "' + cSTNOR + '"))');
    FqtD := FieldByName('qtd').AsInteger;
    FvlD := FieldByName('vld').AsFloat;
    edQTD.Text := inttostr(FqtD);
    edVLD.Text := formataValor(FvlD);
    Close;
  end;

end;

procedure TflanContrato.btVoltarClick(Sender: TObject);
// var
// obs: string;
begin
  if DM.QYCTR.FieldByName('st_fim').AsString = cSTPEN then
  begin
    FmodoContrato := modoExc; // define como Excluido
    DM.DBTRANS.StartTransaction;
    AtuDadosContrato;
    if DM.qymov.RecordCount > 0 then
      DM.DBCON.ExecSQL('UPDATE plmovimento SET ' + 'st_fim = "' + cSTEXC + '" '
        + 'WHERE (id_ctr = ' + inttostr(FidContrato) + ') ');
    DM.DBTRANS.Commit;
    modalResult := mrClose;
  end else begin
    if DM.qymov.Locate('st_fim', cSTPEN, []) then begin
      DM.DBCON.ExecSQL('update plmovimento SET st_fim = "' + cSTEXC + '" WHERE '
        + 'id_ctr = "' + DM.QYCTR.FieldByName('id').AsString + '" and ' +
        'st_fim = "' + cSTPEN + '"');
      DM.qymov.Close;
      //DM.qymov.Open(localSQLMOV);
    end;
    if DM.qymov.RecordCount = 0 then
      MsgErro('Por um ERRO ANTERIOR, este Contrato foi salvo sem Lançamentos!!!!!');
    modalResult := mrCancel;
  end;
  // ShowMessage(inttostr(self.Tag));
end;

procedure TflanContrato.btFecharClick(Sender: TObject);
begin
Self.Close;
end;

procedure TflanContrato.btConfClick(Sender: TObject);
var
  st: string;
begin
  st := '';
  if cbIDUNI.ItemIndex < 0 then
    st := st + '- Campo "Centro de Custo" inválido!' + #13#10;
  if cbIDEVE.EditValue = null then
    st := st + '- Campo "Evento" inválido!' + #13#10;
  if cbIDPES.EditValue = null then
    st := st + '- Informe o "Locador/Favorecido" do Contrato!';
  if (edDTINI.EditValue <> null) or (edDTFIM.EditValue <> null) then begin
    if (edDTINI.EditValue = null) then
      st := st + '- Campo "Data de Início" inválido!' + #13#10;
    if (edDTFIM.EditValue = null) then
      st := st + '- Campo "Data de Término" inválido!' + #13#10
    else if (edDTFIM.Date < edDTINI.Date) then
      st := st + '- Campo "Data de Término" inválido!' + #13#10;
  end;
  if (cbCAUCAO.ItemIndex = 1) and (edVLCAUCAO.Value = 0) then
    st := st + '- Campo "Valor da Caução" inválido!' + #13#10;
  if not chTITULAR.Checked then
    if cbIDPES2.EditValue = null then
      st := st + '- Informe o "Titular" do Contrato!';

  if DM.qymov.RecordCount = 0 then
    st := st + '- Informe as Parcelas!' + #13#10;

  if st <> '' then begin
    ShowMessage(st);
    Exit;
  end;

  DM.QYCTR.Tag := 0;
  if DM.QYCTR.FieldByName('st_fim').AsString = cSTPEN then begin
    if MsgBox('Confirma Inclusão deste Contrato com ' + edQTD.Text +
      ' parcela(s) totalizando ' + edVLD.Text + '?', 'Inclusão de Contrato',
      MB_QUESTAO) = IDNO then
      Exit;
    IncluiAlteraContrato;
  end else begin
    if (cbSIT.ItemIndex <> cbSIT.Tag) and (cbSIT.ItemIndex <> 1) then begin // Nao é Ativo!!!!
      if cbSIT.ItemIndex = 2 then begin // Finalizando!!!!
        if DM.qymov.Locate('st_mov', cMovAgendado, []) or
          DM.qymov.Locate('st_mov', cMovEmConta, []) then begin
          MsgErro('Não é possível Finalizar um Contrato com movimento pendente!');
          Exit;
        end;
        if not perguntaSim('Deseja marcar este contrato como FINALIZADO?',
          'Finalizar Contrato') then
          Exit;

        AlteraContrato(cSTFIN);
      end else begin
        if cbSIT.ItemIndex = 0 then // Inativar
          st := 'Deseja DESATIVAR este Contrato?'
        else
          st := 'Deseta ATIVAR novamente este Contrato?';

        if not perguntaSim(st, 'Contrato') then
          Exit;

        if cbSIT.ItemIndex = 0 then
          AlteraContrato(cSTINA)
        else
          AlteraContrato(cSTNOR);

      end;
    end else begin
      if MsgBox('Confirma Alteração deste Contrato com ' + edQTD.Text +
        ' parcela(s) totalizando ' + edVLD.Text + '?', 'Alteração de Contrato',
        MB_QUESTAO) = IDNO then
        Exit;

      IncluiAlteraContrato;
    end;

  end;

  // if (FmodoContrato = modoINC) or (DM.qyctr.FieldByName('st_fim').AsString = cSTPEN) then begin
  modalResult := mrOk;
  // end else begin
  // ShowMessage('Contrato com os lançamentos foi Alterado com Sucesso!');
  // ModalResult:= mrOk;
  // end;
end;

procedure TflanContrato.btExcClick(Sender: TObject);
var
  i: Integer;
  obs: String;
begin
  if gviewMov.Controller.SelectedRowCount > 0 then
  begin
    for i := 0 to gviewMov.Controller.SelectedRowCount - 1 do begin
      // showmessage(grMov.DataController.GetRecordId(grMov.Controller.SelectedRows[i].RecordIndex));
      if gviewMov.DataController.Values[gviewMov.Controller.SelectedRecords[i]
        .RecordIndex, colSTMOV.Index] <> cMovAgendado then begin
        MsgErro('Apenas Lançamentos Agendados podem ser excluído!');
        Exit;

      end;

    end;
    if not perguntaNao('Excluir ' +
      inttostr(gviewMov.Controller.SelectedRowCount) +
      ' Registro(s) selecionado(s)? Esta operação não pode ser desfeita!',
      'Exclusão de Registros') then
      Exit;
    if not perguntaNao('Tem certeza?', 'Exclusão de Registros') then
      Exit;

    if not DM.obsBox('Motivo da Exclusão',
      'Informe por que está Excluindo este(s) lançamento(s):', obs) then
      exit;
    gviewMov.BeginUpdate();
    gviewMov.DataController.BeginLocate;
    DM.qymov.DisableControls;
    DM.DBTRANS.StartTransaction;
    try
      for i := 0 to gviewMov.Controller.SelectedRowCount - 1 do begin
        // showmessage(grMov.DataController.GetRecordId(grMov.Controller.SelectedRows[i].RecordIndex));
        // grmOv.Controller
        if DM.qymov.Locate('id', gviewMov.DataController.GetRecordId
          (gviewMov.Controller.SelectedRows[i].RecordIndex), []) then begin
          DM.qymov.Edit;
          DM.qymov.FieldByName('st_fim').AsString := cSTEXC;
          DM.qymov.FieldByName('dt_exc').AsDateTime := Now;
          DM.qymov.FieldByName('us_exc').AsInteger := wUsuario;
          DM.adicionaLog(DM.qymov, logExcluido, obs);
          DM.qymov.Post;
          // qyMov.Delete;
        end else begin
          raise Exception.Create('070820231751 - Id não encontrado: ' +
            gviewMov.DataController.GetRecordId(gviewMov.Controller.SelectedRows
            [i].RecordIndex));
        end;
        // qymov.Lookup()
        // grMov.Controller.SelectedRows[i].Selected
        // grMov.DataController.DeleteRecord(grMov.Controller.SelectedRows[i].RecordIndex);
      end;
    finally
      DM.DBTRANS.Commit;
      DM.qymov.Refresh;
      gviewMov.DataController.EndLocate;
      gviewMov.EndUpdate;
      DM.qymov.EnableControls;
      // grMov.Controller.DeleteSelection;
      AtuValores;
      btVoltar.Enabled := (DM.QYCTR.FieldByName('st_fim').AsString = cSTPEN);
      ShowMessage('Lançamento(s) Excluído(s)!');
    end;

  end;

end;

procedure TflanContrato.btModoClick(Sender: TObject);
var
  modo: Integer;
  qtpar: Integer;
  inpar: integer;
begin
  modo := TControl(Sender).Tag;
  if not TControl(Sender).Enabled then Exit;

  if modo <> modoExc then begin
    if (modo = modoAlt) and (DM.qymov.RecordCount = 0) then Exit;

    if not checaHeader then Exit;

    qtpar := 1;
    if (edDTINI.EditValue <> null) and (edDTFIM.EditValue <> null) then
      qtpar := calcMeses(edDTINI.Date, edDTFIM.Date);
    DM.qymov.DisableControls;

    if modo = modoInc then begin
      //colDTVEN.so
      if colDTVEN.SortIndex <> 0 then begin
        colDTVEN.SortIndex:= 0;
      end;
      inpar:= 1;
      if DM.QYMOV.RecordCount > 0 then begin
        DM.QYMOV.Last;
        inpar:= dm.QYMOV['nr_parc'] + 1;
      end;
      if inpar > qtpar then inpar:= 1;

      with TflanMov.Create(Self, cTipoContrato, FidContrato, cbIDCNT.EditValue,
        cbIDUNI.EditValue, cbIDEVE.EditValue, cbIDPES.EditValue, 0, qtpar, inpar) do begin
        ShowModal; // = mrOK then
        if (Tag > 0) or (modalResult = mrOk) then begin
          AtuValores;
          // btVoltar.Enabled:= False;
          btVoltar.Enabled := false;
        end;
        Free;
      end;
    end else begin   //ALTERAÇÃO
      if DM.qymov.FieldByName('st_mov').AsString <> cMovAgendado then begin
        // MsgErro('Este Lançamento não pode ser Alterado por aqui!');
        with TflanMov.Create(Self, 0) do begin
          ShowModal;
          Free;
        end;
        DM.qymov.EnableControls;
        Exit;
      end;

      with TflanMov.Create(Self, modo, cTipoContrato, FidContrato,
        cbIDCNT.EditValue, cbIDUNI.EditValue, cbIDEVE.EditValue,
        DM.qymov['id_pes']) do begin
        ShowModal; // = mrOK then
        if (Tag > 0) or (modalResult = mrOk) then begin
          btVoltar.Enabled := false;
          DM.QYMOV.DisableControls;


          if tag = 99 then begin
            DM.QYMOV.Close;
            DM.QYMOV.Open(localSQLMOV);
          end;
          while DM.QYMOV.ControlsDisabled do
            DM.QYMOV.EnableControls;
          //DM.QYMOV.clo
          AtuValores;
          // btVoltar.Enabled:= False;
        end;
        Free;
      end;

    end;
    while DM.QYMOV.ControlsDisabled do DM.qymov.EnableControls;
  end else begin // exclusão
    // if (qymov.RecordCount = 0) then exit;

  end;
end;

procedure TflanContrato.btGeraParcelasClick(Sender: TObject);
var
  qtpar: Integer;
  inpar: Integer;
begin

  if edDTINI.EditValue = null then
  begin
    MsgErro('Informe uma Data de Início!');
    edDTINI.SetFocus;
    Exit;
  end;
  if edDTFIM.EditValue = null then
  begin
    MsgErro('Informe uma Data de Término!');
    edDTFIM.SetFocus;
    Exit;
  end;

  if edDTFIM.Date < edDTINI.Date then
  begin
    MsgErro('Data de Término não pode ser menor que a Data de Início!');
    edDTFIM.SetFocus;
    Exit;
  end;

  if edDtIncorp.EditValue = null then
  begin
    MsgErro('Informe a Data de Incorporação!');
    edDTINI.SetFocus;
    Exit;
  end;
  if edDtIncorp.EditValue < edDTINI.EditValue then
  begin
    MsgErro('Data de Incorporação não pode ser Menor que a Data de Início!');
    edDTINI.SetFocus;
    Exit;
  end;
  if edDtIncorp.EditValue > edDTFIM.EditValue then
  begin
    MsgErro('Data de Incorporação não pode ser Maior que a Data de Término!');
    edDTINI.SetFocus;
    Exit;
  end;

  if not checaHeader then
    Exit;

  // Math.SetRoundMode(rmUP);
  qtpar := calcMeses(edDTINI.Date, edDTFIM.Date);
  // Round(MonthSpan(edDTFIM.Date, edDTINI.Date));
  // if qtPar = 1 then

  inpar := calcMeses(edDTINI.Date, edDtIncorp.Date) + 1;
  // Round(MonthSpan(edDTIncorp.Date, edDTINI.Date)) +1;
  // if not perguntaSim('Serão geradas ' + inttostr(qtpar-inpar+1) + ' Parcelas de um Total de ' + inttostr(qtPar) + ' iniciando na Parcela de Nº ' + inttostr(inpar) + ' na data de ' + edDtIncorp.Text +'. Proceder?', 'Geração de Parcelas') then
  // exit;
  if not perguntaSim('Gerar Parcelas a partir da número ' + inttostr(inpar) +
    ' iniciando na data de ' + edDtIncorp.Text + '?',
    'Geração de Parcelas de Incorporação') then
    Exit;

  DM.qymov.DisableControls;
  with TflanMov.Create(Self, cTipoContrato, FidContrato, cbIDCNT.EditValue,
    cbIDUNI.EditValue, cbIDEVE.EditValue, cbIDPES.EditValue, edDtIncorp.Date,
    qtpar, inpar) do
  begin
    ShowModal; // = mrOK then
    if (Tag > 0) or (modalResult = mrOk) then
      AtuValores;
    Free;
  end;
  DM.qymov.EnableControls;

end;

procedure TflanContrato.cbCAUCAOSelect(Sender: TObject);
begin

  edVLCAUCAO.Enabled := (cbCAUCAO.ItemIndex = 1);
  if cbCAUCAO.ItemIndex = 0 then
    edVLCAUCAO.Value := 0;

end;

procedure TflanContrato.cbIDCNTPropertiesEditValueChanged(Sender: TObject);
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

procedure TflanContrato.cbIDEVEPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDEVE.Tag = 0 then
  begin // permite o OnChange
    edIDEVE.Tag := 1; // DESATIVA o OnChange
    edIDEVE.Text := '';
    if DM.qyEVE.Locate('id', cbIDEVE.EditValue, []) then
    begin
      edIDEVE.Text := DM.qyEVE.FieldByName('cod').AsString;
      AlteraNTREG(DM.qyEVE.FieldByName('nt_reg').AsString);
    end;
    edIDEVE.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanContrato.cbIDPES2PropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDPES2.Tag = 0 then
  begin // permite o OnChange
    if cbIDPES2.EditValue <= 0 then
      Exit;
    edIDPES2.Tag := 1; // DESATIVA o OnChange
    edIDPES2.Text := '';
    edIDPES2.EditMask := '';

    if DM.qyPES.Locate('id', cbIDPES2.EditValue, []) then
    begin
      // PreInfPes;
      edIDPES2.Text := DM.qyPES.FieldByName('nr_ins').AsString;
      if DM.qyPES.FieldByName('tp_ins').AsInteger = cTipoCPF then
        edIDPES2.EditMask := mskCPF
      else
        edIDPES2.EditMask := mskCNPJ;
    end;
    edIDPES2.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanContrato.cbIDPESPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDPES.Tag = 0 then
  begin // permite o OnChange
    edIDPES.Tag := 1; // DESATIVA o OnChange
    edIDPES.Text := '';
    edIDPES.EditMask := '';
    if DM.qyPES.Locate('id', cbIDPES.EditValue, []) then
    begin
      // PreInfPes;
      edIDPES.Text := DM.qyPES.FieldByName('nr_ins').AsString;
      if DM.qyPES.FieldByName('tp_ins').AsInteger = cTipoCPF then
        edIDPES.EditMask := mskCPF
      else
        edIDPES.EditMask := mskCNPJ;
    end;
    edIDPES.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanContrato.cbIDTPCPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDTPC.Tag = 0 then
  begin // permite o OnChange
    edIDTPC.Tag := 1; // DESATIVA o OnChange
    edIDTPC.Value := '';
    if DM.qyTPC.Locate('id', cbIDTPC.EditValue, []) then
    begin
      edIDTPC.Value := DM.qyTPC.FieldByName('cod').AsString;
    end;
    edIDTPC.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanContrato.cbIDTPRPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDTPR.Tag = 0 then
  begin // permite o OnChange
    edIDTPR.Tag := 1; // DESATIVA o OnChange
    edIDTPR.Value := '';
    if DM.qyTPR.Locate('id', cbIDTPR.EditValue, []) then
    begin
      edIDTPR.Value := DM.qyTPR.FieldByName('cod').AsString;
    end;
    edIDTPR.Tag := 0; // Ativa o OnChange
  end;
end;

procedure TflanContrato.cbIDUNIPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDUNI.Tag = 0 then
  begin // permite o OnChange
    edIDUNI.Tag := 1; // DESATIVA o OnChange
    edIDUNI.Text := '';
    edPTUNI.Value := '1';
    if DM.qyUNI.Locate('id', cbIDUNI.EditValue, []) then
    begin
      edIDUNI.Text := DM.qyUNI.FieldByName('cod').AsString;
      edPTUNI.Value := DM.qyUNI.FieldByName('ponto').AsString;
    end;
    edIDUNI.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanContrato.cbSITSelect(Sender: TObject);
begin
  //
  btConf.Enabled := cbSIT.Tag <> cbSIT.ItemIndex;
  if cbSIT.Tag = cbSIT.ItemIndex then
  begin

    btConf.Enabled := (cbSIT.ItemIndex = 1);
    btInc.Enabled := cbSIT.ItemIndex <> 2;
    btAlterar.Enabled := cbSIT.ItemIndex <> 2;
    btExc.Enabled := cbSIT.ItemIndex <> 2;
    btGeraParcelas.Enabled := cbSIT.ItemIndex <> 2;
  end;
end;

function TflanContrato.cdrPessoal(tpins: Integer; nrins: string): Boolean;
var
  iTPPES: Integer;
  // sTPPES: String;
  sTPINS: String;
  sNRINS: String;
begin
  if tpins = cTipoCNPJ then
  begin
    // sTPPES:= 'Fornecedor';
    sTPINS := 'CNPJ';
  end
  else
  begin
    // sTPPES:= 'Documento';
    sTPINS := 'CPF';
  end;
  sNRINS := formataNRINS(sonumero(nrins), tpins);

  with TfdlgAgeFor.Create(Self, tpins, sTPINS + ': ' + sNRINS) do
  begin
    iTPPES := ShowModal;
    Free;
  end;
  Result := False;
  if iTPPES = idCancel then
  begin
    // edIDPES.SetFocus;
    // edIDPES.SelectAll;
    Exit;
  end;
  iTPPES := 100 - iTPPES;
  // Retorna 100 - Agente, 99 - Fornecedor  e Transf. em 0 e 1

  with TfcdrPessoal.Create(Self, iTPPES) do
  begin
    cbTPINS.ItemIndex := tpins;
    cbTPINSSelect(nil);
    edNRINS.Text := sonumero(edIDPES.Text);
    // edPonto.Text:= edPTUNI.Value;
    if ShowModal = mrOk then
    begin // Cadastrado
        DM.DBCON.StartTransaction;
      with DM.qyPES do begin
        Append;
        FieldByName('tp_pes').AsInteger := iTPPES;
        FieldByName('tp_ins').AsInteger := tpins;
        FieldByName('nr_ins').AsString := sonumero(edIDPES.Text);
        if iTPPES = cTipoAgente then
        begin
          FieldByName('cod').AsString := edCod.Text;
          FieldByName('id_uni').AsInteger := cbIDUNI.EditValue;
        end;
        FieldByName('descr').AsString := edDescr.Text;
        FieldByName('banco').AsString := edBanco.Value;
        FieldByName('agencia').AsString := edagencia.Value; // , 'X');
        FieldByName('nr_conta').AsString := ednrconta.Value; // , 'X');
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
        Last;
        cbIDPES.Tag := 1;
        cbIDPES.EditValue := FieldByName('id').AsInteger;
        cbIDPES.Tag := 0;
        // Self.edBanco.value:= FieldByName('banco').AsString;
        // Self.edAgencia.value:= FieldByName('agencia').AsString;
        // Self.edNrConta.Value:= FieldByName('nr_conta').AsString;
      end;
        DM.DBCON.Commit;
      // ShowMessage('Cadastro realizado!');
      // ProxFocus;
      Result := true;
    end
    else
    begin
      // edIDPES.SetFocus;
      // edIDPES.SelectAll;
      // cbIDPES.Tag:= 1; //
    end;
    Free;
  end;

end;

procedure TflanContrato.cdrUnidade;
begin
  if Application.MessageBox(PWideChar('Unidade "' + edIDUNI.Value +
    '" não existe. Deseja cadastrá-la?'), 'Nova Unidade',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;
  with TfcdrUnidades.Create(Self) do
  begin
    edCod.Text := edIDUNI.Value;
    edPonto.Text := edPTUNI.Value;
    if ShowModal = mrOk then
    begin
      DM.DBCON.StartTransaction;
      DM.qyUNI.Append;
      DM.qyUNI.FieldByName('cod').AsString := edCod.Text;
      DM.qyUNI.FieldByName('ponto').AsString := edPonto.Text;
      DM.qyUNI.FieldByName('descr').AsString := edDescr.Text;
      DM.qyUNI.FieldByName('local').AsString := edLocal.Text;
      DM.qyUNI.FieldByName('uf').AsString := cbUF.Text;
      DM.qyUNI.FieldByName('obs').AsString := edOBS.Text;
      DM.qyUNI.FieldByName('ativo').AsInteger := 1;
      DM.qyUNI.FieldByName('us_inc').AsInteger := wUsuario;
      // DM.qyUni.FieldByName('dt_inc').AsDateTime:= Now;
      DM.qyUNI.Post;
      DM.DBCON.Commit;
      DM.qyUNI.Last;
      cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
      edIDUNI.Tag := 0; // ativa OnChange
      // edDSUNI.Text:= DM.qyUni.FieldByName('descr').AsString;
      // ShowMessage('Cadastro realizado!');
      edIDEVE.SetFocus;
    end else begin
      edIDUNI.SetFocus;
    end;
    Free;
  end;
end;

function TflanContrato.checaHeader: Boolean;
begin
  Result := False;
  if cbIDCNT.EditValue = null then
  begin
    MsgErro('Informe uma Conta de Movimento!');
    edIDCNT.SetFocus;
    Exit;
  end;

  if cbIDUNI.EditValue = null then
  begin
    MsgErro('Informe um Centro de Custo!');
    edIDUNI.SetFocus;
    Exit;
  end;

  if cbIDEVE.EditValue = null then
  begin
    MsgErro('Informe um Tipo de Evento!');
    edIDEVE.SetFocus;
    Exit;
  end;

  if cbIDPES.EditValue = null then
  begin
    MsgErro('Informe um Favorecido!');
    edIDPES.SetFocus;
    Exit;
  end;

  Result := true;
end;

procedure TflanContrato.chTITULARClick(Sender: TObject);
begin
  AtivaTitular;
end;

procedure TflanContrato.colNRDOCPropertiesChange(Sender: TObject);
begin
  // TextEdit(SendetrdNRDOC.Text:= formataNrDoc(soNumero(edNRDOC.Text));
  // edNRDOC.SelStart:= length(edNRDOC.Text);
  with TcxTextEdit(Sender) do
  begin
    Text := sonumero(Text);
    SelStart := length(Text);
  end;
end;

procedure TflanContrato.colSTMOVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  cor: TColor;
begin
  cor := ACanvas.Font.Color;
  ACanvas.Font.Color := clBlack;
  if AViewInfo.Value = cMovLiquidado then
    ACanvas.Brush.Color := corMovLiquidado
  else if AViewInfo.Value = cMovEmConta then
    ACanvas.Brush.Color := corMovEmconta // TColor($00A5FF)
  else if AViewInfo.Value = cMovAgendado then
    ACanvas.Brush.Color := corMovAgendado
  else
    ACanvas.Font.Color := cor; // TColor($0000FF);
end;

constructor TflanContrato.Create(AOwner: TComponent; modoContrato: Integer;
  idContrato: Integer);
var
  st: string;
  stfim: String;
begin
  inherited Create(AOwner);

  btFECHAR.Visible:= wUsuario <= 100;

  colNRPAR.Visible:= (wUsuario <= 100);
  colSTFIM.Visible:= (wUsuario <= 100);

  DM.carregaConfig();
  pnAguarde.Hide;
  pnAguarde.Left := (gridMov.Left + gridMov.Width - pnAguarde.Width) div 2;
  pnAguarde.Top := (gridMov.Top + gridMov.Height - pnAguarde.Height) div 2;
  lbIDCTR.Visible := wUsuario <= 100;//(wModoDev <> 0);
  FmodoContrato := modoContrato;

  //with DM do begin // Tabelas auxiliares abertas na Planilha
    //qyPES.Filter := 'ativo >= 0';
    //qyPES.Filtered := true; // esta aberta an Pl. Contrato
    //qyEVE.Filter := '(ativo = 1) and (rgtCod <> ''00'')';
    //qyEVE.Filtered := true; // esta aberta na Pl. Contrato
    //qyTCB.Open();
  //end;

  DM.qymov.Filter := 'st_fim in (''' + cSTPEN + ''', ''' + cSTNOR + ''', ''' + cSTINA + ''') ';
  DM.qymov.Filtered := true;
  DM.QYMOV.IndexFieldNames:= 'dt_ven';
  AlteraNTREG(cNTNEU);
  if FmodoContrato = modoInc then begin // Modo de Inclusão
    // qyctr.Filtered:= false;
    cbSIT.ItemIndex := 1;
    // cbSIT.Enabled:= false;
    novoContrato;
  end else begin
    FidContrato := idContrato;
    lbIDCTR.Caption := inttostr(FidContrato);
    if (FmodoContrato = modoAlt) or (FmodoContrato = modoNAV) then begin // Alteração
      stfim := DM.QYCTR.FieldByName('st_fim').AsString;
      if stfim = cSTNOR then
        cbSIT.ItemIndex := 1
      else if stfim = cSTFIN then begin // Finalizado
        cbSIT.ItemIndex := 2;
        cbSIT.Enabled := False;
      end else
        cbSIT.ItemIndex := 0; // Inativo?!?!?!?!

      if FmodoContrato = modoAlt then begin // Alteração
        DM.DBCON.ExecSQL('update plmovimento SET ' +
          'st_fim = "' + cSTEXC2 + '", ' +
          'us_alt = ' + inttostr(wUsuario) + ', ' +
          'dt_alt = current_timestamp() ' +
          'WHERE '
          + 'id_ctr = "' + inttostr(FidContrato) + '" and ' +
          'st_fim = "' + cSTPEN + '"');

        st := 'SELECT * FROM plmovimento WHERE ' +
          '(id_ctr = ' + inttostr(FidContrato) + ')  and (';
        if stfim <> cSTNOR then
          st := st + '(st_fim = "' + cSTNOR + '") or ';
        st := st + '(st_fim = "' + stfim + '") ' + ') order by DT_VEN';
        localSQLMOV:= st;
        DM.qymov.Open(localSQLMOV);
        Self.Caption := Self.Caption + ' - Alteração';
      end;
      AtuValores;
      PreCamposCtr;
    end else begin
      MsgErro('2306271420 - Modo Informado inválido: ' + inttostr(FmodoContrato));
      Close;
    end;
  end;
  cbSIT.Tag := cbSIT.ItemIndex;
  cbSITSelect(nil);

  self.Caption:= self.Caption + ' (' + inttostr(fidcontrato) + ')';
end;

procedure TflanContrato.edDSCTRKeyPress(Sender: TObject; var Key: Char);
var
  pkey: Integer;
begin
  if (Key = kENTER) then begin
    Key := #0;
    ProxFocus;
  end else begin
    pkey := pos(Key, comAcento);
    if pkey > 0 then
      Key := semacento[pkey];
  end;
end;

procedure TflanContrato.edDtIncorpExit(Sender: TObject);
begin
  {
    if edDtIncorp.EditValue < edDtIni.Date then begin
    msgErro('Data da Incorporação não pode ser menor que a Data de Início.');
    edDtIncorp.SetFocus;
    end;
    if edDtIncorp.EditValue > edDtFim.Date then begin
    msgErro('Data da Incorporação não pode ser maior que a Data de Término.');
    edDtIncorp.SetFocus;
    end;
  }
end;

procedure TflanContrato.edDTINIPropertiesEditValueChanged(Sender: TObject);
var
  qt: Integer;
begin
  // if edDTFIM.EditValue > edDTINI.EditValue then begin
  lbMeses.Caption := '';
  if edDTINI.EditValue = null then
    Exit;
  if edDTFIM.EditValue = null then
    Exit;

  // Math.SetRoundMode(rmUP);
  qt := calcMeses(edDTINI.Date, edDTFIM.Date);
  // Round(MonthSpan(edDTFIM.Date, edDTINI.Date));// MonthsBetween(edDTFIM.Date, edDTINI.Date);
  if qt > 0 then
    if qt > 1 then
      lbMeses.Caption := inttostr(qt) + ' MESES'
    else
      lbMeses.Caption := inttostr(qt) + ' MÊS';

  if edDtIncorp.EditValue = null then
    edDtIncorp.Date := edDTINI.Date;
end;

procedure TflanContrato.ProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TflanContrato.edIDTPRChange(Sender: TObject);
begin
  if edIDTPR.Tag = 0 then
  begin // permite o OnChange
    cbIDTPR.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDTPR.Clear;
    if length(edIDTPR.Value) > 0 then
    begin
      if DM.qyTPR.Locate('id', edIDTPR.Value, []) then
      begin
        cbIDTPR.EditValue := DM.qyTPR.FieldByName('id').AsInteger;
        cbIDTPR.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end
    else
    begin // campo está vazio
      cbIDTPR.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TflanContrato.edIDTPRExit(Sender: TObject);
begin
  edIDTPR.Tag := 1; // DESATIVA o OnChange
  if cbIDTPR.Tag = 1 then
  begin // não foi localizado
    with TfInputBox.Create(Self, 'Cadastro de um novo Tipo de Reajuste: ' +
      edIDTPR.Value, 'Informe uma Descrição para o Tipo ' + edIDTPR.Value) do
    begin
      if ShowModal = mrOk then
      begin
        DM.qyTPR.Append;
        DM.qyTPR.FieldByName('id').AsString := edIDTPR.Value;
        DM.qyTPR.FieldByName('descr').AsString := edPROMPT.Text;
        DM.qyTPR.FieldByName('us_inc').AsInteger := wUsuario;
        DM.qyTPR.FieldByName('ativo').AsInteger := 1;
        // Dm.qyTPR.FieldByName('dt_inc').AsDateTime:= now;
        DM.qyTPR.Append;
        DM.qyTPR.Last;
        cbIDTPR.EditValue := DM.qyTPR.FieldByName('id').AsInteger;
      end
      else
      begin
        edIDTPR.Clear;
        edIDTPR.SetFocus;
      end;
      Free;
    end; // with
  end;
  cbIDTPR.Tag := 0; // Ativa o OnChange
  edIDTPR.Tag := 0; // Ativa o OnChange

end;

procedure TflanContrato.edIDTPRKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyTPR;
  ok := False;
  if (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    if qry.RecordCount > 0 then
    begin
      ok := true;

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
    desativatags([edIDTPR, cbIDTPR]);
    edIDTPR.Text := qry.FieldByName('cod').AsString;
    cbIDTPR.EditValue := qry.FieldByName('id').AsInteger;
    ativatags([edIDTPR, cbIDTPR]);

  end;
  // qry:= nil;
end;

procedure TflanContrato.edIDCNTChange(Sender: TObject);
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

procedure TflanContrato.edIDCNTKeyDown(Sender: TObject; var Key: Word;
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
      ok := true;

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

procedure TflanContrato.edIDEVEChange(Sender: TObject);
var
  iSelStart: Integer;
begin
  if edIDEVE.Tag = 0 then
  begin // permite o OnChange
    cbIDEVE.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDEVE.Clear;
    if length(edIDEVE.Text) > 0 then
    begin
      if DM.qyEVE.Locate('cod', edIDEVE.Text, [loPartialKey]) then
      begin
        cbIDEVE.EditValue := DM.qyEVE.FieldByName('id').AsInteger;
        // ShowMessage('ok');
        edIDEVE.Tag := 1; // DESATIVA onChange
        iSelStart := edIDEVE.SelStart;
        AlteraNTREG(DM.qyEVE.FieldByName('nt_reg').AsString);
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

procedure TflanContrato.edIDEVEClick(Sender: TObject);
begin
  if edIDEVE.Text = '' then
    edIDEVE.SelStart := 0;

end;

procedure TflanContrato.edIDEVEExit(Sender: TObject);
begin
  edIDEVE.Tag := 1; // DESATIVA o OnChange
  if cbIDEVE.Tag = 2 then // se localizou
    edIDEVE.Text := DM.qyEVE.FieldByName('cod').AsString // preenche o campo
  else if cbIDEVE.Tag = 1 then // não foi localizado
    edIDEVE.Clear; // limpa o campo
  cbIDEVE.Tag := 0; // Ativa o OnChange
  edIDEVE.Tag := 0; // Ativa o OnChange

end;

procedure TflanContrato.edIDEVEKeyDown(Sender: TObject; var Key: Word;
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
      ok := true;

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
    desativatags([edIDEVE, cbIDEVE]);
    edIDEVE.Text := qry.FieldByName('cod').AsString;
    cbIDEVE.EditValue := qry.FieldByName('id').AsInteger;
    AlteraNTREG(DM.qyEVE.FieldByName('nt_reg').AsString);
    ativatags([edIDEVE, cbIDEVE]);

  end;
  // qry:= nil;
end;

procedure TflanContrato.edIDPES2Change(Sender: TObject);
begin
  if edIDPES2.Tag = 0 then
  begin // If OnChange Ativado
    cbIDPES2.Tag := 1; // desativa OnChange - nao encontrado
    cbIDPES2.Clear;
    if length(edIDPES2.Text) > 0 then
    begin
      if DM.qyPES.Locate('nr_ins', edIDPES2.Text, [loPartialKey]) then
      begin
        cbIDPES2.EditValue := DM.qyPES.FieldByName('id').AsInteger;
        cbIDPES2.Tag := 2; // encontrado - OnExit

      end;
    end
    else
    begin
      cbIDPES2.Tag := 0;
    end;
  end;

end;

procedure TflanContrato.edIDPES2Enter(Sender: TObject);
begin
  edIDPES2.Tag := 1; // Desativar OnChange
  edIDPES2.EditMask := ''; // 99999999999999;0;_';
  edIDPES2.SelectAll;
  edIDPES2.Tag := 0; // Ativar OnChange

end;

procedure TflanContrato.edIDPES2Exit(Sender: TObject);
var
  tpPes: Integer;
begin
  if cbIDPES2.Tag = 2 then
  begin // Foi localizado
    edIDPES2.Tag := 1; // desativa OnChange
    edIDPES2.EditMask := '';
    if DM.qyPES.FieldByName('tp_ins').AsInteger = cTipoCPF then
      edIDPES2.EditMask := mskCPF
    else
      edIDPES2.EditMask := mskCNPJ;
    edIDPES2.Text := DM.qyPES.FieldByName('nr_ins').AsString;
    cbIDPES2.Tag := 0;
    edIDPES2.Tag := 0; // ativa OnChange
  end
  else
  begin
    tpPes := 2;
    edIDPES2.Tag := 1;
    if length(edIDPES2.Text) = 11 then
    begin
      edIDPES.EditMask := mskCPF;
      tpPes := cTipoCPF
    end
    else if length(edIDPES2.Text) = 14 then
    begin
      edIDPES2.EditMask := mskCNPJ;
      tpPes := cTipoCNPJ;
    end;
    edIDPES2.Tag := 0;

    if cbIDPES2.Tag = 1 then
    begin // não foi localizado
      if length(edIDPES2.Text) > 0 then
      begin
        if (tpPes = 2) or not checaNRINS(edIDPES2.Text, tpPes) then
        begin
          MsgErro('CPF/CNPJ inválido! Corrija ou apague.');
          edIDPES2.SetFocus;
          edIDPES2.SelectAll;
        end
        else
        begin
          if cdrPessoal(tpPes, edIDPES2.Text) then
            ProxFocus
          else
          begin
            edIDPES2.SetFocus;
            edIDPES2.SelectAll;
            cbIDPES2.Tag := 1;
          end;
        end;
      end
      else
      begin
        cbIDPES2.Tag := 0;
      end;
    end;
  end;
end;

procedure TflanContrato.edIDPESChange(Sender: TObject);
begin
  if edIDPES.Tag = 0 then
  begin // If OnChange Ativado
    cbIDPES.Tag := 1; // desativa OnChange - nao encontrado
    cbIDPES.Clear;
    if length(edIDPES.Text) > 0 then
    begin
      if DM.qyPES.Locate('nr_ins', edIDPES.Text, [loPartialKey]) then
      begin
        cbIDPES.EditValue := DM.qyPES.FieldByName('id').AsInteger;
        cbIDPES.Tag := 2; // encontrado - OnExit

      end;
    end
    else
    begin
      cbIDPES.Tag := 0;
    end;
  end;

end;

procedure TflanContrato.edIDPESEnter(Sender: TObject);
begin
  edIDPES.Tag := 1; // Desativar OnChange
  edIDPES.EditMask := ''; // 99999999999999;0;_';
  edIDPES.SelectAll;
  edIDPES.Tag := 0; // Ativar OnChange

end;

procedure TflanContrato.edIDPESExit(Sender: TObject);
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
          if cdrPessoal(tpPes, edIDPES.Text) then
            ProxFocus
          else
          begin
            edIDPES.SetFocus;
            edIDPES.SelectAll;
            cbIDPES.Tag := 1;
          end;
        end;
      end
      else
      begin
        cbIDPES.Tag := 0;
      end;
    end;
  end;

end;

procedure TflanContrato.edIDPESKeyPress(Sender: TObject; var Key: Char);
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

procedure TflanContrato.edIDTPCChange(Sender: TObject);
begin
  if edIDTPC.Tag = 0 then
  begin // permite o OnChange
    cbIDTPC.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDTPC.Clear;
    if length(edIDTPC.Value) > 0 then
    begin
      if DM.qyTPC.Locate('id', edIDTPC.Value, []) then
      begin
        cbIDTPC.EditValue := DM.qyTPC.FieldByName('id').AsInteger;
        cbIDTPC.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end
    else
    begin // campo está vazio
      cbIDTPC.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TflanContrato.edIDTPCExit(Sender: TObject);
begin
  edIDTPC.Tag := 1; // DESATIVA o OnChange
  if cbIDTPC.Tag = 1 then
  begin // não foi localizado
    with TfInputBox.Create(Self, 'Cadastro de um novo Tipo de Contrato: ' +
      edIDTPC.Value, 'Informe uma Descrição para o Tipo ' + edIDTPC.Value) do
    begin
      if ShowModal = mrOk then
      begin
        DM.qyTPC.Append;
        DM.qyTPC.FieldByName('id').AsString := edIDTPC.Value;
        DM.qyTPC.FieldByName('descr').AsString := edPROMPT.Text;
        DM.qyTPC.FieldByName('us_inc').AsInteger := wUsuario;
        DM.qyTPC.FieldByName('ativo').AsInteger := 1;
        // Dm.qyTPC.FieldByName('dt_inc').AsDateTime:= now;
        DM.qyTPC.Append;
        DM.qyTPC.Last;
        cbIDTPC.EditValue := DM.qyTPC.FieldByName('id').AsInteger;
      end
      else
      begin
        edIDTPC.Clear;
        edIDTPC.SetFocus;
      end;
      Free;
    end;

  end;
  cbIDTPC.Tag := 0; // Ativa o OnChange
  edIDTPC.Tag := 0; // Ativa o OnChange

end;

procedure TflanContrato.edIDTPCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyTPC;
  ok := False;
  if (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    if qry.RecordCount > 0 then
    begin
      ok := true;

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
    desativatags([edIDTPC, cbIDTPC]);
    edIDTPC.Text := qry.FieldByName('cod').AsString;
    cbIDTPC.EditValue := qry.FieldByName('id').AsInteger;
    ativatags([edIDTPC, cbIDTPC]);

  end;
  // qry:= nil;
end;

procedure TflanContrato.edIDUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // OnChange Ativado
    cbIDUNI.Tag := 1; // Desativa OnChange
    cbIDUNI.Clear;
    if length(edIDUNI.Value) > 0 then
    begin
      if DM.qyUNI.Locate('cod;ponto', VarArrayOf([edIDUNI.Value, edPTUNI.Value]
        ), []) then
      begin // Achou
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // Confirma q achou
      end;
    end
    else
    begin
      cbIDUNI.Tag := 0; // Ativa OnChange
      edPTUNI.Value := '1';
    end;
  end;
end;

procedure TflanContrato.edIDUNIExit(Sender: TObject);
begin
  if cbIDUNI.Tag = 1 then
  begin // Código não localizado
    // ShowMessage('Cadastrar "' + edIDUNI.Text + '"?');
    cdrUnidade;
  end;
  cbIDUNI.Tag := 0; // Ativa OnChange
end;

procedure TflanContrato.edIDUNIKeyDown(Sender: TObject; var Key: Word;
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
      ok := true;

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
    desativatags([edIDUNI, cbIDUNI]);
    edIDUNI.Text := qry.FieldByName('cod').AsString;
    edPTUNI.Value := qry.FieldByName('ponto').AsString;
    cbIDUNI.EditValue := qry.FieldByName('id').AsInteger;
    ativatags([edIDUNI, cbIDUNI]);

  end;
  // qry:= nil;
end;

procedure TflanContrato.edNrContaEnter(Sender: TObject);
begin
  // ednrconta.Text:= SoNumeroX(ednrconta.Text);

end;

procedure TflanContrato.edNrContaExit(Sender: TObject);
begin
  // ednrconta.Text:= fmtConta(ednrconta.Text);

end;

procedure TflanContrato.edNRDOCKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end
  else
  begin
    if not charinset(Key, ['0' .. '9', #8]) then
      Key := #0;
  end;

end;

procedure TflanContrato.edPERIOKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end
  else
  begin
    if not charinset(Key, ['0' .. '9', #8]) then
      Key := #0;
  end;

end;

procedure TflanContrato.edPTUNIChange(Sender: TObject);
begin

  if edIDUNI.Tag = 0 then
  begin // OnChange Ativado
    if length(edIDUNI.Text) > 0 then
    begin
      cbIDUNI.Tag := 1; // Desativa OnChange
      cbIDUNI.Clear;
      if DM.qyUNI.Locate('cod;ponto', VarArrayOf([edIDUNI.Value, edPTUNI.Value]
        ), []) then
      begin // Achou
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // Confirma q achou
      end;
    end;
  end;
end;

procedure TflanContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  with DM do  begin
    while DM.DBCON.InTransaction do DM.DBTRANS.Rollback;
    qymov.Close;
    QYMOV.IndexFieldNames:= '';//'dt_ven';
    qymov.Filtered := False;
    qymov.Filter := '';
    qyEVE.Filtered := False; // esta aberta an Pl. Mov
    qyEVE.Filter:= '';
    qyPES.Filtered := False; // esta aberta an Pl. Mov
    qypes.Filter:= '';
    //qyTCB.Close;
  end;
end;

procedure TflanContrato.FormCreate(Sender: TObject);
begin
  // inherited create
  // ShowMessage('OK');
end;

procedure TflanContrato.colNUMCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  //if (not AViewInfo.Selected) then begin

    if AViewInfo.GridRecord.Values[colSTFIM.Index] = 'P' then begin
      ACanvas.Brush.Color:= clCream;
    end;
  //end;

end;

procedure TflanContrato.colNUMGetDataText
  (Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
var
  AIndex: Integer;
begin
  AIndex := TcxGridTableView(Sender.GridView)
    .DataController.GetRowIndexByRecordIndex(ARecordIndex, False);
  AText := inttostr(AIndex + 1);
end;

procedure TflanContrato.gviewMovDblClick(Sender: TObject);
var
  APoint: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin
  GetCursorPos(APoint);
  with gridMov.FocusedView.Site do
  begin
    APoint := ScreenToClient(APoint);
    AHitTest := ViewInfo.GetHitTest(APoint);
    if AHitTest is TcxGridRecordHitTest then
    begin
      btAlterar.Click;
    end;
  end;
end;

procedure TflanContrato.IncluiAlteraContrato;
var
  IDPES: String;
  st: string;
begin
  DM.DBTRANS.StartTransaction;
  AtuDadosContrato();

  //if not chTITULAR.Checked then
  //  IDPES := cbIDPES2.EditValue
  //else
  //Definido como Favorecido (Campo 1) como o campo que vai para o movimento (30/01/2024)
  IDPES := cbIDPES.EditValue;

  // if iModoCtr = modoINC then begin
  st := 'UPDATE plmovimento SET ' +
          //'id_pes = ' + IDPES + ', ' +
          'id_cnt = ' + inttostr(cbIDCNT.EditValue) +  ', ' +
          'id_uni = ' + inttostr(cbIDUNI.EditValue) + ', ' +
          'id_eve = ' + inttostr(cbIDEVE.EditValue) + ' ' +
        'WHERE ' +
          '(id_ctr = ' + inttostr(FidContrato) + ') and ' +
          '(st_fim = "' + cSTNOR + '") and ' +
          '(st_mov <> "' + cMovLiquidado + '") ';
  DM.DBCON.ExecSQL(st); // Normais / Não liquidados(Estes não mudam)
  st := 'UPDATE plmovimento SET ' +
          'st_ini = "' + cSTNOR + '", ' +
          'st_fim = "' + cSTNOR + '", ' +
          //'id_PES = ' + IDPES + ', ' +
          'id_cnt = ' + inttostr(cbIDCNT.EditValue) + ', ' +
          'id_uni = ' + inttostr(cbIDUNI.EditValue) + ', ' +
          'id_eve = ' + inttostr(cbIDEVE.EditValue) + ' ' +
        'WHERE ' +
          '(id_ctr = ' + inttostr(FidContrato) + ') and ' +
          '((st_fim = "' + cSTPEN + '") or ' +
          ' (st_fim = "' + cSTINA + '")) ';
  DM.DBCON.ExecSQL(st); // Pendentes
  // end;
  DM.DBTRANS.Commit;

  DM.QYCTR.Tag := FidContrato;
end;

procedure TflanContrato.LimpaCamposCtr;
begin
  // edIDCUS.Clear;
  lbMeses.Caption := '';
  edIDUNI.Tag := 0;
  edIDUNI.Clear;
  edPTUNI.Value := '1';
  cbIDUNI.Clear;
  // edDSUNI.Clear;
  // edDSUNI.Tag:= 0;

  cbIDEVE.EditValue := null;
  cbIDPES.EditValue := null;
  chTITULAR.Checked := true;
  edNrCtr.Clear;
  cbIDTPC.EditValue := null;
  cbIDTPR.EditValue := null;

  edDTINI.Clear;
  edDTFIM.Clear;

  edVLCTR.Value := 0;
  cbCAUCAO.ItemIndex := 0;
  cbCAUCAOSelect(nil);

  edPERIO.Clear;
  edIndReajus.Value := 0;
  edVlMulta.Value := 0;
  edQtMeses.Clear;

  edDSCTR.Clear;
  edOBS.Clear;

end;

procedure TflanContrato.novoContrato;
begin
  DM.qry.Open('SELECT COALESCE(MAX(id), 0) as MaxID FROM plcontratos');
  FidContrato := DM.qry.FieldByName('MaxID').AsInteger + 1;
  DM.qry.Close;
  with DM.QYCTR do begin
    Append;
    // FieldByName('tp_mov').AsString:= cTipoContrato;
    // FieldByName('dt_inc').AsDateTime:= Date;   //valor padrão a partir de 18/07/2023
    FieldByName('tp_mov').AsString := cTipoContrato;
    FieldByName('us_inc').AsInteger := wUsuario;
    FieldByName('st_ini').AsString := cSTPEN;
    FieldByName('st_fim').AsString := cSTPEN;
    FieldByName('id').AsInteger := FidContrato;
    FieldByName('id_uni').AsInteger := 0;
    Post;
    // ShowMessage(FieldByName('id').AsString);
    if not Locate('id', FidContrato, []) then begin
      MsgErro('202308011529 - Contrato ' + inttostr(FidContrato) + ' não localizado!');
    end;
  end;
  lbIDCTR.Caption := inttostr(FidContrato);
  FqtD := 0;
  FvlD := 0;
  AtuValores;
  lbIDCTR.Caption := inttostr(FidContrato);
  // DM.DBTRANS.StartTransaction; // 03/05/2023 - A transação é efetuado somente no final
  localSQLMOV:= 'SELECT * FROM plmovimento WHERE id_ctr = ' +  inttostr(FidContrato) + ' order by DT_VEN';
  DM.qymov.Open(localSQLMOV);

  LimpaCamposCtr;
end;

procedure TflanContrato.PreCamposCtr;
var
  // st: String;
  id: Integer;
begin
  with DM.QYCTR do begin
    cbIDCNT.EditValue := FieldByName('id_Cnt').AsVariant;
    id := FieldByName('id_uni').AsInteger;
    if id > 0 then
    begin
      // edIDUNI.Tag:= 2; //Desativa OnChange
      // if DM.qyUni.Locate('id', id, []) then begin
      // edIDUNI.Value:= DM.qyUni.FieldByName('cod').AsString;
      // edPTUNI.Value:= DM.qyUni.FieldByName('ponto').AsString;
      // edDSUNI.Text:= DM.qyUni.FieldByName('descr').AsString;
      // edDSUNI.Tag:= id; //
      // end;
      // edIDUNI.Tag:= 0; //Ativa OnChange
      cbIDUNI.EditValue := id;
    end;

    cbIDEVE.EditValue := FieldByName('id_eve').AsInteger;
    cbIDPES.EditValue := FieldByName('id_pes').AsInteger;
    edDTINI.EditValue := FieldByName('dt_Ini').AsVariant;
    edDTFIM.EditValue := FieldByName('dt_fim').AsVariant;
    edDtIncorp.EditValue := FieldByName('dt_incorp').AsVariant;

    cbIDTPC.EditValue := FieldByName('id_tpc').AsInteger;
    cbIDTPR.EditValue := FieldByName('id_tpR').AsInteger;

    edVLCTR.Value := FieldByName('vl_contrato').AsFloat;
    edVLCAUCAO.Value := FieldByName('vl_caucao').AsFloat;
    if edVLCAUCAO.Value > 0 then
      cbCAUCAO.ItemIndex := 1
    else
      cbCAUCAO.ItemIndex := 0;
    cbCAUCAOSelect(nil);
    edNrCtr.Text := FieldByName('nr_contrato').AsString;
    edPERIO.Text := FieldByName('perio').AsString;
    edIndReajus.Value := FieldByName('ind_reajus').AsFloat;
    edVlMulta.Value := FieldByName('vl_multa').AsFloat;
    edQtMeses.Text := FieldByName('qt_meses').AsString;
    edDSCTR.Text := FieldByName('descr').AsString;
    edOBS.Text := FieldByName('obs').AsString;
    if FieldByName('id_pes2').AsInteger = 0 then
      chTITULAR.Checked := true
    else
      cbIDPES2.EditValue := FieldByName('id_pes2').AsInteger;
    // AtivaTitular;

    // chREP.Enabled:= False;
  end;
end;

end.
