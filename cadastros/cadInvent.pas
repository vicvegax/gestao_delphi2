unit cadInvent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxCalendar, DateUtils, zeroEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxLabel, frxClass, frxDBSet, MaskUtils;//,
  //diagnostics;

type
  TfcadInvent = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    pcInv: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbAtivo: TComboBox;
    edOBS: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    edDTCOM: TcxDateEdit;
    edVLCOM: TcxCurrencyEdit;
    Label9: TLabel;
    edVIDUTIL: TcxSpinEdit;
    Label10: TLabel;
    cbSITUA: TComboBox;
    Label11: TLabel;
    edVLDEP: TEdit;
    Label13: TLabel;
    edDTMAN: TcxDateEdit;
    Label12: TLabel;
    edDTINCOR: TcxDateEdit;
    Label15: TLabel;
    cbTPINCOR: TComboBox;
    pnIDUNI: TPanel;
    Label1: TLabel;
    edDESCR: TEdit;
    Label5: TLabel;
    edID: TEdit;
    Label2: TLabel;
    edCod: TzeroEdit;
    edFABRI: TEdit;
    Label16: TLabel;
    edMODEL: TEdit;
    Label17: TLabel;
    edNRSER: TEdit;
    Label18: TLabel;
    edNFISC: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edFORNE: TEdit;
    Label14: TLabel;
    edIDUNI: TzeroEdit;
    cbIDUNI: TcxLookupComboBox;
    edPTUNI: TzeroEdit;
    qyRecdscat_calc: TStringField;
    qyReccdcat_calc: TStringField;
    qyRecdt_comp: TDateField;
    qyRecvl_comp: TBCDField;
    qyRecvid_util: TWordField;
    gridMov: TcxGrid;
    gviewMov: TcxGridDBTableView;
    glevelMov: TcxGridLevel;
    colDSCAT: TcxGridDBColumn;
    colCOD: TcxGridDBColumn;
    colDESCR: TcxGridDBColumn;
    gviewMovdt_comp: TcxGridDBColumn;
    gviewMovvl_comp: TcxGridDBColumn;
    colOBS: TcxGridDBColumn;
    gviewMovmodel: TcxGridDBColumn;
    gviewMovnfisc: TcxGridDBColumn;
    gviewMovforne: TcxGridDBColumn;
    dscat: TDataSource;
    qycat: TFDQuery;
    dsuni: TDataSource;
    qyuni: TFDQuery;
    qycatdescr2: TStringField;
    qyunidescr2: TStringField;
    qyunicodpt: TStringField;
    pnIDCAT: TPanel;
    Label6: TLabel;
    edIDCAT: TzeroEdit;
    cbIDCAT: TcxLookupComboBox;
    colIDUNI: TcxGridDBColumn;
    colDSUNI: TcxGridDBColumn;
    qyReccduni_calc: TStringField;
    qyRecdsuni_calc: TStringField;
    frxDBR: TfrxDBDataset;
    qyRecid: TWordField;
    qyRecdescr: TStringField;
    qyRecnrser: TStringField;
    Label22: TLabel;
    edDTAQUI: TcxDateEdit;
    Bevel1: TBevel;
    edGARAN: TcxDateEdit;
    Label23: TLabel;
    edIDPES: TMaskEdit;
    cbIDPES: TcxLookupComboBox;
    dspes: TDataSource;
    qypes: TFDQuery;
    qypesdescr2: TStringField;
    qypesid_uni: TWordField;
    qyuniid: TWordField;
    qypesds_uni: TStringField;
    colSITUA: TcxGridDBColumn;
    qyRecsitua: TStringField;
    gviewMovColumn1: TcxGridDBColumn;
    gviewMovColumn2: TcxGridDBColumn;
    edOBS2: TMemo;
    Label24: TLabel;
    chUNI: TCheckBox;
    qyRecdspes_calc: TStringField;
    colDSPES: TcxGridDBColumn;
    colID: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure edDTINCORExit(Sender: TObject);
    procedure edIDUNIChange(Sender: TObject);
    procedure edIDUNIExit(Sender: TObject);
    procedure edIDCATChange(Sender: TObject);
    procedure edIDCATExit(Sender: TObject);
    procedure cbIDCATPropertiesEditValueChanged(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure cbIDUNIPropertiesEditValueChanged(Sender: TObject);
    procedure edPTUNIChange(Sender: TObject);
    procedure qyRecCalcFields(DataSet: TDataSet);
    procedure cbIDUNIDblClick(Sender: TObject);
    procedure gviewMovDblClick(Sender: TObject);
    procedure qycatCalcFields(DataSet: TDataSet);
    procedure qyuniCalcFields(DataSet: TDataSet);
    procedure gviewMovFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure gviewMovColumn1GetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure edDESCRExit(Sender: TObject);
    procedure qypesCalcFields(DataSet: TDataSet);
    procedure edOBS2Exit(Sender: TObject);
    procedure edOBS2Enter(Sender: TObject);
    procedure edIDPESChange(Sender: TObject);
    procedure edIDPESEnter(Sender: TObject);
    procedure edIDPESExit(Sender: TObject);
    procedure cbIDPESPropertiesEditValueChanged(Sender: TObject);
    procedure chUNIClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbAtivoDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure colSITUACustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    qtModoInc: Integer;
    modoUNIDADE: boolean;

    function ExeAcao: Boolean;
    function ChkCampos: Boolean;
    procedure preCampos;
    procedure WMACAO(var Msg: TMessage); message WM_ACAO;
    procedure LimpaCampos;
    procedure FiltraTabela;
    procedure moverItem;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Unidade: Boolean); reintroduce;

  end;

