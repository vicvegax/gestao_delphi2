unit mudarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfMudarSenha = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lbNOME: TLabel;
    Label3: TLabel;
    lbUSU: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edSENHA: TEdit;
    Label6: TLabel;
    edNOVASENHA: TEdit;
    Label7: TLabel;
    edCONFIRMA: TEdit;
    imgSENHA: TImage;
    imgNOVA: TImage;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    procedure imgSENHAClick(Sender: TObject);
    procedure imgNOVAClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMudarSenha: TfMudarSenha;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfMudarSenha.btOKClick(Sender: TObject);
begin
  if length(edSENHA.Text) < 4 then begin
    msgErro('Senha Inválida!');
    edSENHA.SetFocus;
    edSENHA.SelectAll;
    exit;
  end;

  if codificaH(edSENHA.Text, 0) <> DM.qyLogin['senha'] then begin
    msgErro('Senha Inválida!');
    edSENHA.SetFocus;
    edSENHA.SelectAll;
    exit;
  end;

  if (length(edNOVASENHA.Text) < 4) or (edNOVASENHA.Text <> edCONFIRMA.Text) then begin
    msgErro('Nova Senha inválida ou não confere!');
    edNOVASENHA.SetFocus;
    edNOVASENHA.SelectAll;
    exit;
  end;

  if edNOVASENHA.Text = edSENHA.Text then begin
    msgErro('Nova Senha deve ser diferente da Senha Anterior!');
    edNOVASENHA.SetFocus;
    edNOVASENHA.SelectAll;
    Exit;
  end;

  if not perguntaSim('Confirma Alteração da Senha?', 'Nova Senha') then Exit;

  DM.qyLogin.Edit;
  DM.qyLogin['senha']:= codificaH(edNOVASENHA.Text, 0);
  DM.qyLogin.Post;
  ShowMessage('Senha alterada!');
  modalResult:= mrOK;

end;

procedure TfMudarSenha.FormCreate(Sender: TObject);
var
  nome: string;
begin
  imgSENHA.OnClick(nil);
  imgNOVA.OnClick(nil);

  lbUSU.Caption:= DM.qyLogin['descr'];
  nome:= DM.DBCON.ExecSQLScalar('select descr from tbpessoal where nr_ins = :cpf', [DM.qyLogin['cpf']]);
  if nome <> '' then lbNOME.Caption:= nome
  else lbNOME.Caption:= 'AGENTE NÃO LOCALIZADO!!! - ' + DM.qyLogin['cpf'];
end;

procedure TfMudarSenha.imgNOVAClick(Sender: TObject);
begin
   if imgNOVA.Tag = 0 then begin
     edNOVASENHA.PasswordChar:= '*';
     edCONFIRMA.PasswordChar:= '*';
     imgNOVA.Picture:= DM.imgMostra.Picture;
   end else begin
     edNOVASENHA.PasswordChar:= #0;
     edCONFIRMA.PasswordChar:= #0;
     imgNOVA.Picture:= DM.imgEsconde.Picture;
   end;
   imgNOVA.Tag:= 1 - imgNOVA.Tag;

end;

procedure TfMudarSenha.imgSENHAClick(Sender: TObject);
begin
   if imgSENHA.Tag = 0 then begin
     edSENHA.PasswordChar:= '*';
     imgSENHA.Picture:= DM.imgMostra.Picture;
   end else begin
     edSENHA.PasswordChar:= #0;
     imgSENHA.Picture:= DM.imgEsconde.Picture;
   end;
   imgSENHA.Tag:= 1 -imgSENHA.Tag;
end;

end.
