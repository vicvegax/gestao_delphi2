unit importAgente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids, StrUtils,
  Vcl.Buttons;

type
  TfImportAgente = class(TForm)
    Button1: TButton;
    dlgA: TOpenDialog;
    Memo1: TMemo;
    dsA: TDataSource;
    grA: TDBGrid;
    btCancelar: TBitBtn;
    Memo2: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImportAgente: TfImportAgente;

implementation

{$R *.dfm}

uses modDados, modFuncoes;

procedure TfImportAgente.Button1Click(Sender: TObject);
var
  csv, parse: TStringList;
  st, cod, descr: string;
  stJ: String;
//  stTPC, stCNT, stAGE: String;
  i, j: integer;
  tbA: TFDMemTable;

  qtUniI, qtPesI: integer;
  qtUniA, qtPesA: integer;
begin

  if dlgA.Execute() then
  begin
    tbA := TFDMemTable.Create(Self);
    // tbA.FieldDefs.Clear;
    parse := TStringList.Create;
    parse.StrictDelimiter := true;
    parse.Delimiter := ';';
    for i := 0 to Memo1.Lines.Count - 1 do
    begin
      parse.DelimitedText := Memo1.Lines[i];
      j:= strtoint(parse[1]);
      tbA.FieldDefs.Add(parse[0], ftString, j);
    end;

    tbA.CreateDataSet;
    for i := 0 to Memo1.Lines.Count - 1 do
    begin
      parse.DelimitedText := Memo1.Lines[i];
      tbA.FieldByName(parse[0]).DisplayLabel := parse[2];
    end;
    tbA.Open;

    csv := TStringList.Create;
    csv.LoadFromFile(dlgA.FileName);
    st := csv[0];
    parse.DelimitedText := st;
    for i := 0 to parse.Count - 1 do begin
      for j := 0 to tbA.FieldCount - 1 do begin
        st := tbA.Fields[j].DisplayLabel;
        if st = parse[i] then begin
          tbA.Fields[j].Tag := i + 1;
        end;
      end;
    end;

    if (tbA.FieldByName('ativo').Tag = 0) or (tbA.FieldByName('nrins').Tag = 0)
      or (tbA.FieldByName('agatu').Tag = 0) or
      (tbA.FieldByName('descr').Tag = 0) or (tbA.FieldByName('cod').Tag = 0)
    then begin
      csv.Free;
      parse.Free;
      tbA.Close;
      freeandnil(tbA);
      MsgErro('Arquivo CSV não é valido! Ele deve conter: '#13#10 +
        Memo2.Lines.Text);
      exit;
    end;

    tbA.DisableControls;
    for i := 1 to csv.Count - 1 do begin
      parse.DelimitedText := csv[i];
      tbA.Append;
      tbA.FieldByName('agatu').AsString := '';
      for j := 0 to tbA.FieldCount - 1 do begin
        if tbA.Fields[j].Tag > 0 then
          tbA.Fields[j].AsVariant := parse[tbA.Fields[j].Tag - 1];
      end;

      st := tbA.FieldByName('agatu').AsString;
      if st <> '' then begin
        cod := '';
        j := 1;
        while true do begin
          if st[j] = '-' then
            break;
          if st[j] <> ' ' then
            cod := cod + st[j];
          inc(j);
        end;
        cod := rightstr('0000' + cod, 4);
        descr := rightstr(st, st.Length - j - 1);
      end;
      tbA.FieldByName('nrins').AsString := soNumero(tbA.FieldByName('nrins').AsString);
      tbA.FieldByName('fone1').AsString := soNumero(tbA.FieldByName('fone1').AsString);
      tbA.FieldByName('fone2').AsString := soNumero(tbA.FieldByName('fone2').AsString);
      //tbA.FieldByName('agencia').AsString := soNumeroX(tbA.FieldByName('agencia').AsString);
      //tbA['agencia'] := soNumeroX(tbA.FieldByName('agencia').AsString);
      //tbA['agencia']:= tbA['agencia'] + '-' + dvAgencia(tbA['agencia'], cBB);
      st:= soNumeroX(tbA['agencia']);
      st:= enchest(st, '0', 5, kPSESQ);
      tbA['agencia']:= leftstr(st, st.Length-1) + dvAgencia(st, cBB);

      tbA.FieldByName('conta').AsString := soNumeroX(tbA.FieldByName('conta').AsString);
      //tbA.FieldByName('tpconta').AsString := '0';
      if tbA.FieldByName('tpconta').AsString = 'CC' then tbA.FieldByName('tpconta').AsString := '1'
      else if tbA.FieldByName('tpconta').AsString = 'P' then tbA.FieldByName('tpconta').AsString := '2'
      else tbA.FieldByName('tpconta').AsString := '0';

      if tbA.FieldByName('ativo').AsString = 'INATIVO' then
        tbA.FieldByName('ativo').AsString := '0'
      else
        tbA.FieldByName('ativo').AsString := '1';

      tbA.FieldByName('cduni').AsString := cod;
      tbA.FieldByName('dsuni').AsString := descr;
      tbA.Post;
    end;
    tbA.First;
    tbA.EnableControls;
    csv.Free;
    parse.Free;
    dsA.DataSet := tbA;
    Application.ProcessMessages;
    if wUsuario <= 100 then
      if not PerguntaSim('Continuar?', 'Continuar') then exit;
    /// ////////////////////////////////////////////////////////////////////
    /// Início Alteração da Base de Dados
    ///
    /// /////////////////////////////////////////////////////////////////

    DM.qyUni.Open('SELECT * FROM tbunidades WHERE ativo >= 0');
    DM.qyPes.Filtered := False;
    DM.qyPes.IndexFieldNames := 'nr_ins';
    DM.qyPes.Open('SELECT * FROM tbpessoal WHERE ativo >= 0');
    DM.DBTRANS.StartTransaction;

    qtUniI := 0;
    qtPesI := 0;
    qtUniA := 0;
    qtPesA := 0;
    while not tbA.Eof do begin
      tbA.Edit;

      if tbA.FieldByName('ativo').AsString = '1' then begin
        if DM.qyUni.Locate('cod', tbA.FieldByName('cduni').AsString, []) then begin
          st := 'L';
          if DM.qyUni.FieldByName('UF').AsString <> tbA.FieldByName('UF').AsString then begin
            st := st + 'U';
            DM.qyUni.Edit;
            stJ := DM.qyUni.FieldByName('UF').AsString;
            DM.qyUni.FieldByName('UF').AsString :=
              tbA.FieldByName('UF').AsString;
            DM.qyUni.FieldByName('us_alt').AsInteger := wUsuario;
            DM.qyUni.FieldByName('dt_alt').AsDateTime := now;
            DM.adicionaLog(DM.qyUni, logAlterado,
              'IMPORTACAO - MUDADO UF ' + stJ);
            DM.qyUni.Post;
            inc(qtUniA);
          end;

          tbA.FieldByName('exuni').AsString := st;
        end else begin
          tbA.FieldByName('exuni').AsString := 'N';
          with DM.qyUni do begin
            Append;
            fieldbyname('id_emp').AsInteger:= 1; //empresa padrão - 13/12/23
            FieldByName('cod').AsString := tbA.FieldByName('cduni').AsString;
            FieldByName('ponto').AsString := '01';
            FieldByName('descr').AsString := tbA.FieldByName('dsuni').AsString;
            FieldByName('UF').AsString := tbA.FieldByName('UF').AsString;
            FieldByName('ativo').AsInteger := 1;
            FieldByName('us_inc').AsInteger := wUsuario;
            FieldByName('dt_inc').AsDateTime := now;
            DM.adicionaLog(DM.qyUni, logIncluido, 'IMPORTACAO');
            Post;
            inc(qtUniI);
          end;
          DM.qyUni.Locate('cod', tbA.FieldByName('cduni').AsString, []);
        end;
      end;

      st := tbA.FieldByName('nrins').AsString;
      if DM.qyPes.Locate('nr_ins', st, []) then begin //Agente(CPF) foi localizado
        if(dm.qyPes['ativo'] <> 1) then begin
          msgerro('REMOVER!!! - Ocorreu um erro! - ' + dm.qyPes['descr']);
          //exit;
        end;