var
  fcadInvent: TfcadInvent;

implementation

{$R *.dfm}

uses modDados, moverInvent, aguarde;

function TfcadInvent.ExeAcao: Boolean;
var
  bLocId, bLocReg: Boolean;

  idLocOri: Integer;
  idLocDst: Integer;
  obs: string;
  // dtManOri: TDate;
  permis: String;
begin
  Result := False;
  permis:= 'cadBens';
  if (wModo = modoInc) and (not DM.permitido(permis + 'I')) then begin
      MsgErro(msgIncNaoPermitida);
      exit;
  end else if (wModo = modoAlt) and (not DM.permitido(permis + 'A')) then begin
      MsgErro(msgAltNaoPermitida);
      exit;
  end else if (wModo = modoExc) and (not DM.permitido(permis + 'E')) then begin
      MsgErro(msgExcNaoPermitida);
      exit;
  end;

  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
  if (not ChkCampos) then Exit;
  // qyRec.DisableControls;
  bLocReg := False; // qyRec.Locate('cod', edCod.Text, []);
  bLocId := False;
  if (wModo <> modoInc) then
    bLocId := (qyrec['id'] = edID.Text) or qyRec.Locate('id', edID.Text, []);


  if not(wModo = modoExc) then begin
    if (wModo = modoInc) then begin //INCLUSÃO
      if (bLocReg) then begin
        MsgErro(Format(kJaCad, ['Bens e Materiais']));
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then Exit;
    end else begin //ALTERAÇÃO
      if (not bLocId) then begin
        MsgErro(Format(kNaoLoc, ['Bens e Materiais']));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then Exit;
    end; // if
    //idLocDst := StrToInt(cbIDUNI.EditValue);
    //idLocOri := -1;
    //if (wModo = modoAlt) then idLocOri := qyRec.FieldByName('id_uni').AsInteger;

    //if (idLocOri <> -1) and (idLocOri <> idLocDst) then begin
   //   if (not perguntaSim('Mudar o Local atual do item selecionado?', 'Mudança de Local')) then Exit;
    //end;

    DM.DBCON.StartTransaction;
    with qyRec do begin
      if (wModo = modoInc) then begin
        Append;
        FieldByName('US_INC').AsInteger := wUsuario;
        FieldByName('DT_INC').AsDateTime := Now;
        FieldValues['st_ini']:= cSTNOR;
        FieldValues['st_FIM']:= cSTNOR;
      end else begin
        DM.criaLogTab(qyrec, 'tbinvent_aud', cSTALT, true, 'id');
        Edit;
        FieldByName('US_ALT').AsInteger := wUsuario;
        FieldByName('DT_ALT').AsDateTime := Now;
        FieldValues['st_ini']:= cSTALT;
      end;
      FieldByName('DESCR').AsString := edDESCR.Text;
      FieldByName('cod').AsString := edCod.Text;

      FieldByName('fabri').AsString := edFABRI.Text;
      FieldByName('model').AsString := edMODEL.Text;
      FieldByName('nrser').AsString := edNRSER.Text;
      FieldByName('nfisc').AsString := edNFISC.Text;
      FieldByName('garan').AsVariant := edGARAN.EditValue;
      FieldByName('FORNE').AsString := edFORNE.Text;

      FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
      FieldByName('obs').AsString := edOBS.Lines.Text;
      FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;

      fieldvalues['id_pes']:= cbIDPES.EditValue;
      FieldByName('id_uni').AsInteger := cbIDUNI.EditValue;
      FieldByName('id_cat').AsInteger := cbIDCAT.EditValue;
      FieldByName('dt_man').AsVariant := edDTMAN.EditValue;

      fieldvalues['dt_aqui']:= edDTAQUI.EditValue ;
      FieldByName('dt_comp').AsVariant := edDTCOM.EditValue;
      FieldByName('vl_comp').AsFloat := edVLCOM.Value;
      FieldByName('vid_util').AsInteger := edVIDUTIL.Value;
      FieldByName('situa').AsInteger := cbSITUA.ItemIndex;
      FieldByName('dt_incor').AsVariant := edDTINCOR.EditValue;
      FieldByName('tp_incor').AsInteger := cbTPINCOR.ItemIndex;
      Post;
    end;
    DM.DBCON.Commit;
    Result := true;
  end else begin //exclusão
    if (not bLocId) then begin
      MsgErro(Format(kNaoLoc, ['Bens e Materiais']));
      Exit;
    end;

    if perguntaNao(kMsgExc, kModo[wModo]) then begin
      if perguntaNao(kMsgExcCtz, kModo[wModo]) then begin
        if DM.obsBox('Motivo da Exclusão',
          'Informe por que está Excluindo este lançamento:', obs) then begin

          qyrec.Edit;
          //DM.marcaExclusao(qyrec);
          qyrec['us_exc']:= wUsuario;
          qyrec['dt_exc']:= Now;
          qyrec.FieldByName('obs_exc').AsString := obs;
          qyrec['st_FIM']:= cSTEXC;
          qyrec.Post;
          Result := true;
        end;
      end;
    end;
  end;
  LimpaCampos;
  MudaModo(modoInc);
