object fDadosContrato: TfDadosContrato
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Dados de Contratos'
  ClientHeight = 642
  ClientWidth = 981
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
    Left = 16
    Top = 96
    Width = 945
    Height = 549
    TabOrder = 0
    LookAndFeel.ScrollbarMode = sbmClassic
    object viewMov: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnEditing = viewMovEditing
      DataController.DataSource = DSREC
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopupMode = fpmExcel
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object colSIT: TcxGridDBColumn
        Caption = 'Sit.'
        DataBinding.FieldName = 'sit'
        OnCustomDrawCell = colSITCustomDrawCell
        FixedKind = fkLeft
        Options.Editing = False
        Options.Filtering = False
        Width = 30
      end
      object colDSUNI: TcxGridDBColumn
        Caption = 'Centro de Custo'
        DataBinding.FieldName = 'dsuni'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        FixedKind = fkLeft
        Options.Editing = False
        Options.FilterRowOperator = foContains
        SortIndex = 0
        SortOrder = soAscending
        Width = 200
      end
      object colDSPES: TcxGridDBColumn
        Caption = 'Favorecido'
        DataBinding.FieldName = 'dspes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 215
      end
      object colDSEVE: TcxGridDBColumn
        Caption = 'Evento'
        DataBinding.FieldName = 'dseve'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.Editing = False
        Options.FilterRowOperator = foContains
        SortIndex = 1
        SortOrder = soAscending
        Width = 174
      end
      object colNRCTR: TcxGridDBColumn
        Caption = 'Nr. Contrato'
        DataBinding.FieldName = 'nrctr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.CharCase = ecUpperCase
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 132
      end
      object colDSTPD: TcxGridDBColumn
        Caption = 'Tipo de Documento'
        DataBinding.FieldName = 'dstpd'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 132
      end
      object colMES1: TcxGridDBColumn
        DataBinding.FieldName = 'mes1'
        OnCustomDrawCell = colMES1CustomDrawCell
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 90
      end
      object viewMovColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'venc1'
        OnCustomDrawCell = colMES1CustomDrawCell
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
      end
      object viewMovent1: TcxGridDBColumn
        Caption = 'Entregue'
        DataBinding.FieldName = 'ent1'
        Visible = False
        OnCustomDrawCell = colMES1CustomDrawCell
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 90
      end
      object colMES2: TcxGridDBColumn
        DataBinding.FieldName = 'mes2'
        OnCustomDrawCell = colMES2CustomDrawCell
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 90
      end
      object viewMovColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'venc2'
        OnCustomDrawCell = colMES2CustomDrawCell
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
      end
      object viewMovent2: TcxGridDBColumn
        Caption = 'Entregue'
        DataBinding.FieldName = 'ent2'
        Visible = False
        OnCustomDrawCell = colMES2CustomDrawCell
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 90
      end
      object colIDATA: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'infodata'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ImmediatePost = True
        Width = 85
      end
      object colIINSC: TcxGridDBColumn
        Caption = 'CPF/CNPJ'
        DataBinding.FieldName = 'infoinsc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnChange = colIINSCPropertiesChange
        Width = 110
      end
      object colIEMAIL: TcxGridDBColumn
        Caption = 'e-mail'
        DataBinding.FieldName = 'infoemail'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecLowerCase
        Width = 300
      end
      object colIOBS: TcxGridDBColumn
        Caption = 'obs.'
        DataBinding.FieldName = 'info4'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 300
      end
      object colMES3: TcxGridDBColumn
        DataBinding.FieldName = 'mes3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnChange = colMES3PropertiesChange
        FixedKind = fkRight
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 90
      end
      object colVENC3: TcxGridDBColumn
        DataBinding.FieldName = 'venc3'
        FixedKind = fkRight
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
      end
      object colENT3: TcxGridDBColumn
        Caption = 'Dt. Entreg.'
        DataBinding.FieldName = 'ent3'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ClearKey = 46
        Properties.DateButtons = [btnClear, btnToday]
        Properties.ImmediatePost = True
        Properties.PostPopupValueOnTab = True
        Properties.ShowTime = False
        FixedKind = fkRight
        Options.Focusing = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 90
      end
      object viewMovColumn3: TcxGridDBColumn
        Caption = 'Entregue'
        DataBinding.FieldName = 'entreg'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'SIM'
          'N'#195'O')
        OnCustomDrawCell = viewMovColumn3CustomDrawCell
        FixedKind = fkRight
        Options.Editing = False
        Width = 57
      end
      object colCheck: TcxGridDBColumn
        Caption = 'Confirma'
        DataBinding.FieldName = 'check'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'Entregue'
        Properties.DisplayUnchecked = 'N'#227'o Entregue'
        Properties.ImmediatePost = True
        Properties.ValidationOptions = []
        Properties.ValueGrayed = False
        Properties.OnEditValueChanged = colCheckPropertiesEditValueChanged
        FixedKind = fkRight
        Options.Filtering = False
        Options.FilteringPopupMode = fpmExcel
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 70
      end
      object colID: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
      end
    end
    object gridMovLevel1: TcxGridLevel
      GridView = viewMov
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 981
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 975
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 25
      Height = 15
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 216
      Top = 16
      Width = 25
      Height = 15
      Caption = 'Ano:'
    end
    object cbMES: TComboBox
      Left = 56
      Top = 8
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cbMESSelect
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object edANO: TcxSpinEdit
      Left = 256
      Top = 8
      Properties.OnChange = edANOPropertiesChange
      TabOrder = 1
      Width = 81
    end
    object BitBtn1: TBitBtn
      Left = 352
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 856
      Top = 8
      Width = 129
      Height = 25
      Caption = 'Teste de Export XLSX'
      TabOrder = 3
      Visible = False
      OnClick = Button1Click
    end
  end
  object DSREC: TDataSource
    DataSet = TBR
    Left = 184
    Top = 200
  end
  object qyrec: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      
        'SELECT id, id_ctr, id_uni, id_eve, id_pes, id_tpd, st_mov, st_fi' +
        'm, vl_bas, dt_ven, dt_entreg, us_entreg FROM plmovimento LIMIT 1')
    Left = 248
    Top = 200
  end
  object QYUNI: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'SELECT id, descr from tbunidades')
    Left = 216
    Top = 336
  end
  object QYEVE: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'SELECT id, descr from tbeventos')
    Left = 216
    Top = 408
  end
  object QYCTR: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'SELECT id, nr_contrato from plcontratos')
    Left = 344
    Top = 360
  end
  object TBR: TFDMemTable
    AutoCalcFields = False
    AfterEdit = TBRAfterEdit
    BeforePost = TBRBeforePost
    OnCalcFields = TBRCalcFields
    Filtered = True
    Filter = 'mes3 is not null'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 392
    Top = 240
    object TBRideve: TIntegerField
      FieldName = 'ideve'
    end
    object TBRiduni: TIntegerField
      FieldName = 'iduni'
    end
    object TBRidctr: TIntegerField
      FieldName = 'idctr'
    end
    object TBRmes1: TBCDField
      FieldName = 'mes1'
      DisplayFormat = ',0.00'
    end
    object TBRent1: TDateField
      FieldName = 'ent1'
    end
    object TBRmes2: TBCDField
      FieldName = 'mes2'
      DisplayFormat = ',0.00'
    end
    object TBRent2: TDateField
      FieldName = 'ent2'
    end
    object TBRmes3: TBCDField
      FieldName = 'mes3'
      DisplayFormat = ',0.00'
    end
    object TBRent3: TDateField
      Alignment = taRightJustify
      FieldName = 'ent3'
    end
    object TBRcheck: TBooleanField
      FieldName = 'check'
    end
    object TBRid: TLongWordField
      FieldName = 'id'
    end
    object TBRvenc1: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Venc.'
      FieldName = 'venc1'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TBRvenc2: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Venc.'
      FieldName = 'venc2'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TBRvenc3: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Venc.'
      FieldName = 'venc3'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TBRsit: TStringField
      Alignment = taCenter
      FieldName = 'sit'
      Size = 1
    end
    object TBRdsuni: TStringField
      FieldName = 'dsuni'
      Size = 100
    end
    object TBRnrctr: TStringField
      Alignment = taRightJustify
      FieldName = 'nrctr'
      Size = 30
    end
    object TBRdseve: TStringField
      FieldName = 'dseve'
      Size = 100
    end
    object TBRdspes: TStringField
      FieldName = 'dspes'
      Size = 100
    end
    object TBRdstpd: TStringField
      FieldName = 'dstpd'
      Size = 100
    end
    object TBRinfodata: TDateField
      Tag = 1
      FieldName = 'infodata'
      OnChange = TBRinfodataChange
    end
    object TBRinfoinsc: TStringField
      Tag = 2
      FieldName = 'infoinsc'
      OnChange = TBRinfodataChange
      OnGetText = TBRinfoinscGetText
      Size = 14
    end
    object TBRinfoemail: TStringField
      Tag = 3
      FieldName = 'infoemail'
      OnChange = TBRinfodataChange
      Size = 255
    end
    object TBRinfo4: TStringField
      Tag = 4
      FieldName = 'info4'
      OnChange = TBRinfodataChange
      Size = 255
    end
    object TBRentreg: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'entreg'
      Size = 3
      Calculated = True
    end
  end
  object QYPES: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'SELECT id, descr from tbeventos')
    Left = 216
    Top = 472
  end
  object QYTPD: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'SELECT id, descr from tbeventos')
    Left = 208
    Top = 536
  end
end
