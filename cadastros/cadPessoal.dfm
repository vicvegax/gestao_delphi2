object fcadPessoal: TfcadPessoal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Pessoal'
  ClientHeight = 576
  ClientWidth = 950
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
    Left = 48
    Top = 56
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object lbID: TLabel
    Left = 496
    Top = 24
    Width = 33
    Height = 15
    Caption = 'Ident.:'
    Visible = False
  end
  object lbAtivo: TLabel
    Left = 608
    Top = 216
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
  end
  object Label4: TLabel
    Left = 912
    Top = 94
    Width = 24
    Height = 15
    Caption = 'Obs.'
  end
  object lbAgencia: TLabel
    Left = 120
    Top = 88
    Width = 51
    Height = 15
    Caption = 'Ag'#234'ncia *'
  end
  object lbNrConta: TLabel
    Left = 248
    Top = 88
    Width = 32
    Height = 15
    Caption = 'Conta'
  end
  object lbBanco: TLabel
    Left = 24
    Top = 88
    Width = 36
    Height = 15
    Caption = 'Banco:'
  end
  object Label9: TLabel
    Left = 32
    Top = 120
    Width = 38
    Height = 15
    Caption = 'Fone 1:'
  end
  object Label10: TLabel
    Left = 16
    Top = 24
    Width = 66
    Height = 15
    Caption = 'Documento:'
  end
  object Label11: TLabel
    Left = 232
    Top = 120
    Width = 38
    Height = 15
    Caption = 'Fone 2:'
  end
  object Label12: TLabel
    Left = 32
    Top = 152
    Width = 37
    Height = 15
    Caption = 'e-mail:'
  end
  object lbLOC: TLabel
    Left = 32
    Top = 184
    Width = 45
    Height = 15
    Caption = 'Lota'#231#227'o:'
  end
  object lbCOD: TLabel
    Left = 312
    Top = 24
    Width = 43
    Height = 15
    Caption = 'Chave J:'
  end
  object lbTpConta: TLabel
    Left = 424
    Top = 88
    Width = 26
    Height = 15
    Caption = 'Tipo:'
  end
  object lbEMP: TLabel
    Left = 40
    Top = 216
    Width = 45
    Height = 15
    Caption = 'Empresa'
  end
  object Label14: TLabel
    Left = 640
    Top = 48
    Width = 226
    Height = 15
    Caption = '* Ag'#234'ncia deve conter no m'#237'nimo 4 d'#237'gitos'
  end
  object edDESCR: TEdit
    Left = 96
    Top = 48
    Width = 441
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 4
    TextHint = '(Nome Completo)'
    OnChange = edDESCRChange
    OnExit = edDESCRExit
    OnKeyPress = edDESCRKeyPress
  end
  object edID: TEdit
    Left = 536
    Top = 16
    Width = 65
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object cbAtivo: TComboBox
    Left = 672
    Top = 208
    Width = 81
    Height = 23
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 18
    Text = 'Ativo'
    OnKeyPress = edENTER_KeyPress
    Items.Strings = (
      'Inativo'
      'Ativo')
  end
  object edObs: TMemo
    Left = 608
    Top = 112
    Width = 329
    Height = 89
    TabOrder = 19
  end
  object edAgencia: TagenciaEdit
    Left = 176
    Top = 80
    Width = 65
    Height = 23
    OnExit = edAgenciaExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 6
    MaxLength = 6
  end
  object edNrConta: TcontaEdit
    Left = 288
    Top = 80
    Width = 121
    Height = 23
    OnExit = edNrContaExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 7
    MaxLength = 20
  end
  object edBanco: TbancoEdit
    Left = 72
    Top = 80
    Width = 41
    Height = 23
    OnExit = edBancoExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 5
    MaxLength = 4
  end
  object cbTPINS: TComboBox
    Left = 96
    Top = 16
    Width = 63
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'CPF'
    OnKeyPress = edProxFocusKeyPress
    OnSelect = cbTPINSSelect
    Items.Strings = (
      'CPF'
      'CNPJ')
  end
  object edNRINS: TMaskEdit
    Left = 168
    Top = 16
    Width = 121
    Height = 23
    TabOrder = 1
    Text = ''
    OnChange = edNRINSChange
    OnClick = edNRINSClick
    OnKeyPress = edProxFocusKeyPress
  end
  object edFone1: TfoneEdit
    Left = 96
    Top = 112
    Width = 119
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 10
    MaxLength = 15
  end
  object edFone2: TfoneEdit
    Left = 296
    Top = 112
    Width = 119
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 11
    MaxLength = 15
  end
  object edEmail: TEdit
    Left = 96
    Top = 144
    Width = 449
    Height = 23
    CharCase = ecLowerCase
    MaxLength = 50
    TabOrder = 12
    OnKeyPress = edProxFocusKeyPress
  end
  object edIDUNI: TzeroEdit
    Left = 96
    Top = 176
    Width = 49
    Height = 23
    OnChange = edIDUNIChange
    OnExit = edIDUNIExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 13
    MaxLength = 5
  end
  object cbIDUNI: TcxLookupComboBox
    Left = 184
    Top = 176
    Properties.CharCase = ecUpperCase
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        SortOrder = soAscending
        Width = 350
        FieldName = 'descr'
      end
      item
        Width = 80
        FieldName = 'codpt'
      end>
    Properties.ListOptions.CaseInsensitive = True
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DSUNI
    Properties.OnEditValueChanged = cbIDCUSPropertiesEditValueChanged
    TabOrder = 15
    OnKeyPress = edProxFocusKeyPress
    Width = 417
  end
  object edCOD: TEdit
    Left = 368
    Top = 16
    Width = 121
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 2
    TextHint = '(CHAVE J)'
    OnKeyPress = edProxFocusKeyPress
  end
  object cbTpConta: TComboBox
    Left = 456
    Top = 80
    Width = 145
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 8
    OnKeyPress = edProxFocusKeyPress
    OnSelect = cbTpContaSelect
    Items.Strings = (
      'C. CORRENTE'
      'POUPAN'#199'A')
  end
  object edPTUNI: TzeroEdit
    Left = 152
    Top = 176
    Width = 25
    Height = 23
    OnChange = edPTUNIChange
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 14
    MaxLength = 3
  end
  object Button1: TButton
    Left = 616
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    Enabled = False
    TabOrder = 20
    Visible = False
    OnClick = Button1Click
  end
  object gridREC: TcxGrid
    Left = 0
    Top = 240
    Width = 950
    Height = 336
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 21
    ExplicitWidth = 944
    ExplicitHeight = 327
    object viewREC: TcxGridDBTableView
      OnDblClick = viewRECDblClick
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Visible = fvAlways
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsRec
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.KeyFieldNames = 'id'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Clique aqui para definir Filtros'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object colNRINS: TcxGridDBColumn
        Caption = 'CPF/CNPJ'
        DataBinding.FieldName = 'nr_ins'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        OnGetDisplayText = colNRINSGetDisplayText
        Options.FilterRowOperator = foContains
        Width = 133
      end
      object colDESCR: TcxGridDBColumn
        Caption = 'Nome/Descri'#231#227'o'
        DataBinding.FieldName = 'descr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.Editing = False
        Options.FilteringPopupIncrementalFiltering = True
        Options.FilterRowOperator = foContains
        Options.Grouping = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 425
      end
      object colCOD: TcxGridDBColumn
        Caption = 'Chave J'
        DataBinding.FieldName = 'cod'
        Options.FilterRowOperator = foContains
        Width = 90
      end
      object viewRECativo: TcxGridDBColumn
        Caption = 'Ativo'
        DataBinding.FieldName = 'ativo'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayChecked = 'ATIVO'
        Properties.DisplayUnchecked = 'INATIVO'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
        Width = 74
      end
      object colIDUNI: TcxGridDBColumn
        Caption = 'C'#243'd. Lot.'
        DataBinding.FieldName = 'calc_cd_uni'
        Width = 75
      end
      object colDSUNI: TcxGridDBColumn
        Caption = 'Lota'#231#227'o'
        DataBinding.FieldName = 'calc_ds_uni'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        Width = 310
      end
      object colDSEMP: TcxGridDBColumn
        Caption = 'Empresa'
        DataBinding.FieldName = 'calc_ds_emp'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        Width = 300
      end
      object viewRECfone1: TcxGridDBColumn
        Caption = 'Fone 1'
        DataBinding.FieldName = 'fone1'
        Options.FilterRowOperator = foContains
        Width = 100
      end
      object viewRECfone2: TcxGridDBColumn
        Caption = 'Fone 2'
        DataBinding.FieldName = 'fone2'
        Options.FilterRowOperator = foContains
        Width = 100
      end
      object viewRECbanco: TcxGridDBColumn
        Caption = 'Banco'
        DataBinding.FieldName = 'banco'
        Options.FilterRowOperator = foContains
        Width = 73
      end
      object viewRECagencia: TcxGridDBColumn
        Caption = 'Ag'#234'ncia'
        DataBinding.FieldName = 'agencia'
        Options.FilterRowOperator = foContains
        Width = 79
      end
      object viewRECnr_conta_fmt: TcxGridDBColumn
        Caption = 'Conta'
        DataBinding.FieldName = 'nr_conta'
        Options.FilterRowOperator = foContains
      end
      object viewRECtp_conta_ds: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'calc_ds_tp_conta'
        Options.FilterRowOperator = foContains
        Width = 56
      end
      object viewRECemail: TcxGridDBColumn
        Caption = 'e-mail'
        DataBinding.FieldName = 'email'
        Options.FilterRowOperator = foContains
      end
      object viewRECobs: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'obs'
        Options.FilterRowOperator = foContains
        Width = 500
      end
    end
    object levelREC: TcxGridLevel
      GridView = viewREC
    end
  end
  object cbIDEMP: TcxLookupComboBox
    Left = 216
    Top = 208
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
    Properties.ListOptions.CaseInsensitive = True
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsemp
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDEMPPropertiesEditValueChanged
    TabOrder = 17
    OnKeyPress = edENTER_KeyPress
    Width = 385
  end
  object edIDEMP: TEdit
    Left = 96
    Top = 208
    Width = 114
    Height = 23
    Alignment = taRightJustify
    TabOrder = 16
    OnChange = edIDEMPChange
    OnExit = edIDEMPExit
    OnKeyPress = edENTER_KeyPress
  end
  object chSemConta: TCheckBox
    Left = 616
    Top = 88
    Width = 201
    Height = 17
    Caption = 'N'#195'O TEM CONTA BANC'#193'RIA'
    TabOrder = 9
    OnClick = chSemContaClick
    OnKeyPress = edProxFocusKeyPress
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyRec
    Left = 923
    Top = 174
  end
  object qyRec: TFDQuery
    AutoCalcFields = False
    OnCalcFields = qyRecCalcFields
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbPessoal ORDER BY tp_pes, nr_ins')
    Left = 235
    Top = 167
    object qyReccduni_calc: TStringField
      Alignment = taRightJustify
      FieldKind = fkInternalCalc
      FieldName = 'calc_cd_uni'
      EditMask = '9999.99;0;_'
      Size = 6
    end
    object qyRecdsuni_calc: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'calc_ds_uni'
      Size = 50
    end
    object qyRectp_conta_ds: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'calc_ds_tp_conta'
      Size = 2
    end
    object qyRecid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyRectp_pes: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'tp_pes'
      Origin = 'tp_pes'
    end
    object qyRecid_uni: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'id_uni'
      Origin = 'id_uni'
    end
    object qyReccod: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cod'
      Origin = 'cod'
      Size = 10
    end
    object qyRectp_ins: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'tp_ins'
      Origin = 'tp_ins'
    end
    object qyRecnr_ins: TStringField
      FieldName = 'nr_ins'
      Origin = 'nr_ins'
      Required = True
      Size = 14
    end
    object qyRecdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 255
    end
    object qyRecbanco: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'banco'
      Origin = 'banco'
      FixedChar = True
      Size = 4
    end
    object qyRecagencia: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'agencia'
      Origin = 'agencia'
      OnGetText = qyRecagenciaGetText
      FixedChar = True
      Size = 6
    end
    object qyRecnr_conta: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
      OnGetText = qyRecnr_contaGetText
    end
    object qyRectp_conta: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'tp_conta'
      Origin = 'tp_conta'
    end
    object qyRecfone1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone1'
      Origin = 'fone1'
      OnGetText = qyRecfone1GetText
      Size = 15
    end
    object qyRecfone2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone2'
      Origin = 'fone2'
      OnGetText = qyRecfone1GetText
      Size = 15
    end
    object qyRecemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object qyRecobs: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      Size = 255
    end
    object qyRecponto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ponto'
      Origin = 'ponto'
      FixedChar = True
      Size = 2
    end
    object qyRecativo: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object qyRecvinc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vinc'
      Origin = 'vinc'
      FixedChar = True
      Size = 3
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
    object qyReclog: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'log'
      Origin = 'log'
      BlobType = ftMemo
    end
    object qyReccalc_ds_emp: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'calc_ds_emp'
      Size = 50
    end
    object qyRecid_emp: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'id_emp'
      Origin = 'id_emp'
    end
  end
  object DSUNI: TDataSource
    AutoEdit = False
    DataSet = DM.qyUni
    Left = 840
    Top = 200
  end
  object qyemp: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, cod, nrins, descr from tbempresas limit 1')
    Left = 904
    Top = 152
  end
  object dsemp: TDataSource
    AutoEdit = False
    DataSet = qyemp
    Left = 880
    Top = 184
  end
end