end;

procedure TfcadInvent.cbAtivoDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
aColor:TColor;
//aBrush:TBrush;
begin
  //aBrush:=TBrush.Create;
  with (Control as TCombobox).Canvas do
    begin
       if odd(Index) then
         aColor:=clred
       else
         aColor:=clBlue;
      Brush.Style:=bsSolid;
      Brush.Color:=aColor;
      FillRect(Rect);//,aBrush.Handle);
      Brush.Style:=Bsclear;
      TextOut(Rect.Left,Rect.Top,(Control as TComboBox).Items[Index]);
      //aBrush.Free;
    end;
end;

procedure TfcadInvent.cbIDCATPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDCAT.Tag = 0 then begin // permite o OnChange
    edIDCAT.Tag := 1; // DESATIVA o OnChange
    edIDCAT.Value := '';
    if qyCAT.Locate('id', cbIDCAT.EditValue, []) then begin
      edIDCAT.Value := qyCAT.FieldByName('cod').AsString;
      if not modoUnidade then FiltraTabela;
    end;
    edIDCAT.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TfcadInvent.cbIDPESPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDPES.Tag = 0 then begin // permite o OnChange
    edIDPES.Tag := 1; // DESATIVA o OnChange
    edIDPES.Text := '';
    if qyPES.Locate('id', cbIDPES.EditValue, []) then begin
      edIDPES.Text := qyPES.FieldByName('nr_ins').AsString;
    end;
    edIDPES.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TfcadInvent.cbIDUNIDblClick(Sender: TObject);
begin
  // ShowMessage(inttostr(cbIDUNI.ItemIndex));

end;

procedure TfcadInvent.cbIDUNIPropertiesEditValueChanged(Sender: TObject);
var
  idpes: variant;
begin
  if cbIDUNI.Tag = 0 then begin // permite o OnChange
    edIDUNI.Tag := 1; // DESATIVA o OnChange
    edIDUNI.Value := '';
    edPTUNI.Value := '1';
    if qyuni.Locate('id', cbIDUNI.EditValue, []) then begin
      edIDUNI.Value := qyuni.FieldByName('cod').AsString;
      edPTUNI.Value := qyuni.FieldByName('ponto').AsString;
      edOBS2.Text:= vartostr(qyuni['obs2']);

      if cbIDPES.Tag <> 99 then begin
        //idpes:= dm.DBCON.ExecSQLScalar('select id from tbpessoal where id_uni = ' + vartostr(cbIDUNI.EditValue)	+ ' and ativo = 1 limit 1');
        //cbIDPES.EditValue:= idpes;
      end;

      //if chUNI.Checked then FiltraTabela;
      if modoUnidade then FiltraTabela;
    end;
    edIDUNI.Tag := 0; // Ativa o OnChange
  end;

end;

function TfcadInvent.ChkCampos: Boolean;
begin
  Result := False;
  if (cbIDUNI.ItemIndex < 0) then
  begin
    msgPreen('Unidade');
    edIDUNI.SetFocus;
    Exit;
  end;
  if (cbIDCAT.ItemIndex < 0) then
  begin
    msgPreen('Categoria');
    edIDCAT.SetFocus;
    Exit;
  end;
  if (length(edDESCR.Text) = 0) then
  begin
    msgPreen('Descrição do Inventário (Bem)');
    edDESCR.SetFocus;
    Exit;
  end;
  if edCOD.Text = '' then
    edCod.Text := DM.DBCON.ExecSQLScalar('select coalesce(max(cod)+1,1) from tbinvent');
  Result := true;
end;

procedure TfcadInvent.chUNIClick(Sender: TObject);
//var
  //relogio: TStopWatch;

