object flanMov: TflanMov
  Left = 0
  Top = 0
  Hint = '%n - N'#250'mero da Parcela e %t - Total de Parcelas'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Lan'#231'amento'
  ClientHeight = 586
  ClientWidth = 634
  Color = clBtnFace
  Constraints.MinWidth = 646
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    634
    586)
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 89
    Height = 15
    Caption = 'Centro de Custo:'
  end
  object Label3: TLabel
    Left = 16
    Top = 152
    Width = 109
    Height = 15
    Caption = 'Data de Vencimento:'
  end
  object Label4: TLabel
    Left = 16
    Top = 184
    Width = 112
    Height = 15
    Caption = 'Valor do Documento:'
  end
  object Label5: TLabel
    Left = 16
    Top = 88
    Width = 39
    Height = 15
    Caption = 'Evento:'
  end
  object Label6: TLabel
    Left = 16
    Top = 120
    Width = 61
    Height = 15
    Caption = 'Favorecido:'
  end
  object Label7: TLabel
    Left = 16
    Top = 216
    Width = 108
    Height = 15
    Caption = 'Tipo de Documento:'
  end
  object Label8: TLabel
    Left = 16
    Top = 312
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object Label11: TLabel
    Left = 16
    Top = 344
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object Label12: TLabel
    Left = 16
    Top = 24
    Width = 35
    Height = 15
    Caption = 'Conta:'
  end
  object Label13: TLabel
    Left = 288
    Top = 152
    Width = 74
    Height = 15
    Caption = 'Compet'#234'ncia:'
  end
  object lbNTREG: TLabel
    Left = 288
    Top = 180
    Width = 58
    Height = 15
    Caption = 'NATUREZA'
  end
  object Label17: TLabel
    Left = 416
    Top = 216
    Width = 43
    Height = 15
    Caption = 'Nr. Doc.'
  end
  object lbPARC: TLabel
    Left = 16
    Top = 408
    Width = 43
    Height = 15
    Caption = 'Parcelas'
  end
  object lbINFO: TLabel
    Left = 296
    Top = 440
    Width = 305
    Height = 65
    AutoSize = False
    Caption = 
      '* Utilize na descri'#231#227'o:'#13#10'  %N - para o N'#250'mero Atual da parcela.'#13 +
      #10'  %T - para o N'#250'mero Total de parcelas.'#13#10'  %PARCELA - Ser'#225' subs' +
      'titu'#237'do por: PARCELA %N DE %T'
  end
  object lbInicio: TLabel
    Left = 16
    Top = 440
    Width = 69
    Height = 15
    Caption = 'Iniciando em'
    Visible = False
  end
  object lbTotal: TLabel
    Left = 16
    Top = 472
    Width = 41
    Height = 15
    Caption = 'Total de'
    Visible = False
  end
  object lbQTPAR: TLabel
    Left = 256
    Top = 536
    Width = 129
    Height = 15
    Alignment = taRightJustify
    Caption = 'Quantidade de Parcelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbDIAUTILv: TLabel
    Left = 16
    Top = 576
    Width = 407
    Height = 15
    Caption = 
      '* Datas ser'#227'o sempre corrigidas para o pr'#243'ximo Dia '#218'til AP'#211'S a C' +
      'onfirma'#231#227'o.'
    Visible = False
  end
  object btConf: TBitBtn
    Left = 16
    Top = 536
    Width = 129
    Height = 33
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000030000000E000000150000000C0000
      0002000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000200000012072B199C136940FF051E127A0000
      000C000000010000000000000000000000000000000000000000000000000000
      0000000000000000000200000010082D1B9A278B63FF3CB58BFF16623FF4020B
      063D000000060000000000000000000000000000000000000000000000000000
      0000000000020000000E082F1C972C9068FF45C097FF44BF96FF36A67DFF0C46
      2BCE000000150000000200000000000000000000000000000000000000000000
      00010000000C09321F9430966FFF56CAA4FF95E3C8FF7BD7B8FF48C39AFF2A8D
      65FF082B1A8A0000000C00000001000000000000000000000000000000000000
      00060A352190349B75FF7BDBBBFFACE9D3FF4EA07EFF6DB99AFF7DDABBFF4CC4
      9DFF1F7852FC03120B4800000007000000010000000000000000000000000000
      00084B8E60FF99E8CEFF90D0B7FF287F5BEF09281B680E422D9A6EBA9DFF75D9
      B7FF4ABE97FF196747E70209062B000000040000000000000000000000000000
      0003082016494D9063FF14573CB2020B0723000000070000000C135239B280CA
      AEFF71D8B8FF46B691FF135639CA000101140000000200000000000000000000
      0000000000030000000600000005000000020000000000000002010302121A63
      44C28CD3B9FF7ADDBEFF3FAA84FF0D432CA10000000D00000002000000000000
      0000000000000000000000000000000000000000000000000000000000020105
      03151B6748C484CFB3FF81E1C4FF38A27BFF0B34237D00000007000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000101030210175E42B27ECCAFFF97E9D0FF4E9265FF00000009000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010002010B15573DA5509769FF0822184A00000004000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000100000004000000060000000300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ParentFont = False
    TabOrder = 25
    OnClick = btConfClick
  end
  object edIDUNI: TzeroEdit
    Left = 136
    Top = 48
    Width = 57
    Height = 23
    OnChange = edIDUNIChange
    OnExit = edIDUNIExit
    OnKeyPress = ProxFocusKeyPress
    OnKeyDown = edIDUNIKeyDown
    TabOrder = 2
    MaxLength = 5
  end
  object edDTVEN: TcxDateEdit
    Left = 160
    Top = 144
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.PostPopupValueOnTab = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnEditValueChanged = edDTVENPropertiesEditValueChanged
    TabOrder = 9
    OnKeyPress = ProxFocusKeyPress
    Width = 121
  end
  object edVLBAS: TvalorEdit
    Left = 160
    Top = 176
    Width = 121
    Height = 23
    OnKeyPress = ProxFocusKeyPress
    OnChange = edVLBASChange
    TabOrder = 12
  end
  object edOBS: TMemo
    Left = 112
    Top = 336
    Width = 505
    Height = 52
    ScrollBars = ssVertical
    TabOrder = 20
  end
  object edDESCR: TEdit
    Left = 112
    Top = 304
    Width = 505
    Height = 23
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnKeyPress = edDESCRKeyPress
  end
  object cbIDTPD: TcxLookupComboBox
    Left = 200
    Top = 208
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        SortOrder = soAscending
        FieldName = 'descr'
      end>
    Properties.ListOptions.ColumnSorting = False
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.DSTPD
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDTPDPropertiesEditValueChanged
    TabOrder = 15
    OnKeyPress = ProxFocusKeyPress
    Width = 209
  end
  object btCancelar: TBitBtn
    Left = 488
    Top = 536
    Width = 129
    Height = 33
    Anchors = [akLeft, akBottom]
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
    ModalResult = 8
    TabOrder = 27
    ExplicitTop = 527
  end
  object cbCOMPT: TComboBox
    Left = 392
    Top = 144
    Width = 145
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 10
    OnKeyPress = ProxFocusKeyPress
    OnSelect = cbCOMPTSelect
    Items.Strings = (
      'M'#202'S ANTERIOR'
      'M'#202'S VIGENTE'
      'PR'#211'XIMO M'#202'S'
      'M'#202'S/ANO'
      'ANO'
      'TRIMESTRE'
      'SEMESTRE')
  end
  object chLiquidaDesativado: TCheckBox
    Left = 256
    Top = 552
    Width = 185
    Height = 17
    Caption = 'LIQUIDAR o(s) lan'#231'amento(s)'
    TabOrder = 26
    Visible = False
  end
  object edIDEVE: TMaskEdit
    Left = 88
    Top = 80
    Width = 73
    Height = 23
    Alignment = taRightJustify
    EditMask = '9.99.99.99;0;_'
    MaxLength = 10
    TabOrder = 5
    Text = ''
    TextHint = '(C'#243'digo)'
    OnChange = edIDEVEChange
    OnClick = edIDEVEClick
    OnExit = edIDEVEExit
    OnKeyDown = edIDEVEKeyDown
    OnKeyPress = ProxFocusKeyPress
  end
  object edCOMPT: TMaskEdit
    Left = 544
    Top = 144
    Width = 73
    Height = 23
    Alignment = taRightJustify
    EditMask = '00/0000'
    MaxLength = 7
    TabOrder = 11
    Text = '  /    '
    OnExit = edCOMPTExit
    OnKeyPress = ProxFocusKeyPress
  end
  object edIDPES: TMaskEdit
    Left = 112
    Top = 112
    Width = 114
    Height = 23
    Alignment = taRightJustify
    TabOrder = 7
    Text = ''
    OnChange = edIDPESChange
    OnEnter = edIDPESEnter
    OnExit = edIDPESExit
    OnKeyPress = edIDPESKeyPress
  end
  object edPTUNI: TzeroEdit
    Left = 200
    Top = 48
    Width = 33
    Height = 23
    OnChange = edPTUNIChange
    OnExit = edPTUNIExit
    OnKeyPress = ProxFocusKeyPress
    TabOrder = 3
    MaxLength = 3
    Value = '01'
  end
  object edIDTPD: TzeroEdit
    Left = 152
    Top = 208
    Width = 41
    Height = 23
    OnChange = edIDTPDChange
    OnExit = edIDTPDExit
    OnKeyPress = ProxFocusKeyPress
    OnKeyDown = edIDTPDKeyDown
    TabOrder = 14
    MaxLength = 4
  end
  object edNRDOC: TEdit
    Left = 480
    Top = 208
    Width = 137
    Height = 23
    Alignment = taRightJustify
    CharCase = ecUpperCase
    MaxLength = 21
    TabOrder = 16
    OnChange = edNRDOCChange
    OnKeyPress = edNRDOCKeyPress
  end
  object cbIDUNI: TcxLookupComboBox
    Left = 240
    Top = 48
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        SortOrder = soAscending
        Width = 290
        FieldName = 'descr'
      end
      item
        Width = 90
        FieldName = 'codpt'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.DSUNI
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDUNIPropertiesEditValueChanged
    TabOrder = 4
    OnKeyPress = ProxFocusKeyPress
    Width = 377
  end
  object cbIDPES: TcxLookupComboBox
    Left = 232
    Top = 112
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Nome'
        SortOrder = soAscending
        FieldName = 'descr'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.DSPES
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDPESPropertiesEditValueChanged
    TabOrder = 8
    OnKeyPress = ProxFocusKeyPress
    Width = 385
  end
  object edQTPAR: TcxSpinEdit
    Left = 96
    Top = 400
    Properties.Alignment.Horz = taRightJustify
    Properties.ImmediatePost = True
    Properties.MaxValue = 60.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.OnEditValueChanged = edQTPARPropertiesEditValueChanged
    TabOrder = 21
    Value = 1
    Width = 65
  end
  object pnBanco: TPanel
    Left = 80
    Top = 240
    Width = 521
    Height = 25
    BevelOuter = bvNone
    TabOrder = 17
    object Label14: TLabel
      Left = 0
      Top = 8
      Width = 36
      Height = 15
      Caption = 'Banco:'
    end
    object Label15: TLabel
      Left = 112
      Top = 8
      Width = 46
      Height = 15
      Caption = 'Ag'#234'ncia:'
    end
    object Label16: TLabel
      Left = 256
      Top = 8
      Width = 35
      Height = 15
      Caption = 'Conta:'
    end
    object Label18: TLabel
      Left = 424
      Top = 8
      Width = 26
      Height = 15
      Caption = 'Tipo:'
      Visible = False
    end
    object edBanco: TbancoEdit
      Left = 56
      Top = 0
      Width = 41
      Height = 23
      OnKeyPress = ProxFocusKeyPress
      TabOrder = 0
      MaxLength = 6
    end
    object edAgencia: TagenciaEdit
      Left = 168
      Top = 0
      Width = 72
      Height = 23
      OnExit = edAgenciaExit
      OnKeyPress = ProxFocusKeyPress
      TabOrder = 1
      MaxLength = 6
    end
    object edNrConta: TcontaEdit
      Left = 304
      Top = 0
      Width = 113
      Height = 23
      OnEnter = edNrContaEnter
      OnExit = edNrContaExit
      OnKeyPress = ProxFocusKeyPress
      TabOrder = 2
      MaxLength = 13
    end
    object cbTpConta: TComboBox
      Left = 456
      Top = 0
      Width = 57
      Height = 23
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemIndex = 0
      TabOrder = 3
      Text = '-'
      OnKeyPress = ProxFocusKeyPress
      Items.Strings = (
        '-'
        'CC'
        'POUP')
    end
  end
  object pnPerio: TPanel
    Left = 80
    Top = 272
    Width = 521
    Height = 25
    BevelOuter = bvNone
    TabOrder = 18
    object Label19: TLabel
      Left = 0
      Top = 8
      Width = 128
      Height = 15
      Caption = 'Per'#237'odo de Faturamento'
    end
    object Label20: TLabel
      Left = 160
      Top = 8
      Width = 32
      Height = 15
      Caption = 'In'#237'cio:'
    end
    object Label21: TLabel
      Left = 344
      Top = 8
      Width = 23
      Height = 15
      Caption = 'Fim:'
    end
    object edPerioIni: TcxDateEdit
      Left = 200
      Top = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DateOnError = deNull
      Properties.ImmediateDropDownWhenActivated = True
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = edPerioIniPropertiesEditValueChanged
      TabOrder = 0
      OnKeyPress = ProxFocusKeyPress
      Width = 121
    end
    object edPerioFim: TcxDateEdit
      Left = 376
      Top = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DateOnError = deNull
      Properties.ImmediateDropDownWhenActivated = True
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      OnKeyPress = ProxFocusKeyPress
      Width = 121
    end
  end
  object edIDCNT: TzeroEdit
    Left = 96
    Top = 16
    Width = 57
    Height = 23
    OnChange = edIDCNTChange
    OnKeyPress = ProxFocusKeyPress
    OnKeyDown = edIDCNTKeyDown
    TabOrder = 0
    MaxLength = 4
  end
  object cbIDCNT: TcxLookupComboBox
    Left = 160
    Top = 16
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Width = 170
        FieldName = 'descr'
      end
      item
        SortOrder = soAscending
        Width = 30
        FieldName = 'cod'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.DSCNT
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDCNTPropertiesEditValueChanged
    TabOrder = 1
    OnKeyPress = ProxFocusKeyPress
    Width = 457
  end
  object edQtPar2: TcxSpinEdit
    Left = 96
    Top = 432
    Properties.Alignment.Horz = taRightJustify
    Properties.ImmediatePost = True
    Properties.MaxValue = 60.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.OnEditValueChanged = edQTPARPropertiesEditValueChanged
    TabOrder = 22
    Value = 1
    Visible = False
    Width = 65
  end
  object edQTPAR3: TcxSpinEdit
    Left = 96
    Top = 464
    Properties.Alignment.Horz = taRightJustify
    Properties.ImmediatePost = True
    Properties.MaxValue = 60.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.OnEditValueChanged = edQTPARPropertiesEditValueChanged
    TabOrder = 23
    Value = 1
    Visible = False
    Width = 65
  end
  object cbIDEVE: TcxExtLookupComboBox
    Left = 168
    Top = 80
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.View = gvIDEVE
    Properties.KeyFieldNames = 'id'
    Properties.ListFieldItem = evDESCR
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDEVEPropertiesEditValueChanged
    TabOrder = 6
    OnEnter = cbIDEVEEnter
    OnKeyPress = ProxFocusKeyPress
    Width = 449
  end
  object chDIV: TCheckBox
    Left = 176
    Top = 408
    Width = 257
    Height = 17
    Caption = 'Dividir o Valor pela quantidade de Parcelas'
    TabOrder = 28
  end
  object chZero: TCheckBox
    Left = 360
    Top = 180
    Width = 97
    Height = 17
    TabStop = False
    Caption = 'Valor Zerado'
    TabOrder = 13
    OnClick = chZeroClick
  end
  object chsempreREPete: TCheckBox
    Left = 72
    Top = 16
    Width = 17
    Height = 17
    TabStop = False
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 29
  end
  object chRCUS: TCheckBox
    Left = 112
    Top = 48
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 30
  end
  object chreve: TCheckBox
    Left = 64
    Top = 80
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 31
  end
  object chRFAV: TCheckBox
    Left = 88
    Top = 112
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 32
  end
  object chrven: TCheckBox
    Left = 136
    Top = 144
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 33
  end
  object chrvld: TCheckBox
    Left = 136
    Top = 176
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 34
  end
  object chrcompt: TCheckBox
    Left = 368
    Top = 144
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 35
  end
  object chrtpd: TCheckBox
    Left = 128
    Top = 208
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 36
  end
  object chsrdes: TCheckBox
    Left = 88
    Top = 304
    Width = 17
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 38
  end
  object chsrobs: TCheckBox
    Left = 88
    Top = 336
    Width = 17
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 39
  end
  object chDiaUtil: TCheckBox
    Left = 16
    Top = 504
    Width = 273
    Height = 17
    Caption = 'Lan'#231'ar Data em Dia '#218'til (AP'#211'S a Confirma'#231#227'o)'
    Checked = True
    State = cbChecked
    TabOrder = 24
  end
  object chrbco: TCheckBox
    Left = 56
    Top = 248
    Width = 17
    Height = 17
    TabStop = False
    TabOrder = 37
    Visible = False
  end
  object gvRepo: TcxGridViewRepository
    Left = 648
    Top = 424
    object gvIDEVE: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DM.DSEVE
      DataController.KeyFieldNames = 'id'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object evDESCR: TcxGridDBColumn
        DataBinding.FieldName = 'descr'
        MinWidth = 39
        SortIndex = 1
        SortOrder = soAscending
        Width = 300
      end
      object evCOD: TcxGridDBColumn
        DataBinding.FieldName = 'cod'
        OnCustomDrawCell = evCODCustomDrawCell
        MinWidth = 39
        Width = 80
      end
      object evNT: TcxGridDBColumn
        Caption = 'Nt.'
        DataBinding.FieldName = 'nt_reg'
        MinWidth = 39
        Width = 40
      end
      object edTP: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'tipo'
        MinWidth = 31
        SortIndex = 0
        SortOrder = soAscending
        Width = 60
      end
    end
  end
end
