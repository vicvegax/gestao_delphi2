object fcadEmpresas: TfcadEmpresas
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Empresas'
  ClientHeight = 517
  ClientWidth = 956
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
    Top = 64
    Width = 68
    Height = 15
    Caption = 'Raz'#227'o Social:'
  end
  object Label5: TLabel
    Left = 664
    Top = 32
    Width = 33
    Height = 15
    Caption = 'Ident.:'
    Visible = False
  end
  object Label3: TLabel
    Left = 56
    Top = 224
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
  end
  object Label4: TLabel
    Left = 816
    Top = 64
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object Label8: TLabel
    Left = 64
    Top = 32
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label11: TLabel
    Left = 176
    Top = 32
    Width = 27
    Height = 15
    Caption = 'CNPJ'
  end
  object Label12: TLabel
    Left = 24
    Top = 96
    Width = 82
    Height = 15
    Caption = 'Nome Fantasia:'
  end
  object Label2: TLabel
    Left = 40
    Top = 128
    Width = 65
    Height = 15
    Caption = 'Logradouro:'
  end
  object Label6: TLabel
    Left = 56
    Top = 160
    Width = 47
    Height = 15
    Caption = 'N'#250'mero:'
  end
  object Label7: TLabel
    Left = 248
    Top = 160
    Width = 80
    Height = 15
    Caption = 'Complemento:'
  end
  object Label9: TLabel
    Left = 64
    Top = 192
    Width = 40
    Height = 15
    Caption = 'Cidade:'
  end
  object Label10: TLabel
    Left = 336
    Top = 192
    Width = 24
    Height = 15
    Caption = 'CEP:'
  end
  object Label13: TLabel
    Left = 448
    Top = 192
    Width = 17
    Height = 15
    Caption = 'UF:'
  end
  object gdRec: TDBGrid
    Left = 0
    Top = 248
    Width = 956
    Height = 269
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRec
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gdRecDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cod'
        Title.Caption = 'C'#243'digo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrins'
        Title.Caption = 'CNPJ'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Raz'#227'o Social'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fanta'
        Title.Caption = 'Nome Fantasia'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lograd'
        Title.Caption = 'Logradouro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'compl'
        Title.Caption = 'Complemento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Caption = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Title.Caption = 'UF'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'obs'
        Title.Caption = 'Obs.'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ativo'
        Title.Caption = 'Ativo'
        Visible = True
      end>
  end
  object edDESCR: TEdit
    Left = 120
    Top = 56
    Width = 425
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 3
    OnExit = edDESCRExit
    OnKeyPress = edDESCRKeyPress
  end
  object edID: TEdit
    Left = 704
    Top = 24
    Width = 65
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 0
    Visible = False
  end
  object cbAtivo: TComboBox
    Left = 120
    Top = 216
    Width = 73
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 1
    TabOrder = 11
    Text = 'ATIVO'
    OnKeyPress = edENTER_KeyPress
    Items.Strings = (
      'INATIVO'
      'ATIVO')
  end
  object edObs: TMemo
    Left = 560
    Top = 80
    Width = 329
    Height = 89
    TabOrder = 12
  end
  object edCod: TzeroEdit
    Left = 120
    Top = 24
    Width = 41
    Height = 23
    OnExit = edCodExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 1
    MaxLength = 4
  end
  object edNRINS: TEdit
    Left = 216
    Top = 24
    Width = 121
    Height = 23
    Alignment = taRightJustify
    CharCase = ecUpperCase
    TabOrder = 2
    OnChange = edNRINSChange
    OnExit = edNRINSExit
  end
  object edFANTA: TEdit
    Left = 120
    Top = 88
    Width = 425
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 4
    OnExit = edFANTAExit
    OnKeyPress = edDESCRKeyPress
  end
  object edLOGRAD: TEdit
    Left = 120
    Top = 120
    Width = 425
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 30
    TabOrder = 5
    OnExit = edFANTAExit
    OnKeyPress = edDESCRKeyPress
  end
  object edNUMERO: TzeroEdit
    Left = 120
    Top = 152
    Width = 65
    Height = 23
    TabOrder = 6
    MaxLength = 6
    Value = '00000'
  end
  object edCOMPL: TEdit
    Left = 344
    Top = 152
    Width = 201
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 15
    TabOrder = 7
    OnExit = edFANTAExit
    OnKeyPress = edDESCRKeyPress
  end
  object edCIDADE: TEdit
    Left = 120
    Top = 184
    Width = 201
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 15
    TabOrder = 8
    OnExit = edFANTAExit
    OnKeyPress = edDESCRKeyPress
  end
  object edCEP: TMaskEdit
    Left = 368
    Top = 184
    Width = 65
    Height = 23
    EditMask = '99999-999;0;_'
    MaxLength = 9
    TabOrder = 9
    Text = ''
  end
  object cbUF: TComboBox
    Left = 480
    Top = 184
    Width = 65
    Height = 23
    Style = csDropDownList
    TabOrder = 10
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyRec
    Left = 544
    Top = 8
  end
  object qyRec: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbempresas order by cod')
    Left = 504
    Top = 8
    object qyRecid: TSmallintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyReccod: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 3
      FieldName = 'cod'
      Origin = 'cod'
      FixedChar = True
      Size = 3
    end
    object qyRecdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 255
    end
    object qyRecnrins: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nrins'
      Origin = 'nrins'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object qyRecfanta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fanta'
      Origin = 'fanta'
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
    object qyRecus_inc: TSmallintField
      FieldName = 'us_inc'
      Origin = 'us_inc'
      Required = True
    end
    object qyRecdt_inc: TDateTimeField
      FieldName = 'dt_inc'
      Origin = 'dt_inc'
      Required = True
    end
    object qyRecus_alt: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'us_alt'
      Origin = 'us_alt'
    end
    object qyRecdt_alt: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_alt'
      Origin = 'dt_alt'
    end
    object qyRecus_exc: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'us_exc'
      Origin = 'us_exc'
    end
    object qyRecdt_exc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_exc'
      Origin = 'dt_exc'
    end
    object qyReclograd: TStringField
      FieldName = 'lograd'
      Origin = 'lograd'
      Required = True
      Size = 30
    end
    object qyRecnumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 5
    end
    object qyReccompl: TStringField
      FieldName = 'compl'
      Origin = 'compl'
      Required = True
      Size = 15
    end
    object qyReccidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
    end
    object qyRecCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object qyRecuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
end