begin
  if chUNI.Checked then begin
    if cbIDUNI.EditValue = null then begin
      cbIDUNI.EditValue := DM.DBCON.ExecSQLScalar('SELECT id FROM tbunidades WHERE ativo = 1 order by descr ASC limit 1');
    end else begin
      filtraTabela;
    end;

  end else begin
    //relogio:= TStopwatch.StartNew;
    cbIDUNI.Clear;
    filtratabela;
    //relogio.Stop;
    //ShowMessage(inttostr(relogio.ElapsedMilliseconds));
  end;

end;

procedure TfcadInvent.colSITUACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Brush.Color := clWhite;
  if AViewInfo.Value = Situacao[0] then begin
//    ACanvas.Brush.Color := clWhite;
    ACanvas.Font.Color := clRed
  end else if AViewInfo.Value = Situacao[2] then begin
    ACanvas.Brush.Color := TColor($84B0F4);
    ACanvas.Font.Color := clWhite;
  end else if AViewInfo.Value = Situacao[3] then begin
    ACanvas.Brush.Color := clRed;
    ACanvas.Font.Color := clWhite;
  end else begin
    ACanvas.Font.Color := clBlack;
  end;

end;

constructor TfcadInvent.Create(AOwner: TComponent; Unidade: Boolean);
var
  i: integer;
begin

  inherited create(aowner);

  cbATIVo.Items.Clear;
  for i := 0 to high(situacao) do begin
    cbATIVO.Items.Append(situacao[i]);
  end;


  gridMov.Align := alClient;

  qycat.IndexFieldNames := 'id';
  qyCAT.Open('SELECT id, descr, cod, ativo FROM tbcateg WHERE (ativo >= 0) ORDER BY id');

  qyuni.IndexFieldNames := 'id';
  qyuni.Open('SELECT id, descr, cod, ponto, ativo, obs2 FROM tbunidades WHERE (ativo >= 0) ORDER BY id');
  qypes.Open('select id, id_uni, nr_ins, descr, ativo from tbpessoal where tp_pes=0 and ativo = 1 order by descr;');

  chUNI.Checked := true;
  //cbIDUNI.EditValue := DM.DBCON.ExecSQLScalar('SELECT id FROM tbunidades WHERE ativo = 1 order by descr ASC limit 1');
  //FiltraTabela;

  modoUnidade:= Unidade;
  if modoUnidade then begin
    cbIDUNI.EditValue := DM.DBCON.ExecSQLScalar('SELECT id FROM tbunidades WHERE ativo = 1 order by descr ASC limit 1');
    pnIDUNI.Top:= 0;
    pnIDUNI.TabOrder:= 0;
    pnIDCAT.TabOrder:= 1;
    colIDUNI.Visible:= False;
    colDSUNI.Visible:= false;
    //chREPUNI.Checked:= True;
    //chREPUNI.Enabled:= False;

    qyrec.IndexFieldNames:= 'dscat_calc;descr';
  end else begin
    cbIDCAT.ItemIndex:= 0;
    pnIDCAT.Top:= 0;
    pnIDCAT.TabOrder:= 0;
    pnIDUNI.TabOrder:= 1;
    colDSCAT.Visible:= False;
    //chREPCAT.Checked:= True;
    //chREPCAT.Enabled:= False;
    qyrec.IndexFieldNames:= 'dsuni_calc;descr';
  end;
  //cbIDUNI.ItemIndex:= 0;

end;

procedure TfcadInvent.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfcadInvent.edDTINCORExit(Sender: TObject);
begin
  // edDTINCOR.PostEditValue;
end;

procedure TfcadInvent.edENTER_KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;
end;

procedure TfcadInvent.edIDCATChange(Sender: TObject);
begin
  if edIDCAT.Tag = 0 then
  begin // permite o OnChange
    cbIDCAT.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDCAT.Clear;
    if length(edIDCAT.Value) > 0 then begin
      if qyCAT.Locate('cod', edIDCAT.Value, [loPartialKey]) then begin
        cbIDCAT.EditValue := qyCAT.FieldByName('id').AsInteger;
        cbIDCAT.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end else begin // campo está vazio
      cbIDCAT.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TfcadInvent.edIDCATExit(Sender: TObject);
begin
  edIDCAT.Tag := 1; // DESATIVA o OnChange
  if cbIDCAT.Tag = 2 then // se localizou
    edIDCAT.Value := qyCAT.FieldByName('cod').AsString // preenche o campo
  else if cbIDCAT.Tag = 1 then // NÃO localizou
    edIDCAT.Clear; // limpa o campos
  cbIDCAT.Tag := 0; // Ativa o OnChange
  edIDCAT.Tag := 0; // Ativa o OnChange

end;

procedure TfcadInvent.edIDPESChange(Sender: TObject);
begin
  if edIDPES.Tag = 0 then begin // If OnChange Ativado
    cbIDPES.Tag := 1; // desativa OnChange - nao encontrado
    cbIDPES.Clear;
    if length(edIDPES.Text) > 0 then begin
      if qyPES.Locate('nr_ins', edIDPES.Text, [loPartialKey]) then begin
        cbIDPES.EditValue := qyPES.FieldByName('id').AsInteger;
        cbIDPES.Tag := 2; // encontrado - OnExit

      end;
    end else begin
      cbIDPES.Tag := 0;
    end;
  end;