//        if(dm.qyPes['tp_pes'] <> 0) then begin
  //        msgerro('REMOVER!!! - Ocorreu um erro! - ' + dm.qyPes['descr'] + ' CPF: ' + dm.qyPes['nr_ins']);
          //exit;
    //    end;
        st := 'LOC';
        tbA.FieldByName('exage').AsString := st;

        if DM.qyPes['id_uni'] <> DM.qyUni.FieldByName('id').AsInteger then begin
          DM.qyPes.Edit;
          st := st + ',id_uni' + DM.qyUni.FieldByName('id').AsString;
          DM.qyPes['id_uni'] := DM.qyUni.FieldByName('id').AsInteger;
        end;
        if DM.qyPes['id_emp'] <> DM.qyUni.FieldByName('id_emp').AsInteger then begin
          DM.qyPes.Edit;
          st := st + ',id_emp' + DM.qyUni.FieldByName('id_emp').AsString;
          DM.qyPes['id_emp'] := DM.qyUni.FieldByName('id_emp').AsInteger;
        end;
        if DM.qyPes['tp_pes'] <> cTipoAgente then begin
          DM.qyPes.Edit;
          st := st + ',tp_pes' + vartostr(DM.qyPes['tp_pes']);
          DM.qyPes['tp_pes'] := cTipoAgente;
        end;
        if DM.qyPes['cod'] <> tba['cod'] then begin
          DM.qyPes.Edit;
          st := st + ',cod' + vartostr(DM.qyPes['cod']);
          DM.qyPes['cod'] := tbA['cod'];
        end;
        if DM.qyPes['ativo'] <> tba['ativo'] then begin
          DM.qyPes.Edit;
          st := st + ',ativo' + vartostr(DM.qyPes['ativo']);
          DM.qyPes['ativo'] := tba['ativo'];
        end;
        if DM.qyPes['agencia'] <> tba['agencia'] then begin
          DM.qyPes.Edit;
          st:= st +',agencia' + vartostr(DM.qyPes['agencia']);
          DM.qyPes['agencia']:= tba['agencia'];
        end;
        if DM.qyPes['nr_conta'] <> tba['conta'] then begin
          DM.qyPes.Edit;
          st:= st + ',conta' + vartostr(DM.qyPes['nr_conta']);
          DM.qyPes['nr_conta']:= tba['conta'];
        end;
        if DM.qyPes['tp_conta'] <> tba['tpconta'] then begin
          DM.qyPes.Edit;
          st:= st + ',tp_conta' + vartostr(DM.qyPes['tp_conta']);
          DM.qyPes['tp_conta']:= tba['tpconta'];
          if tba['tpconta'] <> 0 then
            DM.qyPes['banco']:= '001';
        end;
        if DM.qyPes['fone1'] <> tba['fone1'] then begin
          DM.qyPes.Edit;
          st:= st + ',fone1' + vartostr(DM.qyPes['fone1']);
          DM.qyPes['fone1']:= tba['fone1'];
        end;
        if DM.qyPes['fone2'] <> tba['fone2'] then begin
          DM.qyPes.Edit;
          st:= st + ',fone2' + vartostr(DM.qyPes['fone2']);
          DM.qyPes['fone2']:= tba['fone2'];
        end;
        if DM.qyPes['email'] <> tba['email'] then begin
          DM.qyPes.Edit;
          st:= st + ',email' + vartostr(DM.qyPes['email']);
          DM.qyPes['email']:= tba['email'];
        end;
        if (DM.qyPes.State in [dsEdit]) then begin
          DM.qyPes.FieldByName('us_alt').AsInteger := wUsuario;
          DM.qyPes.FieldByName('dt_alt').AsDateTime := now;
          DM.adicionaLog(DM.qyPes, logAlterado, 'IMPORTACAO-' + st);
          DM.qyPes.Post;
          inc(qtPesA);
        end;


        // tbA.FieldByName('exuni').AsString:= '0';
      end else begin
        if tbA.FieldByName('ativo').AsString = '1' then begin
          tbA.FieldByName('exage').AsString := 'N';
          with DM.qyPes do begin
            Append;
            FieldByName('tp_pes').AsInteger := cTipoAgente;
            fieldbyname('id_emp').AsInteger:= DM.qyUni.FieldByName('id_emp').AsInteger; //empresa padrão - 13/12/23
            FieldByName('id_uni').AsInteger := DM.qyUni.FieldByName('id').AsInteger;
            FieldByName('tp_ins').AsInteger := cTipoCPF;
            FieldByName('nr_ins').AsString := tbA.FieldByName('nrins').AsString;
            FieldByName('cod').AsString := tbA.FieldByName('cod').AsString;
            FieldByName('descr').AsString := tbA.FieldByName('descr').AsString;
            FieldByName('banco').AsString := '001';
            FieldByName('agencia').AsString := tbA.FieldByName('agencia').AsString;
            FieldByName('nr_conta').AsString := tbA.FieldByName('conta').AsString;
            FieldByName('tp_conta').AsInteger := tbA.FieldByName('tpconta').AsInteger;
            FieldByName('fone1').AsString := tbA.FieldByName('fone1').AsString;
            FieldByName('fone2').AsString := tbA.FieldByName('fone2').AsString;
            FieldByName('email').AsString := tbA.FieldByName('email').AsString;
            FieldByName('ativo').AsInteger := 1;
            FieldByName('us_inc').AsInteger := wUsuario;
            FieldByName('dt_inc').AsDateTime := now;
            DM.adicionaLog(DM.qyPes, logIncluido, 'IMPORTACAO');
            Post;
            inc(qtPesI);
          end;

        end;
      end;
      tbA.Post;
      tbA.Next;
    end;
    DM.DBTRANS.Commit;
    DM.qyPes.Close;
    DM.qyPes.IndexName := '';
    DM.qyUni.Close;
    ShowMessage
      (Format('Tudo Concluído! Foram alterados %d Centro(s) de Custo e %d Agente(s). Foram incluídos %d Centro(s) de Custo e %d Agente(s).',
      [qtUniA, qtPesA, qtUniI, qtPesI]));
    // Application.ProcessMessages;
    // Sleep(3000);
    tbA.Close;
    freeandnil(tbA);
    Close;
  end;

end;

end.
