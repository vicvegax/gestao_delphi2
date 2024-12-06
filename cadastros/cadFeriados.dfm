object fcadFeriados: TfcadFeriados
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Feriados'
  ClientHeight = 530
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 222
    Top = 31
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object Label2: TLabel
    Left = 22
    Top = 31
    Width = 27
    Height = 15
    Caption = 'Data:'
  end
  object gdRec: TDBGrid
    Left = 0
    Top = 80
    Width = 764
    Height = 450
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRec
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gdRecDblClick
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'data'
        Title.Alignment = taRightJustify
        Title.Caption = 'Data'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Descri'#231#227'o'
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'diasem'
        Title.Caption = 'Dia da Semana'
        Width = 98
        Visible = True
      end>
  end
  object edDESCR: TEdit
    Left = 288
    Top = 28
    Width = 305
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = '(Feriado)'
    OnKeyPress = edENTER_KeyPress
  end
  object edDATA: TcxDateEdit
    Left = 64
    Top = 28
    TabOrder = 0
    OnKeyPress = edDATAKeyPress
    Width = 121
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyrec
    Left = 115
    Top = 206
  end
  object qyrec: TFDQuery
    OnCalcFields = qyrecCalcFields
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbFeriados ORDER BY data')
    Left = 640
    Top = 304
    object qyrecdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyrecdescr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descr'
      Origin = 'descr'
      Size = 255
    end
    object qyrecativo: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object qyrecus_inc: TWordField
      FieldName = 'us_inc'
      Origin = 'us_inc'
      Required = True
    end
    object qyrecdt_inc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_inc'
      Origin = 'dt_inc'
    end
    object qyrecus_alt: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_alt'
      Origin = 'us_alt'
    end
    object qyrecdt_alt: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_alt'
      Origin = 'dt_alt'
    end
    object qyrecus_exc: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_exc'
      Origin = 'us_exc'
    end
    object qyrecdt_exc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_exc'
      Origin = 'dt_exc'
    end
    object qyrecdiasem: TStringField
      FieldKind = fkCalculated
      FieldName = 'diasem'
      Size = 15
      Calculated = True
    end
  end
end
