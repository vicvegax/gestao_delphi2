object fDadosUnidade: TfDadosUnidade
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Dados de Centros de Custo'
  ClientHeight = 635
  ClientWidth = 1015
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
    Left = 0
    Top = 39
    Width = 1070
    Height = 549
    TabOrder = 0
    object viewMov: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DSUNI
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object viewMovdescr: TcxGridDBColumn
        Caption = 'Centro de Custo'
        DataBinding.FieldName = 'descr'
        Options.Editing = False
        Options.FilterRowOperator = foContains
        SortIndex = 0
        SortOrder = soAscending
        Width = 332
      end
      object viewMovinfodata: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'infodata'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.ShowOnlyValidDates = True
        Width = 81
      end
      object viewMovinfoinsc: TcxGridDBColumn
        Caption = 'CPF/CNPJ'
        DataBinding.FieldName = 'infoinsc'
        Options.FilterRowOperator = foContains
        Width = 105
      end
      object viewMovinfoemail: TcxGridDBColumn
        Caption = 'e-mail'
        DataBinding.FieldName = 'infoemail'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecLowerCase
        Options.FilterRowOperator = foContains
        Width = 300
      end
      object viewMovinfo4: TcxGridDBColumn
        Caption = 'Info. 1'
        DataBinding.FieldName = 'info4'
        Options.FilterRowOperator = foContains
        Width = 300
      end
      object viewMovinfo5: TcxGridDBColumn
        Caption = 'Info. 2'
        DataBinding.FieldName = 'info5'
        Options.FilterRowOperator = foContains
        Width = 300
      end
    end
    object gridMovLevel1: TcxGridLevel
      GridView = viewMov
    end
  end
  object QYUNI: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    SQL.Strings = (
      
        'select id, descr, infodata, infoinsc, infoemail, info4, info5 fr' +
        'om tbunidades')
    Left = 160
    Top = 232
    object QYUNIid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QYUNIdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 255
    end
    object QYUNIinfodata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'infodata'
      Origin = 'infodata'
    end
    object QYUNIinfoinsc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'infoinsc'
      Origin = 'infoinsc'
      Size = 14
    end
    object QYUNIinfoemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'infoemail'
      Origin = 'infoemail'
      Size = 255
    end
    object QYUNIinfo4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'info4'
      Origin = 'info4'
      Size = 255
    end
    object QYUNIinfo5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'info5'
      Origin = 'info5'
      Size = 255
    end
  end
  object DSUNI: TDataSource
    DataSet = QYUNI
    Left = 248
    Top = 232
  end
end
