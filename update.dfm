object fUpdate: TfUpdate
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'fUpdate'
  ClientHeight = 618
  ClientWidth = 921
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnAtu: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 489
    BevelWidth = 5
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 8
      Width = 921
      Height = 89
      Alignment = taCenter
      AutoSize = False
      Caption = 'ATUALIZANDO. AGUARDE!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -60
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 136
      Width = 160
      Height = 67
      Caption = 'BYTES:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -50
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbBYTE: TLabel
      Left = 216
      Top = 128
      Width = 225
      Height = 67
      Caption = '(0 BYTES)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -50
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 224
      Width = 881
      Height = 233
      Alignment = taCenter
      AutoSize = False
      Caption = 'O PROGRAMA SER'#193#13#10' FECHADO E ABERTO'#13#10'AUTOMATICAMENTE!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -60
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 512
      Top = 208
      Width = 172
      Height = 15
      Caption = 'ATEN'#199#195'O: MUDAR O HTTPPORT'
      Visible = False
    end
    object edHTTP: TEdit
      Left = 80
      Top = 272
      Width = 737
      Height = 23
      TabOrder = 0
      Text = 'edHTTP'
      Visible = False
    end
    object edPORT: TEdit
      Left = 80
      Top = 304
      Width = 121
      Height = 23
      TabOrder = 1
      Text = 'edPORT'
      Visible = False
    end
    object btUPD: TButton
      Left = 232
      Top = 304
      Width = 75
      Height = 25
      Caption = 'btUPD'
      TabOrder = 2
      Visible = False
      OnClick = btUPDClick
    end
  end
  object WebCopy1: TWebCopy
    Agent = 'WebCopy'
    DlgCancel = 'Cancel'
    DlgCaption = 'Downloading'
    DlgCompleted = 'completed'
    DlgClose = 'Close'
    DlgFileLabel = 'File :'
    DlgFileOfLabel = 'of'
    DlgFromServerLabel = 'from'
    DlgToServerLabel = 'to'
    DlgProgressLabel = 'Progress :'
    DlgRateLabel = 'Transfer rate :'
    DlgTimeLabel = 'Estimated time left :'
    DlgElapsedTimeLabel = 'Elapsed time :'
    DlgCopying = 'Copying'
    DlgDwnload = 'Downloading'
    DlgUpload = 'Uploading'
    DlgOpenFile = 'Open file'
    DlgOpenFolder = 'Open folder'
    DlgTimeSec = 'sec'
    DlgTimeMin = 'minutes'
    FTPPassive = False
    Items = <>
    ShowDialog = False
    Timeout = 0
    OnCopyProgress = WebCopy1CopyProgress
    OnErrorInfo = WebCopy1ErrorInfo
    OnFileDone = WebCopy1FileDone
    OnURLNotFound = WebCopy1URLNotFound
    Version = '2.5.5.0'
    Left = 784
    Top = 232
  end
end
