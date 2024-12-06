unit selConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfSelConta = class(TForm)
    gvSEL: TcxGridDBTableView;
    glSEL: TcxGridLevel;
    grSEL: TcxGrid;
    gvSELcod: TcxGridDBColumn;
    gvSELdescr: TcxGridDBColumn;
    gvSELnrins: TcxGridDBColumn;
    gvSELdsemp: TcxGridDBColumn;
    Panel1: TPanel;
    btCancelar: TBitBtn;
    btOK: TBitBtn;
    colID: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    constructor Create(AOwner: TComponent; selConta: array of integer); reintroduce;
  end;

var
  fSelConta: TfSelConta;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

//constructor TfSelConta.Create(AOwner: TComponent;
//  selConta: array of integer);
//begin
//  inherited Create(Aowner);
//
//  grSEL.Align	:= alClient;
//  for I := low(selConta) to high(selConta) do begin
//    //if gvSEL.DataController.LocateByKey(selConta[i]) then
//      //gvSEL.ViewData.Rows[gvSEL.DataController.
//  end;
//end;

procedure TfSelConta.btOKClick(Sender: TObject);
begin
  modalResult:= mrOk;
end;

procedure TfSelConta.FormCreate(Sender: TObject);
begin
//constructor
  grSEL.Align	:= alClient;
end;

end.
