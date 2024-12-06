unit relAnalisePonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons, modFuncoes, zeroEdit, Data.DB,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, dxGDIPlusClasses, strutils;

type
  TfrelAnalisePonto = class(TForm)
    dsMov: TDataSource;
    qyMov: TFDQuery;
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    gvMov: TcxGridDBTableView;
    glMov: TcxGridLevel;
    grMov: TcxGrid;
    Button2: TButton;
    pnBar: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    imgMostra: TImage;
    imgSelo: TImage;
    Label6: TLabel;
    lbDSEMP: TLabel;
    edSDATU: TcxCurrencyEdit;
    edSDANT: TcxCurrencyEdit;
    btFiltra: TButton;
    cbIDCNT: TcxLookupComboBox;
    edDTFIM: TcxDateEdit;
    edDTINI: TcxDateEdit;
    edTOTC: TcxCurrencyEdit;
    edTOTD: TcxCurrencyEdit;
    pnGuia: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure colValorDCCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gvMovColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure Panel1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frelAnalisePonto: TfrelAnalisePonto;

implementation

{$R *.dfm}

uses modDados;

procedure TfrelAnalisePonto.Button1Click(Sender: TObject);
var
  sql: string;
  i: integer;
begin
sql:= memo1.Text;
sql:= stringreplace(sql, ':dti', '"' + dataSQL(edDTINI.Date) + '"', [rfReplaceAll, rfIgnoreCase]);
sql:= stringreplace(sql, ':dtf', '"' + dataSQL(edDTFIM.Date) + '"', [rfReplaceAll, rfIgnoreCase]);
sql:= stringreplace(sql, ':cnt', '"' + vartostr(cbIDCNT.EditValue)	 + '"', [rfReplaceAll, rfIgnoreCase]);
//showmessage(sql);
gvMov.BeginUpdate();
qyMov.Open(sql);
gvMov.ClearItems ;
gvMov.DataController.CreateAllItems();
  for i := 0 to gvMov.ColumnCount-1 do begin
    if leftstr(gvmov.Columns[i].Caption, 2) = 'vl' then begin
      gvmov.Columns[i].PropertiesClass := TcxCurrencyEditProperties ;
      TcxCurrencyEditProperties(gvmov.Columns[i].Properties).DisplayFormat := ',0.00 C;,0.00 D';
      gvmov.Columns[i].OnCustomDrawCell := colValorDCCustomDrawCell;
    end;
    if leftstr(gvmov.Columns[i].Caption, 3) = 'tot' then begin
      gvmov.Columns[i].PropertiesClass := TcxCurrencyEditProperties ;
      TcxCurrencyEditProperties(gvmov.Columns[i].Properties).DisplayFormat := ',0.00;,0.00; ';
      gvmov.Columns[i].OnCustomDrawCell := colValorDCCustomDrawCell;
    end;

    //gvmov.Columns[i].Caption:= fromSnake(gvmov.Columns[i].Caption);
  end;
gvMov.EndUpdate;
gvMov.ApplyBestFit();

end;

procedure TfrelAnalisePonto.Button2Click(Sender: TObject);
begin
gvMov.CopyToClipboard(true);
end;

procedure TfrelAnalisePonto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
qymov.Close;
with DM do begin
  qycnt.Close;
end;
end;

procedure TfrelAnalisePonto.FormCreate(Sender: TObject);
begin
with DM do begin
  qycnt.Open();
end;
cbIDCNT.ItemIndex:= 0;
edDTINI.Date:= TmesAno.Create(encodeDate(2024,3,1)).priDia;
edDTFIM.Date:= TmesAno.Create(encodeDate(2024,3,31)).ultDia	;
grMov.Align := alClient;
end;

procedure TfrelAnalisePonto.gvMovColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
acolumn.Caption:= inputbox('Novo Título', 'Coluna ' + Tcxgriddbcolumn(acolumn).DataBinding.FieldName , acolumn.Caption);


end;

procedure TfrelAnalisePonto.Panel1DblClick(Sender: TObject);
begin
panel1.Hide;
end;

procedure TfrelAnalisePonto.colValorDCCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Value  = 0 then ACanvas.Font.Color := clBlack
  else if aviewinfo.Value	 < 0 then ACanvas.Font.Color:= corValorD
  else ACanvas.Font.Color:= corValorC;


end;

end.
