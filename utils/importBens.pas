unit importBens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, cxDBLookupComboBox,
  strutils,
  FireDAC.Stan.StorageBin;

type
  TfImportBens = class(TForm)
    viewMem: TcxGridDBTableView;
    grMemLevel1: TcxGridLevel;
    grMem: TcxGrid;
    tbmem: TFDMemTable;
    dsmem: TDataSource;
    tbmemidcat: TIntegerField;
    tbmemdescr: TStringField;
    tbmemnumero: TStringField;
    tbmemcidade: TStringField;
    tbmemponto: TStringField;
    tbmemiduni: TIntegerField;
    tbmemok: TBooleanField;
    viewMemidcat: TcxGridDBColumn;
    viewMemdescr: TcxGridDBColumn;
    viewMemnumero: TcxGridDBColumn;
    viewMemcidade: TcxGridDBColumn;
    viewMemponto: TcxGridDBColumn;
    viewMemiduni: TcxGridDBColumn;
    viewMemok: TcxGridDBColumn;
    Panel1: TPanel;
    Button1: TButton;
    dlgAbrir: TOpenDialog;
    Button2: TButton;
    dlgSalvar: TSaveDialog;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure tbmemBeforePost(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImportBens: TfImportBens;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfImportBens.Button1Click(Sender: TObject);
var
  lsTab, lsRow: tStringList;
  st: string;
  i: integer;
begin
  if dlgAbrir.Execute then
  begin
    Screen.Cursor := crHourglass;
    st := dlgAbrir.FileName;
    tbmem.Tag := 1;
    tbmem.Open;
    if lowercase(rightstr(st, 3)) = 'csv' then
    begin
      tbmem.DisableControls;
      lsTab := tStringList.Create;
      lsRow := tStringList.Create;
      lsTab.LoadFromFile(dlgAbrir.FileName);
      lsRow.Delimiter := ';';
      lsRow.StrictDelimiter := true;
      for i := 0 to lsTab.Count - 1 do
      begin
        st := lsTab[i];
        lsRow.DelimitedText := st;
        tbmem.Append;
        tbmem['idcat'] := lsRow[0];
        tbmem['descr'] := lsRow[1];
        tbmem['cidade'] := lsRow[2];
        tbmem['ponto'] := lsRow[3];
        tbmem['numero'] := lsRow[4];
        if DM.qyUni.Locate('cod', lsRow[3], []) then
          tbmem['iduni'] := DM.qyUni['id'];
        tbmem['ok'] := false;
        tbmem.Post;
      end;
      lsRow.Free;
      lsTab.Free;
      tbmem.EnableControls;
      viewMem.ApplyBestFit();
    end
    else
    begin
      tbmem.LoadFromFile(st);
    end;
    tbmem.Tag := 0;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfImportBens.Button2Click(Sender: TObject);
begin
  if dlgSalvar.Execute() then
  begin
    tbmem.SaveToFile(dlgSalvar.FileName);
  end;
end;

procedure TfImportBens.Button3Click(Sender: TObject);
var
  i: integer;
begin
  DM.DBCON.StartTransaction;
  viewMem.DataController.GotoFirst;
  i := 1;
  while not viewMem.DataController.IsEOF do
  begin
    with DM.qyInv do
    begin
      Open;
      Append;
      FieldValues['cod'] := Format('%.*d', [5, i]);
      FieldValues['descr'] := tbmem['descr'];
      FieldValues['id_cat'] := tbmem['idcat'];
      FieldValues['id_uni'] := tbmem['iduni'];
      FieldValues['nrser'] := tbmem['numero'];
      FieldValues['US_INC'] := wUsuario;
      FieldValues['DT_INC'] := Now;
      FieldValues['ativo'] := 1;
      Post;
      close;
    end;
    viewMem.DataController.GotoNext;
    inc(i);
  end;
  DM.DBCON.Commit;
  ShowMessage('OK');

end;

procedure TfImportBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbmem.close;
  DM.qyCat.close;
  DM.qyUni.close;
end;

procedure TfImportBens.FormCreate(Sender: TObject);
begin
  self.WindowState := wsMaximized;
  grMem.Align := alClient;
  DM.qyCat.Open();
  DM.qyUni.Open();
end;

procedure TfImportBens.tbmemBeforePost(DataSet: TDataSet);
begin
  if tbmem.Tag = 0 then
    if DM.qyUni.Locate('id', DataSet['iduni'], []) then
      DataSet['ponto'] := DM.qyUni['cod'];
end;

end.
