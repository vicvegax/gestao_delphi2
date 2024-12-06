object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 567
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 32
    Top = 64
    Width = 801
    Height = 489
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 664
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 48
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 256
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'Edit2'
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 152
    Top = 41
  end
  object qry1: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from teste')
    Left = 88
    Top = 112
  end
end
