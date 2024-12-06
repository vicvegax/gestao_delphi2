object fCfgFatura: TfCfgFatura
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Encargos'
  ClientHeight = 434
  ClientWidth = 641
  Color = clBtnFace
  Constraints.MinHeight = 472
  Constraints.MinWidth = 653
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
    Left = 88
    Top = 88
    Width = 29
    Height = 15
    Caption = 'PIS %'
  end
  object Label2: TLabel
    Left = 64
    Top = 120
    Width = 54
    Height = 15
    Caption = 'COFINS %'
  end
  object Label3: TLabel
    Left = 80
    Top = 152
    Width = 39
    Height = 15
    Caption = 'CSLL %'
  end
  object Label4: TLabel
    Left = 88
    Top = 184
    Width = 33
    Height = 15
    Caption = 'IRPJ %'
  end
  object Label5: TLabel
    Left = 40
    Top = 216
    Width = 80
    Height = 15
    Caption = '* Adicional 1 %'
  end
  object Label6: TLabel
    Left = 40
    Top = 280
    Width = 80
    Height = 15
    Caption = '* Abatimento $'
  end
  object Label7: TLabel
    Left = 56
    Top = 312
    Width = 62
    Height = 15
    Caption = 'Reten'#231#227'o %'
  end
  object Label8: TLabel
    Left = 24
    Top = 24
    Width = 112
    Height = 15
    Caption = 'Ano de Compet'#234'ncia'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 56
    Width = 625
    Height = 9
    Shape = bsTopLine
  end
  object Label9: TLabel
    Left = 40
    Top = 248
    Width = 80
    Height = 15
    Caption = '* Adicional 2 %'
  end
  object Label10: TLabel
    Left = 264
    Top = 112
    Width = 83
    Height = 15
    Caption = '* Receita (Teste)'
  end
  object Label11: TLabel
    Left = 264
    Top = 296
    Width = 218
    Height = 15
    Caption = '* F'#243'rmula para c'#225'lculo do Valor Adicional'
  end
  object Label12: TLabel
    Left = 40
    Top = 344
    Width = 77
    Height = 15
    Caption = 'ISS - Mensal %'
  end
  object edPIS: TvalorEdit
    Left = 128
    Top = 80
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edCOFINS: TvalorEdit
    Left = 128
    Top = 112
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object edCSLL: TvalorEdit
    Left = 128
    Top = 144
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object edIRPJ: TvalorEdit
    Left = 128
    Top = 176
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object edADI1: TvalorEdit
    Left = 128
    Top = 208
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object edABAT: TvalorEdit
    Left = 128
    Top = 272
    Width = 121
    Height = 23
    TabOrder = 7
  end
  object edRET: TvalorEdit
    Left = 128
    Top = 304
    Width = 121
    Height = 23
    TabOrder = 8
  end
  object cbANO: TComboBox
    Left = 144
    Top = 18
    Width = 105
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnSelect = cbANOSelect
  end
  object btConf: TBitBtn
    Tag = 4
    Left = 16
    Top = 384
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
    TabOrder = 10
    OnClick = btConfClick
  end
  object btCancelar: TBitBtn
    Left = 496
    Top = 384
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
    ModalResult = 8
    TabOrder = 11
  end
  object edADI2: TvalorEdit
    Left = 128
    Top = 240
    Width = 121
    Height = 23
    TabOrder = 6
  end
  object ed1: TfsSyntaxMemo
    Left = 264
    Top = 136
    Width = 361
    Height = 153
    Cursor = crIBeam
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 12
    TabStop = True
    BlockColor = clHighlight
    BlockFontColor = clHighlightText
    CommentAttr.Charset = DEFAULT_CHARSET
    CommentAttr.Color = clNavy
    CommentAttr.Height = -17
    CommentAttr.Name = 'Courier New'
    CommentAttr.Style = [fsItalic]
    KeywordAttr.Charset = DEFAULT_CHARSET
    KeywordAttr.Color = clWindowText
    KeywordAttr.Height = -17
    KeywordAttr.Name = 'Courier New'
    KeywordAttr.Style = [fsBold]
    StringAttr.Charset = DEFAULT_CHARSET
    StringAttr.Color = clNavy
    StringAttr.Height = -17
    StringAttr.Name = 'Courier New'
    StringAttr.Style = []
    TextAttr.Charset = DEFAULT_CHARSET
    TextAttr.Color = clWindowText
    TextAttr.Height = -17
    TextAttr.Name = 'Courier New'
    TextAttr.Style = []
    Lines.Strings = (
      'result = receita * adic2'
      'if(result > abat)'
      '  result = result - abat'
      '  result = result * adic1'
      'else'
      '  result = 0')
    ReadOnly = False
    SyntaxType = stJs
    ShowFooter = True
    ShowGutter = True
  end
  object edREC: TvalorEdit
    Left = 352
    Top = 104
    Width = 121
    Height = 23
    TabOrder = 13
  end
  object Button1: TButton
    Left = 552
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Testar'
    TabOrder = 14
    OnClick = Button1Click
  end
  object edISS: TvalorEdit
    Left = 128
    Top = 336
    Width = 121
    Height = 23
    TabOrder = 9
  end
  object Button2: TButton
    Left = 264
    Top = 16
    Width = 177
    Height = 25
    Caption = 'Copiar dados do Ano Anterior'
    TabOrder = 15
    OnClick = Button2Click
  end
  object qycfg: TFDQuery
    Connection = DM.DBCON
    Left = 472
    Top = 80
  end
end
