object fcadUnidades: TfcadUnidades
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de Unidades'
  ClientHeight = 553
  ClientWidth = 989
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 47
    Height = 15
    Caption = 'Unidade:'
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
    Left = 32
    Top = 32
    Width = 40
    Height = 15
    Caption = 'Prefixo:'
  end
  object Label3: TLabel
    Left = 32
    Top = 192
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
  end
  object Label4: TLabel
    Left = 360
    Top = 120
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object Label6: TLabel
    Left = 40
    Top = 128
    Width = 40
    Height = 15
    Caption = 'Cidade:'
  end
  object Label7: TLabel
    Left = 56
    Top = 160
    Width = 17
    Height = 15
    Caption = 'UF:'
  end
  object Label8: TLabel
    Left = 160
    Top = 32
    Width = 35
    Height = 15
    Caption = 'Ponto:'
  end
  object Label9: TLabel
    Left = 192
    Top = 192
    Width = 30
    Height = 15
    Caption = 'N'#237'vel:'
  end
  object Label11: TLabel
    Left = 32
    Top = 96
    Width = 45
    Height = 15
    Caption = 'Empresa'
  end
  object edDESCR: TEdit
    Left = 88
    Top = 56
    Width = 473
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 3
    TextHint = '(UNIDADE)'
    OnChange = edDESCRChange
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
    TabOrder = 2
    Visible = False
  end
  object edCod: TzeroEdit
    Left = 88
    Top = 24
    Width = 57
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 0
    MaxLength = 5
  end
  object cbAtivo: TComboBox
    Left = 88
    Top = 184
    Width = 82
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 1
    TabOrder = 8
    Text = 'ATIVO'
    Items.Strings = (
      'INATIVO'
      'ATIVO')
  end
  object edObs: TMemo
    Left = 440
    Top = 120
    Width = 329
    Height = 97
    TabOrder = 10
  end
  object edLocal: TEdit
    Left = 88
    Top = 120
    Width = 218
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 6
    TextHint = '(LOCAL)'
    OnKeyPress = edProxFocusKeyPress
  end
  object cbUF: TComboBox
    Left = 88
    Top = 152
    Width = 82
    Height = 23
    Style = csDropDownList
    ItemIndex = 9
    TabOrder = 7
    Text = 'MA'
    OnKeyPress = edENTER_KeyPress
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object cbNIVEL: TcxLookupComboBox
    Left = 232
    Top = 184
    Enabled = False
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'descr'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsNiv
    Properties.PostPopupValueOnTab = True
    TabOrder = 9
    Width = 193
  end
  object gridRec: TcxGrid
    Left = 0
    Top = 224
    Width = 989
    Height = 329
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 11
    ExplicitWidth = 983
    ExplicitHeight = 320
    object viewRec: TcxGridDBTableView
      OnDblClick = viewRecDblClick
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsRec
      DataController.KeyFieldNames = 'id'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnFilterRecord = viewRecDataControllerFilterRecord
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object viewReccod: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'cod'
        Width = 59
      end
      object viewRecponto: TcxGridDBColumn
        Caption = 'Pt.'
        DataBinding.FieldName = 'ponto'
        Width = 40
      end
      object colDESCR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'descr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        Width = 300
      end
      object viewRecColumn1: TcxGridDBColumn
        Caption = 'Empresa'
        DataBinding.FieldName = 'calc_dsemp'
        Width = 300
      end
      object viewReclocal: TcxGridDBColumn
        Caption = 'Cidade'
        DataBinding.FieldName = 'local'
        Width = 187
      end
      object viewRecuf: TcxGridDBColumn
        Caption = 'UF'
        DataBinding.FieldName = 'uf'
        Width = 34
      end
      object viewRecobs: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'obs'
        Width = 300
      end
      object colSIT: TcxGridDBColumn
        Caption = 'Situa'#231#227'o'
        DataBinding.FieldName = 'ativo'
        OnCustomDrawCell = colSITCustomDrawCell
        Width = 71
      end
      object viewRecnivel: TcxGridDBColumn
        Caption = 'N'#237'vel'
        DataBinding.FieldName = 'ds_nivel'
        Visible = False
        Width = 100
      end
      object colNivel: TcxGridDBColumn
        DataBinding.FieldName = 'nivel'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object levelRec: TcxGridLevel
      GridView = viewRec
    end
  end
  object cbIDEMP: TcxLookupComboBox
    Left = 208
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
    TabOrder = 5
    OnKeyPress = edProxFocusKeyPress
    Width = 385
  end
  object edIDEMP: TEdit
    Left = 88
    Top = 88
    Width = 114
    Height = 23
    Alignment = taRightJustify
    TabOrder = 4
    OnChange = edIDEMPChange
    OnExit = edIDEMPExit
    OnKeyPress = edProxFocusKeyPress
  end
  object edPONTO: TzeroEdit
    Left = 200
    Top = 24
    Width = 33
    Height = 23
    OnExit = edPONTOExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 1
    MaxLength = 3
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyRec
    Left = 598
    Top = 14
  end
  object qyRec: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbUnidades')
    Left = 535
    Top = 16
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
      Size = 5
    end
    object qyRecponto: TStringField
      FieldName = 'ponto'
      Origin = 'ponto'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qyReccodpt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codpt'
      Origin = 'codpt'
      FixedChar = True
      Size = 6
    end
    object qyRecdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 255
    end
    object qyReclocal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'local'
      Origin = 'local'
      Size = 50
    end
    object qyRecuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object qyRecfone1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone1'
      Origin = 'fone1'
      Size = 15
    end
    object qyRecobs: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      Size = 255
    end
    object qyRecativo: TShortintField
      Alignment = taCenter
      FieldName = 'ativo'
      Origin = 'ativo'
      Required = True
      OnGetText = qyRecativoGetText
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
    object qyRecnivel: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'nivel'
      Origin = 'nivel'
    end
    object qyRecds_nivel: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_nivel'
      LookupDataSet = qyNiv
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'nivel'
      Size = 30
      Lookup = True
    end
    object qyRecid_emp: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'id_emp'
      Origin = 'id_emp'
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
  object dsNiv: TDataSource
    AutoEdit = False
    DataSet = qyNiv
    Left = 824
    Top = 88
  end
  object qyNiv: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select id, descr from tbusuarionivel order by id')
    Left = 832
    Top = 152
    object qyNivid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyNivdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 50
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
    Left = 656
    Top = 48
  end
  object dsemp: TDataSource
    AutoEdit = False
    DataSet = qyemp
    Left = 704
    Top = 48
  end
end
