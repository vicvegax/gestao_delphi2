object frelConta: TfrelConta
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Movimenta'#231#227'o de Conta'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object gridConta: TcxGrid
    Left = 144
    Top = 136
    Width = 906
    Height = 519
    TabOrder = 0
    object gviewConta: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsR
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object gvcData: TcxGridDBColumn
        DataBinding.FieldName = 'Data'
      end
      object gvcIDUNI: TcxGridDBColumn
        DataBinding.FieldName = 'IDUNI'
        OnCustomDrawCell = gvcIDUNICustomDrawCell
        Width = 200
      end
      object colUF: TcxGridDBColumn
        DataBinding.FieldName = 'UF'
        Width = 31
      end
      object gvcIDPES: TcxGridDBColumn
        DataBinding.FieldName = 'IDPES'
        Width = 200
      end
      object gvcHIST: TcxGridDBColumn
        DataBinding.FieldName = 'HIST'
        OnCustomDrawCell = gvcHISTCustomDrawCell
        Width = 200
      end
      object gvcNRDOC: TcxGridDBColumn
        DataBinding.FieldName = 'NRDOC'
        OnCustomDrawCell = gvcNRDOCCustomDrawCell
      end
      object gvcVLD: TcxGridDBColumn
        DataBinding.FieldName = 'VLD'
        OnCustomDrawCell = gvcVLDCustomDrawCell
        Width = 110
      end
      object gvcVLC: TcxGridDBColumn
        DataBinding.FieldName = 'VLC'
        OnCustomDrawCell = gvcVLCCustomDrawCell
        Width = 110
      end
      object gvcSaldo: TcxGridDBColumn
        DataBinding.FieldName = 'Saldo'
        OnCustomDrawCell = gvcSALDOCustomDrawCell
        Width = 110
      end
      object gvcTPREG: TcxGridDBColumn
        DataBinding.FieldName = 'TPREG'
        Visible = False
      end
    end
    object glevelConta: TcxGridLevel
      GridView = gviewConta
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 622
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 116
      Height = 15
      Caption = 'Conta de Movimento:'
    end
    object Label1: TLabel
      Left = 480
      Top = 16
      Width = 92
      Height = 15
      Caption = 'Movimento entre'
    end
    object Label2: TLabel
      Left = 680
      Top = 16
      Width = 6
      Height = 15
      Caption = 'e'
    end
    object edIDCNT: TEdit
      Left = 136
      Top = 8
      Width = 329
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object edDTI: TEdit
      Left = 584
      Top = 8
      Width = 89
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 1
    end
    object edDTF: TEdit
      Left = 696
      Top = 8
      Width = 89
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 2
    end
  end
  object pnFirstStart: TPanel
    Left = 0
    Top = 396
    Width = 628
    Height = 46
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 387
    ExplicitWidth = 622
    object btCancelar: TBitBtn
      Left = 8
      Top = 8
      Width = 129
      Height = 33
      Cancel = True
      Caption = '&Fechar'
      Default = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000020000000C05031A46110852AB190C76E31D0E89FF1C0E89FF190C
        76E4120852AD06031B4D0000000E000000030000000000000000000000000000
        000301010519130A55A9211593FF2225AEFF2430C2FF2535CBFF2535CCFF2430
        C3FF2225AFFF211594FF140B58B20101051E0000000400000000000000020101
        03151C1270CD2522A6FF2D3DCCFF394BD3FF3445D1FF2939CDFF2839CDFF3344
        D0FF394AD4FF2D3CCDFF2523A8FF1C1270D20101051D00000003000000091912
        5BA72A27AAFF2F41D0FF3541C7FF2726ABFF3137BCFF384AD3FF384BD3FF3137
        BCFF2726ABFF3540C7FF2E40D0FF2927ACFF1A115EB10000000D08061C3D3129
        A2FD2C3CCCFF3842C6FF5F5DBDFFEDEDF8FF8B89CEFF3337B9FF3437B9FF8B89
        CEFFEDEDF8FF5F5DBDFF3741C6FF2B3ACDFF3028A4FF0907204A1E185F9F373B
        BCFF3042D0FF2621A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
        EDFFF3E9E2FFECE6EBFF2621A5FF2E3FCFFF343ABEFF201A66B0312A92E03542
        CBFF3446D1FF2C2FB5FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
        E2FFEADAD1FF7F6FACFF2B2EB5FF3144D0FF3040CBFF312A95E53E37AEFA3648
        D0FF374AD3FF3A4ED5FF3234B4FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
        E5FF897DB8FF3233B4FF384BD3FF3547D2FF3446D1FF3E37AEFA453FB4FA4557
        D7FF3B50D5FF4C5FDAFF4343B7FF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
        E8FF9087C5FF4242B7FF495DD8FF394CD4FF3F52D4FF443FB3FA403DA1DC5967
        DAFF5B6EDDFF4F4DBAFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
        EAFFFAF5F2FF8F89CAFF4E4DB9FF576ADCFF5765D9FF403EA4E12E2D70987C85
        DDFF8798E8FF291D9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
        D8FFF4ECE7FFE5D9DCFF291D9BFF8494E7FF7A81DDFF33317BAC111125356768
        D0FC9EACEDFF686FCEFF5646A1FFCCB6BCFF7A68A8FF4C4AB6FF4D4BB7FF7A68
        A8FFCBB5BCFF5646A1FF666DCCFF9BAAEEFF696CD0FD1212273F000000043B3B
        79977D84DFFFA5B6F1FF6D74D0FF2D219BFF5151B9FF8EA2ECFF8EA1ECFF5252
        BBFF2D219BFF6B72D0FFA2B3F0FF8086E0FF404183A700000008000000010303
        050C4E509DBC8087E2FFAEBDF3FFA3B6F1FF9DAFF0FF95A9EEFF95A8EEFF9BAD
        EFFFA2B3F0FFACBCF3FF838AE3FF4F52A0C10303051100000002000000000000
        000100000005323464797378D9F8929CEAFFA1AEEFFFB0BFF3FFB0BFF4FFA2AE
        EFFF939DE9FF7479DAF83234647D000000080000000200000000000000000000
        000000000000000000031213232D40437D935D61B5D07378DFFC7378DFFC5D61
        B5D040437D951212223000000004000000010000000000000000}
      ModalResult = 2
      TabOrder = 0
    end
    object btXLS: TButton
      Tag = 1
      Left = 352
      Top = 8
      Width = 145
      Height = 33
      Caption = 'Exportar para Excel'
      TabOrder = 1
      OnClick = btExportClick
    end
    object btPDF: TButton
      Left = 192
      Top = 8
      Width = 153
      Height = 33
      Caption = 'Exportar para PDF'
      TabOrder = 2
      OnClick = btExportClick
    end
  end
  object tbR: TFDMemTable
    Active = True
    OnCalcFields = tbRCalcFields
    FieldDefs = <
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'IDUNI'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'IDPES'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'HIST'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NRDOC'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VLD'
        DataType = ftFloat
      end
      item
        Name = 'VLC'
        DataType = ftFloat
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
      end
      item
        Name = 'TPREG'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 376
    Top = 200
    object tbRData: TDateField
      FieldName = 'Data'
    end
    object tbRIDUNI: TStringField
      DisplayLabel = 'Centro de Custo'
      FieldName = 'IDUNI'
      Size = 255
    end
    object tbRUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbRIDPES: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'IDPES'
      Size = 255
    end
    object tbRHIST: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HIST'
      Size = 255
    end
    object tbRNRDOC: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nr. Documento'
      FieldName = 'NRDOC'
      Size = 30
    end
    object tbRVLD: TFloatField
      DisplayLabel = 'D'#233'bito'
      FieldName = 'VLD'
      DisplayFormat = ',0.00'
    end
    object tbRVLC: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'VLC'
      DisplayFormat = ',0.00'
    end
    object tbRSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = ',0.00 C;,0.00 D'
    end
    object tbRTPREG: TSmallintField
      FieldName = 'TPREG'
      Visible = False
    end
    object tbRvl: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'vl'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object tbRnt: TStringField
      FieldKind = fkCalculated
      FieldName = 'nt'
      Size = 1
      Calculated = True
    end
  end
  object dsR: TDataSource
    AutoEdit = False
    DataSet = tbR
    Left = 400
    Top = 376
  end
  object frxDBR: TfrxDBDataset
    UserName = 'MovConta'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Data=Data'
      'IDUNI=IDUNI'
      'UF=UF'
      'IDPES=IDPES'
      'HIST=HIST'
      'NRDOC=NRDOC'
      'VLD=VLD'
      'VLC=VLC'
      'Saldo=Saldo'
      'TPREG=TPREG'
      'vl=vl'
      'nt=nt')
    DataSource = dsR
    BCDToCurrency = False
    DataSetOptions = []
    Left = 184
    Top = 280
  end
end
