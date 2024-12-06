object fCadUsuarioNivel: TfCadUsuarioNivel
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Cadastro de N'#237'veis de Usu'#225'rio'
  ClientHeight = 516
  ClientWidth = 758
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
  object Label1: TLabel
    Left = 144
    Top = 40
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 42
    Height = 15
    Caption = 'C'#243'digo:'
  end
  object gdRec: TDBGrid
    Left = 0
    Top = 80
    Width = 758
    Height = 436
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRec
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gdRecDblClick
    OnTitleClick = gdRecTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Descri'#231#227'o'
        Width = 496
        Visible = True
      end>
  end
  object edDESCR: TEdit
    Left = 208
    Top = 32
    Width = 521
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = '(DESCRI'#199#195'O)'
    OnKeyPress = edENTER_KeyPress
  end
  object edID: TcxSpinEdit
    Left = 72
    Top = 32
    TabStop = False
    Properties.DisplayFormat = '000'
    Properties.ImmediatePost = True
    Properties.MaxValue = 999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 0
    Value = 1
    OnKeyPress = edIDKeyPress
    Width = 51
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qyrec
    Left = 115
    Top = 206
  end
  object qyrec: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbTipoDoc')
    Left = 640
    Top = 304
  end
end
