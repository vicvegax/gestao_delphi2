object fcadUsuario: TfcadUsuario
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 486
  ClientWidth = 829
  Color = clBtnFace
  Constraints.MinWidth = 454
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
    Left = 24
    Top = 56
    Width = 43
    Height = 15
    Caption = 'Usu'#225'rio:'
  end
  object Label2: TLabel
    Left = 40
    Top = 24
    Width = 24
    Height = 15
    Caption = 'CPF:'
  end
  object Label3: TLabel
    Left = 32
    Top = 88
    Width = 35
    Height = 15
    Caption = 'Senha:'
  end
  object Label4: TLabel
    Left = 360
    Top = 120
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
    Visible = False
  end
  object Label5: TLabel
    Left = 32
    Top = 120
    Width = 30
    Height = 15
    Caption = 'N'#237'vel:'
  end
  object Label6: TLabel
    Left = 184
    Top = 88
    Width = 392
    Height = 15
    Caption = 'NA ALTERA'#199#195'O, DEIXE A SENHA EM BRANCO PARA N'#195'O MODIFIC'#193'-LA!!!'
  end
  object gdRec: TDBGrid
    Left = 0
    Top = 152
    Width = 829
    Height = 334
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRec
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Nome do Usu'#225'rio'
        Width = 332
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_nivel'
        Title.Caption = 'N'#237'vel'
        Width = 204
        Visible = True
      end>
  end
  object edDESCR: TEdit
    Left = 80
    Top = 48
    Width = 329
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 16
    TabOrder = 1
    TextHint = '(Nome do Usuario)'
    OnExit = edDESCRExit
    OnKeyPress = edProxFocusKeyPress
  end
  object edCPF: TMaskEdit
    Left = 80
    Top = 16
    Width = 97
    Height = 23
    CharCase = ecUpperCase
    EditMask = '000.000.000-00;0;_'
    MaxLength = 14
    TabOrder = 0
    Text = ''
    TextHint = '(CPF)'
    OnKeyPress = edProxFocusKeyPress
  end
  object edSENHA: TEdit
    Left = 80
    Top = 80
    Width = 89
    Height = 23
    Hint = '(Login)'
    MaxLength = 8
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = edENTERKeyPress
  end
  object cbAtivo: TComboBox
    Left = 416
    Top = 112
    Width = 81
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 1
    TabOrder = 3
    Text = 'ATIVO'
    Visible = False
    OnKeyPress = edProxFocusKeyPress
    Items.Strings = (
      'INATIVO'
      'ATIVO')
  end
  object cbNivel: TcxLookupComboBox
    Left = 80
    Top = 112
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'descr'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsUsuNivel
    Properties.PostPopupValueOnTab = True
    TabOrder = 4
    Width = 257
  end
  object dsRec: TDataSource
    DataSet = qyRec
    Left = 294
    Top = 6
  end
  object qyRec: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbUsuario')
    Left = 567
    Top = 16
    object qyRecid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyReccpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
      Size = 11
    end
    object qyRecdescr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descr'
      Origin = 'descr'
      Size = 255
    end
    object qyRecsenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      FixedChar = True
      Size = 60
    end
    object qyRecid_nivel: TWordField
      FieldName = 'id_nivel'
      Origin = 'id_nivel'
      Required = True
    end
    object qyRecult_log: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ult_log'
      Origin = 'ult_log'
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
    object qyRecds_nivel: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_nivel'
      LookupDataSet = DM.tbUsuNivel
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'id_nivel'
      Size = 50
      Lookup = True
    end
  end
end
