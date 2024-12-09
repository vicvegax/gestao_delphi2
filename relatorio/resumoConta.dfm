object fResumoConta: TfResumoConta
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Resumo de Contas'
  ClientHeight = 798
  ClientWidth = 1161
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
    Top = 0
    Width = 1161
    Height = 51
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1155
    object Label1: TLabel
      Left = 20
      Top = 20
      Width = 114
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Movimento entre'
    end
    object Label2: TLabel
      Left = 330
      Top = 10
      Width = 8
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'e'
    end
    object edDTINI: TcxDateEdit
      Left = 180
      Top = 10
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = edDTINIPropertiesEditValueChanged
      TabOrder = 0
      Width = 121
    end
    object edDTFIM: TcxDateEdit
      Left = 360
      Top = 10
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = edDTFIMPropertiesEditValueChanged
      TabOrder = 1
      Width = 121
    end
  end
  object grMov: TcxGrid
    Left = 110
    Top = 100
    Width = 981
    Height = 638
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 1
    object grMovDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsRES
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.TranslateLike = True
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
          Column = grMovDBTableView1sd_ant
        end
        item
          Kind = skSum
          Column = grMovDBTableView1sd_ant
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00 C;,0.00 D'
          Kind = skSum
          Column = grMovDBTableView1sd_ant
        end
        item
          Format = ',0.00;,0.00'
          Kind = skSum
          Column = grMovDBTableView1saldo
        end
        item
          Format = ',0.00;,0.00'
          Kind = skSum
          Column = grMovDBTableView1Column2
        end
        item
          Format = ',0.00 C;,0.00 D'
          Kind = skSum
          Column = grMovDBTableView1Column1
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soMultipleSelectedRecords]
      Filtering.ColumnPopupMode = fpmExcel
      FilterRow.InfoText = 'Clique aqui para definir Filtros'
      FilterRow.SeparatorWidth = 8
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      FixedDataRows.SeparatorWidth = 8
      NewItemRow.SeparatorWidth = 8
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CheckBoxPosition = cbpIndicator
      OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvColumnHeader]
      OptionsSelection.ShowCheckBoxesDynamically = True
      OptionsView.NavigatorOffset = 63
      OptionsView.FixedColumnSeparatorWidth = 3
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      OptionsView.ShowColumnFilterButtons = sfbAlways
      Preview.LeftIndent = 25
      Preview.RightIndent = 6
      RowLayout.MinValueWidth = 100
      object grMovDBTableView1id_cnt: TcxGridDBColumn
        Caption = 'Conta de Movimento'
        DataBinding.FieldName = 'ds_cnt'
        MinWidth = 25
        Width = 506
      end
      object grMovDBTableView1Column3: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'tp_cnt'
        MinWidth = 25
        Width = 203
      end
      object grMovDBTableView1sd_ant: TcxGridDBColumn
        Caption = 'Saldo Anterior'
        DataBinding.FieldName = 'sd_ant'
        OnCustomDrawCell = grMovDBTableView1sd_antCustomDrawCell
        MinWidth = 25
        Width = 138
        OnCustomDrawFooterCell = grMovDBTableView1sd_antCustomDrawFooterCell
      end
      object grMovDBTableView1saldo: TcxGridDBColumn
        Caption = 'D'#233'bito'
        DataBinding.FieldName = 'vl_des'
        OnCustomDrawCell = grMovDBTableView1saldoCustomDrawCell
        MinWidth = 25
        Width = 138
        OnCustomDrawFooterCell = grMovDBTableView1saldoCustomDrawFooterCell
      end
      object grMovDBTableView1Column2: TcxGridDBColumn
        Caption = 'Cr'#233'dito'
        DataBinding.FieldName = 'vl_rec'
        OnCustomDrawCell = grMovDBTableView1Column1CustomDrawCell
        MinWidth = 25
        Width = 138
        OnCustomDrawFooterCell = grMovDBTableView1Column2CustomDrawFooterCell
      end
      object grMovDBTableView1Column1: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'total'
        OnCustomDrawCell = grMovDBTableView1Column1CustomDrawCell
        MinWidth = 25
        Width = 138
        OnCustomDrawFooterCell = grMovDBTableView1sd_antCustomDrawFooterCell
      end
    end
    object grMovLevel1: TcxGridLevel
      GridView = grMovDBTableView1
    end
  end
  object dsRES: TDataSource
    AutoEdit = False
    DataSet = qyRES
    Left = 96
    Top = 192
  end
  object qyRES: TFDQuery
    OnCalcFields = qyRESCalcFields
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id, cod, descr, tp_conta,'
      '  (SELECT COALESCE(sum(valor), 0) FROM plmovimento as mov'
      #9'WHERE mov.id_cnt = cnt.id and st_mov = "L" and st_fim="N" and '
      '      dt_mov < "2024-03-01") as sd_ant,'
      '  (SELECT coalesce(sum(valor),0) FROM plmovimento as mov '
      
        '    WHERE mov.id_cnt = cnt.id and st_mov = "L" and st_fim="N" an' +
        'd valor>0 and '
      '      dt_mov BETWEEN "2024-03-01" AND "2024-03-31") as vl_rec,'
      '  (SELECT coalesce(sum(valor),0) FROM plmovimento as mov '
      
        '    WHERE mov.id_cnt = cnt.id and st_mov = "L" and st_fim="N" an' +
        'd valor<0 and '
      '      dt_mov BETWEEN "2024-03-01" AND "2024-03-31") as vl_des'
      'FROM tbcontas as cnt where ativo = 1;')
    Left = 176
    Top = 192
    object qyRESid: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qyREScod: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cod'
      Origin = 'cod'
      Size = 3
    end
    object qyRESdescr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descr'
      Origin = 'descr'
      Size = 255
    end
    object qyRESsd_ant: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sd_ant'
      Origin = 'sd_ant'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00 C;,0.00 D'
      Precision = 34
      Size = 2
    end
    object qyRESvl_rec: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vl_rec'
      Origin = 'vl_rec'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 34
      Size = 2
    end
    object qyRESvl_des: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vl_des'
      Origin = 'vl_des'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00;,0.00'
      Precision = 34
      Size = 2
    end
    object qyREStp_cnt: TStringField
      FieldKind = fkCalculated
      FieldName = 'tp_cnt'
      Size = 30
      Calculated = True
    end
    object qyRESds_cnt: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_cnt'
      Size = 100
      Calculated = True
    end
    object qyREStotal: TBCDField
      FieldKind = fkCalculated
      FieldName = 'total'
      DisplayFormat = ',0.00 C;,0.00 D'
      Calculated = True
    end
    object qyREStp_conta: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'tp_conta'
      Origin = 'tp_conta'
    end
  end
end
