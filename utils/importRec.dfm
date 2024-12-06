object fImportRec: TfImportRec
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o de Receitas'
  ClientHeight = 482
  ClientWidth = 996
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object grImp: TcxGrid
    Left = 72
    Top = 168
    Width = 905
    Height = 265
    TabOrder = 0
    LookAndFeel.ScrollbarMode = sbmClassic
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = grImpActiveTabChanged
    object gvCSV: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = True
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dscsv
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
          Column = gvCSVvalorc
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = gvCSVvalord
        end
        item
          Kind = skCount
          Column = gvCSVid
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soMultipleSelectedRecords]
      Filtering.ColumnPopupMode = fpmExcel
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvGroupRow, cbvColumnHeader]
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      object gvCSVRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object gvCSVid: TcxGridDBColumn
        Caption = 'Linha'
        DataBinding.FieldName = 'id'
        Visible = False
        Width = 54
      end
      object gvCSVColumn3: TcxGridDBColumn
        Caption = 'Linha'
        DataBinding.FieldName = 'id'
      end
      object colNRCTO: TcxGridDBColumn
        DataBinding.FieldName = 'nr_cto'
        Width = 184
      end
      object gvCSVcnpj: TcxGridDBColumn
        Caption = 'CNPJ'
        DataBinding.FieldName = 'cnpj'
        Width = 110
      end
      object gvCSVColumn1: TcxGridDBColumn
        Caption = 'Empresa'
        DataBinding.FieldName = 'empresa'
        Width = 250
      end
      object gvCSVchavej: TcxGridDBColumn
        Caption = 'Chave J'
        DataBinding.FieldName = 'chavej'
        Width = 70
      end
      object gvCSVagente: TcxGridDBColumn
        Caption = 'Agente'
        DataBinding.FieldName = 'agente'
        SortIndex = 1
        SortOrder = soAscending
        Width = 250
      end
      object gvCSVColumn2: TcxGridDBColumn
        Caption = 'Centro de Custo'
        DataBinding.FieldName = 'ponto'
        SortIndex = 0
        SortOrder = soAscending
        Width = 180
      end
      object gvCSVvalorc: TcxGridDBColumn
        Caption = 'Receita'
        DataBinding.FieldName = 'valorc'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
      end
      object gvCSVvalord: TcxGridDBColumn
        Caption = 'Despesa'
        DataBinding.FieldName = 'valord'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
      end
      object colOBS: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'obs'
        Width = 400
      end
    end
    object gvMov: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = True
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsmov
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
          Column = gvMovvalorc
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = gvMovvalord
        end
        item
          Format = '0'
          Kind = skCount
          Column = gvMovid
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soMultipleSelectedRecords]
      Filtering.ColumnPopupMode = fpmExcel
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      object gvMovid: TcxGridDBColumn
        Caption = 'Id.'
        DataBinding.FieldName = 'id'
        Visible = False
      end
      object gvMovponto: TcxGridDBColumn
        Caption = 'Agente/Ponto'
        DataBinding.FieldName = 'ponto'
        SortIndex = 0
        SortOrder = soAscending
        Width = 320
      end
      object gvMovvalorc: TcxGridDBColumn
        Caption = 'Receita'
        DataBinding.FieldName = 'valorc'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 110
      end
      object gvMovvalord: TcxGridDBColumn
        Caption = 'Comiss'#227'o'
        DataBinding.FieldName = 'valord'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 110
      end
    end
    object gvAGE: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = True
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsage
      DataController.KeyFieldNames = 'chavej'
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopupMode = fpmExcel
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      object gvAGEempresa: TcxGridDBColumn
        Caption = 'Empresa'
        DataBinding.FieldName = 'empresa'
        Options.Editing = False
        Width = 250
      end
      object gvAGEchavej: TcxGridDBColumn
        Caption = 'Chave J'
        DataBinding.FieldName = 'chavej'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 70
      end
      object gvAGEnome: TcxGridDBColumn
        Caption = 'Agente'
        DataBinding.FieldName = 'nome'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        SortIndex = 0
        SortOrder = soAscending
        Width = 250
      end
      object gvAGEColumn1: TcxGridDBColumn
        Caption = 'Centro de Custo (Selecione)'
        DataBinding.FieldName = 'id_uni'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.CharCase = ecUpperCase
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Centro de Custo'
            SortOrder = soAscending
            FieldName = 'descr'
          end
          item
            Caption = 'C'#243'digo'
            MinWidth = 70
            FieldName = 'codpt'
          end>
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = dsuni
        Properties.PostPopupValueOnTab = True
        Width = 400
      end
    end
    object glCSV: TcxGridLevel
      Caption = 'Detalhado'
      GridView = gvCSV
    end
    object glAGE: TcxGridLevel
      Caption = 'Chaves J n'#227'o localizadas (Informar Centro de Custo)'
      GridView = gvAGE
    end
    object glMOV: TcxGridLevel
      Caption = 'Resumido por Ponto'
      GridView = gvMov
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 996
    Height = 57
    Align = alTop
    TabOrder = 1
    Visible = False
    ExplicitWidth = 990
    object Label2: TLabel
      Left = 880
      Top = 34
      Width = 34
      Height = 15
      Caption = 'Label1'
      Visible = False
    end
    object Label1: TLabel
      Left = 880
      Top = 16
      Width = 34
      Height = 15
      Caption = 'Label1'
      Visible = False
    end
    object Button2: TButton
      Left = 792
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 0
      Visible = False
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 436
    Width = 996
    Height = 46
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 427
    ExplicitWidth = 990
    object Label3: TLabel
      Left = 192
      Top = 24
      Width = 107
      Height = 15
      Caption = 'Data da Importa'#231#227'o:'
    end
    object Label4: TLabel
      Left = 624
      Top = 24
      Width = 34
      Height = 15
      Caption = 'Label4'
    end
    object btImport: TBitBtn
      Left = 440
      Top = 8
      Width = 177
      Height = 33
      Caption = 'Importar Dados'
      TabOrder = 0
      OnClick = btImportClick
    end
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 145
      Height = 33
      Caption = 'Abrir Arquivo CSV'
      TabOrder = 1
      OnClick = Button1Click
    end
    object edDTIMP: TcxDateEdit
      Left = 304
      Top = 16
      Properties.Alignment.Horz = taRightJustify
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.ImmediateDropDownWhenActivated = True
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 121
    end
  end
  object pnLoading: TPanel
    Left = 496
    Top = 0
    Width = 393
    Height = 137
    Caption = 'Carregando...'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    object pgLoading: TProgressBar
      Left = 40
      Top = 96
      Width = 321
      Height = 21
      TabOrder = 0
    end
  end
  object odCSV: TOpenDialog
    DefaultExt = 'csv'
    Filter = 'Arquivo CSV|*.csv'
    Options = [ofHideReadOnly, ofNoValidate, ofEnableSizing]
    Left = 152
    Top = 112
  end
  object tbcsv: TFDMemTable
    AutoCalcFields = False
    OnCalcFields = tbcsvCalcFields
    Filtered = True
    IndexFieldNames = 'id_pes;agente'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 304
    Top = 80
    object tbcsvid: TIntegerField
      FieldName = 'id'
    end
    object tbcsvcnpj: TStringField
      FieldName = 'cnpj'
      EditMask = '00.000.000/0000-00;0;_'
      Size = 14
    end
    object tbcsvchavej: TStringField
      FieldName = 'chavej'
      Size = 8
    end
    object tbcsvagente: TStringField
      FieldName = 'agente'
      Size = 50
    end
    object tbcsvvalorc: TCurrencyField
      FieldName = 'valorc'
    end
    object tbcsvvalord: TCurrencyField
      FieldName = 'valord'
    end
    object tbcsvnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object tbcsvponto: TStringField
      FieldName = 'ponto'
      Size = 50
    end
    object tbcsvempresa: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'empresa'
      Size = 50
    end
    object tbcsvid_pes: TIntegerField
      FieldName = 'id_pes'
    end
    object tbcsvid_emp: TIntegerField
      FieldName = 'id_emp'
    end
    object tbcsvid_uni: TIntegerField
      FieldName = 'id_uni'
    end
    object tbcsvobs: TStringField
      FieldName = 'obs'
      Size = 255
    end
    object tbcsvok_chavej: TBooleanField
      FieldName = 'ok_chavej'
    end
    object tbcsvok_ponto: TBooleanField
      FieldName = 'ok_ponto'
    end
    object tbcsvok: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ok'
      Calculated = True
    end
    object tbcsvnr_cto: TStringField
      FieldName = 'nr_cto'
      Size = 255
    end
    object tbcsvok_nrcto: TBooleanField
      FieldName = 'ok_nrcto'
    end
  end
  object dscsv: TDataSource
    AutoEdit = False
    DataSet = tbcsv
    Left = 368
    Top = 80
  end
  object qypes: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 88
    Top = 72
  end
  object qyemp: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 24
    Top = 80
  end
  object tbmov: TFDMemTable
    AutoCalcFields = False
    OnCalcFields = tbcsvCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 576
    Top = 104
    object IntegerField1: TIntegerField
      FieldName = 'id'
    end
    object IntegerField4: TIntegerField
      FieldName = 'id_uni'
    end
    object IntegerField2: TIntegerField
      FieldName = 'id_pes'
    end
    object tbmovchavej: TStringField
      FieldName = 'chavej'
      Size = 8
    end
    object StringField5: TStringField
      FieldName = 'ponto'
      Size = 50
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'valorc'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'valord'
    end
  end
  object dsmov: TDataSource
    AutoEdit = False
    DataSet = tbmov
    Left = 672
    Top = 104
  end
  object tbage: TFDMemTable
    AutoCalcFields = False
    AfterPost = tbageAfterPost
    IndexFieldNames = 'nome'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 72
    object IntegerField3: TIntegerField
      FieldName = 'id'
    end
    object IntegerField5: TIntegerField
      FieldName = 'id_pes'
    end
    object IntegerField6: TIntegerField
      FieldName = 'id_emp'
    end
    object IntegerField7: TIntegerField
      FieldName = 'id_uni'
    end
    object StringField2: TStringField
      FieldName = 'chavej'
      Size = 8
    end
    object StringField7: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'empresa'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object tbageponto: TStringField
      FieldName = 'ponto'
      Size = 50
    end
  end
  object dsage: TDataSource
    DataSet = tbage
    Left = 496
    Top = 72
  end
  object qyuni: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, codpt, descr from tbunidades')
    Left = 160
    Top = 72
  end
  object dsuni: TDataSource
    AutoEdit = False
    DataSet = qyuni
    Left = 240
    Top = 64
  end
  object qychj: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select id, codpt, descr from tbunidades')
    Left = 32
    Top = 144
  end
end
