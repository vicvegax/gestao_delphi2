unit cdrEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TfcdrEventos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edDESCR: TEdit;
    edCod: TMaskEdit;
    cbNTREG: TComboBox;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    Label4: TLabel;
    edObs: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcdrEventos: TfcdrEventos;

implementation

{$R *.dfm}

end.
