object fajustaConta: TfajustaConta
  Left = 0
  Top = 0
  Caption = 'Ajusta Contas Banc'#225'rias'
  ClientHeight = 635
  ClientWidth = 972
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
    Top = 0
    Width = 972
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 24
      Height = 15
      Caption = 'SQL:'
    end
    object ed1: TMemo
      Left = 56
      Top = 8
      Width = 593
      Height = 73
      Lines.Strings = (
        
          'select id, banco, agencia, nr_conta from plmovimento where banco' +
          ' = '#39'001'#39' and st_fim = '#39'N'#39' and st_mov <> '#39'L'#39)
      TabOrder = 0
    end
    object Button1: TButton
      Left = 656
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Executa'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 744
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object grMov: TcxGrid
    Left = 144
    Top = 224
    Width = 250
    Height = 200
    TabOrder = 1
    object gvMov: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsV
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
    end
    object glMov: TcxGridLevel
      GridView = gvMov
    end
  end
  object dsV: TDataSource
    DataSet = qryV
    Left = 176
    Top = 144
  end
  object qryV: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    Left = 248
    Top = 144
  end
end
