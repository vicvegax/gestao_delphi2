unit visPessoal;

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
  TfvisPessoal = class(TForm)
    dsmov: TDataSource;
    qymov: TFDQuery;
    Label1: TLabel;
    edDESCR: TEdit;
    Label5: TLabel;
    edID: TEdit;
    Label3: TLabel;
    cbAtivo: TComboBox;
    Label4: TLabel;
    edObs: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    edAgencia: TagenciaEdit;
    edNrConta: TcontaEdit;
    Label8: TLabel;
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
    edDSUNI: TEdit;
    lbCOD: TLabel;
    edCOD: TEdit;
    Label2: TLabel;
    cbTpConta: TComboBox;
    edPTUNI: TzeroEdit;
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
    edDSEMP: TEdit;
    edIDEMP: TEdit;
    Label13: TLabel;
    colDSEMP: TcxGridDBColumn;
    procedure edProxFocusKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure preCampos;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; iCDPES: Integer); reintroduce;
  end;

var
  fvisPessoal: TfvisPessoal;

implementation

{$R *.dfm}

uses modDados;


procedure TfvisPessoal.edProxFocusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = kENTER) then
  begin
    Key := #0;
    ProxFocus;
  end;

end;


constructor TfvisPessoal.Create(AOwner: TComponent; iCDPES: Integer);
var
  sTipo: String;
begin
  inherited Create(AOwner);

  if not DM.qyPes.Locate('id', iCDPES, []) then begin
    MsgErro('2312271145 - Código Ag/For não encontrado: ' + inttostr(iCDPES));
    Exit;
  end;
  
  cbTPINS.ItemIndex:= 0;
  if DM.qyPes['tp_pes'] = cTipoAgente then begin // Agentes
    cbTPINS.Enabled := False;
    sTipo := 'Agentes';
  end else begin // Fornecedores
    lbLOC.Visible := False;
    edIDEMP.Visible:= false;
    edDSEMP.Visible:= false;
    colDSEMP.Visible:= False;
    edIDUNI.Visible := False;
    edPTUNI.Visible := False;
    edDSUNI.Visible := False;
    lbCOD.Visible := False;
    edCOD.Visible := False;
    sTipo := 'Fornecedores';
    gridREC.height := Self.ClientHeight - edIDUNI.Top;
  end;

  Self.Caption := 'Visualização de Cadastro de ' + sTipo;
  preCampos;
end;


procedure TfvisPessoal.FormCreate(Sender: TObject);
begin
  // Procure o INHERITED
end;

procedure TfvisPessoal.preCampos;
begin
  with DM.qyPes do begin
    edID.Text:= FieldValues['id'];
    edDESCR.Text := FieldByName('DESCR').AsString;
    edNRINS.Text := FieldByName('nr_ins').AsString;
    cbTPINS.ItemIndex := FieldByName('tp_ins').AsInteger;
    edCOD.Text := FieldByName('cod').AsString;
    edBanco.Value := FieldByName('Banco').AsString;
    edAgencia.Value := FieldByName('agencia').AsString;
    edNrConta.Value := FieldByName('nr_conta').AsString;
    cbTpConta.ItemIndex := FieldByName('tp_conta').AsInteger;
    cbAtivo.ItemIndex := FieldByName('ativo').AsInteger;
    edObs.Lines.Text := FieldByName('obs').AsString;
    edFone1.Value := FieldByName('fone1').AsString;
    edFone2.Value := FieldByName('fone2').AsString;
    edEmail.Text := FieldByName('email').AsString;

    if FieldValues['tp_pes'] = cTipoAgente then begin
      edDSUNI.Text:= DM.DBCON.ExecSQLScalar('select descr from tbunidades where id = :id', FieldValues['id_uni']);
      edDSEMP.Text:= DM.DBCON.ExecSQLScalar('select descr from tbempresa where id = :id', FieldValues['id_emp']);
    end;
  end;
end;

end.