end;

procedure TfcadInvent.edIDPESEnter(Sender: TObject);
begin
  edIDPES.Tag := 1; // Desativar OnChange
  edIDPES.EditMask := ''; // 99999999999999;0;_';
  edIDPES.SelectAll;
  edIDPES.Tag := 0; // Ativar OnChange

end;

procedure TfcadInvent.edIDPESExit(Sender: TObject);
begin
  if cbIDPES.Tag = 2 then begin // Foi localizado
    edIDPES.Tag := 1; // desativa OnChange
    edIDPES.EditMask := mskCPF;
    edIDPES.Text := qyPES.FieldByName('nr_ins').AsString;
    cbIDPES.Tag := 0;
    edIDPES.Tag := 0; // ativa OnChange
  end else begin
    edIDPES.EditMask := mskCPF;
    edIDPES.Text := '';
    edIDPES.Tag := 0;

  end;
end;

procedure TfcadInvent.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcadInvent.edPTUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1;
    // DESATIVA o OnChange, usado no OnExit e marca como Não localizado
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then
    begin
      if qyuni.Locate('codpt', edIDUNI.Value+ edPTUNI.Value, []) then
      begin
        cbIDUNI.EditValue := qyuni.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end
    else
      cbIDUNI.Tag := 0;
    FiltraTabela;
  end;

end;

procedure TfcadInvent.edIDUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then begin
      if qyuni.Locate('codpt', edIDUNI.Value + edPTUNI.Value, []) then begin
        cbIDUNI.EditValue := qyuni.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end;
    end else begin // campo está vazio
      cbIDUNI.Tag := 0; // Ativa o OnChange
    end;
    FiltraTabela;
  end;

end;

procedure TfcadInvent.edIDUNIExit(Sender: TObject);
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

procedure TfcadInvent.edOBS2Enter(Sender: TObject);
begin
  if cbIDUNI.EditValue = null then exit;

  if qyuni['id'] <> cbiduni.EditValue then qyuni.Locate('id', cbIDUNI.EditValue, []);

end;

procedure TfcadInvent.edOBS2Exit(Sender: TObject);
begin
  if cbIDUNI.EditValue = null then begin
    edOBS2.Clear;
    exit;
  end;

  if edOBS2.Text <> qyuni['obs2'] then begin
    if perguntasim('Atualizar Observação da Locação?', 'Observação') then begin
      qyuni.Edit;
      qyuni['obs2']:= edOBS2.Text;
      qyuni.Post;
    end else begin
      edOBS2.Text	:= qyuni['obs2'];
    end;
  end;

end;

procedure TfcadInvent.FiltraTabela;
var
  sql: string;
  order: string;
begin
  //delete from tbinvent WHERE NOT ( st_fim = 'N' and ativo>=0);
  qyrec.Close;

  qyRec.Filter := ' st_fim = ' + quotedstr(cSTNOR);// + ' and ';
  sql:= '';

  if modoUnidade then begin

    //colIDUNI.Visible:= not chUNI.Checked;
    //colDSUNI.Visible:= not chUNI.Checked;
    //if chUNI.Checked	 then begin
      if cbIDUNI.EditValue < 0 then exit;
      qyRec.Filter:= qyRec.Filter + ' and id_uni = ' + vartostr(cbIDUNI.EditValue);
      sql:= 'id_uni = "' + vartostr(cbIDUNI.EditValue) + '" and ';
      order:= 'id_uni, id_cat';
    //end;
  end else begin
    if cbIDCAT.EditValue < 0 then exit;
    qyRec.Filter:= qyRec.Filter + ' and id_cat = ' + vartostr(cbIDCAT.EditValue);
    sql:= 'id_cat = "' + vartostr(cbIDCAT.EditValue) + '" and ';
    order:= 'id_cat, id_uni';
  end;

  qyRec.Filtered := true;
  qyRec.Open('select * from tbinvent where ' +
    sql +
    'st_fim = "' + cSTNOR + '" and ' +
    'ativo >= 0 ');//ORDER BY ' + order);
  sql:= '';
end;

procedure TfcadInvent.FormCreate(Sender: TObject);
begin
  //inherited create
end;

procedure TfcadInvent.FormDestroy(Sender: TObject);
begin
  qyRec.Close;
  qyCAT.Close;
  qyuni.Close;
  qypes.Close;

end;

procedure TfcadInvent.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
  // qtModoInc:= -1;
end;

procedure TfcadInvent.gviewMovColumn1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: string);
//var
//  AIndex: Integer;
begin
//  AIndex := TcxGridTableView(Sender.GridView)
//    .DataController.GetRowIndexByRecordIndex(ARecordIndex, False);
//  AText := IntToStr(AIndex + 1);
end;

