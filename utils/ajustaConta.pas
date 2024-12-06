unit ajustaConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfajustaConta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed1: TMemo;
    Button1: TButton;
    gvMov: TcxGridDBTableView;
    glMov: TcxGridLevel;
    grMov: TcxGrid;
    dsV: TDataSource;
    qryV: TFDQuery;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fajustaConta: TfajustaConta;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfajustaConta.Button1Click(Sender: TObject);
begin
qryV.Open(ed1.Lines.Text);
gvmov.ClearItems;
gvmov.DataController.CreateAllItems();
gvmov.ApplyBestFit();
end;

procedure TfajustaConta.Button2Click(Sender: TObject);
var
  ag: string;
begin
//showmessage(gvmov.DataController.GetItemByFieldName('agencia').EditValue);
//exit;
gvmov.DataController.GotoFirst;
//while not gvmov.DataController.IsEOF do begin
while True do begin

  //if  then
  ag:= gvmov.DataController.GetItemByFieldName('agencia').EditValue;
  if dvAgencia(ag, cBB) <> ag[ag.Length] then
    if perguntaSim('Divergência: ' + ag[ag.Length] + ' <> ' + dvAgencia(ag, cBB), 'Erro Dígito') then begin
      ag[ag.Length]:= dvAgencia(ag, cBB)[1];
      gvmov.DataController.GetItemByFieldName('agencia').EditValue:= ag;
    end;
  if gvmov.DataController.IsEOF then break
  else gvmov.DataController.GotoNext;
end;
end;

procedure TfajustaConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
qryV.Close;
end;

procedure TfajustaConta.FormCreate(Sender: TObject);
begin
self.WindowState:= wsMaximized;
grMov.Align:= alClient;
end;

end.
