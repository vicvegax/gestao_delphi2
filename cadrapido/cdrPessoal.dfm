object fcdrPessoal: TfcdrPessoal
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Cadastro R'#225'pido de Agente/Fornecedor'
  ClientHeight = 468
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 72
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 32
    Top = 392
    Width = 48
    Height = 15
    Caption = 'Situa'#231#227'o:'
  end
  object Label4: TLabel
    Left = 472
    Top = 304
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object Label9: TLabel
    Left = 48
    Top = 192
    Width = 38
    Height = 15
    Caption = 'Fone 1:'
  end
  object Label10: TLabel
    Left = 16
    Top = 32
    Width = 66
    Height = 15
    Caption = 'Documento:'
  end
  object Label11: TLabel
    Left = 232
    Top = 192
    Width = 38
    Height = 15
    Caption = 'Fone 2:'
  end
  object Label12: TLabel
    Left = 48
    Top = 232
    Width = 37
    Height = 15
    Caption = 'e-mail:'
  end
  object lbCOD: TLabel
    Left = 376
    Top = 32
    Width = 43
    Height = 15
    Caption = 'Chave J:'
  end
  object Label6: TLabel
    Left = 152
    Top = 112
    Width = 43
    Height = 15
    Caption = 'Ag'#234'ncia'
  end
  object Label7: TLabel
    Left = 48
    Top = 144
    Width = 32
    Height = 15
    Caption = 'Conta'
  end
  object Label8: TLabel
    Left = 48
    Top = 112
    Width = 36
    Height = 15
    Caption = 'Banco:'
  end
  object Label2: TLabel
    Left = 232
    Top = 144
    Width = 26
    Height = 15
    Caption = 'Tipo:'
  end
  object edDESCR: TEdit
    Left = 96
    Top = 64
    Width = 449
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 3
    TextHint = '(Nome Completo)'
    OnKeyPress = edDESCRKeyPress
  end
  object cbAtivo: TComboBox
    Left = 96
    Top = 384
    Width = 75
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    Enabled = False
    ItemIndex = 1
    TabOrder = 12
    Text = 'ATIVO'
    Items.Strings = (
      'INATIVO'
      'ATIVO')
  end
  object edObs: TMemo
    Left = 224
    Top = 320
    Width = 323
    Height = 89
    TabOrder = 13
  end
  object cbTPINS: TComboBox
    Left = 96
    Top = 24
    Width = 59
    Height = 23
    Style = csDropDownList
    Enabled = False
    ItemIndex = 0
    TabOrder = 0
    Text = 'CPF'
    OnSelect = cbTPINSSelect
    Items.Strings = (
      'CPF'
      'CNPJ')
  end
  object edNRINS: TMaskEdit
    Left = 168
    Top = 24
    Width = 117
    Height = 23
    Enabled = False
    TabOrder = 1
    Text = ''
    TextHint = '(Documento)'
    OnKeyPress = edProxFocusKeyPress
  end
  object edFone1: TfoneEdit
    Left = 96
    Top = 184
    Width = 117
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 8
    MaxLength = 15
  end
  object edFone2: TfoneEdit
    Left = 296
    Top = 184
    Width = 119
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 9
    MaxLength = 15
  end
  object edEmail: TEdit
    Left = 96
    Top = 224
    Width = 450
    Height = 23
    CharCase = ecLowerCase
    MaxLength = 50
    TabOrder = 10
    TextHint = 'e-mail'
    OnKeyPress = edProxFocusKeyPress
  end
  object edCOD: TEdit
    Left = 432
    Top = 24
    Width = 113
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 2
    TextHint = '(CHAVE J)'
    OnKeyPress = edProxFocusKeyPress
  end
  object btOK: TBitBtn
    Tag = 4
    Left = 48
    Top = 432
    Width = 129
    Height = 33
    Caption = '&Incluir'
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
    TabOrder = 14
    OnClick = btOKClick
  end
  object btCancelar: TBitBtn
    Left = 392
    Top = 432
    Width = 129
    Height = 33
    Cancel = True
    Caption = '&Cancelar'
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
    TabOrder = 15
  end
  object edAgencia: TagenciaEdit
    Left = 208
    Top = 104
    Width = 65
    Height = 23
    OnExit = edAgenciaExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 5
    MaxLength = 6
  end
  object edNrConta: TcontaEdit
    Left = 96
    Top = 136
    Width = 121
    Height = 23
    OnExit = edNrContaExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 6
    MaxLength = 20
  end
  object edBanco: TbancoEdit
    Left = 96
    Top = 104
    Width = 41
    Height = 23
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 4
    MaxLength = 4
  end
  object cbTPCNT: TComboBox
    Left = 272
    Top = 136
    Width = 105
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 0
    TabOrder = 7
    Text = 'C. CORRENTE'
    OnKeyPress = edProxFocusKeyPress
    Items.Strings = (
      'C. CORRENTE'
      'POUPAN'#199'A')
  end
  object pnIDUNI: TPanel
    Left = 24
    Top = 256
    Width = 529
    Height = 41
    BevelOuter = bvNone
    TabOrder = 11
    object lbLOC: TLabel
      Left = 16
      Top = 16
      Width = 45
      Height = 15
      Caption = 'Lota'#231#227'o:'
    end
    object edIDUNI: TzeroEdit
      Left = 72
      Top = 8
      Width = 49
      Height = 23
      OnChange = edIDUNIChange
      OnExit = edIDUNIExit
      OnKeyPress = edProxFocusKeyPress
      TabOrder = 0
      MaxLength = 5
    end
    object cbIDUNI: TcxLookupComboBox
      Left = 160
      Top = 8
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'descr'
        end
        item
          FieldName = 'codpt'
        end>
      Properties.ListSource = DM.DSUNI
      Properties.OnEditValueChanged = cbIDUNIPropertiesEditValueChanged
      TabOrder = 1
      Width = 361
    end
    object edPTUNI: TzeroEdit
      Left = 128
      Top = 8
      Width = 25
      Height = 23
      OnChange = edPTUNIChange
      OnKeyPress = edProxFocusKeyPress
      TabOrder = 2
      MaxLength = 3
      Value = '01'
    end
  end
end