procedure TfcadInvent.gviewMovDblClick(Sender: TObject);
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
      preCampos;
      qtModoInc := 0;
      MudaModo(modoAlt);
    end;
  end;
end;

procedure TfcadInvent.gviewMovFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
//exit;
//  preCampos;
  if(wModo = modoAlt) then begin
    LimpaCampos;
    MudaModo(modoInc);
  end;
end;

procedure TfcadInvent.LimpaCampos;
begin
  //if (not chREPCAT.Checked) and (modoUnidade) then
  if modoUnidade then
    cbIDCAT.ItemIndex := -1;
  //else
  //if not chUNI.Checked then begin
  if not modoUnidade then begin
    cbIDPES.Tag:= 99;
    cbIDPES.Clear;
    edIDPES.Clear;
    cbIDUNI.ItemIndex := -1;
    cbIDPES.Tag := 0;
  end;
  //if (not chREPUNI.Checked) and (not modoUnidade) then

  //if not chREP2.Checked then
    edDESCR.Text := '';
  edCod.Text := DM.DBCON.ExecSQLScalar('select coalesce(max(cod)+1,1) from tbinvent');

  edFABRI.Clear;
  edMODEL.Clear;
  //if not chREP3.Checked then
    edNRSER.Clear;
  edNFISC.Clear;
  edGARAN.Clear;
  edFORNE.Clear;

  edDTAQUI.Clear ;
  edDTCOM.EditValue := null;
  edVLCOM.Value := 0;

  cbSITUA.ItemIndex := 1;
  edVIDUTIL.Value := 0;
  edVLDEP.Text := '';

  cbAtivo.ItemIndex := 1;
  edDTMAN.EditValue := null;
  // cbIdcus.ItemIndex:= -1;
  //if not chREP4.Checked then
    edDTINCOR.EditValue := null;
  cbTPINCOR.ItemIndex := 0;
  edOBS.Lines.Clear;
  edID.Text := kNovoId;
  qtModoInc := 0;
end;

procedure TfcadInvent.moverItem;
var
  mover_iduni, mover_idcat, mover_idpes, i: integer;
  mover_obs: string;
  qtd: integer;
  descr, desuni, despes, descat,
  iduni, idpes, idcat: string;
  obs: string;
