unit OrdenaGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.DBCGrids;

type
  TfOrdenaGrid = class(TForm)
    grORD: TDBCtrlGrid;
    Label1: TLabel;
    cbCOL: TDBComboBox;
    Label2: TLabel;
    cbORD: TDBComboBox;
    btINC: TBitBtn;
    btEXC: TBitBtn;
    DSORD: TDataSource;
    TBORD: TFDMemTable;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    ordID: TSmallintField;
    ordCol: TStringField;
    ordORD: TStringField;
    lbID: TDBText;
    btUP: TBitBtn;
    btDN: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBORDNewRecord(DataSet: TDataSet);
    procedure btINCClick(Sender: TObject);
    procedure btEXCClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure TBORDAfterScroll(DataSet: TDataSet);
    procedure btUPClick(Sender: TObject);
    procedure btDNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrdenaGrid: TfOrdenaGrid;

implementation

{$R *.dfm}

uses modFuncoes;

procedure TfOrdenaGrid.btINCClick(Sender: TObject);
begin
  tbord.Append;
  ordID.Value:= tbord.RecordCount+1;
  tbord.Post;
  tbord.Last;
end;

procedure TfOrdenaGrid.btOKClick(Sender: TObject);
//var
//  st: string;
begin
  //st:= 'Vazio';
  if tbord.State in [dsEdit, dsInsert] then tbord.Post;

  if tbord.RecordCount > 0 then begin
    //tbord.DisableControls;
    tbord.First;
    //st:= '';
    while not tbord.Eof do begin
      if ordCOL.IsNull then begin
        MsgErro('Informe a Coluna!');
        exit;
      end;
      //st:= st + ordCOL.Value + ', ';
      tbord.Next;
    end;
  end;
  //ShowMessage(st);
  ModalResult:= mrOk;
end;

procedure TfOrdenaGrid.btUPClick(Sender: TObject);
var
  oldid: integer;
begin
  if ordID.Value = 0 then exit;

  tbord.DisableControls;
  oldid:= ordID.Value;
  tbord.Edit;
  ordid.Value:= tbord.RecordCount+1;
  tbord.Post;

  if tbord.Locate('id', oldid-1, []) then begin
    tbord.Edit;
    ordID.Value:= oldid;
    tbord.post;
  end;

  if tbord.Locate('id', tbord.RecordCount+1, []) then begin
    tbord.Edit;
    ordID.Value:= oldid-1;
    tbord.post;
  end;

  tbord.EnableControls;
  tbord.Locate('id', oldid-1, []);
end;

procedure TfOrdenaGrid.btDNClick(Sender: TObject);
var
  oldid: integer;
begin
  if ordID.Value = (tbord.RecordCount) then exit;

  tbord.DisableControls;
  oldid:= ordID.Value;
  tbord.Edit;
  ordid.Value:= tbord.RecordCount+1;
  tbord.Post;

  if tbord.Locate('id', oldid+1, []) then begin
    tbord.Edit;
    ordID.Value:= oldid;
    tbord.post;
  end;

  if tbord.Locate('id', tbord.RecordCount+1, []) then begin
    tbord.Edit;
    ordID.Value:= oldid+1;
    tbord.post;
  end;

  tbord.EnableControls;
  tbord.Locate('id', oldid+1, []);
end;

procedure TfOrdenaGrid.btEXCClick(Sender: TObject);
begin
  tbord.Delete;
  if tbord.RecordCount = 0 then btEXC.enabled:= false;

end;

procedure TfOrdenaGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
///TBORD.Close;
end;

procedure TfOrdenaGrid.FormCreate(Sender: TObject);
begin
TBORD.Open;
lbID.Visible:= wUsuario<100;
end;

procedure TfOrdenaGrid.TBORDAfterScroll(DataSet: TDataSet);
begin
btUP.Enabled:= (Dataset.RecNo > 1) and (Dataset.RecordCount > 1);
btDN.Enabled:= (Dataset.RecNo < Dataset.RecordCount) and (Dataset.RecordCount > 1);
end;

procedure TfOrdenaGrid.TBORDNewRecord(DataSet: TDataSet);
begin
  ordORD.Value:= cbORD.Items[0];
  //DataSet.Post;
  btEXC.Enabled:= true;
end;

end.
