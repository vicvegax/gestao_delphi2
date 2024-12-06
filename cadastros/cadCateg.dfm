object fcadCateg: TfcadCateg
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Tipos de Bens e Materiais'
  ClientHeight = 498
  ClientWidth = 746
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
    Left = 40
    Top = 72
    Width = 54
    Height = 15
    Caption = 'Categoria:'
  end
  object Label5: TLabel
    Left = 296
    Top = 112
    Width = 33
    Height = 15
    Caption = 'Ident.:'
    Visible = False
  end
  object Label2: TLabel
    Left = 48
    Top = 32
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label3: TLabel
    Left = 40
    Top = 112
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
  end
  object Label4: TLabel
    Left = 429
    Top = 19
    Width = 21
    Height = 15
    Caption = 'Obs'
  end
  object gdRec: TDBGrid
    Left = 0
    Top = 152
    Width = 746
    Height = 346
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRec
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 5
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
        FieldName = 'cod'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Categoria'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ativo'
        Title.Caption = 'Ativo'
        Width = 49
        Visible = True
      end>
  end
  object edDESCR: TEdit
    Left = 104
    Top = 64
    Width = 305
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = edENTER_KeyPress
  end
  object edID: TEdit
    Left = 336
    Top = 104
    Width = 65
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 1
    Visible = False
  end
  object edCod: TzeroEdit
    Left = 104
    Top = 24
    Width = 55
    Height = 23
    TabStop = False
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 0
    MaxLength = 5
  end
  object cbAtivo: TComboBox
    Left = 104
    Top = 104
    Width = 145
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 1
    TabOrder = 3
    Text = 'ATIVO'
    Items.Strings = (
      'INATIVO'
      'ATIVO')
  end
  object edObs: TMemo
    Left = 432
    Top = 41
    Width = 329
    Height = 89
    TabOrder = 4
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyRec
    Left = 115
    Top = 206
  end
  object qyRec: TFDQuery
    IndexFieldNames = 'cod'
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbcateg order by Cod')
    Left = 326
    Top = 169
    object qyRecid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyReccod: TStringField
      FieldName = 'cod'
      Origin = 'cod'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qyRecdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 255
    end
    object qyRecobs: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      Size = 255
    end
    object qyRecativo: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object qyRecus_inc: TWordField
      FieldName = 'us_inc'
      Origin = 'us_inc'
      Required = True
    end
    object qyRecdt_inc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_inc'
      Origin = 'dt_inc'
    end
    object qyRecus_alt: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_alt'
      Origin = 'us_alt'
    end
    object qyRecdt_alt: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_alt'
      Origin = 'dt_alt'
    end
    object qyRecus_exc: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_exc'
      Origin = 'us_exc'
    end
    object qyRecdt_exc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_exc'
      Origin = 'dt_exc'
    end
  end
end