begin
    //if qyrec.RecordCount = 0 then exit;
    qtd:= gviewMov.Controller.SelectedRowCount;
    if qtd = 0 then exit;

    //qyrec.DisableControls;
    descr:= gviewMov.Controller.SelectedRows[0].Values[colDESCR.Index];
    desuni:= gviewMov.Controller.SelectedRows[0].Values[colDSUNI.Index	];
    iduni:= gviewMov.Controller.SelectedRows[0].Values[colIDUNI.Index	] + ' - ';
    despes:= gviewMov.Controller.SelectedRows[0].Values[colDSPES.Index	];
    descat:= gviewMov.Controller.SelectedRows[0].Values[colDSCAT.Index	];
    //obs:=  gviewMov.Controller.SelectedRows[0].Values[colOBS.Index];
    if qtd > 1 then begin
      gviewMov.BeginUpdate();
      for i := 1 to qtd-1 do begin
        if descr <> gviewMov.Controller.SelectedRows[i].Values[colDESCR.Index] then
          descr:= 'VÁRIOS ITENS';

        if desuni <> gviewMov.Controller.SelectedRows[i].Values[colDSUNI.Index] then begin
          desuni:= 'VÁRIAS LOCAÇÕES';
          iduni:= '';
        end;

        if descat<> gviewMov.Controller.SelectedRows[i].Values[colDSCAT.Index] then
          descat:= ' VÁRIAS CATEGORIAS';

        if despes <> gviewMov.Controller.SelectedRows[i].Values[colDSPES.Index] then
          despes:= 'VÁRIOS PROMOTORES';

        //if obs <> gviewMov.Controller.SelectedRows[i].Values[colOBS.Index] then

      end;
      gviewMov.EndUpdate;
    end;
    //preCampos;
    mover_iduni:= 0;
    //ShowMessage('Generico Clicado!');
    with TfmoverInvent.Create(Self) do begin

      edDESCR.Text:= descr;// Self.edDESCR.Text;
      edUNI.Text:= iduni + desuni;
      // Self.edIDUNI.Text + '.' + Self.edPTUNI.Text + ' - ' + Self.cbIDUNI.Text;
      //edUNI.Tag:= Self.cbIDUNI.EditValue;
      edCAT.Text:= descat;
      //edCAT.Text:= Self.edIDCAT.Text + ' - ' + Self.cbIDCAT.Text;
      //edCAT.Tag:= Self.cbIDCAT.EditValue;
      //edPES.Text:= Self.cbIDPES.Text;
      edPES.Text:= despes;


      cbIDUNI.Properties.ListSource:= dsuni;
      //cbIDUNI.EditValue:= Self.cbIDUNI.EditValue;
      cbIDCAT.Properties.ListSource:= dscat;
      //cbIDCAT.EditValue:= Self.cbIDCAT.EditValue;
      cbIDPES.Properties.ListSource:= dspes;
      //cbIDPES.EditValue:= Self.cbIDPES.EditValue;
      //edOBS.Text:= obs; //Self.edOBS.Text;
      if ShowModal = mrOK then begin
        mover_iduni:= 0;
        if chUNI.Checked then mover_iduni:= cbIDUNI.EditValue;
        mover_idcat:= 0;
        if chCAT.Checked then mover_idcat:= cbIDCAT.EditValue;
        mover_idpes:= 0;
        if chPES.Checked then mover_idpes:= cbIDPES.EditValue;
        mover_obs:= edOBS.Text;
      end;

      Free;
    end;
    if (mover_iduni>0) or (mover_idcat>0) or (mover_idpes > 0) then begin
      fAguarde:= TfAguarde.create(nil);
      fAguarde.Show;
      Application.ProcessMessages;
      obs:= '';
      qyrec.DisableControls;
      gviewMov.BeginUpdate();
      DM.DBCON.StartTransaction;
      for i := 0 to qtd-1 do begin
        if qyrec.Locate('id', gviewMov.Controller.SelectedRows[i].Values[colID.Index], []) then begin
          obs:= obs + #13#10 + qyrec['descr'];
          DM.criaLogTab(qyrec, 'tbinvent_aud', cSTESTOQMOV, true, 'id');
          qyrec.Edit;
          qyrec['US_ALT']:= wUsuario;
          qyrec['DT_ALT']:= Now;
          qyrec['st_ini']:= cSTESTOQMOV;
          if mover_iduni > 0 then qyrec['id_uni']:= mover_iduni;
          if mover_idcat > 0 then qyrec['id_cat']:= mover_idcat;
          if mover_idpes > 0 then qyrec['id_pes']:= mover_idpes;

          if mover_obs <> '' then begin
            if qyrec.FieldByName('obs').AsString <> '' then qyrec['obs']:= qyrec['obs'] + #13#10;
            qyrec['obs']:= qyrec['obs'] + mover_obs;
          end;
          qyrec.Post;
        end;
      end;
      DM.DBCON.commit	;
      gviewmov.EndUpdate;
      qyrec.EnableControls;
      faguarde.Hide;
      faguarde.Free;
      ShowMessage('Transferência de Locação/Categoria/Promotor Concluída!');
    end;

end;

procedure TfcadInvent.preCampos;
var
  dVLDEP: double;
  vl: variant;
begin
  with qyRec do begin
    //if modoUNIDADE then
    cbIDCAT.EditValue := FieldByName('id_cat').AsInteger;
    //else
    cbIDPES.Tag:= 99;
    vl:= FieldValues['id_uni'];
    if cbIDUNI.EditValue <> vl then
      cbIDUNI.EditValue:= vl;
    cbIDPES.Tag	:= 0;
    cbIDPES.EditValue:= FieldByName('id_pes').AsInteger	;

    edDESCR.Text := FieldByName('DESCR').AsString;
    edCod.Text := FieldByName('Cod').AsString;
    edFABRI.Text := FieldByName('fabri').AsString;
    edMODEL.Text := FieldByName('model').AsString;
    edNRSER.Text := FieldByName('nrser').AsString;
    edNFISC.Text := FieldByName('nfisc').AsString;
    edGARAN.EditValue := FieldByName('garan').AsVariant;
    edFORNE.Text := FieldByName('FORNE').AsString;
    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edOBS.Lines.Text := FieldByName('obs').AsString;

    edDTCOM.EditValue := FieldByName('dt_comp').AsVariant;
    edDTAQUI.EditValue := fieldvalues['dt_aqui'];
    edDTMAN.EditValue := FieldByName('dt_man').AsVariant;

    edVLCOM.Value := FieldByName('vl_comp').AsFloat;

    edVIDUTIL.Value := FieldByName('vid_util').AsInteger;

    edDTINCOR.EditValue := FieldByName('dt_incor').AsVariant;

    cbTPINCOR.ItemIndex := FieldByName('tp_incor').AsInteger;

    dVLDEP := edVLCOM.Value - ((edVLCOM.Value / (edVIDUTIL.Value * 12)) * MonthsBetween(Date, edDTCOM.Date));
    if dVLDEP.IsNan then dVLDEP:= 0;

    edVLDEP.Text := FormatFloat(',0.00', dVLDEP);

    if not(wModo = modoInc) then begin
      edID.Text := FieldByName('id').AsString;
      // qyMov.Filter:= ' id_inv = ' + edID.Text;
    end;
  end;
end;

procedure TfcadInvent.qycatCalcFields(DataSet: TDataSet);
var
  st: string;
