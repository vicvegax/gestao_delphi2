object fdlgAgeFor: TfdlgAgeFor
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro R'#225'pido de Agente/Fornecedor'
  ClientHeight = 147
  ClientWidth = 594
  Color = clBtnFace
  Constraints.MinHeight = 185
  Constraints.MinWidth = 606
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object lbDESCR: TLabel
    Left = 0
    Top = 40
    Width = 593
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Deseja cadastrar o CPF/CNPJ: 00.000.000/0000-00 como?'
  end
  object btAge: TBitBtn
    Left = 56
    Top = 88
    Width = 129
    Height = 33
    Caption = '&Agente'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0004000000150000002B00000033000000330000003400000035000000350000
      0036000000360000003600000030000000180000000500000000000000000000
      00141615149B34312FFF302C2BFF2A2826FF262322FF221F1EFF1D1B1AFF1917
      16FF151313FF100F0FFF0D0D0CFF040404A40000001800000000000000000000
      0024393534F8827A74FF554840FF493C37FF423731FF13100EFF100C0CFF2D23
      1FFF261C19FF211815FF1F1714FF0C0C0CFA0000002D00000000000000000000
      00243D3937F88B817BFF675B53FF564941FF2F2B29FF323182FF1A1A6CFF2523
      21FF302520FF281E1BFF221A17FF0F0E0DFB0000003100000000000000000000
      001C363330E0847B75FF7E7269FF63554CFF5E5B5AFF615FA1FF35357DFF5654
      53FF3D302BFF312622FF261E1BFF100E0EE90000002700000000000000000000
      000F242120A3706864FF988C86FF7A6D65FFBBB9B9FF5E5CA0FF4C4C8CFFB7B6
      B6FF463A34FF3C302AFF302B28FF0B0B0AB40000001700000000000000000000
      00040505043144403CEC807772FF958B84FFF7F7F7FF2A2984FF232371FFF5F5
      F5FF5E544FFF564F4CFF1F1E1CF2020202430000000600000000000000000000
      0000000000070303032D312D2BC64A4543FF74849DFF436296FF3C588DFF6370
      8BFF353230FF1B1919D10201013F0000000B0000000100000000000000000000
      000000000000000000040000001E202E41A76484AFFF7FA3C6FF4B83B4FF224B
      87FF0B152BB50000002B00000007000000000000000000000000000000000000
      00000000000000000000000000112A4467CCB0C1D8FF96CCECFF70AFD6FF4377
      AAFF0A1F4ACD0000001B00000000000000000000000000000000000000000000
      000000000000000000000001021E1A2F51F9E8EDF4FFA7DDF6FF84C2E5FF6099
      C3FF102F6BF10000033300000000000000000000000000000000000000000000
      00000000000000000000030B19800A1938FEE4E9F0FFCAEBFBFF96D3F1FF689F
      C6FF14346EF1000213A100000000000000000000000000000000000000000000
      00000000000000000000061126AE1F395BFF212D49FF687387FF97B7CBFF7297
      BDFF071235EB000216B400000000000000000000000000000000000000000000
      00000000000000000000061122921F375AFF233E61FF0C2041FF071432FF2C3E
      62FE030927FF0103138800000000000000000000000000000000000000000000
      0000000000000000000002050A280F2444F7264165FF2A476BFF223D60FF0612
      2FFC020715810000020E00000000000000000000000000000000000000000000
      0000000000000000000000000000040A144F07152DC1071633F304102AD90105
      0F58000000010000000000000000000000000000000000000000}
    TabOrder = 0
    OnClick = btAgeClick
  end
  object btCancelar: TBitBtn
    Left = 424
    Top = 88
    Width = 129
    Height = 33
    Cancel = True
    Caption = '&Cancelar'
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
    TabOrder = 2
  end
  object btFor: TBitBtn
    Left = 240
    Top = 88
    Width = 129
    Height = 33
    Caption = '&Fornecedor'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      000000000000000000000000000100000004695E53DF2F2B2664000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000001595149DF2724206D08080841534B43E56D6257F1020202080000
      0000000000000000000000000000000000000000000000000000000000000000
      0001010101074F4843E33D3A37FA3E3E3EFF2E2E2EF3383531F10505052A0101
      010B5B5044DE29241E6300000000000000000000000000000000000000000000
      000217171759515151FD848585FFBFBFBFFF656566FF484849FF1F1F1FE90B0B
      0B68544B40DE615549F101010104000000000000000000000000000000000000
      0003363636AD8F8F90FFB3B4B4FFD0D0D0FF777777FF717071FF616161FF3333
      33FF1C1B1ACC4D453BE00202020E000000020000000000000000000000000404
      040B5C5B5BF6B0B1B1FFB3B4B4FFE5E5E5FF7C7B7CFF7A7A7BFF747475FF6E6D
      6EFF4D4C4DFF202020F108080851010101070000000000000000000000001F1F
      1F4B7B7C7CFFB3B4B4FFCCCDCDFFFDFDFDFF8E8D8EFF7C7B7CFF7C7B7CFF7876
      78FF717172FF4C4C4DFF141314AB0101010D0000000000000000000000004342
      439699999AFFE5E5E5FFD9D8D8FF959594FFADADACFFDBDADAFF7D7C7DFF7C7B
      7CFF7A797AFF6B6B6CFF202121E7020202110000000100000000000000005454
      54B2B1B1B1E5A2A1A1FE8F8F8FFF919090FF919090FF959494FFEEEDEDFFB4B4
      B4FF7B7A7BFF777677FF373737FF080808400000000300000000000000001212
      122447474796707070F47E7E7EFF8F8E8EFF959494FF959494FFF8F8F7FFF8F8
      F8FFF8F8F8FF878787FE565555FF171717A90101010600000000000000000000
      0000000000000707070F3232326F5E5E5EDB747474FF878686FFF5F5F5FFF5F5
      F5FFD4D4D4FF989898FF4B4C4BFF2A2A29ED0000000400000000000000000000
      0000000000000000000000000000000000001F1F1F484B4B4BBA797979FF6E6F
      6EFF414141CF2323237B090909390D0D0DE20000000400000000000000000000
      00000000000000000000000000000000000000000000000000001212123D1616
      16B7000000020000000000000000101017B403030C2F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F0F
      0FA00505123A05053B66060664B7050680F30101234700000000000000000000
      0000000000000000000000000000000000000000000000000000060627391111
      7EC7121297F00A0A64A803032E510000060C0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303131B0707
      324B000002030000000000000000000000000000000000000000}
    TabOrder = 1
    OnClick = btForClick
  end
end