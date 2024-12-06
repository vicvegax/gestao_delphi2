object fCadUsuarioPermissao: TfCadUsuarioPermissao
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Permiss'#245'es de Usu'#225'rio'
  ClientHeight = 498
  ClientWidth = 746
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
    Left = 24
    Top = 40
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object Label3: TLabel
    Left = 24
    Top = 80
    Width = 36
    Height = 15
    Caption = 'Chave:'
  end
  object Label2: TLabel
    Left = 208
    Top = 80
    Width = 36
    Height = 15
    Caption = 'Grupo:'
  end
  object gdRec: TDBGrid
    Left = 0
    Top = 120
    Width = 746
    Height = 378
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRec
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
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
        FieldName = 'grupo'
        Title.Caption = 'Grupo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_grupo'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Descri'#231#227'o'
        Width = 412
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'Chave'
        Visible = True
      end>
  end
  object edDESCR: TEdit
    Left = 120
    Top = 32
    Width = 521
    Height = 23
    TabOrder = 1
    TextHint = '(Descri'#231#227'o)'
    OnKeyPress = edDESCRKeyPress
  end
  object edID: TcxSpinEdit
    Left = 72
    Top = 72
    Properties.Alignment.Horz = taRightJustify
    Properties.ImmediatePost = True
    Properties.Increment = 10.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 2
    Value = 1
    OnKeyPress = edIDKeyPress
    Width = 121
  end
  object edGRUPO: TcxSpinEdit
    Left = 256
    Top = 72
    Properties.Alignment.Horz = taRightJustify
    Properties.ImmediatePost = True
    Properties.MinValue = 1.000000000000000000
    TabOrder = 3
    Value = 1
    OnKeyPress = edENTER_KeyPress
    Width = 121
  end
  object chREP: TCheckBox
    Left = 96
    Top = 40
    Width = 17
    Height = 17
    TabStop = False
    Checked = True
    State = cbChecked
    TabOrder = 0
  end
  object cbGRUPO: TcxLookupComboBox
    Left = 384
    Top = 72
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'descr'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsgrp
    Properties.PostPopupValueOnTab = True
    TabOrder = 5
    Width = 273
  end
  object dsRec: TDataSource
    DataSet = qyrec
    Left = 115
    Top = 206
  end
  object qyrec: TFDQuery
    Connection = DM.DBCON
    SQL.Strings = (
      'select * from tbusuariopermissao')
    Left = 200
    Top = 200
    object qyrecid: TWordField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyrecid_grupo: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'id_grupo'
      Origin = 'id_grupo'
    end
    object qyrecgrupo: TWordField
      FieldName = 'grupo'
      Origin = 'grupo'
      Required = True
    end
    object qyrecdescr: TStringField
      FieldName = 'descr'
      Origin = 'descr'
      Required = True
      Size = 50
    end
    object qyrecus_inc: TWordField
      FieldName = 'us_inc'
      Origin = 'us_inc'
      Required = True
    end
    object qyrecdt_inc: TDateTimeField
      FieldName = 'dt_inc'
      Origin = 'dt_inc'
      Required = True
    end
    object qyrecus_alt: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'us_alt'
      Origin = 'us_alt'
    end
    object qyrecdt_alt: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_alt'
      Origin = 'dt_alt'
    end
    object qyrecus_exc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'us_exc'
      Origin = 'us_exc'
    end
    object qyrecdt_exc: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'dt_exc'
      Origin = 'dt_exc'
    end
    object qyrecobs_exc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obs_exc'
      Origin = 'obs_exc'
      Size = 255
    end
    object qyrecds_grupo: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_grupo'
      LookupDataSet = qygrp
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'id_grupo'
      Size = 50
      Lookup = True
    end
  end
  object qygrp: TFDQuery
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from tbusuariogrupopermissao')
    Left = 312
    Top = 296
  end
  object dsgrp: TDataSource
    AutoEdit = False
    DataSet = qygrp
    Left = 147
    Top = 310
  end
end
