object fcadContas: TfcadContas
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Contas'
  ClientHeight = 525
  ClientWidth = 784
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
    Left = 16
    Top = 64
    Width = 87
    Height = 15
    Caption = 'Nome da Conta:'
  end
  object Label5: TLabel
    Left = 664
    Top = 32
    Width = 33
    Height = 15
    Caption = 'Ident.:'
    Visible = False
  end
  object Label2: TLabel
    Left = 176
    Top = 128
    Width = 43
    Height = 15
    Caption = 'Ag'#234'ncia'
  end
  object Label3: TLabel
    Left = 288
    Top = 208
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
  end
  object Label4: TLabel
    Left = 704
    Top = 112
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object Label6: TLabel
    Left = 64
    Top = 152
    Width = 32
    Height = 15
    Caption = 'Conta'
  end
  object Label7: TLabel
    Left = 64
    Top = 128
    Width = 33
    Height = 15
    Caption = 'Banco'
  end
  object Label8: TLabel
    Left = 64
    Top = 32
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label9: TLabel
    Left = 32
    Top = 184
    Width = 77
    Height = 15
    Alignment = taRightJustify
    Caption = 'Tipo de Conta:'
  end
  object Label10: TLabel
    Left = 24
    Top = 208
    Width = 80
    Height = 15
    Alignment = taRightJustify
    Caption = 'Complemento:'
  end
  object Label11: TLabel
    Left = 56
    Top = 96
    Width = 45
    Height = 15
    Caption = 'Empresa'
  end
  object gdRec: TDBGrid
    Left = 0
    Top = 240
    Width = 784
    Height = 285
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRec
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 12
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
        Title.Caption = 'C'#243'd.'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Nome da Conta'
        Width = 332
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'banco'
        Title.Alignment = taRightJustify
        Title.Caption = 'Banco'
        Width = 40
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'agencia'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ag'#234'ncia'
        Width = 61
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'nr_conta'
        Title.Alignment = taRightJustify
        Title.Caption = 'Nr. Conta'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tp_conta'
        Title.Caption = 'Tp. Conta'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tp_descr'
        Title.Caption = 'Complemento'
        Title.Color = 1
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'saldo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'calc_nrins'
        Title.Caption = 'CNPJ'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'calc_dsemp'
        Title.Caption = 'Empresa'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'obs'
        Title.Caption = 'Obs.'
        Width = 512
        Visible = True
      end>
  end
  object edDESCR: TEdit
    Left = 120
    Top = 56
    Width = 425
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
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
    TabOrder = 1
    Visible = False
  end
  object edAgencia: TagenciaEdit
    Left = 232
    Top = 120
    Width = 57
    Height = 23
    OnExit = edAgenciaExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 6
    MaxLength = 6
  end
  object cbAtivo: TComboBox
    Left = 352
    Top = 200
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
    Left = 448
    Top = 128
    Width = 329
    Height = 89
    TabOrder = 10
  end
  object edNrConta: TcontaEdit
    Left = 120
    Top = 144
    Width = 113
    Height = 23
    OnExit = edNrContaExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 7
    MaxLength = 20
  end
  object edBanco: TbancoEdit
    Left = 120
    Top = 120
    Width = 41
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 5
    MaxLength = 4
  end
  object edCod: TzeroEdit
    Left = 120
    Top = 24
    Width = 41
    Height = 23
    OnExit = edCodExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 0
    MaxLength = 4
  end
  object cbTPCNT: TComboBox
    Left = 120
    Top = 176
    Width = 145
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 0
    TabOrder = 8
    Text = '(CAIXA)'
    OnKeyPress = edENTER_KeyPress
    Items.Strings = (
      '(CAIXA)'
      'CONTA CORRENTE'
      'INVESTIMENTO'
      'PATRIMONIAL')
  end
  object edtpdes: TEdit
    Left = 120
    Top = 200
    Width = 145
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 9
    OnKeyPress = edENTER_KeyPress
  end
  object edIDEMP: TEdit
    Left = 120
    Top = 88
    Width = 114
    Height = 23
    Alignment = taRightJustify
    TabOrder = 3
    OnChange = edIDEMPChange
    OnExit = edIDEMPExit
    OnKeyPress = edProxFocusKeyPress
  end
  object cbIDEMP: TcxLookupComboBox
    Left = 240
    Top = 88
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Width = 300
        FieldName = 'descr'
      end
      item
        SortOrder = soAscending
        Width = 80
        FieldName = 'cod'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsemp
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDEMPPropertiesEditValueChanged
    TabOrder = 4
    OnKeyPress = edProxFocusKeyPress
    Width = 385
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
      'select * from tbContas order by cod')
    Left = 504
    Top = 8
    object qyRecid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyReccod: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cod'
      Origin = 'cod'
      Size = 3
    end
    object qyRecdescr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descr'
      Origin = 'descr'
      Size = 255
    end
    object qyRecbanco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'banco'
      Origin = 'banco'
      Size = 4
    end
    object qyRecagencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'agencia'
      Origin = 'agencia'
      Size = 6
    end
    object qyRecnr_conta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
      OnGetText = qyRecnr_contaGetText
    end
    object qyRectp_conta: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'tp_conta'
      Origin = 'tp_conta'
      OnGetText = qyRectp_contaGetText
    end
    object qyRectp_descr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tp_descr'
      Origin = 'tp_descr'
      Size = 30
    end
    object qyRecobs: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      Size = 255
    end
    object qyRecinfo1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'info1'
      Origin = 'info1'
      Size = 255
    end
    object qyRecinfo2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'info2'
      Origin = 'info2'
      Size = 255
    end
    object qyRecinfo3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'info3'
      Origin = 'info3'
      Size = 255
    end
    object qyRecinfo4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'info4'
      Origin = 'info4'
      Size = 255
    end
    object qyRecinfo5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'info5'
      Origin = 'info5'
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
    object qyRecvalor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 12
      Size = 2
    end
    object qyRecsaldo: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'saldo'
      Origin = 'saldo'
      Precision = 12
      Size = 2
    end
    object qyRecid_emp: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'id_emp'
      Origin = 'id_emp'
    end
    object qyReccalc_nrins: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nrins'
      LookupDataSet = qyemp
      LookupKeyFields = 'id'
      LookupResultField = 'nrins'
      KeyFields = 'id_emp'
      EditMask = '99.999.999/9999-99;0;1'
      Size = 14
      Lookup = True
    end
    object qyReccalc_dsemp: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_dsemp'
      LookupDataSet = qyemp
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'id_emp'
      Size = 50
      Lookup = True
    end
  end
  object qyemp: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, cod, nrins, descr from tbempresas limit 1')
    Left = 632
    Top = 24
  end
  object dsemp: TDataSource
    AutoEdit = False
    DataSet = qyemp
    Left = 680
    Top = 24
  end
end
