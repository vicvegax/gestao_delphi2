unit cfgRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxButtonEdit;

type
  TfCfgRel = class(TForm)
    gridREC: TcxGrid;
    viewREC: TcxGridDBTableView;
    levelREC: TcxGridLevel;
    dsrec: TDataSource;
    qyrec: TFDQuery;
    qyrecid: TWordField;
    qyrecnome: TStringField;
    qyrecdtalt: TDateTimeField;
    colID: TcxGridDBColumn;
    colNOME: TcxGridDBColumn;
    colBT: TcxGridDBColumn;
    colDTALT: TcxGridDBColumn;
    dlgAbrir: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyrecNewRecord(DataSet: TDataSet);
    procedure colBTPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCfgRel: TfCfgRel;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfCfgRel.colBTPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  arq: TStringList;

begin
  if Abuttonindex = 0 then begin
    if dlgAbrir.Execute() then begin
      arq:= TStringList.Create;
      arq.LoadFromFile(dlgAbrir.FileName, TEncoding.ANSI);
      //DM.qry.Open('select dados from cfgrelatorio where id = ' + colID.EditValue);

      DM.DBCON.ExecSQL('update cfgrelatorio set dados = :dados where id = :id',
        [arq.Text, colID.EditValue]);

      arq.Free;
      colDTALT.EditValue:= Now;
      viewRec.DataController.Post();
      ShowMessage('Registro Atualizado!');
    end;

  end else
    ShowMessage(DM.DBCON.ExecSQLScalar('select length(dados) from cfgrelatorio where id = :id', [colID.EditValue]));
end;

procedure TfCfgRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
qyrec.Close;
end;

procedure TfCfgRel.FormCreate(Sender: TObject);
begin
qyrec.Open('select id, nome, dtalt from cfgrelatorio');
end;

procedure TfCfgRel.qyrecNewRecord(DataSet: TDataSet);
begin
  //DataSet['dados']:= '';
  DataSet['dtalt']:= Now;
end;

end.
