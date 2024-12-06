unit dadosUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, cxCalendar;

type
  TfDadosUnidade = class(TForm)
    gridMov: TcxGrid;
    viewMov: TcxGridDBTableView;
    gridMovLevel1: TcxGridLevel;
    QYUNI: TFDQuery;
    DSUNI: TDataSource;
    QYUNIid: TWordField;
    QYUNIdescr: TStringField;
    QYUNIinfodata: TDateField;
    QYUNIinfoinsc: TStringField;
    QYUNIinfoemail: TStringField;
    QYUNIinfo4: TStringField;
    QYUNIinfo5: TStringField;
    viewMovdescr: TcxGridDBColumn;
    viewMovinfodata: TcxGridDBColumn;
    viewMovinfoinsc: TcxGridDBColumn;
    viewMovinfoemail: TcxGridDBColumn;
    viewMovinfo4: TcxGridDBColumn;
    viewMovinfo5: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDadosUnidade: TfDadosUnidade;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfDadosUnidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QYUNI.Close;
end;

procedure TfDadosUnidade.FormCreate(Sender: TObject);
begin
  gridMov.Align := alClient;
  QYUNI.Open
    ('select id, descr, infodata, infoinsc, infoemail, info4, info5 from tbunidades');

end;

end.
