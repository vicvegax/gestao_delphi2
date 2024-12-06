object fvisPessoal: TfvisPessoal
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
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 56
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object Label5: TLabel
    Left = 656
    Top = 24
    Width = 14
    Height = 15
    Caption = 'ID:'
  end
  object Label3: TLabel
    Left = 611
    Top = 152
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
  end
  object Label4: TLabel
    Left = 864
    Top = 30
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object Label6: TLabel
    Left = 136
    Top = 88
    Width = 43
    Height = 15
    Caption = 'Ag'#234'ncia'
  end
  object Label7: TLabel
    Left = 264
    Top = 88
    Width = 32
    Height = 15
    Caption = 'Conta'
  end
  object Label8: TLabel
    Left = 16
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
  object Label2: TLabel
    Left = 456
    Top = 88
    Width = 26
    Height = 15
    Caption = 'Tipo:'
  end
  object Label13: TLabel
    Left = 40
    Top = 216
    Width = 45
    Height = 15
    Caption = 'Empresa'
  end
  object edDESCR: TEdit
    Left = 96
    Top = 48
    Width = 441
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 4
    TextHint = '(Nome Completo)'
  end
  object edID: TEdit
    Left = 680
    Top = 16
    Width = 65
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 3
  end
  object cbAtivo: TComboBox
    Left = 672
    Top = 144
    Width = 81
    Height = 23
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 17
    Text = 'Ativo'
    Items.Strings = (
      'Inativo'
      'Ativo')
  end
  object edObs: TMemo
    Left = 608
    Top = 48
    Width = 329
    Height = 89
    TabOrder = 18
  end
  object edAgencia: TagenciaEdit
    Left = 192
    Top = 80
    Width = 65
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 6
    MaxLength = 6
  end
  object edNrConta: TcontaEdit
    Left = 320
    Top = 80
    Width = 121
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 7
    MaxLength = 20
  end
  object edBanco: TbancoEdit
    Left = 72
    Top = 80
    Width = 41
    Height = 23
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
    OnKeyPress = edProxFocusKeyPress
  end
  object edFone1: TfoneEdit
    Left = 96
    Top = 112
    Width = 119
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 9
    MaxLength = 15
  end
  object edFone2: TfoneEdit
    Left = 296
    Top = 112
    Width = 119
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 10
    MaxLength = 15
  end
  object edEmail: TEdit
    Left = 96
    Top = 144
    Width = 449
    Height = 23
    CharCase = ecLowerCase
    MaxLength = 50
    TabOrder = 11
    TextHint = 'e-mail'
    OnKeyPress = edProxFocusKeyPress
  end
  object edIDUNI: TzeroEdit
    Left = 96
    Top = 176
    Width = 49
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 12
    MaxLength = 5
  end
  object edDSUNI: TEdit
    Left = 184
    Top = 176
    Width = 417
    Height = 23
    TabOrder = 14
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
    Left = 496
    Top = 80
    Width = 105
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 8
    OnKeyPress = edProxFocusKeyPress
    Items.Strings = (
      '-'
      'C. CORRENTE'
      'POUPAN'#199'A')
  end
  object edPTUNI: TzeroEdit
    Left = 152
    Top = 176
    Width = 25
    Height = 23
    TabOrder = 13
    MaxLength = 3
  end
  object gridREC: TcxGrid
    Left = 0
    Top = 248
    Width = 950
    Height = 328
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 19
    ExplicitWidth = 944
    ExplicitHeight = 319
    object viewREC: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Visible = fvAlways
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsmov
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
      object viewRECativo: TcxGridDBColumn
        Caption = 'Ativo'
        DataBinding.FieldName = 'ativo'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.AllowGrayed = True
        Properties.DisplayChecked = 'SIM'
        Properties.DisplayUnchecked = 'N'#195'O'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
      end
    end
    object levelREC: TcxGridLevel
      GridView = viewREC
    end
  end
  object edDSEMP: TEdit
    Left = 216
    Top = 208
    Width = 385
    Height = 23
    TabOrder = 16
    OnKeyPress = edProxFocusKeyPress
  end
  object edIDEMP: TEdit
    Left = 96
    Top = 208
    Width = 114
    Height = 23
    Alignment = taRightJustify
    TabOrder = 15
    OnKeyPress = edProxFocusKeyPress
  end
  object dsmov: TDataSource
    AutoEdit = False
    DataSet = qymov
    Left = 803
    Top = 174
  end
  object qymov: TFDQuery
    AutoCalcFields = False
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from plmovimento')
    Left = 867
    Top = 175
  end
end
