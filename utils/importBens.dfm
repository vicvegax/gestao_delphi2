object fImportBens: TfImportBens
  Left = 0
  Top = 0
  Caption = 'fImportBens'
  ClientHeight = 572
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object grMem: TcxGrid
    Left = 0
    Top = 0
    Width = 1013
    Height = 505
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1019
    object viewMem: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsmem
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Inserting = False
      object viewMemidcat: TcxGridDBColumn
        DataBinding.FieldName = 'idcat'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            SortOrder = soAscending
            FieldName = 'descr'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DM.DSCAT
        Options.SortByDisplayText = isbtOn
        Width = 200
      end
      object viewMemdescr: TcxGridDBColumn
        DataBinding.FieldName = 'descr'
      end
      object viewMemnumero: TcxGridDBColumn
        DataBinding.FieldName = 'numero'
      end
      object viewMemcidade: TcxGridDBColumn
        DataBinding.FieldName = 'cidade'
      end
      object viewMemponto: TcxGridDBColumn
        DataBinding.FieldName = 'ponto'
      end
      object viewMemiduni: TcxGridDBColumn
        DataBinding.FieldName = 'iduni'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = '2'
            SortOrder = soAscending
            Width = 250
            FieldName = 'descr'
          end
          item
            Width = 80
            FieldName = 'cod'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DM.DSUNI
        Options.SortByDisplayText = isbtOn
        Width = 300
      end
      object viewMemok: TcxGridDBColumn
        DataBinding.FieldName = 'ok'
      end
    end
    object grMemLevel1: TcxGridLevel
      GridView = viewMem
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 531
    Width = 1013
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 224
    ExplicitTop = 536
    ExplicitWidth = 185
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Abrir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 128
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 248
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Importar'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object tbmem: TFDMemTable
    BeforePost = tbmemBeforePost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 368
    Top = 280
    object tbmemidcat: TIntegerField
      FieldName = 'idcat'
    end
    object tbmemdescr: TStringField
      FieldName = 'descr'
      Size = 50
    end
    object tbmemnumero: TStringField
      FieldName = 'numero'
      Size = 50
    end
    object tbmemcidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object tbmemponto: TStringField
      FieldName = 'ponto'
      Size = 4
    end
    object tbmemiduni: TIntegerField
      FieldName = 'iduni'
    end
    object tbmemok: TBooleanField
      FieldName = 'ok'
    end
  end
  object dsmem: TDataSource
    DataSet = tbmem
    Left = 432
    Top = 280
  end
  object dlgAbrir: TOpenDialog
    DefaultExt = 'csv'
    Filter = 'Arquivo CSV|*.csv|Arquivo Bin'#225'rio|*.bin'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 296
    Top = 492
  end
  object dlgSalvar: TSaveDialog
    DefaultExt = 'bin'
    Filter = 'Arquivo Bin'#225'rio|*.bin'
    Left = 376
    Top = 488
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 576
    Top = 272
  end
end
