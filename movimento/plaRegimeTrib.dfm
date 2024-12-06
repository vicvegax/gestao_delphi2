object fplRegimeTrib: TfplRegimeTrib
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Regime Tribut'#225'rio'
  ClientHeight = 649
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object gridMov: TcxGrid
    Left = 72
    Top = 48
    Width = 881
    Height = 409
    TabOrder = 1
    object viewFatura: TcxGridDBTableView
      OnDblClick = viewFaturaDblClick
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsfat
      DataController.KeyFieldNames = 'nfe'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object viewFaturaid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
      object viewFaturaColumn1: TcxGridDBColumn
        Caption = 'Ano'
        DataBinding.FieldName = 'ano'
        Width = 56
      end
      object viewFaturaColumn2: TcxGridDBColumn
        Caption = 'M'#234's'
        DataBinding.FieldName = 'mes'
        Width = 48
      end
      object viewFaturanfe: TcxGridDBColumn
        Caption = 'NF-e'
        DataBinding.FieldName = 'nfe'
        SortIndex = 0
        SortOrder = soAscending
        Width = 73
      end
      object viewFaturadtemi: TcxGridDBColumn
        Caption = 'Data NF'
        DataBinding.FieldName = 'dtemi'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Width = 110
      end
      object colValor: TcxGridDBColumn
        Caption = 'Receita Bruta'
        DataBinding.FieldName = 'valor'
        Width = 120
      end
      object colUANO: TcxGridDBColumn
        Caption = #218'lt. 12 Meses'
        DataBinding.FieldName = 'ult12'
        Width = 120
      end
      object colISS: TcxGridDBColumn
        Caption = 'ISS'
        DataBinding.FieldName = 'vliss'
        Width = 120
      end
      object colIRPJRet: TcxGridDBColumn
        Caption = 'IRPJ - Retido'
        DataBinding.FieldName = 'vlirpj_ret'
        Width = 120
      end
      object viewFaturames: TcxGridDBColumn
        Caption = 'Compet.'
        DataBinding.FieldName = 'compt'
        Options.Filtering = False
        Options.Sorting = False
        Width = 71
      end
      object viewFaturavlpis: TcxGridDBColumn
        DataBinding.FieldName = 'vlpis'
        Visible = False
      end
      object viewFaturavlcofins: TcxGridDBColumn
        DataBinding.FieldName = 'vlcofins'
        Visible = False
      end
      object viewFaturavlcsll: TcxGridDBColumn
        DataBinding.FieldName = 'vlcsll'
        Visible = False
      end
      object viewFaturavlirpj: TcxGridDBColumn
        DataBinding.FieldName = 'vlirpj'
        Visible = False
      end
      object viewFaturavladic1: TcxGridDBColumn
        DataBinding.FieldName = 'vladic1'
        Visible = False
      end
    end
    object viewTrim: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCustomDrawCell = viewTrimCustomDrawCell
      DataController.DataSource = dstri
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object viewTrimmes: TcxGridDBColumn
        Caption = 'MESES'
        DataBinding.FieldName = 'dsmes'
        Width = 135
      end
      object viewTrimreceita: TcxGridDBColumn
        Caption = 'RECEITA'
        DataBinding.FieldName = 'receita'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 100
      end
      object viewTrimpis: TcxGridDBColumn
        Caption = '1=PIS'
        DataBinding.FieldName = 'pis'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimcofins: TcxGridDBColumn
        Caption = '2=COFINS'
        DataBinding.FieldName = 'cofins'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimcsll: TcxGridDBColumn
        Caption = '3=CSLL'
        DataBinding.FieldName = 'csll'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimirpj: TcxGridDBColumn
        Caption = '4=IRPJ'
        DataBinding.FieldName = 'irpj'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimadic: TcxGridDBColumn
        Caption = '5=ADICIONAL'
        DataBinding.FieldName = 'adic'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimColumn3: TcxGridDBColumn
        Caption = '6=TOTAL (4+5)'
        DataBinding.FieldName = 'tot'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimret: TcxGridDBColumn
        Caption = '7=RETEN'#199#195'O'
        DataBinding.FieldName = 'ret'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimColumn4: TcxGridDBColumn
        Caption = '8=RECOL. (6-7)'
        DataBinding.FieldName = 'rec'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimiss: TcxGridDBColumn
        Caption = '9=ISS MENSAL'
        DataBinding.FieldName = 'iss'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 90
      end
      object viewTrimColumn1: TcxGridDBColumn
        Caption = 'TOTAL GERAL'
        DataBinding.FieldName = 'geral'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 100
      end
      object viewTrimColumn2: TcxGridDBColumn
        Caption = '%'
        DataBinding.FieldName = 'perc'
        OnGetDisplayText = viewTrimreceitaGetDisplayText
        Width = 60
      end
      object colTIPO: TcxGridDBColumn
        DataBinding.FieldName = 'tipo'
        VisibleForCustomization = False
      end
    end
    object levelFatura: TcxGridLevel
      GridView = viewFatura
    end
    object levelTrim: TcxGridLevel
      GridView = viewTrim
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 495
    Width = 1016
    Height = 154
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 486
    ExplicitWidth = 1010
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 62
      Height = 15
      Caption = 'Acumulado'
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 201
      Height = 15
      Caption = 'Exclus'#227'o: (-) Meses/Ano Anterior (at'#233')'
    end
    object Label3: TLabel
      Left = 76
      Top = 72
      Width = 69
      Height = 15
      Caption = '(-) M'#234's Atual'
    end
    object Label4: TLabel
      Left = 24
      Top = 104
      Width = 90
      Height = 15
      Caption = 'Total da Exclus'#227'o'
    end
    object Label5: TLabel
      Left = 24
      Top = 128
      Width = 192
      Height = 15
      Caption = 'Total Acumulado - '#250'ltimos 12 meses'
    end
    object edAcumulado: TvalorEdit
      Left = 264
      Top = 16
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 0
    end
    object edExcAnterior: TvalorEdit
      Left = 264
      Top = 40
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 1
    end
    object edExcAtual: TvalorEdit
      Left = 264
      Top = 64
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object edExcTotal: TvalorEdit
      Left = 264
      Top = 96
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 3
    end
    object edAcumTotal: TvalorEdit
      Left = 264
      Top = 120
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 4
    end
    object btModo: TButton
      Left = 400
      Top = 104
      Width = 137
      Height = 41
      Caption = 'Lucro Presumido'
      TabOrder = 5
      OnClick = btModoClick
    end
    object btAdicValor: TButton
      Left = 400
      Top = 16
      Width = 137
      Height = 41
      Caption = 'Adicionar Valor'
      TabOrder = 6
      OnClick = btAdicValorClick
    end
    object btPDF: TButton
      Left = 584
      Top = 112
      Width = 137
      Height = 33
      Caption = 'Exportar PDF'
      TabOrder = 7
      OnClick = btExportClick
    end
    object btXLS: TButton
      Tag = 1
      Left = 728
      Top = 112
      Width = 137
      Height = 33
      Caption = 'Exportar Excel'
      TabOrder = 8
      OnClick = btExportClick
    end
  end
  object pnBARRA: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1010
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 48
      Height = 15
      Caption = 'Empresa:'
    end
    object Label6: TLabel
      Left = 592
      Top = 16
      Width = 71
      Height = 15
      Caption = 'Compet'#234'ncia'
    end
    object cbIDEMP: TcxLookupComboBox
      Left = 184
      Top = 8
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
      TabOrder = 1
      Width = 385
    end
    object edIDEMP: TEdit
      Left = 64
      Top = 8
      Width = 114
      Height = 23
      Alignment = taRightJustify
      TabOrder = 0
      OnChange = edIDEMPChange
      OnExit = edIDEMPExit
    end
    object cbANO: TComboBox
      Left = 672
      Top = 10
      Width = 105
      Height = 23
      Style = csDropDownList
      TabOrder = 2
      OnSelect = cbANOSelect
    end
    object btCfg: TBitBtn
      Left = 792
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Config. Encargos'
      TabOrder = 3
      OnClick = btCfgClick
    end
  end
  object qyfat: TFDQuery
    AutoCalcFields = False
    BeforePost = qyfatBeforePost
    OnCalcFields = qyfatCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    MasterSource = DM.DSCAT
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from plfatura')
    Left = 432
    Top = 136
    object qyfatid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fatvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvliss: TBCDField
      FieldName = 'vliss'
      Origin = 'vliss'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvlirpj_ret: TBCDField
      FieldName = 'vlirpj_ret'
      Origin = 'vlirpj_ret'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvlpis: TBCDField
      FieldName = 'vlpis'
      Origin = 'vlpis'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvlcofins: TBCDField
      FieldName = 'vlcofins'
      Origin = 'vlcofins'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvlcsll: TBCDField
      FieldName = 'vlcsll'
      Origin = 'vlcsll'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvlirpj: TBCDField
      FieldName = 'vlirpj'
      Origin = 'vlirpj'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvladic1: TBCDField
      FieldName = 'vladic1'
      Origin = 'vladic1'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvladic2: TBCDField
      FieldName = 'vladic2'
      Origin = 'vladic2'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatvladic3: TBCDField
      FieldName = 'vladic3'
      Origin = 'vladic3'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatmes: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'compt'
      Origin = 'compt'
      EditMask = '99/9999;0;_'
      Size = 6
    end
    object fatUANO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ult12'
      Origin = 'ult12'
      DisplayFormat = ',0.00'
      Precision = 14
    end
    object fatAnoCompt: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'ano'
      DisplayFormat = '0000'
    end
    object fatMesCompt: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'mes'
      DisplayFormat = '00'
    end
    object qyfatdtinc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dtinc'
      Origin = 'dtinc'
    end
    object qyfatdtexc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dtexc'
      Origin = 'dtexc'
    end
    object qyfatdtalt: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dtalt'
      Origin = 'dtalt'
    end
    object fatdtemi: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtemi'
      Origin = 'dtemi'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyfatcalc_compt: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_compt'
      Size = 8
      Calculated = True
    end
    object qyfatidemp: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'idemp'
      Origin = 'idemp'
    end
    object qyfatnfe: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'nfe'
      Origin = 'nfe'
    end
  end
  object qycfg: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from cfgfatura where id=1')
    Left = 536
    Top = 120
    object cfgid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cfgiss: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'iss'
      Origin = 'iss'
      Precision = 4
      Size = 2
    end
    object cfgirpj_ret: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'irpj_ret'
      Origin = 'irpj_ret'
      Precision = 4
      Size = 2
    end
    object cfgpis: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pis'
      Origin = 'pis'
      Precision = 4
      Size = 2
    end
    object cfgcofins: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'cofins'
      Origin = 'cofins'
      Precision = 4
      Size = 2
    end
    object cfgcsll: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'csll'
      Origin = 'csll'
      Precision = 4
      Size = 2
    end
    object cfgirpj: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'irpj'
      Origin = 'irpj'
      Precision = 4
      Size = 2
    end
    object cfgadic1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'adic1'
      Origin = 'adic1'
      Precision = 4
      Size = 2
    end
    object cfgadic2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'adic2'
      Origin = 'adic2'
      Precision = 4
      Size = 2
    end
    object cfgadic3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'adic3'
      Origin = 'adic3'
      Precision = 4
      Size = 2
    end
    object cfgabat1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abat1'
      Origin = 'abat1'
      Precision = 12
      Size = 2
    end
    object cfgabat2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'abat2'
      Origin = 'abat2'
      Precision = 12
      Size = 2
    end
    object qycfgidemp: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'idemp'
      Origin = 'idemp'
    end
    object qycfgano: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ano'
      Origin = 'ano'
    end
    object cfgcalc_adic1: TStringField
      FieldName = 'calc_adic1'
      Origin = 'calc_adic1'
      Required = True
      Size = 255
    end
    object qycfgdtinc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dtinc'
      Origin = 'dtinc'
    end
  end
  object dsfat: TDataSource
    AutoEdit = False
    DataSet = qyfat
    Left = 356
    Top = 136
  end
  object dstri: TDataSource
    AutoEdit = False
    DataSet = tbtri
    Left = 292
    Top = 272
  end
  object qry: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      
        'SELECT month(dtemi) as mes, sum(valor) as receita, sum(vlpis) as' +
        ' pis, sum(vlcofins) as cofins, sum(vlcsll) as csll, sum(vlirpj) ' +
        'as irpj, sum(vladic1) as adic, sum(vlirpj_ret) as ret, sum(vliss' +
        ') as iss from plfatura limit 1')
    Left = 432
    Top = 208
  end
  object tbtri: TFDMemTable
    AutoCalcFields = False
    OnCalcFields = tbtriCalcFields
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 352
    Top = 272
    object flmes: TIntegerField
      FieldName = 'mes'
    end
    object flreceita: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'receita'
      DisplayFormat = ',0.00;-,0.00'
    end
    object flpis: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'pis'
      DisplayFormat = ',0.00;-,0.00'
    end
    object flcofins: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'cofins'
      DisplayFormat = ',0.00;-,0.00'
    end
    object flcsll: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'csll'
      DisplayFormat = ',0.00;-,0.00'
    end
    object flirpj: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'irpj'
      DisplayFormat = ',0.00;-,0.00'
    end
    object fladic: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'adic'
      DisplayFormat = ',0.00;-,0.00'
    end
    object tbtritot: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'tot'
      DisplayFormat = ',0.00;-,0.00'
      Calculated = True
    end
    object flret: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'ret'
      DisplayFormat = ',0.00;-,0.00'
    end
    object tbtrirec: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'rec'
      DisplayFormat = ',0.00;-,0.00'
      Calculated = True
    end
    object fliss: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'iss'
      DisplayFormat = ',0.00;-,0.00'
    end
    object fldsmes: TStringField
      FieldName = 'dsmes'
    end
    object trigeral: TCurrencyField
      FieldName = 'geral'
      DisplayFormat = ',0.00'
    end
    object triperc: TFloatField
      FieldName = 'perc'
      DisplayFormat = ',0.00;;'
    end
    object fltipo: TSmallintField
      FieldName = 'tipo'
    end
  end
  object dsemp: TDataSource
    AutoEdit = False
    DataSet = qyemp
    Left = 736
    Top = 120
  end
  object qyemp: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, cod, nrins, descr from tbempresas limit 1')
    Left = 680
    Top = 120
  end
  object frxdbFAT: TfrxDBDataset
    UserName = 'TBFAT'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'nfe=nfe'
      'valor=valor'
      'vliss=vliss'
      'vlirpj_ret=vlirpj_ret'
      'vlpis=vlpis'
      'vlcofins=vlcofins'
      'vlcsll=vlcsll'
      'vlirpj=vlirpj'
      'vladic1=vladic1'
      'vladic2=vladic2'
      'vladic3=vladic3'
      '-compt=compt2'
      'ult12=ult12'
      'ano=ano'
      'mes=mes'
      'idemp=idemp'
      'dtinc=dtinc'
      'dtexc=dtexc'
      'dtalt=dtalt'
      'dtemi=dtemi'
      'calc_compt=compt')
    OpenDataSource = False
    DataSource = dsfat
    BCDToCurrency = False
    DataSetOptions = []
    Left = 208
    Top = 168
  end
  object frxdbTRI: TfrxDBDataset
    UserName = 'TBTRI'
    CloseDataSource = False
    FieldAliases.Strings = (
      'mes=mes'
      'receita=receita'
      'pis=pis'
      'cofins=cofins'
      'csll=csll'
      'irpj=irpj'
      'adic=adic'
      'tot=tot'
      'ret=ret'
      'rec=rec'
      'iss=iss'
      'dsmes=dsmes'
      'geral=geral'
      'perc=perc'
      'tipo=tipo')
    OpenDataSource = False
    DataSource = dstri
    BCDToCurrency = False
    DataSetOptions = []
    Left = 192
    Top = 264
  end
end
