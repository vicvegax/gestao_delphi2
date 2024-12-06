object fEntrega: TfEntrega
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Entrega de Documento'
  ClientHeight = 351
  ClientWidth = 702
  Color = clBtnFace
  Constraints.MinHeight = 389
  Constraints.MinWidth = 714
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 208
    Width = 112
    Height = 15
    Caption = 'Valor do Documento:'
  end
  object Label2: TLabel
    Left = 40
    Top = 248
    Width = 109
    Height = 15
    Caption = 'Data de Vencimento:'
  end
  object Label5: TLabel
    Left = 40
    Top = 168
    Width = 82
    Height = 15
    Caption = 'Nr. Documento'
  end
  object lbNTREG: TLabel
    Left = 296
    Top = 204
    Width = 58
    Height = 15
    Caption = 'NATUREZA'
  end
  object btConf: TBitBtn
    Tag = 4
    Left = 192
    Top = 296
    Width = 129
    Height = 39
    Caption = '&Entregar'
    Default = True
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
    TabOrder = 4
    OnClick = btConfClick
  end
  object edDTVEN: TcxDateEdit
    Left = 168
    Top = 240
    Properties.Alignment.Horz = taRightJustify
    Properties.ImmediatePost = True
    TabOrder = 2
    OnKeyPress = ProxFocusKeyPress
    Width = 121
  end
  object btCancelar: TBitBtn
    Left = 424
    Top = 296
    Width = 129
    Height = 39
    Cancel = True
    Caption = '&Cancelar'
    Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000010000000200000004000000050000000600000007000000070000
      0006000000050000000400000002000000010000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      0003000000060000000B0000001000000015000000180000001A0000001A0000
      001800000016000000110000000C000000070000000400000001000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000100000003000000070000
      000E0000001706031B4D0F084595180B69D11A0B6FD91E0E87FF1E0D87FF180A
      6ED9170968D10F06449606021B4F000000190000001000000008000000040000
      0001000000010000000000000000000000000000000000000000000000000000
      000000000000000000000000000100000001000000040000000B000000150B06
      2E6B1C0F76E11F148FFF1C199AFF1A1EA4FF1A1FA5FF1823ACFF1822ACFF191E
      A5FF1A1DA3FF1B1899FF1D118DFF1A0C75E20A052C6D000000180000000D0000
      0005000000010000000100000000000000000000000000000000000000000000
      0000000000000000000100000001000000050000000D040311361C0F6ECF2119
      96FF1D21A8FF1C27B2FF1E2AB4FF202DBAFF212DBAFF232FBDFF232FBCFF202D
      B9FF202CB9FF1E2AB6FF1B26B0FF1B1FA5FF1E1492FF180B6AD10402103A0000
      0010000000060000000100000001000000000000000000000000000000000000
      00000000000000000001000000050000000E0A062455241788F02022A5FF202B
      B5FF2231BBFF2432BDFF2533BDFF2533BDFF2533BEFF2533BEFF2433BEFF2532
      BEFF2432BEFF2433BDFF2532BDFF222EBAFF1E2AB3FF1E1EA1FF1D1181F10804
      225A000000120000000600000001000000000000000000000000000000000000
      000000000000000000040000000C0A072553281C93FA2329ADFF2532BCFF2735
      BFFF2735C1FF2836BFFF2836C1FF2836C0FF2836C2FF2836C0FF2836C0FF2836
      C0FF2736C0FF2736C0FF2736BFFF2635BFFF2635BEFF2230BAFF1F25A9FF2114
      8BFA080523590000001000000005000000010000000000000000000000000000
      0000000000020000000906041638281E8CEE262FB2FF2935C0FF2A38C1FF2B38
      C2FF2A39C3FF2B39C2FF2A3AC2FF2B3AC3FF2C3AC3FF2C3AC3FF2C3AC3FF2B3A
      C3FF2B39C3FF2B3AC3FF2939C2FF2A38C2FF2938C2FF2837C0FF2634BFFF2228
      AEFF211585EF0503143E0000000C000000030000000100000000000000000000
      00010000000500000010241B77CB2B2EAFFF2C3BC2FF2D3BC4FF2E3DC4FF2D3D
      C4FF3140C5FF4556CFFF4F5ED2FF4454CEFF303FC7FF2F3EC5FF2F3EC5FF303F
      C6FF4453CEFF4D5DD3FF4555CFFF303FC5FF2C3CC3FF2D3BC4FF2B3AC3FF2A38
      C1FF2526A8FF1D1270D000000016000000070000000100000000000000000000
      00020000000A110D3465312BA5FF3040C4FF2F3FC5FF2F40C6FF3041C6FF3344
      C7FF4B5ACFFF434ABBFF3D41B2FF444CBDFF4A5AD0FF3344C8FF3344C9FF495A
      D1FF4249BAFF393BACFF3E44B6FF4958CDFF3343C7FF2F3FC5FF2E3EC5FF2E3D
      C5FF2E3CC2FF29219AFF0D08306B0000000E0000000300000001000000010000
      00040000000F2C2489DD323BBBFF3344C8FF3243C8FF3244C8FF3444C9FF4B5A
      CFFF4046B6FF9597D4FFE8E8F6FF8081CBFF4147B8FF4D5ED3FF4D5FD3FF3E45
      B7FF7E80C9FFE7E8F5FF9293D0FF3A3EB0FF4959CEFF3244C7FF3142C7FF3041
      C7FF3243C7FF2C35B6FF24187EDF000000160000000700000001000000020000
      00070E0C294E3A36ACFF3A4AC9FF3546C9FF3646CAFF3648C9FF3748CBFF4349
      B9FF9597D4FFF9F4F1FFF5ECE6FFF9F5F4FF8182CBFF4046B7FF3F45B6FF7F81
      C9FFF9F5F3FFF4EBE5FFF9F4F1FF9192D0FF3C41B3FF3648C9FF3546CAFF3445
      C9FF3344C8FF3747C7FF2F29A1FF0B0827570000000B00000002000000020000
      00091F1A59924044BBFF3E4ECCFF384ACCFF394CCBFF3A4CCCFF3B4DCCFF3B3E
      AFFFE3DADCFFE7D9D1FFF4EAE4FFF4EBE4FFF9F5F4FF7F81C9FF7F80C8FFF9F5
      F4FFF4E9E2FFF4E9E2FFF3E8E1FFE9E2E5FF3233A6FF3A4CCCFF384BCBFF384A
      CAFF3748CAFF3A4CCBFF373AB2FF181252980000000E00000003000000020000
      000B2F2882C6444FC7FF3D50CEFF3C4ECDFF3C50CFFF3D50CFFF3D51CFFF3B43
      B8FF6E68AFFFD6C2BBFFE9DAD2FFF4EBE5FFF4EBE5FFF9F6F5FFF9F6F4FFF4EA
      E4FFF4EAE3FFF4EAE3FFE5D6D0FF6A64ADFF343BB1FF3E50CEFF3C4FCDFF3B4D
      CDFF3A4DCCFF3C4ECDFF3F48C0FF251D77CA0000001100000004000000030000
      000C3A36A2EC4958CEFF4052D0FF3F52D0FF4053D0FF4054D1FF4155D1FF4255
      D1FF3940B4FF6D66AEFFD7C2BCFFE9DBD3FFF6ECE6FFF6ECE5FFF4ECE5FFF4EB
      E5FFF6EBE5FFE7D8D1FF6A63ABFF3339AEFF4054CFFF4054D0FF3F52D0FF3E52
      CFFF3D50CFFF3E50CFFF4554CBFF2F2694ED0000001300000005000000030000
      000C423CAFFA5061D5FF4154D1FF4256D1FF4356D2FF4357D2FF4458D3FF4559
      D3FF465AD2FF3E43B5FF6D67AFFFE9DAD4FFF7EDE9FFF6EDE9FFF6EDE8FFF6ED
      E6FFF4EBE5FF706AB4FF393EB1FF4559D1FF4459D3FF4358D2FF4357D2FF4256
      D1FF4054D0FF3F53D0FF4C60D3FF362CA0FA0000001300000005000000030000
      000B4541B1FA5B6DDAFF4557D3FF4559D3FF465AD4FF465BD4FF475CD4FF4A5F
      D5FF687ADDFF464BB6FF7A79C1FFF5EFE9FFF7F0E9FFF6EFE9FFF6EFE9FFF6EF
      E9FFF4ECE7FF7977BFFF3F43B1FF6578DCFF4A5ED5FF475BD4FF465AD4FF4559
      D3FF4357D2FF4356D1FF576BD8FF3830A4FA0000001200000005000000020000
      000A433FABEC6576DAFF485ED5FF475CD5FF485DD5FF5468D9FF687BDDFF8496
      E5FF5255BAFF8080C7FFFAF8F7FFF7F0EBFFF7F1EBFFF7F0EBFFF7F0EAFFF7F0
      EAFFF7F0EAFFFAF7F7FF7A7AC3FF4549B2FF7789E0FF5D70DBFF5063D8FF485D
      D5FF465BD4FF475BD4FF6372D8FF38309DED0000001100000004000000020000
      000839378FC56F7DDAFF4E63D9FF5167D8FF7084E1FF7C8FE4FF7D90E4FF5A5F
      BFFF7D7CC5FFFAF8F7FFF8F2EFFFF8F1EDFFF8F2ECFFE9DDD8FFDECEC8FFEADE
      D8FFF7F0EBFFF7F0EBFFFAF8F7FF7775C0FF4D51B6FF6B7FDFFF687CDEFF5F73
      DBFF4E62D6FF4D62D7FF6A77D5FF302B84C80000000E00000003000000010000
      00062A28668F747DD6FF6F83E1FF8092E4FF8295E5FF8295E5FF8295E6FF3A3B
      A9FFE8E2E7FFEDE3DEFFF9F2EFFFF8F3EFFFE8DDD9FF6F68ADFF6D65A9FFD8C6
      BFFFEADFD8FFF8F2ECFFF7F1ECFFEDE9EEFF2F2D9EFF6F84E2FF6E81E0FF6B7F
      DFFF677BDEFF6376DDFF6C73CFFF23205F940000000B00000003000000010000
      0004151430486F72D1FF9FB0EDFF8699E6FF879AE7FF879AE7FF889BE8FF4E53
      B7FF8179B0FFDCCBC4FFEADFDCFFE7DBD7FF6F68ADFF494DB3FF484CB3FF6C64
      A9FFD8C7C0FFE7DCD7FFEBDFD9FF7E75B0FF4245B0FF7589E2FF7287E2FF7083
      E2FF6C80E0FF889BE8FF5F5FC4FF11102D4E0000000700000002000000000000
      0002000000075757AEDAA8B5EBFF90A3E9FF8D9FE9FF8EA0E9FF8EA0E9FF8696
      E4FF4649B0FF7E75ADFFC3B1B7FF6D66ABFF4A4FB4FF8799E6FF8698E6FF474C
      B1FF6B64A9FFC2B0B6FF796FAAFF3A3CA8FF7587DEFF7A8EE5FF778BE3FF7489
      E3FF768AE3FF99A5E5FF4643A0DC0000000E0000000400000001000000000000
      0001000000042324455B7E82D9FFB0C1F2FF92A5EAFF93A5EBFF93A5EBFF93A5
      EBFF8A9AE4FF4F54B6FF3534A2FF565CBBFF8D9FE8FF8FA2EBFF8EA1EAFF899C
      E7FF5157B9FF2E2C9CFF454AB0FF7C8EE1FF8295E7FF7F92E6FF7C90E5FF798D
      E5FF9EB0EDFF6C6ECBFF1C1B4061000000080000000200000000000000000000
      000000000002000000065455A2C6A8B2E9FFA8B9F0FF97AAECFF98AAECFF98AA
      ECFF98AAECFF97AAECFF97A9ECFF96A9ECFF95A8ECFF94A7ECFF93A6EBFF91A4
      EBFF8FA3EAFF8DA0EAFF8B9FEAFF899CE9FF859AE8FF8397E8FF8194E6FF93A5
      EBFF9CA5E3FF464497C80000000C000000040000000100000000000000000000
      000000000001000000030F0F1C286B6EC5ECBDCAF2FFACBEF1FF9DAFEDFF9DAF
      EEFF9DAFEDFF9DAFEDFF9BAEEDFF9AADEDFF9AACEDFF99ABEDFF97AAEDFF96A9
      ECFF94A7ECFF91A5EBFF8FA3EAFF8CA0EAFF8A9EEAFF879BE9FF99ACEDFFB2C0
      EEFF5C5CBBED0C0C1A2D00000006000000020000000000000000000000000000
      00000000000000000001000000041D1D3646787BD5F9BFCBF2FFBCCCF5FFA1B4
      EFFFA1B3EFFFA1B3EFFFA0B3EEFF9FB1EFFF9EB1EFFF9DAFEEFF9BAEEEFF9AAD
      EEFF98ABEDFF95A9ECFF93A6ECFF90A4EBFF8EA1EAFFACBEF2FFB6C3EFFF696B
      CBFA1818324A0000000700000002000000000000000000000000000000000000
      0000000000000000000000000001000000041D1E36457074CBEEB0BAEEFFD0E0
      F9FFB5C6F3FFA5B7F0FFA5B7F0FFA3B6F0FFA3B5EFFFA1B4EFFF9FB2EFFF9EB0
      EEFF9CAEEEFF99ACEDFF97ABEDFFA6B9F0FFC7D8F7FFA8B1E9FF6466C4EE1A1A
      334A000000070000000200000001000000000000000000000000000000000000
      000000000000000000000000000000000001000000030E0F1A235E60AAC89196
      E4FFC4D0F4FFD7E7FBFFC7D7F7FFB8C8F4FFB3C4F3FFA6B8F0FFA4B7F0FFAFC0
      F2FFB1C2F2FFC0D1F6FFD2E3FAFFBFCCF2FF888EDEFF5556A6CA0D0D19280000
      0006000000020000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000002000000052728
      4656686CBCDA878CE1FFAAB2ECFFC4D1F4FFCAD6F6FFDDECFCFFDCECFCFFC8D5
      F5FFC1CEF3FFA5AEEAFF8085DEFF6163B7DA2526475B00000007000000040000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      000300000004161728323E3F6E825F61A9C56366B2CE797EDBFC787CDAFC6064
      B1CF5C5EA9C63A3D6D8415162734000000060000000400000002000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000010000000200000003000000040000000500000005000000050000
      0005000000040000000400000003000000020000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001000000010000000100000001000000010000
      0001000000010000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ModalResult = 8
    TabOrder = 3
  end
  object edNRDOC: TEdit
    Left = 168
    Top = 160
    Width = 129
    Height = 23
    Alignment = taRightJustify
    MaxLength = 19
    TabOrder = 0
    OnChange = edNRDOCChange
    OnKeyPress = edNRDOCKeyPress
  end
  object edVALOR: TvalorEdit
    Left = 168
    Top = 200
    Width = 121
    Height = 23
    OnKeyPress = ProxFocusKeyPress
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 32
    Top = 16
    Width = 641
    Height = 121
    TabOrder = 5
    object Label6: TLabel
      Left = 16
      Top = 24
      Width = 89
      Height = 15
      Caption = 'Centro de Custo:'
    end
    object Label7: TLabel
      Left = 16
      Top = 56
      Width = 61
      Height = 15
      Caption = 'Favorecido:'
    end
    object Label8: TLabel
      Left = 16
      Top = 88
      Width = 39
      Height = 15
      Caption = 'Evento:'
    end
    object edIDUNI: TEdit
      Left = 120
      Top = 16
      Width = 505
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object edIDPES: TEdit
      Left = 120
      Top = 48
      Width = 505
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object edIDEVE: TEdit
      Left = 120
      Top = 80
      Width = 505
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
  end
end
