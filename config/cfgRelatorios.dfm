object fCfgRel: TfCfgRel
  Left = 0
  Top = 0
  Caption = 'fCfgRel'
  ClientHeight = 553
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object gridREC: TcxGrid
    Left = 0
    Top = 0
    Width = 932
    Height = 465
    Align = alTop
    TabOrder = 0
    object viewREC: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsrec
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
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object colID: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Options.Editing = False
      end
      object colNOME: TcxGridDBColumn
        DataBinding.FieldName = 'nome'
        SortIndex = 0
        SortOrder = soAscending
      end
      object colBT: TcxGridDBColumn
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Caption = 'Alterar'
            Default = True
            Kind = bkText
          end
          item
            Caption = 'Baixar'
            Kind = bkText
          end>
        Properties.ViewStyle = vsButtonsAutoWidth
        Properties.OnButtonClick = colBTPropertiesButtonClick
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.GroupFooters = False
        Width = 106
      end
      object colDTALT: TcxGridDBColumn
        DataBinding.FieldName = 'dtalt'
        Options.Editing = False
        Width = 162
      end
    end
    object levelREC: TcxGridLevel
      GridView = viewREC
    end
  end
  object dsrec: TDataSource
    DataSet = qyrec
    Left = 296
    Top = 272
  end
  object qyrec: TFDQuery
    OnNewRecord = qyrecNewRecord
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from cfgrelatorio')
    Left = 352
    Top = 272
    object qyrecid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyrecnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qyrecdtalt: TDateTimeField
      FieldName = 'dtalt'
      Origin = 'dtalt'
      Required = True
    end
  end
  object dlgAbrir: TOpenDialog
    Filter = 'Arquivo FastReport|*.fr3'
    Left = 432
    Top = 296
  end
end
