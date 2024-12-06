{
  * Usu�rio Administrador - C�digo 99 (Manualmente inserido, numera��o passa a contar ap�s este valor)
  * Criado uma Unidade Interna(Sistema) - C�digo 0(zero)
  -> Ativo definido como 2 para sair do filtro SQL
  11/04/2023 - Primeiro Recebimento (Projeto Aprovado!!!!!)
  12/04/2023 - Criado sistemas b�sico de backup no servidor (de hora em hora)
  - Log de entrada e sa�da do sistema com UUID(hash) e Computador(hash)
  >>>>>>       - MODO DESENVOLVEDOR (base de dados DEV) <<<<< LEMBRAR <<<<<<<<<<<
  13/04/2023 -
  - Verificar Cadastro de Usu�rios
  Inclus�o e Altera��o com verifica��o de senha.
  N�veis de usu�rio, autoriza��es
  >>>>>>         EXCLUS�O est� desativada
  >>>>>>       - (VERIFICAR) no c�digo-fonte para verificar depois o c�digo ????
  26/04/2023 - DT INC, EXC e ALT COM DATA E HORA (HORA PASSOU A SER INCLUIDA)  < n�o deu certo
  28/04/2023 - Desenvolvimento da Planilha de Contratos
}

unit modFuncoes;

interface

uses SysUtils, Messages, Forms, Controls, Windows, DateUtils, StrUtils,
  Vcl.Dialogs,
  MaskUtils, Classes, Graphics;

type
  TtipoLog = (logIncluido, logAlterado, logExcluido, logRetornado, logAberto,
    logEmConta, logReaberto, logEfetivado, logEstornado, logEntregue,
    logDevolvido, lotAltLote);


  TMesAno = record
    Mes: Integer;
    Ano: Integer;
    constructor Create(Data: TDate);
    function proxMes: TMesAno;
    function mesAnt: TMesAno;
    function priDia: TDate;
    function ultDia: TDate;
  end;

  TCNAB = record
    var
      st: string[240];
      _tam: array of integer;
      _pos: array of integer;
      _qtcol: integer;
      _sttam, _stpos: string;
    constructor Create(tam: array of integer);
    procedure grava(pos: integer; valor: ansistring);
  end;

  TSituacao = (sitInativo, sitAtivo, sitPendente, sitBaixado);

