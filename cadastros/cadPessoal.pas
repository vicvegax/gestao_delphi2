unit cadPessoal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, maskutils, cxGraphics,
  cxControls, cxContainer, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, StrUtils, bancoEdit, zeroEdit, contaEdit,
  agenciaEdit, foneEdit, cxLookAndFeels, cxLookAndFeelPainters, cxEdit,
  cxTextEdit, cxMaskEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxCheckBox;

type
  TfcadPessoal = class(TForm)
    dsRec: TDataSource;
    qyRec: TFDQuery;
    Label1: TLabel;
    edDESCR: TEdit;
    lbID: TLabel;
    edID: TEdit;
    lbAtivo: TLabel;
    cbAtivo: TComboBox;
    Label4: TLabel;
    edObs: TMemo;
    lbAgencia: TLabel;
    lbNrConta: TLabel;
    edAgencia: TagenciaEdit;
    edNrConta: TcontaEdit;
    lbBanco: TLabel;
    edBanco: TbancoEdit;
    cbTPINS: TComboBox;
    edNRINS: TMaskEdit;
    Label9: TLabel;
    edFone1: TfoneEdit;
    Label10: TLabel;
    edFone2: TfoneEdit;
    Label11: TLabel;
    Label12: TLabel;
    edEmail: TEdit;
    lbLOC: TLabel;
    edIDUNI: TzeroEdit;
    cbIDUNI: TcxLookupComboBox;
    DSUNI: TDataSource;
    lbCOD: TLabel;
    edCOD: TEdit;
    lbTpConta: TLabel;
    cbTpConta: TComboBox;
    edPTUNI: TzeroEdit;
    Button1: TButton;
    qyRecdsuni_calc: TStringField;
    qyReccduni_calc: TStringField;
    qyRectp_conta_ds: TStringField;
    viewREC: TcxGridDBTableView;
    levelREC: TcxGridLevel;
    gridREC: TcxGrid;
    colNRINS: TcxGridDBColumn;
    colDESCR: TcxGridDBColumn;
    colCOD: TcxGridDBColumn;
    colIDUNI: TcxGridDBColumn;
    colDSUNI: TcxGridDBColumn;
    viewRECfone1: TcxGridDBColumn;
    viewRECfone2: TcxGridDBColumn;
    viewRECbanco: TcxGridDBColumn;
    viewRECagencia: TcxGridDBColumn;
    viewRECnr_conta_fmt: TcxGridDBColumn;
    viewRECtp_conta_ds: TcxGridDBColumn;
    viewRECemail: TcxGridDBColumn;
    viewRECobs: TcxGridDBColumn;
    viewRECativo: TcxGridDBColumn;
    qyRecid: TWordField;
    qyRectp_pes: TShortintField;
    qyRecid_uni: TWordField;
    qyReccod: TStringField;
    qyRectp_ins: TShortintField;
    qyRecnr_ins: TStringField;
    qyRecdescr: TStringField;
    qyRecbanco: TStringField;
    qyRecagencia: TStringField;
    qyRecnr_conta: TStringField;
    qyRectp_conta: TShortintField;
    qyRecfone1: TStringField;
    qyRecfone2: TStringField;
    qyRecemail: TStringField;
    qyRecobs: TStringField;
    qyRecponto: TStringField;
    qyRecativo: TShortintField;
    qyRecvinc: TStringField;
    qyRecus_inc: TWordField;
    qyRecdt_inc: TDateTimeField;
    qyRecus_alt: TWordField;
    qyRecdt_alt: TDateTimeField;
    qyRecus_exc: TWordField;
    qyRecdt_exc: TDateTimeField;
    qyReclog: TMemoField;
    cbIDEMP: TcxLookupComboBox;
    edIDEMP: TEdit;
    lbEMP: TLabel;
    qyemp: TFDQuery;
    dsemp: TDataSource;
    colDSEMP: TcxGridDBColumn;
    qyReccalc_ds_emp: TStringField;
    qyRecid_emp: TSmallintField;
    Label14: TLabel;
    chSemConta: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edENTER_KeyPress(Sender: TObject; var Key: Char);
    procedure cbTPINSSelect(Sender: TObject);
    procedure qyRecCalcFields(DataSet: TDataSet);
    procedure edIDUNIChange(Sender: TObject);
    procedure edIDUNIExit(Sender: TObject);
    procedure cbIDCUSPropertiesEditValueChanged(Sender: TObject);
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure edDESCRKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edPTUNIPropertiesEditValueChanged(Sender: TObject);
    procedure edPTUNIChange(Sender: TObject);
    procedure edNRINSClick(Sender: TObject);
    procedure edNrContaExit(Sender: TObject);
    procedure edAgenciaExit(Sender: TObject);
    procedure qyRecagenciaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edDESCRExit(Sender: TObject);
    procedure viewRECDblClick(Sender: TObject);
    procedure colNRINSGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure edNRINSChange(Sender: TObject);
    procedure edDESCRChange(Sender: TObject);
    procedure qyRecfone1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyRecnr_contaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edIDEMPChange(Sender: TObject);
    procedure edIDEMPExit(Sender: TObject);
    procedure cbIDEMPPropertiesEditValueChanged(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure cbTpContaSelect(Sender: TObject);
    procedure chSemContaClick(Sender: TObject);
  private
    { Private declarations }
    function ExeAcao: Boolean;
    function ChkCampos: Boolean;
    procedure preCampos;
    procedure WMACAO(var Msg: TMessage); message WM_ACAO;
    procedure LimpaCampos;

  var
    qtModoInc: Integer;
    sTipo: String;
    FiTPPES: Integer;
  public

    { Public declarations }
    constructor Create(AOwner: TComponent; iTPPES: Integer); reintroduce;
  end;

var
  fcadPessoal: TfcadPessoal;

implementation

{$R *.dfm}

uses modDados;

function TfcadPessoal.ExeAcao: Boolean;
var
  bLocId, bLocReg: Boolean;
  permis: String;
  oldbanco: string;
  oldagencia: string;
  oldnrconta: string;
  oldtpconta: integer;
  qtmov, qtmovAlt: integer;
  sqltext: string;
begin
  Result := False;
  if fitppes = cTipoAgente then permis:= 'cadAgentes'
  else permis:= 'cadFornec';
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
  Result := False;

  if (not ChkCampos) then
    Exit;
  // qyRec.DisableControls;
  // qyrec.Filtered:= False;
  // bLocReg:= qyRec.Locate('nr_ins', ednrins.Text, []);
  // qyRec.Filtered:= True;
  bLocId := False;
  if (wModo <> modoInc) then
    if qyrec['id'] = edID.Text then bLOCID:= True
    else bLocId := qyRec.Locate('id', edID.Text, []);

  if not(wModo = modoExc) then begin
    if (wModo = modoInc) then begin  //INCLUSÃO
      bLocReg := DM.DBCON.ExecSQLScalar('SELECT count(id) FROM tbpessoal WHERE (nr_ins = "' +  edNRINS.Text + '")') > 0;

      if (bLocReg) then begin
        MsgErro(Format(kJaCad, [cbTPINS.Text]) + ' ou como AGENTE ou como FORNECEDOR!');
        Exit;
      end;
      if (not perguntaSim(kMsgInc, kModo[wModo])) then Exit;
    end else begin  //ALTERAÇÃO
      if (not bLocId) then begin
        MsgErro(Format(kNaoLoc, [sTipo]));
        Exit;
      end;
      if (not perguntaSim(kMsgAlt, kModo[wModo])) then Exit;


    end; // if

    qtmov:= 0;
    with qyRec do begin
      if (wModo = modoInc) then begin
        Append;
        FieldByName('US_INC').AsInteger := wUsuario;
        FieldByName('DT_INC').AsDateTime := Now;
      end else begin

        oldbanco:= vartostr(FieldValues['banco']);
        if (oldbanco <> '') and (edBANCO.Value <> '') then begin
          oldagencia:= vartostr(fieldvalues['agencia']);
          oldnrconta:= vartostr(fieldvalues['nr_conta']);
          oldtpconta:= fieldvalues['tp_conta'];
          if (oldbanco <> edBANCO.Value) or
             (oldagencia <> edagencia.Value) or
             (oldnrconta <> ednrconta.Value) or
             (oldtpconta <> cbtpconta.ItemIndex+1) then begin
            //DM.qry.open('SELECT id, id_ctr, valor, dt_ven, banco, agencia, nr_conta, tp_conta FROM plmovimento WHERE ' +
            qtmov:= DM.DBCON.ExecSQLScalar('SELECT count(id) FROM plmovimento WHERE ' +
              'id_pes = ' + edID.Text + ' AND ' +
              'st_fim = "' + cSTNOR + '" AND '+
              'st_mov = "' + cMovAgendado + '" AND ' +
              'banco <> "";');
            //if DM.qry.RecordCount > 0 then begin
            if qtmov > 0 then begin
              //ShowMessage('Pl. de Movimento: ' + inttostr(DM.qry.RecordCount));
              if not perguntaNao('ATENÇÃO! Há ' + inttostr(qtmov) + ' registro(s) Em Aberto na Pl. de Movimento. Deseja alterá-los para os novos dados?', 'Dados Bancários Alterados') then begin
                qtmov:= 0;
                if not perguntaNao('ATENÇÃO! Não foi selecionado a Alteração na Pl. de Movimento. Deseja continuar com a Alteração do Cadastro?', 'Alteração de Cadastro') then begin
                  ShowMessage('A Alteração foi cancelada!');
                  exit;
                end;

              end;
            end;
            //DM.qry.Close;
          end;

        end;
        //Exit;  //////// <<<<<<<<<<<<<<<<<<<<<<< A T E N Ç Ã O <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

        Edit;
        FieldByName('US_ALT').AsInteger := wUsuario;
        FieldByName('DT_ALT').AsDateTime := Now;
      end;
      if FiTPPES = cTipoAgente then
        FieldByName('cod').AsString := edCOD.Text;
      if (wModo = modoInc) then begin
        FieldByName('tp_ins').AsInteger := cbTPINS.ItemIndex;
        FieldByName('nr_ins').AsString := edNRINS.Text;
      end;
      FieldByName('DESCR').AsString := Trim(edDESCR.Text);
      FieldByName('banco').AsString := edBanco.Value;
      FieldByName('agencia').AsString := edAgencia.Value; // , 'X');
      FieldByName('nr_conta').AsString := edNrConta.Value; // , 'X');
      if chSemConta.Checked then FieldByName('tp_conta').AsInteger := 0
      else FieldByName('tp_conta').AsInteger := cbTpConta.ItemIndex + 1; // cTIPCC;
      // if cbTPCNT.ItemIndex = 1 then FieldByName('tp_conta').AsString:= cTIPCP;

      FieldByName('fone1').AsString := edFone1.Value;
      FieldByName('fone2').AsString := edFone2.Value;
      FieldByName('email').AsString := edEmail.Text;
      FieldByName('ativo').AsInteger := cbAtivo.ItemIndex;
      FieldByName('obs').AsString := edObs.Lines.Text;
      if FiTPPES = cTipoAgente then begin
        FieldByName('id_uni').AsInteger := cbIDUNI.EditValue;
        fieldvalues['id_emp']:= cbIDEMP.EditValue;
        // FieldByName('ponto').AsString:= edPonto.Text;

      end else begin
        FieldByName('id_uni').AsInteger := 0;
        fieldvalues['id_emp']:= 0;
        // FieldByName('ponto').AsInteger:= 0;
      end;
      FieldByName('tp_pes').AsInteger := FiTPPES;
      Post;

      if(qtmov > 0) then begin //É ACREDITADO ESTAR NO MODO DE ALTERAÇÃO
        DM.DBCON.StartTransaction;
        sqltext:= 'insert into `plmovimento_aud` ' +
          'SELECT 0, ' +
            'id, id_ctr, old_id, tp_mov, "' + cSTALT + '", st_fim, ' +
            'st_mov, st_ctr, id_cnt, id_uni, id_inv, id_eve, id_pes, ' +
            'id_tpd, nr_doc, vl_bas, vl_efe, 0, nt_reg, dt_emi, dt_ven, dt_ven_ori, compt, perio_ini, ' +
            'perio_fim, dt_bxa, 0, banco, agencia, nr_conta, tp_conta, descr, obs, qt_parc, nr_parc, ' +
            'nivel, us_entreg, dt_entreg, ' + inttostr(wUsuario) + ', :DTINC, us_alt, dt_alt, us_exc, dt_exc, obs_exc, us_efe, ' +
            'dt_efe, log FROM `plmovimento` ' +
          'WHERE ' +
            'st_fim = "' + cSTNOR + '" and ' +
            'st_mov = "' + cMovAgendado + '" and ' +
            'banco <> "" and ' +
            'id_pes = ' + edID.Text;

        DM.DBCON.ExecSQL(sqltext, [Now]);
        sqltext:= 'UPDATE plmovimento SET ' +
            'banco = "' + edBanco.Value + '", ' +
            'agencia = "' + edAgencia.value + '", ' +
            'nr_conta = "' + edNrConta.Value + '", ' +
            'tp_conta = ' + inttostr(cbTpConta.ItemIndex+1) + ', ' +
            'us_alt = ' + inttostr(wusuario) + ', ' +
            'dt_alt = :DTALT, ' +
            'st_ini = "' + cSTALT + '" ' +
          ' WHERE ' +
            'id_pes = ' + edID.Text + ' AND ' +
            'st_fim = "' + cSTNOR + '" AND '+
            'st_mov = "' + cMovAgendado + '" AND ' +
            'banco <> "";';
        qtmovAlt:= DM.DBCON.ExecSQL(sqltext, [Now]);
        if(qtMovAlt <> qtmov) then begin
          DM.DBCON.Rollback;
          MsgErro('ATENÇÃO! Erro na Quantidade Alterada! Previsto: ' + inttostr(qtmov) + ', Alterado: ' + inttostr(qtmovAlt));
        end else begin
          DM.DBCON.Commit;
          ShowMessage('Foram Atualizados ' + inttostr(qtmov) + ' registro(s) da Pl. de Movimento!');
        end;
      end;
    end;
  end else begin //EXCLUSÃO
    if (not bLocId) then begin
      MsgErro(Format(kNaoLoc, [sTipo]));
      Exit;
    end;

    if DM.DBCON.ExecSQLScalar('SELECT id FROM plmovimento WHERE id_pes = ' + edID.Text + ' LIMIT 1') <> null then begin
      MsgErro('Este Registro não pode ser Excluído. Ele está sendo usado na Pl. de Movimento!');
      Exit;
    end;


    if (not perguntaSim(kMsgExc, kModo[wModo])) then Exit;
    if (not perguntaSim(kMsgExcCtz, kModo[wModo])) then Exit;

    qyRec.Edit;
    DM.marcaExclusao(qyRec);
    qyRec.Post;
  end;
  LimpaCampos;
  MudaModo(modoInc);
  Result := true;
end;

procedure TfcadPessoal.Button1Click(Sender: TObject);
var
  st: string;
  dv: string;
  a, b, c, d, e: Integer;
begin
  qyRec.First;
  DM.DBCON.StartTransaction;
  while not qyRec.Eof do
  begin
    st := leftstr(qyRec.FieldByName('agencia').AsString, 4);
    a := strtoint(st[1]) * 5;
    b := strtoint(st[2]) * 4;
    c := strtoint(st[3]) * 3;
    d := strtoint(st[4]) * 2;
    e := 11 - ((a + b + c + d) mod 11);
    if e = 10 then
      dv := 'X'
    else if e = 11 then
      dv := '0'
    else
      dv := inttostr(e);
    qyRec.Edit;
    qyRec.FieldByName('agencia').AsString := st + dv;
    qyRec.Post;
    qyRec.Next;
  end;
  DM.DBCON.Commit;
  ShowMessage('ok');
end;

procedure TfcadPessoal.cbIDCUSPropertiesEditValueChanged(Sender: TObject);
begin
  if cbIDUNI.Tag = 0 then
  begin // permite o OnChange
    edIDUNI.Tag := 1; // DESATIVA o OnChange
    edIDUNI.Value := '';
    edPTUNI.Value := '1';
    if DM.qyUNI.Locate('id', cbIDUNI.EditValue, []) then
    begin
      edIDUNI.Value := DM.qyUNI.FieldByName('cod').AsString;
      edPTUNI.Value := DM.qyUNI.FieldByName('ponto').AsString;
    end;
    edIDUNI.Tag := 0; // Ativa o OnChange
  end;

end;

procedure TfcadPessoal.cbIDEMPPropertiesEditValueChanged(Sender: TObject);
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

end;

procedure TfcadPessoal.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;

procedure TfcadPessoal.edPTUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then
    begin
      if DM.qyUNI.Locate('cod;ponto', varArrayOf([edIDUNI.Value, edPTUNI.Value]
        ), []) then
      begin
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end
      else
        cbIDUNI.Tag := 0;
    end
    else
      cbIDUNI.Tag := 0;
  end;

end;

procedure TfcadPessoal.edPTUNIPropertiesEditValueChanged(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Value) > 0 then
    begin
      if DM.qyUNI.Locate('cod;ponto', varArrayOf([edIDUNI.Value, edPTUNI.Value]
        ), []) then
      begin
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end
      else
        cbIDUNI.Tag := 0;
    end
    else
      cbIDUNI.Tag := 0;
  end;

end;

procedure TfcadPessoal.cbTPINSSelect(Sender: TObject);
begin
  edNRINS.Tag := 1;

  if cbTPINS.ItemIndex = 0 then
    edNRINS.EditMask := mskCPF
  else
    edNRINS.EditMask := mskCNPJ;

  edNRINS.Tag := 0;
end;

procedure TfcadPessoal.chSemContaClick(Sender: TObject);
var
  ativo: boolean;
begin
edBanco.Value:= '';
edAgencia.Value:= '';
edNrConta.Value:= '';
cbTpConta.ItemIndex:= -1;
ativo:= not chSemConta.Checked;

edBanco.Enabled:= ativo;
edAgencia.Enabled:= ativo;
edNrConta.Enabled:= ativo;
cbTpConta.Enabled:= ativo;

lbBanco.Enabled:= ativo;
lbAgencia.Enabled:= ativo;
lbNrConta.Enabled:= ativo;
lbTpConta.Enabled:= ativo;
end;

function TfcadPessoal.ChkCampos: Boolean;
begin
  Result := False;
  if (length(edNRINS.Text) = 0) or  (not checaNRINS(edNRINS.Text, cbTPINS.ItemIndex)) then begin
    MsgErro('Informe um ' + cbTPINS.Text + ' válido!');
    edNRINS.SetFocus;
    Exit;
  end;
  if FiTPPES = cTipoAgente then begin
    if edCOD.Text = '' then begin
      MsgErro('Informe uma Chave J!');
      edCOD.SetFocus;
      Exit;
    end;
  end;

  if (length(edDESCR.Text) = 0) then begin
    msgPreen('Nome Completo');
    edDESCR.SetFocus;
    Exit;
  end;
  if FiTPPES = cTipoAgente then begin
    if cbIDUNI.ItemIndex < 0 then begin
      msgPreen('Lotação');
      edIDUNI.SetFocus;
      Exit;
    end;

    if cbIDEMP.EditValue = null then begin
      msgPreen('Empresa');
      edIDEMP.SetFocus;
      exit;
    end;

  end;


  if not chSemConta.Checked then begin

    if edBanco.Value = '' then begin
      MsgErro('Preencha o campo Banco!');
      edBanco.SetFocus;
      Exit;
    end;
    if edAgencia.Value = '' then begin
      MsgErro('Preencha o campo Agência!');
      edAgencia.SetFocus;
      Exit;
    end else begin
      if not (rightstr(edagencia.Value,1)[1] in ['0'..'9']) then
        edAgencia.Value:= enchest(edAgencia.Value, '0', 5, kPSESQ);

      if (edBANCO.Text = cBB) or (length(edagencia.Value) = 5) then begin
        //if checaAgencia(edAgencia.Value, edBanco.Value) then begin
        if checaAgencia(edAgencia.Value, cBB) then begin
          edAgencia.Value:= enchest(edAgencia.Value, '0', 5, kPSESQ);
        end else begin
          MsgErro('Número da Agência inválido! (Cálculo Módulo 11)');
          edAgencia.SetFocus;
          Exit;
        end;
      end else begin
        edAgencia.Value:= enchest(edAgencia.Value, '0', 4, kPSESQ);
      end;
    end;
    if edNrConta.Value = '' then begin
      MsgErro('Preencha o campo Conta!');
      edNrConta.SetFocus;
      Exit;
    end else begin
      if not checaConta(edNrConta.Value, edBanco.Value) then begin
        MsgErro('Número da Conta inválido! (Atenção ao Código do Banco)');
        edNrConta.SetFocus;
        Exit;
      end;

    end;

    if cbTpConta.ItemIndex < 0 then begin
      MsgErro('Informe o Tipo de Conta!');
      cbTpConta.SetFocus;
      Exit;
    end;
  end;
  Result := true;
end;

constructor TfcadPessoal.Create(AOwner: TComponent; iTPPES: Integer);
begin
  inherited Create(AOwner);
  edID.Visible := wUsuario <= 100;
  lbID.Visible := edID.Visible;
  cbTPINS.ItemIndex := 0;
  FiTPPES := iTPPES;
  if iTPPES = cTipoAgente then begin // Agentes
    cbTPINS.Enabled := False;
    sTipo := 'Agentes';
    //DM.qyUNI.Filter := 'ativo = 1';
    //DM.qyUNI.Filtered := true;
    DM.qyUNI.Open(DM.sqlTBUNI	);//).Open('select id, cod, ponto, codpt, descr from tbunidades where ativo >= 0');
    qyemp.Open('select id, cod, nrins, descr from tbempresas where ativo = 1 order by nrins');
    chSemConta.Enabled:= False;
    chSemConta.Visible:= False;
    // gdRec.Top:= 288;
  end else begin // Fornecedores
    lbLOC.Visible := False;
    lbEMP.Visible:= False;
    edIDEMP.Visible:= false;
    cbIDEMP.Visible:= false;
    colDSEMP.Visible:= False;
    edIDUNI.Visible := False;
    edPTUNI.Visible := False;
    cbIDUNI.Visible := False;
    lbCOD.Visible := False;
    edCOD.Visible := False;
    colCOD.Visible := False;
    colIDUNI.Visible := False;
    colDSUNI.Visible := False;
    lbAtivo.Left:= lbLOC.Left;
    lbAtivo.Top:= lbLOC.Top;
    cbAtivo.Left:= edIDUNI.Left;
    cbAtivo.Top:= edIDUNI.Top;
    // gdRec.Columns[2].Visible:= False;
    // gdRec.Columns[3].Visible:= False;
    // gdRec.Columns[4].Visible:= False;
    // gdRec.Columns[5].Visible:= False;
    sTipo := 'Fornecedores';
    gridREC.height := Self.ClientHeight - edIDEMP.Top;
    // gdRec.Top:= 248;
  end;
  {
    qyRec.Open('select p.*, u.cod CDUNI, u.ponto PTUNI, u.descr DSUNI from tbpessoal p ' +
    'left join tbunidades u on ' +
    '  p.id_uni = u.id ' +
    'order by u.descr, tp_ins, nr_ins');//WHERE tp_pes = ' + inttostr(tipo));
  }
  qyRec.Filter := '(ativo >= 0) ';
  qyRec.Filtered := true;
  qyRec.Open('select * FROM tbpessoal WHERE (ativo >= 0) and (tp_pes = ' +
    inttostr(iTPPES) + ') order by id'); // WHERE tp_pes = ' + inttostr(tipo));
  // qyRec.Last;
  // qyRec.First;
  // qyRec
  // gdRec.Align:= alBottom;
  Self.Caption := 'Cadastro de ' + sTipo;

  cbTPINSSelect(nil);

end;

procedure TfcadPessoal.edAgenciaExit(Sender: TObject);
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

procedure TfcadPessoal.edBancoExit(Sender: TObject);
begin
//DM.qybco.open('select * from tbbanco where cod = :id1', [edbanco.Text]);

end;

procedure TfcadPessoal.edDESCRChange(Sender: TObject);
begin
  // if wModo = modoINC then qyrec.Locate('descr', edDESCR.Text, [loPartialKey]);
  if edDESCR.Tag <> 0 then exit;

  //viewREC.DataController.Search.Locate(colDESCR.Index, edDESCR.Text, true, false);
  with viewREC.DataController.Filter do begin
    BeginUpdate;
    try
      Root.Clear;
      if(edDESCR.Text <> '') then
        Root.AddItem(colDESCR, foContains, edDESCR.Text, edDESCR.Text);
    finally
      EndUpdate;
      Active:= true;
    end;

  end;
end;

procedure TfcadPessoal.edDESCRExit(Sender: TObject);
begin
  edDESCR.Text := Trim(removeAcento(edDESCR.Text));
end;

procedure TfcadPessoal.edDESCRKeyPress(Sender: TObject; var Key: Char);
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

procedure TfcadPessoal.edENTER_KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ExeAcao;
  end;
end;

procedure TfcadPessoal.edIDEMPChange(Sender: TObject);
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
    end;

    //ProxFocus;
  end else begin
    cbIDEMP.tag:= 0;
  end;
end;

procedure TfcadPessoal.edIDEMPExit(Sender: TObject);
begin
  edIDEMP.Tag:= 1;
  if cbIDEMP.Tag = 2 then begin
    edIDEMP.Text:= formataCNPJ(qyemp['nrins']);
    cbIDEMP.Tag:= 0;
  end else if cbIDEMP.Tag = 1 then begin
    edIDEMP.Clear;
    cbIDEMP.Tag:= 0;
  end;
  edIDEMP.Tag:= 0;

end;

procedure TfcadPessoal.edIDUNIChange(Sender: TObject);
begin
  if edIDUNI.Tag = 0 then
  begin // permite o OnChange
    cbIDUNI.Tag := 1; // DESATIVA o OnChange, usado no OnExit
    cbIDUNI.ItemIndex := -1;
    if length(edIDUNI.Text) > 0 then
    begin
      if DM.qyUNI.Locate('cod;ponto', varArrayOf([edIDUNI.Value, edPTUNI.Value]
        ), []) then
      begin
        cbIDUNI.EditValue := DM.qyUNI.FieldByName('id').AsInteger;
        cbIDUNI.Tag := 2; // confirma que localizou, usado no OnExit
      end
      else
        cbIDUNI.Tag := 0; // Ativa o OnChange
    end
    else
    begin // campo está vazio
      cbIDUNI.Tag := 0; // Ativa o OnChange
    end;
  end;

end;

procedure TfcadPessoal.edIDUNIExit(Sender: TObject);
begin
  edIDUNI.Tag := 1; // DESATIVA o OnChange
  if cbIDUNI.Tag = 1 then // não foi localizado
    edIDUNI.Clear; // limpa o campo
  cbIDUNI.Tag := 0; // Ativa o OnChange
  edIDUNI.Tag := 0; // Ativa o OnChange

end;

procedure TfcadPessoal.edNrContaExit(Sender: TObject);
begin
  if edNrConta.Value <> '' then
    if not checaConta(edNrConta.Value, edBanco.Value) then
    begin
      MsgErro('Número da Conta inválido! (Atenção ao Código do Banco)');
      edNrConta.SetFocus;
    end;
end;

procedure TfcadPessoal.edNRINSChange(Sender: TObject);
begin
  // if wModo = modoINC then qyrec.Locate('nr_ins', sonumero(edNRINS.Text), [loPartialKey]);
  // with viewREC.DataController.Filter.Root do begin
  // Clear;
  // AddItem(colNRINS, foContains, edNRINS.Text, edNRINS.Text);
  // end;
  if edNRINS.Tag = 0 then
    viewREC.DataController.Search.Locate(colNRINS.Index, edNRINS.Text, true);
end;

procedure TfcadPessoal.edNRINSClick(Sender: TObject);
begin
  if edNRINS.Text = '' then
    edNRINS.SelStart := 0;

end;

procedure TfcadPessoal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qyUNI.Close;
  qyemp.Close;
  // DM.qyUni.Filtered:= false;
  qyRec.Close;
end;

procedure TfcadPessoal.FormCreate(Sender: TObject);
begin
  // Procure o INHERITED
end;

procedure TfcadPessoal.FormShow(Sender: TObject);
begin
  // edDESCR.SetFocus;
  LimpaCampos;
end;

procedure TfcadPessoal.LimpaCampos;
begin
  cbIDEMP.Tag:= 0;
  cbIDEMP.EditValue:= null;
  edDESCR.Tag := 1;
  edDESCR.Text := '';
  edDESCR.Tag := 0;
  edNRINS.Tag := 1;
  edNRINS.Text := '';
  edNRINS.Tag := 0;
  cbAtivo.ItemIndex := 1;
  edObs.Lines.Clear;
  edID.Text := kNovoId;
  edCOD.Text := '';
  edFone1.Clear;
  edFone2.Clear;
  edEmail.Text := '';

  chSemConta.Checked:= False;
  edBanco.Value := '';
  edAgencia.Value := '';
  edNrConta.Value := '';
  cbTpConta.ItemIndex := -1;

  cbTPINSSelect(nil);
  cbIDUNI.ItemIndex := -1;
  edIDUNI.Value := '';
  edPTUNI.Value := '1';
  qtModoInc := 0;
end;

procedure TfcadPessoal.preCampos;
begin
  with qyRec do
  begin
    edDESCR.Tag := 1;
    edDESCR.Text := FieldByName('DESCR').AsString;
    edDESCR.Tag := 0;
    edNRINS.Tag := 1;
    edNRINS.Text := FieldByName('nr_ins').AsString;
    edNRINS.Tag := 0;

    cbTPINS.ItemIndex := FieldByName('tp_ins').AsInteger;
    cbTPINSSelect(nil);
    edCOD.Text := FieldByName('cod').AsString;
    if FieldValues['tp_conta'] = 0 then begin
      chSemConta.Checked:= True;
    end else begin
      chSemConta.Checked:= False;
      edBanco.Value := FieldByName('Banco').AsString;
      edAgencia.Value := FieldByName('agencia').AsString;
      edNrConta.Value := FieldByName('nr_conta').AsString;
      cbTpConta.ItemIndex := FieldByName('tp_conta').AsInteger - 1;
    end;

    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edObs.Lines.Text := FieldByName('obs').AsString;
    edFone1.Value := FieldByName('fone1').AsString;
    edFone2.Value := FieldByName('fone2').AsString;
    edEmail.Text := FieldByName('email').AsString;
    if FiTPPES = cTipoAgente then begin
      cbIDUNI.EditValue := FieldByName('id_uni').AsInteger;
      cbIDEMP.EditValue:= FieldValues['id_emp'];
      // edPonto.Value:= FieldByName('ponto').AsInteger;

    end;
    if not(wModo = modoInc) then
      edID.Text := FieldByName('id').AsString;
  end;
end;

procedure TfcadPessoal.qyRecagenciaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataAgencia(Sender.AsString);
end;

procedure TfcadPessoal.qyRecCalcFields(DataSet: TDataSet);
begin
  // if DataSet.FieldByName('tp_ins').AsInteger = cTipoCPF then
  // DataSet.FieldByName('nrins_fmt').AsString:= FormatMaskText(mskCPF, DataSet.FieldByName('nr_ins').AsString)
  // else
  // DataSet.FieldByName('nrins_fmt').AsString:= FormatMaskText(mskCNPJ, DataSet.FieldByName('nr_ins').AsString);

  if FiTPPES = cTipoAgente then begin
    if DataSet.FieldByName('id_uni').AsInteger > 0 then begin
      if DM.qyUNI.Locate('id', DataSet.FieldByName('id_uni').AsInteger, []) then begin
        DataSet.FieldByName('calc_ds_uni').AsString :=
          DM.qyUNI.FieldByName('descr').AsString;
        DataSet.FieldByName('calc_cd_uni').AsString :=
          DM.qyUNI.FieldByName('codpt').AsString;
      end;
    end;
    if DataSet.FieldByName('id_emp').AsInteger > 0 then begin
      if qyemp.Locate('id', DataSet.FieldByName('id_emp').AsInteger, []) then begin
        DataSet.FieldByName('calc_ds_emp').AsString :=
         qyemp.FieldByName('descr').AsString;
      end;
    end;
  end;
  DataSet.FieldByName('calc_ds_tp_conta').AsString :=
    DM.retTipoConta(DataSet.FieldByName('tp_conta').AsInteger);

  // DataSet.FieldByName('nr_conta_fmt').AsString:= formataConta(DataSet.FieldByName('nr_conta').AsString);

  // DataSet.FieldByName('fone1_ds').AsString:= formataFone(DataSet.FieldByName('fone1').AsString);
  // DataSet.FieldByName('fone2_ds').AsString:= formataFone(DataSet.FieldByName('fone2').AsString);
end;

procedure TfcadPessoal.qyRecfone1GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataFone(Sender.AsString);
end;

procedure TfcadPessoal.qyRecnr_contaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := formataNrConta(Sender.AsString);

end;

procedure TfcadPessoal.viewRECDblClick(Sender: TObject);
var
  APoint: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin
  GetCursorPos(APoint);
  with gridREC.FocusedView.Site do
  begin
    APoint := ScreenToClient(APoint);
    AHitTest := ViewInfo.GetHitTest(APoint);

    if AHitTest is TcxGridRecordHitTest then begin
      preCampos;
      MudaModo(modoAlt);
    end;
  end;
end;

procedure TfcadPessoal.cbTpContaSelect(Sender: TObject);
begin
//  edBANCO.Value:= '';
//  edAGENCIA.Value:= '';
//  edNRCONTA.Value:= '';
end;

procedure TfcadPessoal.colNRINSGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if AText.length = 11 then
    AText := FormatMaskText(mskCPF, AText)
  else if AText.length = 14 then
    AText := FormatMaskText(mskCNPJ, AText);

end;

procedure TfcadPessoal.WMACAO(var Msg: TMessage);
begin
  if Msg.wParam = wpModo then begin
    if Msg.LParam <> modoInc then begin
      if (qyRec.RecordCount > 0) then begin
        preCampos;
        if Msg.LParam = modoExc then ExeAcao;

      end else
        MudaModo(modoInc);
      qtModoInc := 0;
    end else begin
      edID.Text := kNovoId;
      inc(qtModoInc);
      if (qtModoInc > 1) then begin
        LimpaCampos;
        qtModoInc := 0;
      end;
    end;
    edNRINS.SetFocus;
  end;
  if Msg.wParam = wpConfirma then   begin
    ExeAcao;
  end;

end;

end.
