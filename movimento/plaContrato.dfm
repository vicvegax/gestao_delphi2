object fPlaContrato: TfPlaContrato
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Contratos'
  ClientHeight = 814
  ClientWidth = 1238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 763
    Width = 1238
    Height = 51
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 762
    ExplicitWidth = 1232
    object btLanc: TButton
      Left = 20
      Top = 10
      Width = 181
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Novo Contrato'
      TabOrder = 0
      OnClick = btLancClick
    end
    object btExcluir: TBitBtn
      Left = 400
      Top = 10
      Width = 181
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Excluir Contrato'
      TabOrder = 2
      OnClick = btExcluirClick
    end
    object btAltera: TButton
      Left = 210
      Top = 10
      Width = 181
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Alterar/Visualizar'
      TabOrder = 1
      OnClick = btAlteraClick
    end
  end
  object gridCtr: TcxGrid
    Left = 50
    Top = 100
    Width = 1185
    Height = 585
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
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
      FilterRow.SeparatorWidth = 8
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      FixedDataRows.SeparatorWidth = 8
      NewItemRow.SeparatorWidth = 8
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NavigatorOffset = 63
      OptionsView.FixedColumnSeparatorWidth = 3
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      OptionsView.ShowColumnFilterButtons = sfbAlways
      Preview.LeftIndent = 25
      Preview.RightIndent = 6
      RowLayout.MinValueWidth = 100
      object gvcIDUNI: TcxGridDBColumn
        Caption = 'Centro de Custos'
        DataBinding.FieldName = 'calc_ds_uni'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Options.FilterRowOperator = foContains
        SortIndex = 0
        SortOrder = soAscending
        Width = 189
      end
      object gvcIDEVE: TcxGridDBColumn
        Caption = 'Evento'
        DataBinding.FieldName = 'calc_ds_eve'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        SortIndex = 1
        SortOrder = soAscending
        Width = 236
      end
      object gvcIDPES: TcxGridDBColumn
        Caption = 'Favorecido'
        DataBinding.FieldName = 'calc_ds_pes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Width = 500
        OnHeaderClick = gvcIDPESHeaderClick
      end
      object gvcIDTPC: TcxGridDBColumn
        Caption = 'Tipo de Contrato'
        DataBinding.FieldName = 'calc_ds_tpc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Width = 171
      end
      object gviewCtrnr_contrato: TcxGridDBColumn
        Caption = 'Nr. do Contrato'
        DataBinding.FieldName = 'nr_contrato'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        MinWidth = 25
        Width = 180
      end
      object gviewCtrdt_ini: TcxGridDBColumn
        Caption = 'Dt. In'#237'cio'
        DataBinding.FieldName = 'dt_ini'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taRightJustify
        MinWidth = 25
        Width = 106
      end
      object gviewCtrdt_fim: TcxGridDBColumn
        Caption = 'Dt. T'#233'rmino'
        DataBinding.FieldName = 'dt_fim'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taRightJustify
        MinWidth = 25
        Width = 106
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
        MinWidth = 25
        Width = 113
      end
      object gviewCtrvl_caucao: TcxGridDBColumn
        Caption = 'Cau'#231#227'o'
        DataBinding.FieldName = 'vl_caucao'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-0,00;0'
        Properties.UseNullString = True
        OnGetDisplayText = gviewCtrvl_caucaoGetDisplayText
        MinWidth = 25
        Width = 90
      end
      object gvcDESCR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'descr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Width = 500
      end
      object gvcIDTPR: TcxGridDBColumn
        Caption = 'Tipo de Reajuste'
        DataBinding.FieldName = 'calc_ds_tpr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Visible = False
        MinWidth = 25
        Width = 188
      end
      object gviewCtrperio: TcxGridDBColumn
        Caption = 'Periodic.'
        DataBinding.FieldName = 'perio'
        Visible = False
        MinWidth = 25
        Width = 100
      end
      object gviewCtrind_reajus: TcxGridDBColumn
        Caption = #205'ndice'
        DataBinding.FieldName = 'ind_reajus'
        Visible = False
        MinWidth = 25
      end
      object gviewCtrvl_multa: TcxGridDBColumn
        Caption = 'Vl. Multa'
        DataBinding.FieldName = 'vl_multa'
        Visible = False
        MinWidth = 25
        Width = 93
      end
      object gviewCtrvl_rescisao: TcxGridDBColumn
        Caption = 'Rescis'#227'o'
        DataBinding.FieldName = 'vl_rescisao'
        Visible = False
        MinWidth = 25
        Width = 118
      end
      object gvcOBS: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'obs'
        MinWidth = 25
        Width = 625
      end
      object colQTTOT: TcxGridDBColumn
        Caption = 'Qt. Docs.'
        DataBinding.FieldName = 'qttot'
        PropertiesClassName = 'TcxTextEditProperties'
        OnCustomDrawCell = colQTTOTCustomDrawCell
        OnGetDataText = colQTTOTGetDataText
        MinWidth = 25
        Options.Editing = False
        Width = 88
      end
      object colQTLIQ: TcxGridDBColumn
        Caption = 'Qt. Liq.'
        DataBinding.FieldName = 'qtliq'
        PropertiesClassName = 'TcxTextEditProperties'
        OnCustomDrawCell = colQTLIQCustomDrawCell
        OnGetDataText = colQTLIQGetDataText
        MinWidth = 25
        Options.Editing = False
        Width = 88
      end
      object gviewCtrColumn1: TcxGridDBColumn
        Caption = 'Dt. Inc./Alt.'
        DataBinding.FieldName = 'calc_dt_alt'
        MinWidth = 25
        Width = 141
      end
      object gviewCtrColumn2: TcxGridDBColumn
        Caption = 'Id.'
        DataBinding.FieldName = 'id'
        PropertiesClassName = 'TcxTextEditProperties'
        MinWidth = 25
      end
      object colTPMOV: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'tp_mov'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Width = 59
      end
    end
    object glevelCtr: TcxGridLevel
      GridView = gviewCtr
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1238
    Height = 51
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 1232
    object Label1: TLabel
      Left = 10
      Top = 20
      Width = 67
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Contratos:'
    end
    object cbTPREG: TComboBox
      Left = 100
      Top = 10
      Width = 181
      Height = 28
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
