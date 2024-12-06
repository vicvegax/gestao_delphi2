unit lanParcela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  zeroEdit, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TflanParcela = class(TForm)
    Label1: TLabel;
    edIDUNI: TzeroEdit;
    Label5: TLabel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    edIDEVE: TMaskEdit;
    edPTUNI: TzeroEdit;
    cbIDEVE: TcxLookupComboBox;
    DSMOV: TDataSource;
    lbIDCTR: TLabel;
    cbIDUNI: TcxLookupComboBox;
    Label2: TLabel;
    grpRep: TGroupBox;
    pnlMov: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnInc: TBitBtn;
    btAlterar: TBitBtn;
    btnExc: TBitBtn;
    edtQTD: TEdit;
    edtVLD: TEdit;
    gridMov: TcxGrid;
    gviewMov: TcxGridDBTableView;
    colMovdt_ven: TcxGridDBColumn;
    colMovcompt: TcxGridDBColumn;
    colMovds_tpd: TcxGridDBColumn;
    colNRDOC: TcxGridDBColumn;
    colMovdescr: TcxGridDBColumn;
    colMovvl_bas: TcxGridDBColumn;
    colMovbanco: TcxGridDBColumn;
    colMovagencia: TcxGridDBColumn;
    colMovconta: TcxGridDBColumn;
    colMovtipo: TcxGridDBColumn;
    colMovID: TcxGridDBColumn;
    glevelMov: TcxGridLevel;
    pnlAguarde: TPanel;
    lbNTREG: TLabel;
    gviewMovColumn1: TcxGridDBColumn;
    Label6: TLabel;
    edIDPES: TMaskEdit;
    cbIDPES: TcxLookupComboBox;
    cbIDCNT: TcxLookupComboBox;
    edIDCNT: TzeroEdit;
    procedure btConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPTUNIChange(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btnModoClick(Sender: TObject);
    procedure cbIDUNIPropertiesEditValueChanged(Sender: TObject);
    procedure edPTUNIExit(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edIDUNIChange(Sender: TObject);
    procedure edIDUNIExit(Sender: TObject);
    procedure edIDUNIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edIDEVEChange(Sender: TObject);
    procedure edIDEVEClick(Sender: TObject);
    procedure edIDEVEExit(Sender: TObject);
    procedure edIDEVEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbIDEVEPropertiesEditValueChanged(Sender: TObject);
    procedure QYMOVagenciaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure colNRDOCPropertiesChange(Sender: TObject);
    procedure btnExcClick(Sender: TObject);
    procedure cbIDPESPropertiesEditValueChanged(Sender: TObject);
    procedure edIDPESChange(Sender: TObject);
    procedure edIDPESEnter(Sender: TObject);
    procedure edIDPESExit(Sender: TObject);
    procedure edIDPESKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gviewMovDblClick(Sender: TObject);
    procedure edIDCNTChange(Sender: TObject);
    procedure edIDCNTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbIDCNTPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  var
    FqtD: Integer;
    FvlD: Double;
    FidContrato: Integer;
    iModoCtr: Integer;
    FiltroMovimento: String;
    // iModoMov: Integer;

    procedure cdrUnidade;
    procedure AlteraNTREG(NT: String);
    procedure novoContrato;

    procedure LimpaCamposCtr;
    procedure PreCamposCtr;
    procedure AtuValores;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; iModo: Integer; idContrato: Integer;
      idcnt: Integer); reintroduce;
  end;

var
  flanParcela: TflanParcela;

implementation

{$R *.dfm}

uses modDados, modFuncoes, myInputBox, lanMovimento, cdrUnidades;

procedure TflanParcela.AlteraNTREG(NT: String);
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

procedure TflanParcela.AtuValores;
begin
  with DM.qry do
  begin
    Open('SELECT COALESCE(SUM(vl_bas),0) as VlD, count(id) as QtD FROM plmovimento WHERE '
      + '(id_ctr = ' + inttostr(FidContrato) + ') and ' + '((st_fim = "' +
      cSTPEN + '") or (st_fim = "' + cSTNOR + '"))');
    FqtD := FieldByName('qtd').AsInteger;
    FvlD := FieldByName('vld').AsFloat;
    edtQTD.Text := inttostr(FqtD);
    edtVLD.Text := formataValor(FvlD);
    Close;
  end;
end;

procedure TflanParcela.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TflanParcela.btConfirmarClick(Sender: TObject);
var
  st: string;
begin
  st := '';
  if cbIDUNI.ItemIndex < 0 then
    st := st + '- Campo "Centro de Custo" inválido!' + #13#10;
  if cbIDEVE.EditValue = null then
    st := st + '- Campo "Evento" inválido!' + #13#10;
  if cbIDPES.EditValue = null then
    st := st + '- Campo "Favorecido" inválido!' + #13#10;

  if DM.qyMOV.RecordCount = 0 then
    st := st + '- Informe as Parcelas!' + #13#10;

  if st <> '' then begin
    ShowMessage(st);
    exit;
  end;

  DM.DBTRANS.StartTransaction;
  with DM.QYCTR do begin
    // showmessage(Fieldbyname('id').AsString);
    if iModoCtr = modoInc then begin
      Edit;
      FieldByName('st_ini').AsString := cSTNOR;
      FieldByName('st_fim').AsString := cSTNOR;
      FieldByName('tp_mov').AsString := cTipoParcela;
      FieldByName('dt_inc').AsDateTime := Now;
    end else begin
      Edit;
      FieldByName('dt_alt').AsDateTime := Now;
      FieldByName('us_alt').AsInteger := wUsuario;
    end;
    FieldByName('id_cnt').AsInteger := edIDCNT.Tag;
    FieldByName('id_uni').AsInteger := cbIDUNI.EditValue;
    FieldByName('id_EVE').AsInteger := cbIDEVE.EditValue;
    FieldByName('id_pes').AsInteger := cbIDPES.EditValue;
    FieldByName('qtd_mov').AsInteger := FqtD;
    FieldByName('vlt_mov').AsFloat := FvlD;
    // FieldByName('descr').AsString:= edDSCTR.Text;//edDESCR.Text;
    // FieldByName('obs').AsString:= edOBS.Text;

    // FieldByName('tp_mov').AsString:= cTPCTR;

    // if iModoCtr = 0 then begin
    // end else begin
    // end;

    Post;
  end;

  DM.DBCON.ExecSQL('UPDATE plmovimento SET ' +
    // 'id_ctr = ' + inttostr(FidContrato) + ', ' +
     'st_ini = "' + cSTNOR + '", ' +
     'st_fim = "' + cSTNOR + '", ' +
     'id_cnt = ' + inttostr(cbIDCNT.EditValue) + ', ' +
     'id_uni = ' + inttostr(cbIDUNI.EditValue) + ', ' +
     'id_eve = ' + inttostr(cbIDEVE.EditValue) + ', ' +
     'id_pes = ' + inttostr(cbIDPES.EditValue) + ' ' +
    'WHERE ' +
     'id_ctr = ' + inttostr(FidContrato) + ' and ' +
     'st_fim <> "' + cSTEXC + '" and ' +
     'st_mov <> "' + cMovLiquidado + '" ');
  // [, , 0+FidContrato]
  // );
  DM.DBTRANS.Commit;

  if iModoCtr = modoInc then begin
    // if Application.MessageBox('Parcelamento lançado com Sucesso! Iniciar um NOVO Parcelamento?','Novo Parcelamento', MB_YESNO + MB_ICONQUESTION) = ID_NO then begin
    // ShowMessage('Lançamentos Incluídos!');
    modalResult := mrOK;
    exit;
    // end;
    // novoContrato;
    // edIDUNI.SetFocus;
  end else begin
    // ShowMessage('Lançamentos Alterados!');
    modalResult := mrOK;
  end;
end;

procedure TflanParcela.btnExcClick(Sender: TObject);
var
  i: Integer;
  obs: string;
begin
  if gviewMov.Controller.SelectedRowCount > 0 then begin
    if not perguntaNao ('Excluir o(s) Registro(s) selecionado(s)? Esta operação não pode ser desfeita!',
      'Exclusão de Registros') then
      exit;
    if not perguntaNao('Tem certeza?', 'Exclusão de Registros') then exit;

//  if not DM.obsBox('Motivo da Exclusão',
//    'Informe por que está Excluindo este lançamento:', obs) then exit;

    gviewMov.BeginUpdate();
    gviewMov.DataController.BeginLocate;
    DM.DBTRANS.StartTransaction;
    try
      for i := 0 to gviewMov.Controller.SelectedRowCount - 1 do begin
        DM.qyMOV.Locate('id', gviewMov.DataController.GetRecordId
          (gviewMov.Controller.SelectedRows[i].RecordIndex), []);
        if vartostr(DM.QYMOV['st_mov']) = cMovLiquidado then begin
          MsgErro('Este registro já foi Efetivado. Ele não pode ser Excluído!');
          Exit;
        end;

        DM.qyMOV.Edit;// .Delete;
        DM.QYMOV['st_fim']:= cSTEXC;
        DM.QYMOV['us_exc']:= wUsuario;
        DM.QYMOV['dt_exc']:= Now;
        DM.QYMOV.Post;
      end;
    finally
      DM.DBTRANS.Commit;
      gviewMov.DataController.EndLocate;
      gviewMov.EndUpdate;
      //gviewMov.Controller.DeleteSelection;
      //ShowMessage('Registro(s) Excluído(s)!');
      AtuValores;
    end;

  end;
end;

procedure TflanParcela.btnModoClick(Sender: TObject);
var
  modo: Integer;
begin
  modo := TControl(Sender).Tag;
  if modo <> modoExc then begin
    if (modo = modoAlt) and (DM.qyMOV.RecordCount = 0) then exit;

    if cbIDCNT.EditValue = null then begin
      MsgErro('Informe uma Conta de Movimento!');
      edIDCNT.SetFocus;
      exit;
    end;

    if cbIDUNI.EditValue = null then begin
      MsgErro('Informe um Centro de Custo!');
      edIDUNI.SetFocus;
      exit;
    end;

    if cbIDEVE.EditValue = null then begin
      MsgErro('Informe um Tipo de Evento!');
      edIDEVE.SetFocus;
      exit;
    end;

    if cbIDPES.EditValue = null then begin
      MsgErro('Informe um Favorecido!');
      edIDPES.SetFocus;
      exit;
    end;

    //gviewMov.BeginUpdate;
    dm.QYMOV.DisableControls;
    with TflanMov.Create(Self, modo, cTipoParcela, FidContrato,
      cbIDCNT.EditValue, cbIDUNI.EditValue, cbIDEVE.EditValue,
      cbIDPES.EditValue) do begin
      ShowModal; // = mrOK then
      if (Tag > 0) or (modalResult = mrOK) then AtuValores;
      Free;
    end;
    while DM.QYMOV.ControlsDisabled do dm.QYMOV.EnableControls;
    //DM.QYMOV.OnCalcFields:= DM.QYMOVCalcFields;
    //gviewMov.EndUpdate;
  end else begin // exclusão
    if (DM.qyMOV.RecordCount = 0) then exit;

  end;
end;

procedure TflanParcela.cbIDCNTPropertiesEditValueChanged(Sender: TObject);
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

procedure TflanParcela.cbIDEVEPropertiesEditValueChanged(Sender: TObject);
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

procedure TflanParcela.cbIDPESPropertiesEditValueChanged(Sender: TObject);
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

procedure TflanParcela.cbIDUNIPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDUNI.Tag = 0 then
  begin // permite o OnChange
    edIDUNI.Tag := 1; // DESATIVA o OnChange
    edIDUNI.Text := '';
    edPTUNI.value := '1';
    if DM.qyUNI.Locate('id', cbIDUNI.EditValue, []) then
    begin
      edIDUNI.Text := DM.qyUNI.FieldByName('cod').AsString;
      edPTUNI.value := DM.qyUNI.FieldByName('ponto').AsString;
    end;
    edIDUNI.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TflanParcela.cdrUnidade;
begin
  if Application.MessageBox(PWideChar('Unidade "' + edIDUNI.value +
    '" não existe. Deseja cadastrá-la?'), 'Nova Unidade',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
    exit;
  with TfcdrUnidades.Create(Self) do
  begin
    edCod.Text := edIDUNI.value;
    edPonto.Text := edPTUNI.value;
    if ShowModal = mrOK then
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
    end
    else
    begin
      edIDUNI.SetFocus;
    end;
    Free;
  end;

end;

procedure TflanParcela.colNRDOCPropertiesChange(Sender: TObject);
begin
  with TcxTextEdit(Sender) do
  begin
    Text := soNumero(Text);
    SelStart := length(Text);
  end;

end;

constructor TflanParcela.Create(AOwner: TComponent; iModo: Integer;
  idContrato: Integer; idcnt: Integer);
begin
  inherited Create(AOwner);
  lbIDCTR.Visible := wUsuario <= 100;//(wModoDev <> 0);
  iModoCtr := iModo;

  with DM do begin // Tabelas auxiliares abertas na Planilha
    //qyPES.Filter := 'ativo >= 0';
    //qyPES.Filtered := true; // esta aberta an Pl. Contrato
    qyEVE.Filter := '(ativo = 1) and (rgtCod <> ''00'')';
    qyEVE.Filtered := true; // esta aberta an Pl. Contrato
  end;

  DM.QYCTR.Filtered := false;
  DM.QYCTR.Filter := '';
  if iModo = modoInc then begin // Inclusão
    edIDCNT.value := DM.qyCNT.FieldByName('cod').AsString;
    cbIDCNT.EditValue := idcnt;
    novoContrato;
  end else if iModo = modoAlt then begin // Alteração
    FidContrato := idContrato;
    DM.QYCTR.Open('SELECT * FROM plcontrato WHERE ' +
      'id = ' + inttostr(FidContrato) + ' and ' +
      'st_fim = "' + cSTNOR + '" ');
    // FqtD:= qtD;
    // FvlD:= vlD;
    Self.Caption := Self.Caption + ' - Alteração';
    PreCamposCtr;
    AtuValores;
    // DM.DBTRANS.StartTransaction; // 03/05/2023 - A transação é efetuado somente no final
  end else begin //Consulta ???
  end;
  FiltroMovimento:= DM.QYMOV.Filter;
  DM.qyMOV.Filter := '(id_ctr = ' + inttostr(FidContrato) + ') and ' +
    '((st_fim = ' + QuotedStr(cSTNOR) + ') or ' +
     '(st_fim = ' + quotedstr(cSTPEN) + '))';
  DM.QYMOV.Filtered:= True;
end;

procedure TflanParcela.QYMOVagenciaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataAgencia(Sender.AsString);

end;

procedure TflanParcela.edPTUNIChange(Sender: TObject);
begin

  if edIDUNI.Tag = 0 then
  begin // OnChange Ativado
    if length(edIDUNI.Text) > 0 then
    begin
      cbIDUNI.Tag := 1; // Desativa OnChange
      cbIDUNI.Clear;
      if DM.qyUNI.Locate('cod;ponto', VarArrayOf([edIDUNI.value, edPTUNI.value]
        ), []) then
      begin // Achou
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // Confirma q achou
      end;
    end;
  end;
end;

procedure TflanParcela.edPTUNIExit(Sender: TObject);
begin
  if cbIDUNI.Tag = 1 then
  begin // Código não localizado
    // ShowMessage('Cadastrar "' + edIDUNI.Text + '"?');
    cdrUnidade;
  end;
  cbIDUNI.Tag := 0; // Ativa OnChange

end;

procedure TflanParcela.edIDCNTChange(Sender: TObject);
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

procedure TflanParcela.edIDCNTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyCNT;
  ok := false;
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

procedure TflanParcela.edIDEVEChange(Sender: TObject);
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

procedure TflanParcela.edIDEVEClick(Sender: TObject);
begin
  if edIDEVE.Text = '' then
    edIDEVE.SelStart := 0;

end;

procedure TflanParcela.edIDEVEExit(Sender: TObject);
begin
  edIDEVE.Tag := 1; // DESATIVA o OnChange
  if cbIDEVE.Tag = 2 then // se localizou
    edIDEVE.Text := DM.qyEVE.FieldByName('cod').AsString // preenche o campo
  else if cbIDEVE.Tag = 1 then // não foi localizado
    edIDEVE.Clear; // limpa o campo
  cbIDEVE.Tag := 0; // Ativa o OnChange
  edIDEVE.Tag := 0; // Ativa o OnChange

end;

procedure TflanParcela.edIDEVEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyEVE;
  ok := false;
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

procedure TflanParcela.edIDPESChange(Sender: TObject);
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

procedure TflanParcela.edIDPESEnter(Sender: TObject);
begin
  edIDPES.Tag := 1; // Desativar OnChange
  edIDPES.EditMask := ''; // 99999999999999;0;_';
  edIDPES.SelectAll;
  edIDPES.Tag := 0; // Ativar OnChange

end;

procedure TflanParcela.edIDPESExit(Sender: TObject);
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
          // cdrPessoal;
        end;
      end
      else
      begin
        cbIDPES.Tag := 0;
      end;
    end;
  end;

end;

procedure TflanParcela.edIDPESKeyPress(Sender: TObject; var Key: Char);
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

procedure TflanParcela.edIDUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // OnChange Ativado
    cbIDUNI.Tag := 1; // Desativa OnChange
    cbIDUNI.Clear;
    if length(edIDUNI.value) > 0 then
    begin
      if DM.qyUNI.Locate('cod;ponto', VarArrayOf([edIDUNI.value, edPTUNI.value]
        ), []) then
      begin // Achou
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // Confirma q achou
      end;
    end
    else
    begin
      cbIDUNI.Tag := 0; // Ativa OnChange
      edPTUNI.value := '1';
    end;
  end;

end;

procedure TflanParcela.edIDUNIExit(Sender: TObject);
begin
  if cbIDUNI.Tag = 1 then
  begin // Código não localizado
    // ShowMessage('Cadastrar "' + edIDUNI.Text + '"?');
    cdrUnidade;
  end;
  cbIDUNI.Tag := 0; // Ativa OnChange

end;

procedure TflanParcela.edIDUNIKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ok: Boolean;
  qry: TFDQuery;
begin
  qry := DM.qyUNI;
  ok := false;
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
    edPTUNI.value := qry.FieldByName('ponto').AsString;
    cbIDUNI.EditValue := qry.FieldByName('id').AsInteger;
    ativatags([edIDUNI, cbIDUNI]);

  end;
  // qry:= nil;
end;

procedure TflanParcela.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TflanParcela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.QYCTR.Close;
  // DM.QYCTR.Filtered:= false;
  // DM.QYCTR.Filter:= '';
  DM.qyEVE.Filtered:= false;
  DM.qyEVE.Filter:= '';
  DM.QYMOV.Filtered:= FiltroMovimento<> '';
  DM.QYMOV.Filter:= FiltroMovimento;
end;

procedure TflanParcela.FormCreate(Sender: TObject);
begin
  // inherited create
end;

procedure TflanParcela.gviewMovDblClick(Sender: TObject);
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

procedure TflanParcela.LimpaCamposCtr;
begin
  // edIDCUS.Clear;

  edIDUNI.Tag := 0;
  edIDUNI.Clear;
  edPTUNI.value := '1';
  cbIDUNI.Clear;
  // edDSUNI.Clear;
  // edDSUNI.Tag:= 0;

  cbIDEVE.EditValue := null;

  // edDSCTR.Clear;
  // edOBS.Clear;

end;

procedure TflanParcela.novoContrato;
begin
  DM.qry.Open('SELECT COALESCE(MAX(id), 0) as MaxID FROM plcontratos');
  FidContrato := DM.qry.FieldByName('MaxID').AsInteger + 1;
  DM.qry.Close;

  DM.QYCTR.Open('SELECT * FROM plcontratos WHERE id = ' +
    inttostr(FidContrato));

  with DM.QYCTR do begin
    Append;
    // FieldByName('dt_inc').AsDateTime:= Date;
    FieldByName('tp_mov').AsString := cTipoParcela;
    FieldByName('us_inc').AsInteger := wUsuario;
    FieldByName('st_ini').AsString := cSTPEN;
    FieldByName('st_fim').AsString := cSTPEN;
    FieldByName('id').AsInteger := FidContrato;
    FieldByName('id_uni').AsInteger := 0;
    Post;
    Locate('id', FidContrato, []);
  end;
  lbIDCTR.Caption := inttostr(FidContrato);
  AtuValores;
  lbIDCTR.Caption := inttostr(FidContrato);

  LimpaCamposCtr;
end;

procedure TflanParcela.PreCamposCtr;
// var
// st: String;
// id: integer;
begin
  with DM.QYCTR do
  begin
    cbIDCNT.EditValue := FieldByName('id_cnt').AsVariant;
    cbIDUNI.EditValue := FieldByName('id_uni').AsVariant;
    cbIDEVE.EditValue := FieldByName('id_eve').AsVariant;
    cbIDPES.EditValue := FieldByName('id_pes').AsVariant;

    // edDSCTR.Text:= FieldByName('descr').AsString;
    // edOBS.Text:= FieldByName('obs').AsString;
  end;
end;

end.
