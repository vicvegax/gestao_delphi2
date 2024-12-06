unit calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfCalc = class(TForm)
    sevenButton: TButton;
    eightButton: TButton;
    nineButton: TButton;
    fourButton: TButton;
    fiveButton: TButton;
    sixButton: TButton;
    oneButton: TButton;
    twoButton: TButton;
    threeButton: TButton;
    zeroButton: TButton;
    decimalButton: TButton;
    signButton: TButton;
    equalsButton: TButton;
    plusButton: TButton;
    minusButton: TButton;
    multButton: TButton;
    divButton: TButton;
    clearButton: TButton;
    backButton: TButton;
    screen: TEdit;
    procedure numberButtonClick(Sender: TObject);
    procedure plusButtonClick(Sender: TObject);
    procedure minusButtonClick(Sender: TObject);
    procedure multButtonClick(Sender: TObject);
    procedure divButtonClick(Sender: TObject);
    procedure equalsButtonClick(Sender: TObject);
    procedure clearButtonClick(Sender: TObject);
    procedure backButtonClick(Sender: TObject);
    procedure signButtonClick(Sender: TObject);
    procedure decimalButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCalc: TfCalc;
  first: Double;
  second: Double;
  currentOperation: Integer; { * -1=equal or clear
    0=nothing
    1=addition
    2=subtraction
    3=multiplication
    4=division * }

implementation

{$R *.dfm}

procedure calculate;
begin
  if first <> 0 then
  begin
    second := StrToFloat(fCalc.screen.Text);

    case currentOperation of
      1:
        first := first + second;
      2:
        first := first - second;
      3:
        first := first * second;
      4:
        first := first / second;
    end;

  end
  else
  begin
    first := StrToFloat(fCalc.screen.Text);
  end;

end;

procedure TfCalc.backButtonClick(Sender: TObject);
begin
  screen.Text := Copy(screen.Text, 1, Length(screen.Text) - 1);
end;

procedure TfCalc.clearButtonClick(Sender: TObject);
begin
  first := 0;
  second := 0;
  currentOperation := -1;
  screen.Text := '';
end;

procedure TfCalc.decimalButtonClick(Sender: TObject);
begin
  if currentOperation < 0 then
  begin
    screen.Text := '';
    currentOperation := 0;
  end;

  if screen.Text = '' then
  begin
    screen.Text := '0.';
  end
  else if Pos('.', screen.Text) = 0 then
  begin
    screen.Text := screen.Text + '.';
  end;
end;

procedure TfCalc.divButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 4;
  screen.Text := '';
end;

procedure TfCalc.equalsButtonClick(Sender: TObject);
begin
  calculate;
  screen.Text := FloatToStr(first);
  first := 0;
  second := 0;
  currentOperation := -1;
end;

procedure TfCalc.minusButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 2;
  screen.Text := '';
end;

procedure TfCalc.plusButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 1;
  screen.Text := '';
end;

procedure TfCalc.signButtonClick(Sender: TObject);
begin
  if screen.Text[1] = '-' then
  begin
    screen.Text := Copy(screen.Text, 2, Length(screen.Text));
  end
  else
  begin
    screen.Text := '-' + screen.Text;
  end;
end;

procedure TfCalc.multButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 3;
  screen.Text := '';
end;

procedure TfCalc.numberButtonClick(Sender: TObject);
begin
  if currentOperation < 0 then
  begin
    screen.Text := '';
    currentOperation := 0;
  end;
  screen.Text := screen.Text + TButton(Sender).Caption;
end;

end.