const
  {
  //tabela de localiza��o do inversor 8 x10
  TLOCAL: array[1..8] of string = ('0123456789',
                                   '1576283094',
                                   '5803796142',
                                   '8916043527',
                                   '9453126870',
                                   '4286573901',
                                   '2793806415',
                                   '7046913258');

  //tabela do �ndice de invers�o 10 x 10
  TINVER: array[1..10] of string = ('0123456789',
                                    '1234067895',
                                    '2340178956',
                                    '3401289567',
                                    '4012395678',
                                    '5987604321',
                                    '6598710432',
                                    '7659821043',
                                    '8765932104',
                                    '9876543210');

  TDIVER = '0432156789'; //tabela do d�gito verificador 1 x 10
  }

  tagENABLED = 0;
  tagDISABLED = 99;

  msgIncNaoPermitida = 'Inclus�o N�O permitida!';
  msgAltNaoPermitida = 'Altera��o N�O permitida!';
  msgExcNaoPermitida = 'Exclus�o N�O permitida!';

  cMESES: array [1 .. 12] of string = ('Janeiro', 'Fevereiro', 'Mar�o', 'Abril',
    'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro',
    'Dezembro');
  cTiposConta: array [0 .. 2] of string = ('(CAIXA)', 'Conta Corrente',
    'Investimento');
  TudoPermitido = 'TUDO';
  TagOK = 1001;
  // RET = Retornado da Exclusao
  // REA = reAgendado

  Situacao: array [0 .. ord(High(TSituacao))] of string = ('INATIVO', 'ATIVO', 'PENDENTE', 'BAIXADO');

  tipoLog: array [0 .. ord(High(TtipoLog))] of string = ('INC', 'ALT', 'EXC',
    'RET', 'AGE', 'EMC', 'REA', 'EFE', 'EST', 'ETG', 'DEV', 'A99');

  // wModoDev = 0; //Modo Desenvolvedor > 0
  wUsuarioAdm = 99;
  wUnidadeSis = 0;

  WM_ACAO = WM_USER + 10; // Message
  wpModo = 1; // wParam
  wpConfirma = 2; // wParam
  wpGenerico = 3; // wParam
  wpExportar = 4; // wParam
  wpFechar = 99; // wParam

  wLOGEN = 10; // LOG de ENtrada
  wLOGSA = 20; // LOG de SA�da
  wLOGUP = 30; // LOG de SA�da com UPDATE
  wLOGDS = 99; // LOG de Sa�da para Entrar como DESENVOLVEDOR
  wLOGERR = 50; // Saida Inesperada - Erro

  kModo: array [1 .. 4] of string = ('Inclus�o', 'Altera��o', 'Exclus�o',
    'Navega��o');
  modoInc = 1;
  modoAlt = 2;
  modoExc = 3;
  modoNav = 4;

  kNovoId = '(AUTOM)';
  kENTER = #13;

  kMsgInc = 'Confirmar +INCLUS�O+ deste Registro?';
  kMsgAlt = 'Confirmar Altera��o deste Registro?';
  kMsgExc = 'Confirmar ---EXCLUS�O---  deste Registro?';
  kMsgExcCtz = 'Tem CERTEZA que dejesa ---EXCLUIR--- este Registro?';
  kJaCad = 'Este(a) "%s" j� est� cadastrado.';
  kNaoLoc = 'Este(a) "%s" n�o foi localizado.';
  kCadas = 'Este(a) "%s" n�o existe. Deseja cadastr�-lo(a)?';
  kPreen = 'Voc� deve preencher o campo "%s" corretamente.';

  comAcento = '�`^~���������������������������������';
  semAcento = '     aaaeouaoaeioucueAAAEOUAOAEIOUCUE';

  kPSESQ = 0;
  kPSDIR = 1;
  kPSCEN = 2;

  corValorC = clBlue;
  corValorD = clRed;
  corValorN = clBlack;

  cNTCRE = 'C';
  cNTDEB = 'D';
  cNTNEU = 'N';
  cDSCRE = 'CR�DITO';
  cDSDEB = 'D�BITO';
  cDSNAT = 'NATUREZA';

  // cSitInativo = 0;
  // cSitAtivo = 1;
  // cSitSistema = 2;
  // cSitExcluido = 9;

  // cSTINI = 'N'; //Normal
  // cSTFIM = 'F';
  cSTPEN = 'P'; // Pendente/Em aberto/Tempor�rio
  cSTNOR = 'N'; // Normalizado
  cSTINA = 'I'; // Inativo????? 16/10/23 - Pl. de Movimento e de Contratos
  cSTFIN = 'F'; // Finalizado??? 25/10/23 - ATEN��O: S� na Planilha Contratos!!!!!
  // cSTOCU = 'O'; //Oculto
  // cSTTMP = 'T'; //Temporario
  cSTEXC = 'X'; // Exclu�do
  cSTEXC2 = 'Y'; // Excluido For�ado
  cSTALT = 'A'; //Alterado
  cSTESTORN = 'S'; //Estornado
  cSTEMC = 'C'; //Em Conta
  cSTREAG = 'R'; //Reaberto(Reagendado)
  cSTLIQ = 'L'; //Liquidado
  cSTENTREG = 'E'; //Entrega de Documento
  cSTDEV = 'D'; //Devolu��o de Documento/Entrega Errada
  cSTESTOQMOV = 'M'; //Estoque movido

  cMovAgendado = 'A'; // (A)gendado
  cMovEmConta = 'C';  // Em (C)onta - Para Movimento que entrou em Agendamento na Conta e ainda n�o foi Liquidado
  cMovLiquidado = 'L'; // (L)iquidado
  cCtrAberto = 'A'; // (A)berto    - N�o Usado  - 25/10/23
  cCtrFechado = 'F'; // (F)echado  - N�o Usado  - 25/10/23
  cCtrInativo = 'I'; // (I)nativo  - N�o Usado  - 25/10/23

  {
  cTPAQU = 'A'; // Opera��o de Aquisi��o
  cTPSAI = 'B'; // Opera��o de Transfer�ncia - Origem
  cTPORI = 'B'; // Opera��o de Transfer�ncia - Origem
  cTPENT = 'C'; // Opera��o de Transfer�ncia - Destino
  cTPDST = 'C'; // Opera��o de Transfer�ncia - Destino
  cTPMAN = 'D'; // Manuten��o (UPKEEP)
  }
  // cTPPAG = '4';  //Contas a Pagar
  cTipoAvulso = 'A'; // Movimento Avulso
  cTipoContrato = 'C'; // Gerado por Contrato   // 02/05/2023
  cTipoParcela = 'P'; // Gerado por Parcelas    // 04/08/2023

  cTipoCPF = 0;
  cTipoCNPJ = 1;

  cTipoCC = 'CC'; // Conta Corrente
  cTipoCP = 'P'; // Poupan�a

  flagPARCELA = '%PARCELA';

  cTipoAgente = 0; // Agente
  cTipoFornecedor = 1; // Fornecedor

  cNALOC = '(N�O LOCALIZADO)';
  mskCPF = '999.999.999-99;0;_';
  mskCNPJ = '99.999.999/9999-99;0;_';
  maskCPF = '###.###.###-##';
  maskCNPJ = '##.###.###/####-##';
  mskEVENTO = '9.99.99.99;0;_';
  // mskFONE = '(00) 00000-0000;0;_';
  mskAGENCIA = '9999-a;0;_';
  // mskCONTA = '999;0;_';
  // mskCATEG = '9.99.99;0;_';
  mskCODPT = '9999.99;0;_';

  setConta = ['0' .. '9', 'X', 'x', #8]; // #8 = Backspace
  setNum = ['0' .. '9', #8]; // #8 = Backspace

  cBB = '001';
  cCAIXA = '104';
  cBRAD = '237';

  strINATIVO = ' (INATIVO)';

  MB_QUESTAO = MB_YESNO + MB_ICONQUESTION;
  MB_QUESTAO_NAO = MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2;

var

  corMovLiquidado: TColor; // = TColor($32CD32);
  corMovEmconta: TColor; // = TColor($00CCDD);
  corMovAgendado: TColor; // = TColor($6783FF);
  corDocEntregue: TColor; // = TColor($6783FF);
  corUltMov: TColor;

  wTickStart: Cardinal;
  wTickStop1, wTickStop2, wTickStop3: Cardinal;
  wModoDepuracao: Boolean;
  wVersao: String; // Vers�o do Aplicativo
  wDtLanc: String; // Data de Lan�amento
  wModoDev: Integer;
  wBDLOCAL: Boolean;
  wUsuario: Integer; // id usuario atual logado
  wTudoPermitido: Boolean;
  wLOGID: Integer;
  wHashLog: Integer; // UUID hascode do log atual
  wModo: Integer;
  dia_semana: array [1 .. 7] of string;

  // procedure ativaSender(Sender: TObject; Value:Boolean);

function Codifica(const Str1: string): String;
function CodificaH(const St: String; const Tp: Byte): String;

function MsgBox(sMen, sCap: String; iFlag: Integer = 0): Integer;
procedure MsgErro(const sMen: String);
procedure MsgPreen(const sCampo: String);
procedure MsgDepuracao(const sMen: String);
function perguntaSim(const sMen, sCap: String): Boolean;
function perguntaNao(const sMen, sCap: String): Boolean;
procedure MudaModo(novoModo: Integer);

//function diaUtil(Data: TDate): TDate;
function Mask(Mascara, Str: string): string;
function checaNRINS(Numero: String; Tipo: Integer): Boolean;

function Verhoeff(cod: String): string;
function dvConta(Num: String; Banco: String): string;
function dvAgencia(Num: String; Banco: String): string;
function checaConta(Num: String; Banco: String): Boolean;
function checaAgencia(Num: String; Banco: String): Boolean;

function formataData(Data: TDate): String;
function formataNrConta(const St: string): String;
function formataNrDoc(const St: string): String;
function formataCPF(St: string): string;
function formataCNPJ(St: string): string;
function formataNRINS(St: string; Tp: Integer): string;
function formataAgencia(const St: string): string;
function formataValor(const vl: Double): String;
function formataValorDC(const vl: Double): String;
function formataFone(Fone: String): String;
function formataMesAno(dt: string): string;
function dataSQL(Data: TDate): String;

function soNumero(txt: String; ch1: char = '0'; ch2: char = '9'): string;
function soNumeroAlpha(txt: String; ch1: char = '0'; ch2: char = '9'): string;
function soNumeroX(txt: String): string;

procedure ProxFocus;
function EncheSt(const s: String; const c: char;
  const tam, pos: Integer): String;
function removeAcento(const St: string): string;

function getPcName(): string;

procedure AtivaTags(comp: array of TComponent);
procedure DESAtivaTags(comp: array of TComponent);

function appdir(St: string): string;

function calcMeses(dtini: TDate; dtfim: TDate): Integer;

procedure startTickCount;
function stopTickCount: Cardinal;


function strToValor(str: string): Extended;

implementation

function strToValor(str: string): Extended;
begin
  str:= stringreplace(str, '-', '0', [rfIgnoreCase, rfReplaceAll]);
  str:= stringreplace(str, '.', '', [rfIgnoreCase, rfReplaceAll]);
  result:= strtofloatdef(str, 0);
end;

procedure startTickCount;
begin
  wTickStart:= GetTickCount;
end;

function stopTickCount: Cardinal;
begin
  result:= GetTickCount - wTickStart;
end;

function dataSQL(Data: TDate): String;
begin
  Result := FormatDateTime('yyyy-mm-dd', Data);
end;

function formataMesAno(dt: string): string;
begin
  if dt.Length >= 4 then
    Result := dt
    // else if dt.Length = 9 then result:= dt
  else
  begin
    Result := leftstr(cMESES[strtoint(leftstr(dt, 2))], 3) + '/' +
      rightstr(dt, 4);
  end;
end;

function removeAcento(const St: string): string;
var
  i: Integer;
  n: Integer;
begin
  Result := St;
  for i := 1 to St.Length do begin
    n := pos(St[i], comAcento);
    if n > 0 then
      Result[i] := semAcento[n];
  end;
end;

function calcMeses(dtini: TDate; dtfim: TDate): Integer;
var
  aI, mI, dI, aF, mF, dF: word;
  aD, mD: Integer;
begin
  DecodeDate(dtini, aI, mI, dI);
  DecodeDate(dtfim, aF, mF, dF);

  aD := aF - aI;
  mD := mF - mI;
  Result := (aD * 12) + mD;

end;

procedure ativaSender(Sender: TObject; Value: Boolean);
begin
  // TWinControl(Sender).TabStop:= Value;
  // TCustomEdit(Sender).ReadOnly:= not Value;

end;

function formataValor(const vl: Double): String;
begin
  Result := formatfloat(',0.00', vl);
end;

function formataValorDC(const vl: Double): String;
begin
  Result := formatfloat(',0.00 C;,0.00 D', vl);
end;

function formataAgencia(const St: string): string;
begin
  Result := soNumeroX(St);
  if Result.Length = 5 then
    Result := FormatMaskText(mskAGENCIA, Result);

end;

function formataFone(Fone: String): String;
var
  sTel: String;
  iDigitos: Integer;
begin
  // Obs: mascara prev� tratamento apenas para n�meros brasileiros
  // Obs2: Esta fun��o n�o leva em conta o c�digo do pa�s (Ex: 55, ou +55)

  sTel := soNumero(Fone);
  // Remove qualquer formata��o que o usu�rio possa ter colocado.
  Result := '';
  if sTel <> '' then
  begin
    iDigitos := Length(sTel);
    // Formata de acordo com a quantidade de n�meros encontrados.
    case iDigitos of
      8:
        Result := FormatMaskText('9999-9999;0;_', sTel);
        // 8 digitos SEM DDD (ex: 34552318)
      9:
        Result := FormatMaskText('99999-9999;0;_', sTel);
        // 9 digitos SEM DDD (ex: 991916889)
      10:
        Result := FormatMaskText('(99) 9999-9999;0;_', sTel);
        // 8 Digitos (convencional, ex: 7734552318)
      11:
        Result := FormatMaskText('(99) 99999-9999;0;_', sTel);
        // 9 Digitos (novos n�meros, ex: 77991916889)
    else
      Result := sTel; // Mant�m na forma que o usu�rio digitou
    end;
  end;
end;

function formataNRINS(St: string; Tp: Integer): string;
begin
  if Tp = cTipoCPF then
    Result := FormatMaskText(mskCPF, St)
  else
    Result := FormatMaskText(mskCNPJ, St);
end;

function appdir(St: string): string;
begin
  Result := extractfilepath(application.ExeName) + St;
end;

procedure AtivaTags(comp: array of TComponent);
var
  i: Integer;
begin
  for i := 0 to High(comp) do
    comp[i].Tag := 0;
end;

procedure DESAtivaTags(comp: array of TComponent);
var
  i: Integer;
begin
  for i := 0 to High(comp) do
    comp[i].Tag := 1;
end;

function formataCPF(St: string): string;
begin
  result:= Mask(maskCPF, sonumero(st));
end;

function formataCNPJ(St: string): string;
begin
  Result := Mask(maskCNPJ, st);

end;

function getPcName(): string;
var
  ComputerName: Array [0 .. 256] of char;
  Size: DWORD;
begin
  Size := 256;
  GetComputerName(ComputerName, Size);
  Result := ComputerName;
end;

function dvConta(Num: String; Banco: String): string;
var
  St: string;
  dv: string;
  i: Integer;
  soma: Integer;
  mod11: Integer;
begin
  //numero deve vir com o(ou algum) dig. verificador
  result:= rightstr(num, 1);

  if Banco = cBB then begin
    // 9 digitos com o DV, s� os 8 da esquerdas s�o usados
    St := leftstr(EncheSt(Num, '0', 9, kPSESQ), 8);
    soma := 0;
    for i := 1 to 8 do
      soma := soma + strtoint(St[i]) * (10 - i);

    mod11 := 11 - (soma mod 11);
    if mod11 = 10 then
      dv := 'X'
    else if mod11 = 11 then
      dv := '0'
    else
      dv := inttostr(mod11);

    Result := dv;
  end;
end;

function Verhoeff(cod: String): string;
const
  {tabela de localiza��o do inversor 8 x10}
  TLOCAL: array[1..8] of string = ('0123456789',
                                   '1576283094',
                                   '5803796142',
                                   '8916043527',
                                   '9453126870',
                                   '4286573901',
                                   '2793806415',
                                   '7046913258');

  {tabela do �ndice de invers�o 10 x 10}
  TINVER: array[1..10] of string = ('0123456789',
                                    '1234067895',
                                    '2340178956',
                                    '3401289567',
                                    '4012395678',
                                    '5987604321',
                                    '6598710432',
                                    '7659821043',
                                    '8765932104',
                                    '9876543210');

  TDIVER = '0432156789'; {tabela do d�gito verificador 1 x 10}
var {defini��o das vari�veis de auxilio � obten��o do d�gito verificador}
    i, pos : integer;
    iloc : integer; {�ndice de localiza��o}
    iver : integer; {�ndice verificador}
    codinv: string ;//conjunto[0..Tamanho(C�DIGO)] decadeia {c�digo invertido}

begin
  {trecho de algoritmo para invers�o doc�digo de identifica��o}
  codinv:= '';
  for i:= 1 to cod.Length do begin
    codinv:= codinv + cod[cod.Length+1-i];
  end;

  {trecho de algoritmo para obten��o ded�gito verificador}
  iver:= 1;
//  para I de 0 at� Tamanho(C�DINV) � 1 passo 1
  for i := 1 to codinv.Length do begin
//    pos:= i;
    pos:= (i mod 8) + 1;
    iloc:= strtoint(TLOCAL[pos][strtoint(codinv[i])+1])+1;//, CarParaNum(C�DINV[I])]
    iver:= strtoint(TINVER[iver][iloc])+1;
  end;
  result:= TDIVER[iver];
end;

function dvAgencia(Num: String; Banco: String): string;
var
  St: string;
  dv: string;
  i: Integer;
  soma: Integer;
  mod11: Integer;
begin
  //numero deve vir com o(ou algum) dig. verificador
  result:= rightstr(num, 1);
  if Banco = cBB then begin
    // 5 digitos com o DV, s� os 4 da esquerda s�o usados
    St := leftstr(EncheSt(Num, '0', 5, kPSESQ), 4);
    soma := 0;
    for i := 1 to 4 do
      soma := soma + strtoint(St[i]) * (6 - i);

    mod11 := 11 - (soma mod 11);
    if mod11 = 10 then
      dv := 'X'
    else if mod11 = 11 then
      dv := '0'
    else
      dv := inttostr(mod11);

    Result := dv;

  end;
end;

function checaConta(Num: String; Banco: String): Boolean;
begin
  Result := (rightstr(num,1) = dvConta(num, banco));
end;

function checaAgencia(Num: String; Banco: String): Boolean;
begin

  Result := (rightstr(num,1) = dvAgencia(num, banco));
end;

function formataNrConta(const St: string): String;
var
  res: string;
  t: Integer;
  i: Integer;
  p: Integer;
begin
  t := Length(St);
  if t <= 2 then
    exit(St);

  if t = 3 then
    exit(FormatMaskText('99-a;0;_', St));
  if t = 4 then
    exit(FormatMaskText('999-a;0;_', St));

  res := '-' + St[t];
  p := 0;
  for i := Length(St) - 1 downto 2 do
  begin
    res := St[i] + res;
    inc(p);
    if p = 3 then
    begin
      res := '.' + res;
      p := 0;
    end;

  end;
  res := St[1] + res;

  Result := res;

end;

function formataNrDoc(const St: string): String;
var
  p, i: Integer;
begin
  if St.Length > 3 then
  begin
    Result := '';
    p := 0;
    for i := St.Length downto 2 do
    begin
      Result := St[i] + Result;
      inc(p);
      if p = 3 then
      begin
        Result := '.' + Result;
        p := 0;
      end;
    end;
    Result := St[1] + Result;
  end
  else
  begin
    Result := copy(St, St.Length - 2, 3);
  end;
end;

function EncheSt(const s: String; const c: char;
  const tam, pos: Integer): String;
var
  r: String;
begin
  r := s;
  if Length(s) < tam then
  begin
    case pos of
      kPSDIR:
        r := s + StringOfChar(c, tam - Length(s));
      kPSESQ:
        r := StringOfChar(c, tam - Length(s)) + s;
      kPSCEN:
        r := s;
    end; { case }
  end; { if }
  Result := r;
end; { EncheSt }

function soNumeroX(txt: String): string;
begin
  Result := soNumero(txt, 'X', 'x');
end;

function soNumero(txt: String; ch1: char = '0'; ch2: char = '9'): string;
var
  res: string;
  pos: Integer;
begin
  res := '';
  if Length(txt) = 0 then
    exit('');

  for pos := 1 to Length(txt) do
  begin

    if charinset(txt[pos], ['0' .. '9', ch1, ch2]) then
      res := res + txt[pos];
  end;

  Result := res;
end;

function soNumeroAlpha(txt: String; ch1: char = '0'; ch2: char = '9'): string;
var
  res: string;
  pos: Integer;
begin
  res := '';
  if Length(txt) = 0 then
    exit('');

  for pos := 1 to Length(txt) do
  begin

    if charinset(txt[pos], ['0' .. '9', 'a'..'z', 'A'..'Z', ch1, ch2]) then
      res := res + txt[pos];
  end;

  Result := res;
end;

procedure ProxFocus;
begin
  // Sender.Perform(WM_NEXTDLGCTL, 0, 0);
  // Sender.Perform(WM_NEXTDLGCTL, 0, 0);
  SendMessage(application.ActiveFormHandle, WM_NEXTDLGCTL, 0, 0);
end; { ProxFocus }


{
function diaUtil(Data: TDate): TDate;
begin
  if DayOfWeek(Data) = 7 then
    Data := Data + 2
  else if DayOfWeek(Data) = 1 then
    Data := Data + 1;
  diaUtil := Data;

end;
}

procedure MudaModo(novoModo: Integer);
begin
  SendMessage(application.MainForm.Handle, WM_ACAO, wpModo, novoModo);
end;

function Codifica(const Str1: string): String;
{ Encripta uma string }
const
  Mascara = '#$%$'#13#12;
var
  Str2: String;
  PonM, PonS: Byte;
begin
  Str2 := '';
  PonM := 1;
  for PonS := 1 to Length(Str1) do
  begin
    Str2 := Str2 + Chr(ord(Str1[PonS]) Xor ord(Mascara[PonM]));
    inc(PonM);
    if PonM > Length(Mascara) then
      PonM := 1;
    Result := Str2;
  end; { for }
end;

function CodificaH(const St: String; const Tp: Byte): String;
var
  St2, sHx: String;
  i, q: Integer;
begin
  Result := '';
  if St = '' then
    exit;
  if Tp = 0 then begin // Encripta
    St2 := Codifica(St);
    sHx := '';
    for i := 1 to Length(St2) do
      sHx := IntToHex(ord(St2[i]), 2) + sHx;
    St2 := sHx;
  end else begin // Decripta
    q := Length(St);
    if (q mod 2) > 0 then begin
      Result := '***LGT' + inttostr(q) + '***';
      exit;
    end; { if }
    St2 := '';
    for i := 1 to (q div 2) do
      St2 := Chr(strtoint('$' + copy(St, (i * 2 - 1), 2))) + St2;
    St2 := Codifica(St2);
  end; { if }
  Result := St2;
end;

/// ////////////// Mensagens
function MsgBox(sMen, sCap: String; iFlag: Integer = 0): Integer;
begin
  Screen.Cursor := crDefault;
  Result := application.MessageBox(PWideChar(sMen), PWideChar(sCap), iFlag);
end; { MsgBox }

procedure MsgErro(const sMen: String);
begin
  MsgBox(sMen, 'Aten��o', MB_OK + MB_ICONWARNING);
end; { MsgErro }

procedure MsgDepuracao(const sMen: String);
begin
  MsgBox(sMen, 'Modo Depura��o Ativado', MB_OK);
end; { MsgDepuracao }

procedure MsgPreen(const sCampo: String);
begin
  MsgErro(Format(kPreen, [sCampo]));;
end; { MsgErro }

function perguntaSim(const sMen, sCap: String): Boolean;
begin
  Result := MsgBox(sMen, sCap, MB_YESNO + MB_ICONQUESTION) = ID_YES;
end; { MsgErro }

function perguntaNao(const sMen, sCap: String): Boolean;
begin
  Result := MsgBox(sMen, sCap, MB_YESNO + MB_ICONQUESTION +
    MB_DEFBUTTON2) = ID_YES;
end; { MsgErro }
/// ////////////// Fim Mensagens

function Mask(Mascara, Str: string): string;
var
  x, p: Integer;
begin
  p := 0;
  Result := '';

  if Str.IsEmpty then
    exit;

  for x := 0 to Length(Mascara) - 1 do
  begin
    if Mascara.Chars[x] = '#' then
    begin
      Result := Result + Str.Chars[p];
      inc(p);
    end
    else
      Result := Result + Mascara.Chars[x];

    if p = Length(Str) then
      break;
  end;
end;

function checaNRINS(Numero: String; Tipo: Integer): Boolean;
var
  DgI, Num, DgC, Nm: String;
  Ps, Mu, Sm: Integer;
  MuFin: Integer;
begin
  MuFin := 0; // iif(cTP = kTPCPF, 0, 2);
  if Tipo <> cTipoCPF then
    MuFin := 2;

  DgI := rightstr(Numero, 2);
  Num := leftstr(Numero, Length(Numero) - 2);
  DgC := '';
  while Length(DgC) < Length(DgI) do
  begin
    Mu := 9;
    Sm := 0;
    Nm := Num + DgC;
    for Ps := Length(Nm) downto 1 do
    begin
      Sm := Sm + strtoint(Nm[Ps]) * Mu;
      if Mu = MuFin then
        Mu := 9
      else
        Mu := Mu - 1;
    end; { for }
    if (Sm mod 11) > 9 then
      DgC := DgC + '0'
    else
      DgC := DgC + inttostr(Sm Mod 11);

  end; { while }
  // ShowMessage(DgC);
  Result := (DgI = DgC);
end; { CalcDV }

function formataData(Data: TDate): string;
begin
  Result := FormatDateTime('dd/mm/yyyy', Data);
end;

{ TMesAno }

constructor TMesAno.Create(Data: TDate);
begin
  Mes := MonthOf(Data);
  Ano := YearOf(Data);
end;

function TMesAno.mesAnt: TMesAno;
begin
  if Mes = 1 then
  begin
    Result.Mes := 12;
    Result.Ano := Ano - 1;
  end
  else
  begin
    Result.Mes := Mes - 1;
    Result.Ano := Ano;
  end;

end;

function TMesAno.priDia: TDate;
begin
  Result := EncodeDate(Ano, Mes, 1);
end;

function TMesAno.proxMes: TMesAno;
begin
  if Mes = 12 then
  begin
    Result.Mes := 1;
    Result.Ano := Ano + 1;
  end
  else
  begin
    Result.Mes := Mes + 1;
    Result.Ano := Ano;
  end;
end;

function TMesAno.ultDia: TDate;
var
  pAno, pMes: Integer;
begin
  pAno := proxMes.Ano;
  pMes := proxMes.Mes;
  Result := EncodeDate(pAno, pMes, 1) - 1;
end;

{ TCNAB }

constructor TCNAB.Create(tam: array of integer);
var
  qt, i: integer;
  posini: integer;
  tottam: integer;
begin
  st:= stringofchar('0',240);
  //for i := 1 to 240 do st[i]:= '1';

  //vai iniciar do 1 (mas existe o 0)
  qt:= high(tam)+1;
  setlength(_pos, qt+1);
  setlength(_tam, qt+1);
  posini:= 1; //strings come�am na posi��o 0
  tottam:= 0;
  _qtcol:= qt;
  for i := 0 to qt-1 do begin
    _tam[i+1]:= tam[i];
    _sttam:= _sttam + inttostr(_tam[i+1]) + ',';
    _pos[i+1]:= posini;
    _stpos:= _stpos + inttostr(_pos[i+1]) + ',';
    posini:= posini + tam[i];
    tottam:= tottam + tam[i];
  end;
  //_pos[qt]:= posini;
  if tottam <> 240 then
    raise Exception.Create('Diferente de 240 caracteres>>> ' + inttostr(tottam));
end;

procedure TCNAB.grava(pos: integer; valor: ansistring);
var
  i: integer;
begin
  if length(valor) < _tam[pos] then
    raise Exception.Create('Campo menor que esperado: ' + inttostr(length(valor)) + '/' + inttostr(_tam[pos]));

  for I := _pos[pos] to _pos[pos]+_tam[pos]-1 do begin
    st[i]:= valor[i-_pos[pos]+1];
  end;
end;

end.
