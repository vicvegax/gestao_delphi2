object fcadEventos: TfcadEventos
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Plano de Contas'
  ClientHeight = 507
  ClientWidth = 987
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
    Left = 19
    Top = 64
    Width = 51
    Height = 15
    Alignment = taRightJustify
    Caption = 'Descri'#231#227'o'
  end
  object Label5: TLabel
    Left = 840
    Top = 16
    Width = 33
    Height = 15
    Caption = 'Ident.:'
    Visible = False
  end
  object Label2: TLabel
    Left = 24
    Top = 32
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label3: TLabel
    Left = 368
    Top = 96
    Width = 45
    Height = 15
    Caption = 'Situa'#231#227'o'
  end
  object Label4: TLabel
    Left = 512
    Top = 16
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object Label6: TLabel
    Left = 16
    Top = 96
    Width = 50
    Height = 15
    Alignment = taRightJustify
    Caption = 'Natureza:'
  end
  object edDESCR: TEdit
    Left = 80
    Top = 56
    Width = 425
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = '(Descri'#231#227'o)'
    OnChange = edDESCRChange
    OnExit = edDESCRExit
    OnKeyPress = edDESCRKeyPress
  end
  object edID: TEdit
    Left = 880
    Top = 16
    Width = 65
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object edCod: TMaskEdit
    Left = 80
    Top = 24
    Width = 73
    Height = 23
    EditMask = '0.00.00.00;0;_'
    MaxLength = 10
    TabOrder = 0
    Text = ''
    TextHint = '(C'#243'digo)'
    OnChange = edCodChange
    OnKeyPress = edProxFocusKeyPress
  end
  object cbAtivo: TComboBox
    Left = 424
    Top = 88
    Width = 81
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 1
    TabOrder = 5
    Text = 'ATIVO'
    OnKeyPress = edProxFocusKeyPress
    Items.Strings = (
      'INATIVO'
      'ATIVO')
  end
  object edObs: TMemo
    Left = 512
    Top = 32
    Width = 329
    Height = 89
    TabOrder = 6
  end
  object cbNTREG: TComboBox
    Left = 80
    Top = 88
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    CharCase = ecUpperCase
    ItemIndex = 0
    TabOrder = 2
    Text = 'D'#201'BITO'
    OnKeyPress = edENTER_KeyPress
    Items.Strings = (
      'D'#201'BITO'
      'CR'#201'DITO')
  end
  object gridREC: TcxGrid
    Left = 0
    Top = 136
    Width = 987
    Height = 371
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
    ExplicitWidth = 981
    ExplicitHeight = 362
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
      object viewRECtp_reg: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'tp_reg'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'D'
          'R')
        OnCustomDrawCell = viewRECtp_regCustomDrawCell
        SortIndex = 0
        SortOrder = soAscending
        Width = 67
      end
      object viewRECcod: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'cod'
        Options.FilterRowOperator = foContains
        Width = 97
      end
      object colDESCR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'descr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        SortIndex = 1
        SortOrder = soAscending
        Width = 300
      end
      object viewRECnt_reg: TcxGridDBColumn
        Caption = 'NT'
        DataBinding.FieldName = 'nt_reg'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'D'
          'C')
        OnCustomDrawCell = viewRECnt_regCustomDrawCell
        Width = 47
      end
      object viewRECobs: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'obs'
        Options.FilterRowOperator = foContains
        Width = 300
      end
      object viewRECColumn1: TcxGridDBColumn
        Caption = 'Dados'
        DataBinding.FieldName = 'dados'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.AllowGrayed = True
        Properties.DisplayChecked = 'SIM'
        Properties.DisplayUnchecked = 'N'#195'O'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 72
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
        Width = 70
      end
    end
    object levelREC: TcxGridLevel
      GridView = viewREC
    end
  end
  object chDADOS: TCheckBox
    Left = 192
    Top = 92
    Width = 137
    Height = 17
    Caption = 'Dados do Contrato'
    TabOrder = 3
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyRec
    Left = 888
    Top = 64
  end
  object qyRec: TFDQuery
    IndexFieldNames = 'cod'
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbEventos')
    Left = 928
    Top = 72
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
    end
    object qyRectp_reg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tp_reg'
      Origin = 'tp_reg'
      FixedChar = True
      Size = 1
    end
    object qyRecdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 255
    end
    object qyRecnt_reg: TStringField
      FieldName = 'nt_reg'
      Origin = 'nt_reg'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyRecativo: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object qyRecobs: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      Size = 255
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
    object qyRecdados: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'dados'
      Origin = 'dados'
    end
  end
end