begin
  st:= Dataset.FieldValues['descr'];
  if dataset.FieldValues['ativo'] = 0 then st:= st + strINATIVO;

  Dataset.FieldValues['descr2']:= st;

end;

procedure TfcadInvent.qypesCalcFields(DataSet: TDataSet);
var
  st: string;
begin
  st:= Dataset.FieldValues['descr'];
  if dataset.FieldValues['ativo'] = 0 then st:= st + strINATIVO;

  Dataset.FieldValues['descr2']:= st;
end;

procedure TfcadInvent.qyRecCalcFields(DataSet: TDataSet);
//var
//  st: string;
begin
  //if not modoUnidade then begin

    if (qyuni['id'] = dataset['id_uni']) or qyuni.Locate('id', DataSet['id_uni'], []) then begin
      //st := qyuni.FieldByName('descr').AsString;
      //if qyuni.FieldValues['ativo'] = 0 then st:= st + ' (INATIVO)';

      DataSet['dsuni_calc']:= qyuni['descr'];
      DataSet['cduni_calc']:= formatmasktext('9999.99;0;_', qyuni['codpt']);
    end;
  //end else begin
    if (qyCAT['id'] = dataset['id_cat']) or qyCAT.Locate('id', DataSet['id_cat'], []) then begin
      DataSet['dscat_calc']:= qyCAT['descr2'];
      //DataSet['cdcat_calc']:= qyCAT['cod'];
    end;
  //end;
    DataSet['dspes_calc']:= '';
    if (qypes['id'] = dataset['id_pes']) or qypes.Locate('id', DataSet['id_pes'], []) then begin
      DataSet['dspes_calc']:= qypes['descr2'];
      //DataSet['cdcat_calc']:= qyCAT['cod'];
    end;
  {
  case dataset['ativo'] of
    0: begin
      st:= 'INATIVO';
    end;
    1: begin
      st:= 'ATIVO';
    end;
    2: begin
      st:= 'PENDENTE';
    end;
    3: begin
      st:= 'BAIXADO';
    end;
    else
      st:= vartostr(dataset['ativo']) + '?';
  end;
  dataset['dssit_calc']:= st;
  }
  dataset['dssit_calc']:= Situacao[dataset.FieldByName('ativo').AsInteger];
end;

procedure TfcadInvent.qyuniCalcFields(DataSet: TDataSet);
var
  st: string;
begin
  st:= Dataset.FieldValues['descr'];
  if dataset.FieldValues['ativo'] = 0 then st:= st + strINATIVO;

  Dataset.FieldValues['descr2']:= st;
  Dataset.FieldValues['codpt']:= Dataset.FieldValues['cod'] + Dataset.FieldValues['ponto'];
end;

procedure TfcadInvent.WMACAO(var Msg: TMessage);
begin
  if Msg.wParam = wpModo then begin
    gviewMov.Controller.ClearSelection;
    if Msg.LParam <> modoInc then begin
      if (qyRec.RecordCount > 0) then begin
        preCampos;
        if wModo = modoExc then ExeAcao; //Confirma Exclusão de imediato - 13/12/23
      end else begin
        MudaModo(modoInc);
      end;
      qtModoInc := 0;
    end else begin
      edID.Text := kNovoId;
      // qyMov.Filter:= ' id_inv = -1';
      inc(qtModoInc);
      if (qtModoInc > 1) then begin
        LimpaCampos;
        qtModoInc := 0;
      end;
    end;
    // if pcInv.ActivePage = tsCad then
    //if modoUnidade then
    //edIDCAT.SetFocus
    //else
    edIDUNI.SetFocus;
  end else if Msg.wParam = wpConfirma then begin
    ExeAcao;
  end else if Msg.wParam = wpGenerico then begin
    moverItem;
  end else if Msg.wParam = wpExportar then begin
    gviewMov.BeginUpdate();
    //if modoUnidade  then begin
      //qyrec.IndexFieldNames:= 'dscat_calc';
      DM.LoadReport('inventPorLocal');
      DM.frxRel.Variables['GRUPO'] := QuotedStr(edIDUNI.Text + '.' + edPTUNI.Text + ' - ' + cbIDUNI.Text);
      DM.frxXLS.FileName := 'relInventLocal.XLSX';

    //end else begin
      //qyrec.IndexFieldNames:= 'dsuni_calc';
      DM.LoadReport('inventPorCateg');
      DM.frxRel.Variables['GRUPO'] := QuotedStr(cbIDCAT.Text);
      DM.frxXLS.FileName := 'relInventCateg.XLSX';
    //end;


    DM.frxRel.PrepareReport();
    DM.frxXLS.ShowDialogOptions := [doShowSaveDialog];
    DM.frxXLS.OpenAfterExport := true;
    DM.frxRel.Export(DM.frxXLS);
    gViewMov.EndUpdate;
  end;

end;

end.
