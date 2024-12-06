object fdetMovimento: TfdetMovimento
  Left = 0
  Top = 0
  Hint = '%n - N'#250'mero da Parcela e %t - Total de Parcelas'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Movimento'
  ClientHeight = 594
  ClientWidth = 970
  Color = clBtnFace
  Constraints.MinHeight = 632
  Constraints.MinWidth = 982
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 89
    Height = 15
    Caption = 'Centro de Custo:'
  end
  object Label5: TLabel
    Left = 16
    Top = 88
    Width = 39
    Height = 15
    Caption = 'Evento:'
  end
  object lbIDCTR: TLabel
    Left = 848
    Top = 72
    Width = 96
    Height = 37
    Caption = 'lbIDCTR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 24
    Width = 116
    Height = 15
    Caption = 'Conta de Movimento:'
  end
  object Label6: TLabel
    Left = 16
    Top = 120
    Width = 61
    Height = 15
    Caption = 'Favorecido:'
  end
  object btCancelar: TBitBtn
    Left = 824
    Top = 16
    Width = 129
    Height = 33
    Cancel = True
    Caption = 'Voltar'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000020000000705120D39113D2A9E19593EDD1F6A49FF1E6A48FF1B5D
      3EE313422EAB0717104900000009000000020000000000000000000000000000
      000201020210113C299D20724EFF229A6DFF22B481FF24C78FFF24C890FF23B5
      81FF229C6FFF20724FFF154831B5010503190000000300000000000000010102
      020E174E36C0218A61FF25C58EFF26C992FF25CA93FF28CB93FF3AD3A3FF45D7
      ABFF27CA93FF25C18BFF218860FF19593CD5020503180000000200000005113C
      2995238A63FF27C993FF26CA94FF27CB95FF30CE9AFF42D0A4FF1F9063FF0D7F
      4DFF29CB95FF27CB95FF29CB95FF238F66FF144731AF00000009040F0B2D2176
      53FA2BC693FF29CB95FF2BCC97FF3FD5A7FF42C198FF228056FFABCABBFF0D7E
      4CFF32D09CFF2DCE99FF2ACB96FF2DC996FF247C58FF07191147113A288F2DA1
      78FF2ECD98FF36D19EFF51DAB2FF31A077FF448968FFDEEAE5FFF9F4F0FF0D7D
      4BFF5BE0B9FF5ADFB8FF4DD9B0FF30CF9BFF30A67DFF154933AF195A3ECA35C1
      93FF44D6ABFF51CEA7FF1F7C56FF86B19CFFFAF9F8FFF8F2EEFFF8F0EBFF0D7B
      4AFF0C7748FF0C7444FF228F65FF3BD4A4FF36C395FF1C694AE51C6B4AE946D1
      A4FF33A980FF296D4DFFC3D3CAFFFBF7F5FFF8F2EEFFF8F4F0FFF9F4F0FFFFFF
      FFFFFFFFFFFFFFFFFFFF0C6D41FF43D9AAFF49D5ABFF207853FA1D6B4BE35CD8
      B3FF30A980FF296E4CFFAEB7A9FFECE2DDFFF8F3EFFFF9F6F3FFFAF7F4FFE2D6
      D1FFE0D4CEFFE0D3CDFF0C6B3FFF48DBAFFF62DFBBFF227D59FC195E43C367D0
      B1FF50DEB2FF45CCA2FF1C7751FF73947EFFE4DBD5FFF7F4F2FFFBF9F6FF0B71
      42FF0C6E41FF0C6B40FF1D885CFF52E0B5FF6CD7B7FF1F7050DF113C2B7D5BB7
      98FF61E3BEFF54E1B9FF56E1BAFF319C77FF3B7255FFC8C8C0FFF3F0EDFF0C6E
      41FF5DE7BFFF5AE5BFFF58E3BBFF63E4C0FF65C1A5FF164F399E040E0A1F2C89
      67F58CE8CEFF5BE3BDFF5DE5BFFF5FE8C1FF4EC6A1FF1E6948FF95A898FF0B69
      3EFF61E9C5FF5FE8C1FF5FE5BFFF91EBD4FF2F9670FC07181236000000021242
      307C4CAE8CFF97F0DAFF67E8C4FF62EAC4FF67EAC8FF64E4C2FF2C8462FF0C65
      3BFF67EAC8FF6EECC9FF9EF3DCFF52B493FF16543D9A00000005000000000002
      0105195D44A550B393FFA3EDDAFF95F2D9FF86EFD6FF78EED0FF79EFD1FF87F0
      D7FF96F2DDFFA0ECD8FF4CB592FF1C6C4FB80103030C00000001000000000000
      000000000002124633782F9F77F76AC9ACFF89DEC6FFA7EDDBFFA9F0DEFF8CE1
      C9FF6DCEAFFF30A67DF916563F8F010201080000000100000000000000000000
      00000000000000000001040F0B1B144E3A7E207F5FC226926DDA269670DF2185
      63C816543F850617112900000003000000010000000000000000}
    TabOrder = 9
    OnClick = btCancelarClick
  end
  object edDSCNT: TEdit
    Left = 208
    Top = 16
    Width = 361
    Height = 23
    TabOrder = 1
    OnKeyPress = edProxFocusKeyPress
  end
  object edDSUNI: TEdit
    Left = 248
    Top = 48
    Width = 377
    Height = 23
    TabOrder = 4
  end
  object edDSEVE: TEdit
    Left = 224
    Top = 80
    Width = 401
    Height = 23
    TabOrder = 6
    OnKeyPress = edProxFocusKeyPress
  end
  object edDSPES: TEdit
    Left = 240
    Top = 112
    Width = 385
    Height = 23
    TabOrder = 8
  end
  object gdMov: TcxGrid
    Left = 8
    Top = 144
    Width = 953
    Height = 441
    TabOrder = 10
    object gvMov: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DSMOV
      DataController.KeyFieldNames = 'id'
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvColumnHeader]
      OptionsSelection.ShowCheckBoxesDynamically = True
      OptionsView.GroupByBox = False
      object gvMovst_mov: TcxGridDBColumn
        DataBinding.FieldName = 'st_mov'
      end
      object gvMovdsuni: TcxGridDBColumn
        DataBinding.FieldName = 'dsuni'
        Width = 150
      end
      object gvMovdspes: TcxGridDBColumn
        DataBinding.FieldName = 'dspes'
        Width = 200
      end
      object gvMovdseve: TcxGridDBColumn
        DataBinding.FieldName = 'dseve'
        Width = 150
      end
      object gvMovdt_ven: TcxGridDBColumn
        DataBinding.FieldName = 'dt_ven'
        Width = 90
      end
      object gvMovdt_bxa: TcxGridDBColumn
        DataBinding.FieldName = 'dt_bxa'
        Width = 90
      end
      object gvMovcompt: TcxGridDBColumn
        DataBinding.FieldName = 'compt'
        Width = 70
      end
      object gvMovvalor: TcxGridDBColumn
        DataBinding.FieldName = 'valor'
        Width = 100
      end
      object gvMovnt_reg: TcxGridDBColumn
        DataBinding.FieldName = 'nt_reg'
      end
      object gvMovdstpd: TcxGridDBColumn
        DataBinding.FieldName = 'dstpd'
        Width = 150
      end
      object gvMovnr_doc: TcxGridDBColumn
        DataBinding.FieldName = 'nr_doc'
        Width = 130
      end
      object gvMovperio_ini: TcxGridDBColumn
        DataBinding.FieldName = 'perio_ini'
        Width = 100
      end
      object gvMovperio_fim: TcxGridDBColumn
        DataBinding.FieldName = 'perio_fim'
        Width = 100
      end
      object gvMovbanco: TcxGridDBColumn
        DataBinding.FieldName = 'banco'
        Width = 70
      end
      object gvMovagencia: TcxGridDBColumn
        DataBinding.FieldName = 'agencia'
        Width = 100
      end
      object gvMovnr_conta: TcxGridDBColumn
        DataBinding.FieldName = 'nr_conta'
        Width = 110
      end
      object gvMovtp_conta: TcxGridDBColumn
        DataBinding.FieldName = 'tp_conta'
        Width = 60
      end
      object gvMovdescr: TcxGridDBColumn
        DataBinding.FieldName = 'descr'
        Width = 200
      end
      object gvMovobs: TcxGridDBColumn
        DataBinding.FieldName = 'obs'
        Width = 200
      end
      object gvMovusent: TcxGridDBColumn
        DataBinding.FieldName = 'usent'
        Width = 100
      end
      object gvMovdt_entreg: TcxGridDBColumn
        DataBinding.FieldName = 'dt_entreg'
        Width = 150
      end
      object gvMovusinc: TcxGridDBColumn
        DataBinding.FieldName = 'usinc'
        Width = 100
      end
      object gvMovdt_inc: TcxGridDBColumn
        DataBinding.FieldName = 'dt_inc'
        Width = 150
      end
      object gvMovusalt: TcxGridDBColumn
        DataBinding.FieldName = 'usalt'
        Width = 100
      end
      object gvMovdt_alt: TcxGridDBColumn
        DataBinding.FieldName = 'dt_alt'
        Width = 150
      end
      object gvMovusefe: TcxGridDBColumn
        DataBinding.FieldName = 'usefe'
        Width = 100
      end
      object gvMovdt_efe: TcxGridDBColumn
        DataBinding.FieldName = 'dt_efe'
        Width = 150
      end
    end
    object glMov: TcxGridLevel
      GridView = gvMov
    end
  end
  object edIDEVE: TEdit
    Left = 144
    Top = 80
    Width = 73
    Height = 23
    Alignment = taRightJustify
    MaxLength = 10
    TabOrder = 5
    OnKeyPress = edProxFocusKeyPress
  end
  object edIDPES: TEdit
    Left = 120
    Top = 112
    Width = 114
    Height = 23
    Alignment = taRightJustify
    TabOrder = 7
  end
  object edPTUNI: TEdit
    Left = 208
    Top = 48
    Width = 33
    Height = 23
    MaxLength = 3
    TabOrder = 3
    OnKeyPress = edProxFocusKeyPress
  end
  object edIDCNT: TEdit
    Left = 144
    Top = 16
    Width = 57
    Height = 23
    MaxLength = 4
    TabOrder = 0
    OnKeyPress = edProxFocusKeyPress
  end
  object edIDUNI: TEdit
    Left = 144
    Top = 48
    Width = 57
    Height = 23
    MaxLength = 5
    TabOrder = 2
    OnKeyPress = edProxFocusKeyPress
  end
  object DSMOV: TDataSource
    AutoEdit = False
    DataSet = QYMOV
    Left = 152
    Top = 512
  end
  object QYMOV: TFDQuery
    AutoCalcFields = False
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DM.DBCON
    SQL.Strings = (
      
        'SELECT mov.*, uni.descr dsuni, pes.descr dspes, eve.descr dseve,' +
        ' tpd.descr dstpd '
      'FROM `plmovimento` mov'
      'left join tbunidades uni on uni.id = mov.id_uni'
      'LEFT join tbpessoal pes on pes.id = mov.id_pes'
      'LEFT JOIN tbeventos eve on eve.id = mov.id_eve'
      'LEFT JOIN tbtipodoc tpd on tpd.id = mov.id_tpd'
      'WHERE id_ctr = 314 and st_fim='#39'N'#39)
    Left = 288
    Top = 446
    object QYMOVtp_mov: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tp_mov'
      Origin = 'tp_mov'
      FixedChar = True
      Size = 1
    end
    object QYMOVst_mov: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'st_mov'
      Origin = 'st_mov'
      FixedChar = True
      Size = 1
    end
    object QYMOVdsuni: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dsuni'
      Origin = 'descr'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QYMOVdspes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dspes'
      Origin = 'descr'
      ProviderFlags = []
      ReadOnly = True
      Size = 55
    end
    object QYMOVdseve: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dseve'
      Origin = 'descr'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QYMOVdt_ven: TDateField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'dt_ven'
      Origin = 'dt_ven'
    end
    object QYMOVdt_bxa: TDateField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'dt_bxa'
      Origin = 'dt_bxa'
    end
    object QYMOVcompt: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'compt'
      Origin = 'compt'
      Size = 10
    end
    object QYMOVvalor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 12
      Size = 2
    end
    object QYMOVnt_reg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nt_reg'
      Origin = 'nt_reg'
      FixedChar = True
      Size = 1
    end
    object QYMOVdstpd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dstpd'
      Origin = 'descr'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QYMOVnr_doc: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'nr_doc'
      Origin = 'nr_doc'
      OnGetText = QYMOVnr_docGetText
      Size = 30
    end
    object QYMOVperio_ini: TDateField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'perio_ini'
      Origin = 'perio_ini'
    end
    object QYMOVperio_fim: TDateField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'perio_fim'
      Origin = 'perio_fim'
    end
    object QYMOVbanco: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'banco'
      Origin = 'banco'
      Size = 4
    end
    object QYMOVagencia: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'agencia'
      Origin = 'agencia'
      OnGetText = QYMOVagenciaGetText
      Size = 6
    end
    object QYMOVnr_conta: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
      OnGetText = QYMOVnr_contaGetText
    end
    object QYMOVtp_conta: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'tp_conta'
      Origin = 'tp_conta'
      OnGetText = QYMOVtp_contaGetText
    end
    object QYMOVdescr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descr'
      Origin = 'descr'
      Size = 255
    end
    object QYMOVobs: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      Size = 255
    end
    object QYMOVus_entreg: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_entreg'
      Origin = 'us_entreg'
    end
    object QYMOVdt_entreg: TDateTimeField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'dt_entreg'
      Origin = 'dt_entreg'
    end
    object QYMOVus_inc: TWordField
      FieldName = 'us_inc'
      Origin = 'us_inc'
      Required = True
    end
    object QYMOVdt_inc: TDateTimeField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'dt_inc'
      Origin = 'dt_inc'
    end
    object QYMOVus_alt: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_alt'
      Origin = 'us_alt'
    end
    object QYMOVdt_alt: TDateTimeField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'dt_alt'
      Origin = 'dt_alt'
    end
    object QYMOVus_efe: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_efe'
      Origin = 'us_efe'
    end
    object QYMOVdt_efe: TDateTimeField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'dt_efe'
      Origin = 'dt_efe'
    end
    object QYMOVusinc: TStringField
      FieldKind = fkLookup
      FieldName = 'usinc'
      LookupDataSet = QYUSU
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'us_inc'
      Size = 50
      Lookup = True
    end
    object QYMOVusalt: TStringField
      FieldKind = fkLookup
      FieldName = 'usalt'
      LookupDataSet = QYUSU
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'us_alt'
      Size = 50
      Lookup = True
    end
    object QYMOVusefe: TStringField
      FieldKind = fkLookup
      FieldName = 'usefe'
      LookupDataSet = QYUSU
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'us_efe'
      Size = 50
      Lookup = True
    end
    object QYMOVusent: TStringField
      FieldKind = fkLookup
      FieldName = 'usent'
      LookupDataSet = QYUSU
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'us_entreg'
      Size = 50
      Lookup = True
    end
  end
  object QYUSU: TFDQuery
    AutoCalcFields = False
    FieldOptions.AutoCreateMode = acCombineAlways
    IndexFieldNames = 'id'
    Connection = DM.DBCON
    SQL.Strings = (
      'select id, descr from tbusuario order by id')
    Left = 456
    Top = 344
  end
end
