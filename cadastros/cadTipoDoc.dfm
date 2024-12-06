object fCadTipoDoc: TfCadTipoDoc
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Tipos de Documentos'
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
    Left = 136
    Top = 40
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 42
    Height = 15
    Caption = 'C'#243'digo:'
  end
  object Label3: TLabel
    Left = 16
    Top = 72
    Width = 132
    Height = 15
    Caption = 'Requer Dados Banc'#225'rios?'
  end
  object Label4: TLabel
    Left = 16
    Top = 104
    Width = 173
    Height = 15
    Caption = 'Requer Per'#237'odo de Faturamento?'
  end
  object edDESCR: TEdit
    Left = 200
    Top = 32
    Width = 425
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = '(DESCRI'#199#195'O)'
    OnChange = edDESCRChange
    OnExit = edDESCRExit
    OnKeyPress = edDESCRKeyPress
  end
  object edID: TcxSpinEdit
    Left = 64
    Top = 32
    TabStop = False
    Properties.DisplayFormat = '000'
    Properties.ImmediatePost = True
    Properties.MaxValue = 999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 0
    Value = 1
    OnKeyPress = edIDKeyPress
    Width = 51
  end
  object cbCONTA: TComboBox
    Left = 160
    Top = 64
    Width = 65
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'N'#195'O'
    OnKeyPress = edENTER_KeyPress
    Items.Strings = (
      'N'#195'O'
      'SIM')
  end
  object cbPERIO: TComboBox
    Left = 200
    Top = 96
    Width = 65
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'N'#195'O'
    OnKeyPress = edENTER_KeyPress
    Items.Strings = (
      'N'#195'O'
      'SIM')
  end
  object gridRec: TcxGrid
    Left = 0
    Top = 136
    Width = 746
    Height = 362
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    ExplicitWidth = 740
    ExplicitHeight = 353
    object viewREC: TcxGridDBTableView
      OnDblClick = viewRECDblClick
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsRec
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnExcelPopup.ApplyChanges = efacImmediately
      Filtering.ColumnPopupMode = fpmExcel
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object viewRECcod: TcxGridDBColumn
        Caption = 'C'#243'd.'
        DataBinding.FieldName = 'cod'
        Width = 57
      end
      object colDESCR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'descr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        Width = 334
      end
      object viewRECconta: TcxGridDBColumn
        Caption = 'Dados Banc'#225'rios?'
        DataBinding.FieldName = 'conta'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.AllowGrayed = True
        Properties.DisplayChecked = 'SIM'
        Properties.DisplayUnchecked = 'N'#195'O'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 150
      end
      object viewRECperio: TcxGridDBColumn
        Caption = 'Pre'#237'odo de Faturamento?'
        DataBinding.FieldName = 'perio'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.AllowGrayed = True
        Properties.DisplayChecked = 'SIM'
        Properties.DisplayUnchecked = 'N'#195'O'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 150
      end
    end
    object gridRecLevel1: TcxGridLevel
      GridView = viewREC
    end
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyrec
    Left = 115
    Top = 206
  end
  object qyrec: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbTipoDoc')
    Left = 192
    Top = 192
    object qyrecid: TWordField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyreccod: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cod'
      Origin = 'cod'
      FixedChar = True
      Size = 3
    end
    object qyrecdescr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descr'
      Origin = 'descr'
      Size = 255
    end
    object qyrecconta: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'conta'
      Origin = 'conta'
    end
    object qyrecperio: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'perio'
      Origin = 'perio'
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
    object qyrecobs_exc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs_exc'
      Origin = 'obs_exc'
      Size = 255
    end
  end
end
