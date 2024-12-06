object fcadInvent: TfcadInvent
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Bens e Materiais'
  ClientHeight = 604
  ClientWidth = 1137
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pcInv: TPanel
    Left = 0
    Top = 82
    Width = 1137
    Height = 231
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 1131
    object Bevel1: TBevel
      Left = 488
      Top = 64
      Width = 409
      Height = 89
    end
    object Label3: TLabel
      Left = 8
      Top = 208
      Width = 48
      Height = 15
      Caption = 'Situa'#231#227'o:'
    end
    object Label4: TLabel
      Left = 440
      Top = 200
      Width = 24
      Height = 15
      Caption = 'Obs.'
    end
    object Label7: TLabel
      Left = 496
      Top = 104
      Width = 80
      Height = 15
      Caption = 'Dt. da Compra:'
    end
    object Label8: TLabel
      Left = 496
      Top = 128
      Width = 91
      Height = 15
      Caption = 'Valor de Compra:'
    end
    object Label9: TLabel
      Left = 880
      Top = 112
      Width = 94
      Height = 15
      Caption = 'Vida '#218'till (meses):'
      Visible = False
    end
    object Label10: TLabel
      Left = 880
      Top = 16
      Width = 71
      Height = 15
      Caption = 'Conserva'#231#227'o:'
      Visible = False
    end
    object Label11: TLabel
      Left = 880
      Top = 48
      Width = 135
      Height = 15
      Caption = 'Valor Depreciado (Linear):'
      Visible = False
    end
    object Label13: TLabel
      Left = 880
      Top = 144
      Width = 91
      Height = 15
      Caption = #218'lt. Manuten'#231#227'o:'
      Visible = False
    end
    object Label12: TLabel
      Left = 496
      Top = 80
      Width = 88
      Height = 15
      Caption = 'Dt. Incorpora'#231#227'o'
    end
    object Label15: TLabel
      Left = 880
      Top = 80
      Width = 41
      Height = 15
      Caption = 'Motivo:'
      Visible = False
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 54
      Height = 15
      Caption = 'Descri'#231#227'o:'
    end
    object Label5: TLabel
      Left = 881
      Top = 168
      Width = 33
      Height = 15
      Caption = 'Ident.:'
      Visible = False
    end
    object Label2: TLabel
      Left = 488
      Top = 16
      Width = 112
      Height = 15
      Caption = 'Nr. de Patrim'#244'nio GP'
    end
    object Label16: TLabel
      Left = 8
      Top = 80
      Width = 58
      Height = 15
      Caption = 'Fabricante:'
    end
    object Label17: TLabel
      Left = 8
      Top = 104
      Width = 44
      Height = 15
      Caption = 'Modelo:'
    end
    object Label18: TLabel
      Left = 8
      Top = 128
      Width = 63
      Height = 15
      Caption = 'Nr. de S'#233'rie:'
    end
    object Label19: TLabel
      Left = 8
      Top = 152
      Width = 61
      Height = 15
      Caption = 'Nota Fiscal:'
    end
    object Label20: TLabel
      Left = 696
      Top = 104
      Width = 47
      Height = 15
      Caption = 'Garantia:'
    end
    object Label21: TLabel
      Left = 8
      Top = 176
      Width = 63
      Height = 15
      Caption = 'Fornecedor:'
    end
    object Label22: TLabel
      Left = 696
      Top = 80
      Width = 86
      Height = 15
      Caption = 'Dt. de Aquisi'#231#227'o'
    end
    object Label23: TLabel
      Left = 8
      Top = 48
      Width = 54
      Height = 15
      Caption = 'Promotor:'
    end
    object cbAtivo: TComboBox
      Left = 80
      Top = 200
      Width = 145
      Height = 23
      Style = csDropDownList
      CharCase = ecUpperCase
      TabOrder = 14
      OnDrawItem = cbAtivoDrawItem
      OnKeyPress = edENTER_KeyPress
      Items.Strings = (
        'INATIVO'
        'ATIVO')
    end
    object edOBS: TMemo
      Left = 488
      Top = 160
      Width = 393
      Height = 65
      TabOrder = 15
    end
    object edDTCOM: TcxDateEdit
      Left = 592
      Top = 96
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = 'dd/mm/yyyy'
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 11
      OnKeyPress = edProxFocusKeyPress
      Width = 97
    end
    object edVLCOM: TcxCurrencyEdit
      Left = 592
      Top = 120
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.MinValue = True
      Properties.DisplayFormat = ',0.00'
      Properties.Nullstring = '0'
      TabOrder = 13
      OnKeyPress = edProxFocusKeyPress
      Width = 97
    end
    object edVIDUTIL: TcxSpinEdit
      Left = 984
      Top = 104
      Properties.ImmediatePost = True
      TabOrder = 18
      Visible = False
      OnKeyPress = edProxFocusKeyPress
      Width = 57
    end
    object cbSITUA: TComboBox
      Left = 960
      Top = 8
      Width = 106
      Height = 23
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemIndex = 0
      TabOrder = 17
      Text = 'BOM'
      Visible = False
      OnKeyPress = edProxFocusKeyPress
      Items.Strings = (
        'BOM'
        'REGULAR'
        'RUIM')
    end
    object edVLDEP: TEdit
      Left = 1032
      Top = 40
      Width = 84
      Height = 23
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 19
      Visible = False
      OnKeyPress = edENTER_KeyPress
    end
    object edDTMAN: TcxDateEdit
      Left = 976
      Top = 136
      Properties.Alignment.Horz = taRightJustify
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnToday]
      Properties.DateOnError = deNull
      Properties.DisplayFormat = 'dd/mm/yyyy'
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 20
      Visible = False
      OnKeyPress = edProxFocusKeyPress
      Width = 121
    end
    object cbTPINCOR: TComboBox
      Left = 928
      Top = 72
      Width = 145
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 16
      Text = 'CADASTRO'
      Visible = False
      OnKeyPress = edProxFocusKeyPress
      Items.Strings = (
        'CADASTRO'
        'AQUISI'#199#195'O'
        'TRANSFER'#202'NCIA')
    end
    object edID: TEdit
      Left = 920
      Top = 162
      Width = 65
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 21
      Visible = False
    end
    object edCod: TzeroEdit
      Left = 608
      Top = 8
      Width = 65
      Height = 23
      TabStop = False
      OnKeyPress = edProxFocusKeyPress
      TabOrder = 1
      MaxLength = 6
    end
    object edFABRI: TEdit
      Left = 80
      Top = 72
      Width = 393
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 4
      OnKeyPress = edProxFocusKeyPress
    end
    object edMODEL: TEdit
      Left = 80
      Top = 96
      Width = 393
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 5
      OnKeyPress = edProxFocusKeyPress
    end
    object edNRSER: TEdit
      Left = 80
      Top = 120
      Width = 393
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 6
      OnKeyPress = edProxFocusKeyPress
    end
    object edNFISC: TEdit
      Left = 80
      Top = 144
      Width = 393
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 7
      OnKeyPress = edProxFocusKeyPress
    end
    object edFORNE: TEdit
      Left = 80
      Top = 168
      Width = 393
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 8
      OnKeyPress = edProxFocusKeyPress
    end
    object edDTINCOR: TcxDateEdit
      Left = 592
      Top = 72
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = 'dd/mm/yyyy'
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 9
      OnExit = edDTINCORExit
      OnKeyPress = edProxFocusKeyPress
      Width = 97
    end
    object edDESCR: TEdit
      Left = 80
      Top = 8
      Width = 393
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edDESCRExit
      OnKeyPress = edProxFocusKeyPress
    end
    object edDTAQUI: TcxDateEdit
      Left = 792
      Top = 72
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = 'dd/mm/yyyy'
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 10
      OnKeyPress = edProxFocusKeyPress
      Width = 97
    end
    object edGARAN: TcxDateEdit
      Left = 792
      Top = 96
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = 'dd/mm/yyyy'
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 12
      OnKeyPress = edProxFocusKeyPress
      Width = 97
    end
    object edIDPES: TMaskEdit
      Left = 80
      Top = 40
      Width = 89
      Height = 23
      Alignment = taRightJustify
      EditMask = '999.999.999-99;0;_'
      MaxLength = 14
      TabOrder = 2
      Text = ''
      OnChange = edIDPESChange
      OnEnter = edIDPESEnter
      OnExit = edIDPESExit
    end
    object cbIDPES: TcxLookupComboBox
      Left = 176
      Top = 40
      Properties.CharCase = ecUpperCase
      Properties.ImmediateDropDownWhenActivated = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Sorting = False
          Width = 100
          FieldName = 'descr2'
        end
        item
          SortOrder = soAscending
          Width = 50
          FieldName = 'ds_uni'
        end>
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dspes
      Properties.PostPopupValueOnTab = True
      Properties.OnEditValueChanged = cbIDPESPropertiesEditValueChanged
      TabOrder = 3
      Width = 537
    end
  end
  object pnIDUNI: TPanel
    Left = 0
    Top = 0
    Width = 1137
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1131
    object Label14: TLabel
      Left = 8
      Top = 16
      Width = 47
      Height = 15
      Caption = 'Loca'#231#227'o:'
    end
    object Label24: TLabel
      Left = 600
      Top = 16
      Width = 24
      Height = 15
      Caption = 'Obs.'
    end
    object cbIDUNI: TcxLookupComboBox
      Left = 176
      Top = 8
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          Width = 340
          FieldName = 'descr2'
        end
        item
          Width = 67
          FieldName = 'codpt'
        end>
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsuni
      Properties.PostPopupValueOnTab = True
      Properties.OnEditValueChanged = cbIDUNIPropertiesEditValueChanged
      TabOrder = 3
      OnDblClick = cbIDUNIDblClick
      OnKeyPress = edENTER_KeyPress
      Width = 409
    end
    object edPTUNI: TzeroEdit
      Left = 144
      Top = 8
      Width = 25
      Height = 23
      OnChange = edPTUNIChange
      OnExit = edIDUNIExit
      OnKeyPress = edENTER_KeyPress
      TabOrder = 2
      MaxLength = 3
    end
    object edIDUNI: TzeroEdit
      Left = 96
      Top = 8
      Width = 49
      Height = 23
      OnChange = edIDUNIChange
      OnExit = edIDUNIExit
      OnKeyPress = edProxFocusKeyPress
      TabOrder = 1
      MaxLength = 5
    end
    object edOBS2: TMemo
      Left = 632
      Top = 4
      Width = 393
      Height = 31
      TabOrder = 4
      OnEnter = edOBS2Enter
      OnExit = edOBS2Exit
    end
    object chUNI: TCheckBox
      Left = 72
      Top = 12
      Width = 23
      Height = 17
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 0
      OnClick = chUNIClick
    end
  end
  object gridMov: TcxGrid
    Left = 48
    Top = 352
    Width = 861
    Height = 232
    TabOrder = 3
    object gviewMov: TcxGridDBTableView
      OnDblClick = gviewMovDblClick
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      OnFocusedRecordChanged = gviewMovFocusedRecordChanged
      DataController.DataSource = dsRec
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.TranslateLike = True
      DataController.KeyFieldNames = 'id'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00 C;,0.00 D'
          Kind = skSum
          FieldName = 'valor'
          DisplayText = 'Total'
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soMultipleSelectedRecords]
      Filtering.ColumnPopupMode = fpmExcel
      FilterRow.InfoText = 'Clique aqui para definir Filtros'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsBehavior.CellHints = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvGroupRow, cbvColumnHeader]
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.ShowCheckBoxesDynamically = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FixedColumnSeparatorWidth = 1
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbAlways
      Preview.Place = ppTop
      Preview.Visible = True
      object colCOD: TcxGridDBColumn
        Caption = 'Patrim'#244'nio'
        DataBinding.FieldName = 'cod'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '00000'
        Properties.EditFormat = '00000;0;_'
        Properties.UseDisplayFormatWhenEditing = True
        Properties.ValueType = vtInt
        FixedKind = fkLeft
        Width = 85
      end
      object colDESCR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'descr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        SortIndex = 2
        SortOrder = soAscending
        Width = 250
      end
      object colSITUA: TcxGridDBColumn
        Caption = 'Situa'#231#227'o'
        DataBinding.FieldName = 'dssit_calc'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        OnCustomDrawCell = colSITUACustomDrawCell
        Width = 87
      end
      object colDSCAT: TcxGridDBColumn
        Caption = 'Categoria'
        DataBinding.FieldName = 'dscat_calc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        SortIndex = 1
        SortOrder = soAscending
        Width = 250
      end
      object colIDUNI: TcxGridDBColumn
        Caption = 'C'#243'd. Loc.'
        DataBinding.FieldName = 'cduni_calc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        Width = 70
      end
      object colDSUNI: TcxGridDBColumn
        Caption = 'Loca'#231#227'o'
        DataBinding.FieldName = 'dsuni_calc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        SortIndex = 0
        SortOrder = soAscending
        Width = 250
      end
      object colDSPES: TcxGridDBColumn
        Caption = 'Promotor'
        DataBinding.FieldName = 'dspes_calc'
        Width = 250
      end
      object gviewMovColumn1: TcxGridDBColumn
        Caption = 'Dt. Incorp.'
        DataBinding.FieldName = 'dt_incorp'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 90
      end
      object gviewMovColumn2: TcxGridDBColumn
        Caption = 'Dt. Aquisi'#231#227'o'
        DataBinding.FieldName = 'dt_aqui'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 90
      end
      object gviewMovdt_comp: TcxGridDBColumn
        Caption = 'Dt. Compra'
        DataBinding.FieldName = 'dt_comp'
        Width = 90
      end
      object gviewMovvl_comp: TcxGridDBColumn
        Caption = 'Vl. Compra'
        DataBinding.FieldName = 'vl_comp'
        Width = 120
      end
      object gviewMovmodel: TcxGridDBColumn
        Caption = 'Modelo'
        DataBinding.FieldName = 'model'
        Width = 78
      end
      object gviewMovnfisc: TcxGridDBColumn
        Caption = 'Nota Fiscal'
        DataBinding.FieldName = 'nfisc'
        Width = 83
      end
      object gviewMovforne: TcxGridDBColumn
        Caption = 'Fornecedor'
        DataBinding.FieldName = 'forne'
        Width = 90
      end
      object colOBS: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'obs'
        Width = 300
      end
      object colID: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
    end
    object glevelMov: TcxGridLevel
      GridView = gviewMov
    end
  end
  object pnIDCAT: TPanel
    Left = 0
    Top = 41
    Width = 1137
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1131
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 54
      Height = 15
      Caption = 'Categoria:'
    end
    object edIDCAT: TzeroEdit
      Left = 80
      Top = 8
      Width = 57
      Height = 23
      OnChange = edIDCATChange
      OnExit = edIDCATExit
      OnKeyPress = edProxFocusKeyPress
      TabOrder = 0
      MaxLength = 5
    end
    object cbIDCAT: TcxLookupComboBox
      Left = 144
      Top = 8
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          FieldName = 'descr2'
        end
        item
          FieldName = 'cod'
        end>
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dscat
      Properties.PostPopupValueOnTab = True
      Properties.OnEditValueChanged = cbIDCATPropertiesEditValueChanged
      TabOrder = 1
      OnKeyPress = edProxFocusKeyPress
      Width = 369
    end
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyRec
    Left = 46
    Top = 442
  end
  object qyRec: TFDQuery
    OnCalcFields = qyRecCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbInvent')
    Left = 96
    Top = 440
    object qyReccdcat_calc: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'cdcat_calc'
      Size = 6
    end
    object qyRecdscat_calc: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'dscat_calc'
      Size = 50
    end
    object qyReccduni_calc: TStringField
      DisplayWidth = 8
      FieldKind = fkInternalCalc
      FieldName = 'cduni_calc'
      Size = 8
    end
    object qyRecdsuni_calc: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'dsuni_calc'
      Size = 50
    end
    object qyRecdt_comp: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_comp'
      Origin = 'dt_comp'
    end
    object qyRecvl_comp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vl_comp'
      Origin = 'vl_comp'
      DisplayFormat = ',0.00'
      Precision = 12
      Size = 2
    end
    object qyRecvid_util: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'vid_util'
      Origin = 'vid_util'
    end
    object qyRecid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyRecdescr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descr'
      Origin = 'descr'
      Size = 255
    end
    object qyRecnrser: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nrser'
      Origin = 'nrser'
      Size = 50
    end
    object qyRecsitua: TStringField
      FieldKind = fkCalculated
      FieldName = 'dssit_calc'
      Calculated = True
    end
    object qyRecdspes_calc: TStringField
      FieldKind = fkCalculated
      FieldName = 'dspes_calc'
      Size = 50
      Calculated = True
    end
  end
  object dscat: TDataSource
    AutoEdit = False
    DataSet = qycat
    Left = 600
    Top = 321
  end
  object qycat: TFDQuery
    OnCalcFields = qycatCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, cod, descr, ativo from tbcateg limit 1')
    Left = 656
    Top = 320
    object qycatdescr2: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'descr2'
      Size = 50
    end
  end
  object dsuni: TDataSource
    AutoEdit = False
    DataSet = qyuni
    Left = 608
    Top = 424
  end
  object qyuni: TFDQuery
    OnCalcFields = qyuniCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    SQL.Strings = (
      
        'select id, codpt, descr, cod, ponto, ativo from tbunidades limit' +
        ' 1')
    Left = 656
    Top = 400
    object qyunidescr2: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'descr2'
      Size = 50
    end
    object qyunicodpt: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'codpt'
      EditMask = '9999.99;0;_'
      Size = 6
    end
    object qyuniid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object frxDBR: TfrxDBDataset
    UserName = 'tbinv'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdcat_calc=cdcat_calc'
      'dscat_calc=categ'
      'cduni_calc=cod_local'
      'dsuni_calc=local'
      'dt_comp=dt_comp'
      'vl_comp=vl_comp'
      'vid_util=vid_util'
      'id=id'
      'descr=descr'
      'nrser=nrser')
    DataSource = dsRec
    BCDToCurrency = False
    DataSetOptions = []
    Left = 208
    Top = 168
  end
  object dspes: TDataSource
    AutoEdit = False
    DataSet = qypes
    Left = 296
    Top = 353
  end
  object qypes: TFDQuery
    OnCalcFields = qypesCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select id, id_uni, nr_ins, descr, ativo from tbpessoal where tp_' +
        'pes=0 and ativo >= 0;')
    Left = 352
    Top = 352
    object qypesdescr2: TStringField
      FieldKind = fkCalculated
      FieldName = 'descr2'
      Size = 60
      Calculated = True
    end
    object qypesid_uni: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'id_uni'
      Origin = 'id_uni'
    end
    object qypesds_uni: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_uni'
      LookupDataSet = qyuni
      LookupKeyFields = 'id'
      LookupResultField = 'descr2'
      KeyFields = 'id_uni'
      Size = 50
      Lookup = True
    end
  end
end
