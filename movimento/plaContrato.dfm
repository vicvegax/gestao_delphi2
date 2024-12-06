object fPlaContrato: TfPlaContrato
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Contratos'
  ClientHeight = 651
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 610
    Width = 984
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 601
    ExplicitWidth = 978
    object btLanc: TButton
      Left = 16
      Top = 8
      Width = 145
      Height = 25
      Caption = 'Novo Contrato'
      TabOrder = 0
      OnClick = btLancClick
    end
    object btExcluir: TBitBtn
      Left = 320
      Top = 8
      Width = 145
      Height = 25
      Caption = 'Excluir Contrato'
      TabOrder = 2
      OnClick = btExcluirClick
    end
    object btAltera: TButton
      Left = 168
      Top = 8
      Width = 145
      Height = 25
      Caption = 'Alterar/Visualizar'
      TabOrder = 1
      OnClick = btAlteraClick
    end
  end
  object gridCtr: TcxGrid
    Left = 40
    Top = 80
    Width = 948
    Height = 468
    TabOrder = 1
    LookAndFeel.ScrollbarMode = sbmClassic
    object gviewCtr: TcxGridDBTableView
      OnDblClick = gvContratoDblClick
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FilterBox.Visible = fvAlways
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DSCTR
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopupMode = fpmExcel
      FilterRow.InfoText = 'Clique aqui para definir um Filtro'
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
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object gvcIDUNI: TcxGridDBColumn
        Caption = 'Centro de Custos'
        DataBinding.FieldName = 'calc_ds_uni'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Options.FilterRowOperator = foContains
        SortIndex = 0
        SortOrder = soAscending
        Width = 151
      end
      object gvcIDEVE: TcxGridDBColumn
        Caption = 'Evento'
        DataBinding.FieldName = 'calc_ds_eve'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        SortIndex = 1
        SortOrder = soAscending
        Width = 189
      end
      object gvcIDPES: TcxGridDBColumn
        Caption = 'Favorecido'
        DataBinding.FieldName = 'calc_ds_pes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 400
        OnHeaderClick = gvcIDPESHeaderClick
      end
      object gvcIDTPC: TcxGridDBColumn
        Caption = 'Tipo de Contrato'
        DataBinding.FieldName = 'calc_ds_tpc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 137
      end
      object gviewCtrnr_contrato: TcxGridDBColumn
        Caption = 'Nr. do Contrato'
        DataBinding.FieldName = 'nr_contrato'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Width = 144
      end
      object gviewCtrdt_ini: TcxGridDBColumn
        Caption = 'Dt. In'#237'cio'
        DataBinding.FieldName = 'dt_ini'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Width = 85
      end
      object gviewCtrdt_fim: TcxGridDBColumn
        Caption = 'Dt. T'#233'rmino'
        DataBinding.FieldName = 'dt_fim'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Width = 85
      end
      object gviewCtrvl_contrato: TcxGridDBColumn
        Caption = 'Vl. Contrato'
        DataBinding.FieldName = 'vl_contrato'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-0,00;0'
        Properties.Nullstring = '0'
        Properties.UseNullString = True
        OnGetDisplayText = gviewCtrvl_contratoGetDisplayText
        Width = 90
      end
      object gviewCtrvl_caucao: TcxGridDBColumn
        Caption = 'Cau'#231#227'o'
        DataBinding.FieldName = 'vl_caucao'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-0,00;0'
        Properties.UseNullString = True
        OnGetDisplayText = gviewCtrvl_caucaoGetDisplayText
        Width = 72
      end
      object gvcDESCR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'descr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 400
      end
      object gvcIDTPR: TcxGridDBColumn
        Caption = 'Tipo de Reajuste'
        DataBinding.FieldName = 'calc_ds_tpr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Visible = False
        Width = 150
      end
      object gviewCtrperio: TcxGridDBColumn
        Caption = 'Periodic.'
        DataBinding.FieldName = 'perio'
        Visible = False
        Width = 80
      end
      object gviewCtrind_reajus: TcxGridDBColumn
        Caption = #205'ndice'
        DataBinding.FieldName = 'ind_reajus'
        Visible = False
      end
      object gviewCtrvl_multa: TcxGridDBColumn
        Caption = 'Vl. Multa'
        DataBinding.FieldName = 'vl_multa'
        Visible = False
        Width = 74
      end
      object gviewCtrvl_rescisao: TcxGridDBColumn
        Caption = 'Rescis'#227'o'
        DataBinding.FieldName = 'vl_rescisao'
        Visible = False
        Width = 94
      end
      object gvcOBS: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'obs'
        Width = 500
      end
      object colQTTOT: TcxGridDBColumn
        Caption = 'Qt. Docs.'
        DataBinding.FieldName = 'qttot'
        PropertiesClassName = 'TcxTextEditProperties'
        OnCustomDrawCell = colQTTOTCustomDrawCell
        OnGetDataText = colQTTOTGetDataText
        Options.Editing = False
        Width = 70
      end
      object colQTLIQ: TcxGridDBColumn
        Caption = 'Qt. Liq.'
        DataBinding.FieldName = 'qtliq'
        PropertiesClassName = 'TcxTextEditProperties'
        OnCustomDrawCell = colQTLIQCustomDrawCell
        OnGetDataText = colQTLIQGetDataText
        Options.Editing = False
        Width = 70
      end
      object gviewCtrColumn1: TcxGridDBColumn
        Caption = 'Dt. Inc./Alt.'
        DataBinding.FieldName = 'calc_dt_alt'
        Width = 113
      end
      object gviewCtrColumn2: TcxGridDBColumn
        Caption = 'Id.'
        DataBinding.FieldName = 'id'
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object colTPMOV: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'tp_mov'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.CharCase = ecUpperCase
        Width = 47
      end
    end
    object glevelCtr: TcxGridLevel
      GridView = gviewCtr
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 978
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 55
      Height = 15
      Caption = 'Contratos:'
    end
    object cbTPREG: TComboBox
      Left = 80
      Top = 8
      Width = 145
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Ativos'
      OnSelect = cbTPREGSelect
      Items.Strings = (
        'Ativos'
        'Inativos'
        'Finalizados')
    end
  end
  object DSCTR: TDataSource
    AutoEdit = False
    DataSet = DM.QYCTR
    Left = 528
    Top = 312
  end
end
