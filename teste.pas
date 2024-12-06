unit teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    qry1: TFDQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DtMod, funcoes;

procedure TForm1.Button1Click(Sender: TObject);
var
 tot_cus: integer;
 id_cus: integer;
begin
edit2.Text:= sonumero(edit1.Text, 'X');

tot_cus:= 0;
//exit;
with qry1, DM do begin
  DBTRANS.StartTransaction;
  QYPES.Open();
  qyUNI.Open();


  first;
  while not eof do begin
    if not qyUNI.Locate('cod', FieldByName('p_lot').AsString, [])  then begin
      //id_cus := tot_cus + 1;
      //tot_cus := tot_cus + 1;
      qyUNI.Append;
      qyUNI.FieldByName('id').AsInteger:= id_cus;
      qyUNI.FieldByName('cod').AsString:= FieldByName('p_lot').AsString;
      qyUNI.FieldByName('descr').AsString:= FieldByName('a_lot').AsString;
      qyUNI.FieldByName('dt_inc').AsDateTime:= Date;
      qyUNI.FieldByName('us_inc').AsString:= '00000000000';
      qyUNI.Post;
    //end else begin
      //id_cus:= qycus.FieldByName('id').AsInteger;
    end;
    id_cus:= qyUNI.FieldByName('id').AsInteger;
    qyPES.Append;
    qyPES.FieldByName('tp_pes').AsInteger:= cTPAGE;
    qyPES.FieldByName('tp_doc').AsInteger:= cTPCPF;
    qyPES.FieldByName('nr_doc').AsString:= sonumero(FieldByName('cod').AsString);
    qyPES.FieldByName('descr').AsString:= FieldByName('nome').AsString;
    qyPES.FieldByName('cod').AsString:= FieldByName('chave').AsString;
    qyPES.FieldByName('agencia').AsString:= sonumero(FieldByName('agenc').AsString, 'X');
    qyPES.FieldByName('conta').AsString:= sonumero(FieldByName('conta').AsString);
    qyPES.FieldByName('tp_conta').AsString:= FieldByName('tipo').AsString;
    qyPES.FieldByName('fone1').AsString:= sonumero(FieldByName('fone').AsString);
    qyPES.FieldByName('email').AsString:= FieldByName('email').AsString;
    qyPES.FieldByName('vinc').AsString:= FieldByName('vinc').AsString;
    qyPES.FieldByName('ativo').AsInteger:= 1;
    qypes.FieldByName('id_uni').AsInteger:= id_cus;
    qypes.FieldByName('dt_inc').AsDateTime:= Date;
    qypes.FieldByName('us_inc').AsString:= '00000000000';
    qypes.Post;
    next;
  end;
  DBTRANS.Commit;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
qry1.Open();
end;

end.
