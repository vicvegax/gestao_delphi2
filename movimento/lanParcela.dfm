object flanParcela: TflanParcela
  Left = 0
  Top = 0
  Hint = '%n - N'#250'mero da Parcela e %t - Total de Parcelas'
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Parcelas'
  ClientHeight = 594
  ClientWidth = 970
  Color = clBtnFace
  Constraints.MinHeight = 632
  Constraints.MinWidth = 982
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
    Left = 16
    Top = 56
    Width = 89
    Height = 15
    Caption = 'Centro de Custo:'
  end
  object Label5: TLabel
    Left = 16
    Top = 88
    Width = 39
    Height = 15
    Caption = 'Evento:'
  end
  object lbIDCTR: TLabel
    Left = 856
    Top = 0
    Width = 96
    Height = 37
    Caption = 'lbIDCTR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 24
    Width = 116
    Height = 15
    Caption = 'Conta de Movimento:'
  end
  object lbNTREG: TLabel
    Left = 640
    Top = 84
    Width = 47
    Height = 15
    Caption = 'Natureza'
  end
  object Label6: TLabel
    Left = 16
    Top = 120
    Width = 61
    Height = 15
    Caption = 'Favorecido:'
  end
  object btConfirmar: TBitBtn
    Tag = 4
    Left = 24
    Top = 544
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
    TabOrder = 9
    OnClick = btConfirmarClick
  end
  object edIDUNI: TzeroEdit
    Left = 144
    Top = 48
    Width = 57
    Height = 23
    OnChange = edIDUNIChange
    OnExit = edIDUNIExit
    OnKeyPress = edProxFocusKeyPress
    OnKeyDown = edIDUNIKeyDown
    TabOrder = 2
    MaxLength = 5
  end
  object btCancelar: TBitBtn
    Left = 816
    Top = 544
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
    TabOrder = 10
    OnClick = btCancelarClick
  end
  object edIDEVE: TMaskEdit
    Left = 144
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
    OnKeyPress = edProxFocusKeyPress
  end
  object edPTUNI: TzeroEdit
    Left = 208
    Top = 48
    Width = 33
    Height = 23
    OnChange = edPTUNIChange
    OnExit = edPTUNIExit
    OnKeyPress = edProxFocusKeyPress
    TabOrder = 3
    MaxLength = 3
    Value = '01'
  end
  object cbIDEVE: TcxLookupComboBox
    Left = 224
    Top = 80
    Properties.CharCase = ecUpperCase
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        SortOrder = soAscending
        FieldName = 'descr'
      end
      item
        FieldName = 'cod'
      end>
    Properties.ListOptions.CaseInsensitive = True
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.DSEVE
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDEVEPropertiesEditValueChanged
    TabOrder = 6
    OnKeyPress = edProxFocusKeyPress
    Width = 401
  end
  object cbIDUNI: TcxLookupComboBox
    Left = 248
    Top = 48
    Properties.CharCase = ecUpperCase
    Properties.ImmediatePost = True
    Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Centro de Custo'
        SortOrder = soAscending
        Width = 300
        FieldName = 'descr'
      end
      item
        FieldName = 'codpt'
      end>
    Properties.ListSource = DM.DSUNI
    Properties.PostPopupValueOnTab = True
    Properties.OnEditValueChanged = cbIDUNIPropertiesEditValueChanged
    TabOrder = 4
    Width = 377
  end
  object grpRep: TGroupBox
    Left = 8
    Top = 152
    Width = 953
    Height = 377
    Caption = 'Parcelas'
    TabOrder = 11
    object pnlMov: TPanel
      Left = 8
      Top = 336
      Width = 937
      Height = 33
      TabOrder = 0
      object lbl1: TLabel
        Left = 696
        Top = 8
        Width = 121
        Height = 15
        Caption = 'Total dos Documentos:'
      end
      object lbl2: TLabel
        Left = 504
        Top = 8
        Width = 106
        Height = 15
        Caption = 'Qt. de Documentos:'
      end
      object btnInc: TBitBtn
        Tag = 1
        Left = 16
        Top = 3
        Width = 113
        Height = 25
        Caption = '&Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
          82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
          59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
          45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
          44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
          D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
          3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
          3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
          5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
        ParentFont = False
        TabOrder = 0
        OnClick = btnModoClick
      end
      object btAlterar: TBitBtn
        Tag = 2
        Left = 135
        Top = 3
        Width = 113
        Height = 25
        Caption = '&Alterar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000040000000F000000110000
          000B000000040000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000E431B10FF31130BE1190A
          0598030407420000000C00000002000000000000000000000000000000000000
          0000000000000000000000000000000000000000000D673C29DCB8C7D2FF7789
          A3FF224084FF040F34960000000F000000020000000000000000000000000000
          0000000000000000000000000000000000000000000841261A91869AB3FFC7E3
          F6FF1B65B9FF286BABFF041237950000000E0000000200000000000000000000
          000000000000000000000000000000000000000000031013163E458BC6FFDDFE
          FDFF4DB4E6FF1B67BAFF2E73B1FF051439940000000D00000002000000000000
          00000000000000000000000000000000000000000001000000081B44628D439F
          D5FFDDFEFDFF55C0ECFF1D6ABCFF337BB6FF06163B920000000CA5A5A5A7A1A1
          A1A9A1A1A1A9A5A5A5A74C4C4C4DBBBBBBC0B8B8B8C1B8B8B8C1B1B1B1C46D96
          B5E348A5D8FFDDFEFDFF5DCBF2FF206EBFFF3883BCFF07193E90A1A1A1A8744E
          42F7744E42F7B8B8B8C18989898E94847EDC6A4132FF978883D86A4032FF7457
          4DF04F6981FC4BABDAFFDDFEFDFF64D5F7FF2474C1FF3C8BC1FFA2A2A2A89275
          6BE86E4332FFA6A19ECCB2B2B2C38C695CF0734737FFAAA7A6C97B4E3EFF7D51
          3FFF917C76E259758FF64EAFDDFFDDFEFDFF6BDEFBFF287AC5FF72727275A79A
          95D3744534FF704232FF7E4F3CFF845342FF7C584BF4B2B2B2C4835342FF8563
          56F0B5B5B5C2ABA8A6C853667DFF51B2DFFFDDFEFDFF4CA7D7FF33333334B5B1
          B0C6895541FF8F6556F49A8279E182513EFF8E756CE3B5B5B5C27F4F3DFF7F5D
          52F0B7B7B7C2B1AEACC77B4E3CFF58728AF8327FBFFF163A5A860D0D0D0DBBBB
          BBC1916A5BEF855848F79F8A82DC804D3AFFA49792D2B8B8B8C284503DFF7443
          32FF947E76E0937366EC7F4E3DFF927D75DF8888889000000003000000008A8A
          8A8DA2887EDF824C37FF956D5DF0804F3DFBBABABAC1BABABAC18B5540FF8558
          48F78C6253F38C5C48FB916F62EBBBBBBBC15959595A00000000000000005959
          595AB0A5A1CD8B533CFF8E5740FF8B6154EFAFAFAFB3BBBBBBC18A543FFF926A
          5CEFACACACB5AFAFAFB4AFAFAFB37F7F7F800000000000000000000000002626
          2626BCBCBCC0966450F78B523BFFA18A83DA8B8B8B8DBCBCBCC08B513DFF8C63
          54EF8A8A8A8D0000000000000000000000000000000000000000000000000000
          0000A5A5A5A6BDBDBDC0BDBDBDC0BEBEBEC04C4C4C4CBEBEBEBFBDBDBDC0BDBD
          BDC08B8B8B8C0000000000000000000000000000000000000000}
        ParentFont = False
        TabOrder = 1
        OnClick = btnModoClick
      end
      object btnExc: TBitBtn
        Tag = 3
        Left = 254
        Top = 3
        Width = 113
        Height = 25
        Caption = '&Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00020000000900000012000000180000001A0000001A00000018000000100000
          0005000000010000000000000000000000000000000000000000000000020000
          000D3524146A936338E5A56B3AFFA36938FFA16736FF9D6233FB633E20B70805
          022800000006000000010000000000000000000000000000000000000008442F
          1D78C18B59FEE1AC76FFE4C296FFB5793BFFB5793CFFB5793CFFAD7239FF7E50
          2AD80302042A00000006000000010000000000000000000000000000000DB07D
          4EF3E6B17AFFE9B47DFFE9B47DFFE7C79DFFB67A3DFFB57A3DFFB57A3DFF6953
          7BFF090E5ED50001052800000006000000010000000000000000000000086A4E
          329DEFD7B3FFE9B47DFFE9B47DFFE9B47DFFEACDA4FFB57B3EFF735C86FF313F
          CCFF2935B8FF0B1161D501010627000000050000000100000000000000010000
          000C745538A5F2DDBBFFE9B47DFFE9B47DFFE9B47DFFD1CEE1FF3443CEFF3443
          CDFF3443CEFF2C39BAFF0D1463D4010106260000000500000001000000000000
          00020000000B76583BA4F5E2C1FFE9B47DFFB5A9B8FF829FF1FFB1C9F5FF3949
          D1FF3A4AD1FF3A49D1FF303FBDFF111767D30101062500000005000000000000
          0000000000010000000B785B3DA3E9E1D2FF87A3F2FF87A4F1FF87A3F2FFB9D0
          F7FF3E50D5FF3E50D5FF3F50D5FF3545C2FF141B6AD201010622000000000000
          000000000000000000010000000A2C386FA2C9E2F9FF8CA8F3FF8DA8F3FF8CA8
          F3FFC0D8F9FF4457D9FF4356D9FF4456D9FF3949C2FF141A61C2000000000000
          000000000000000000000000000100000009303D74A1CFE7FBFF92ADF3FF91AD
          F4FF92ADF4FFC6DEFAFF495EDBFF495DDCFF475AD7FF232F8BF0000000000000
          00000000000000000000000000000000000100000008334177A0D4ECFCFF97B2
          F5FF97B2F4FF97B3F5FFCCE4FBFF4A5FDAFF3141A4F6090C214A000000000000
          000000000000000000000000000000000000000000010000000736457A9FD8F0
          FDFF9DB7F5FF9CB7F5FFD9F1FEFF6B81CAF50B0E234700000006000000000000
          0000000000000000000000000000000000000000000000000001000000063947
          7D9EDBF3FEFFDBF3FFFF677FCFF513192C440000000500000001000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          00053543728E4F63AACD151A2D40000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000030000000400000002000000000000000000000000}
        ParentFont = False
        TabOrder = 2
        OnClick = btnExcClick
      end
      object edtQTD: TEdit
        Left = 624
        Top = 5
        Width = 57
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 3
      end
      object edtVLD: TEdit
        Left = 824
        Top = 5
        Width = 105
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 4
      end
    end
    object gridMov: TcxGrid
      Left = 8
      Top = 24
      Width = 937
      Height = 313
      TabOrder = 1
      object gviewMov: TcxGridDBTableView
        OnDblClick = gviewMovDblClick
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DSMOV
        DataController.KeyFieldNames = 'id'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvColumnHeader]
        OptionsSelection.ShowCheckBoxesDynamically = True
        OptionsView.GroupByBox = False
        object colMovdt_ven: TcxGridDBColumn
          Caption = 'Dt. Venc.'
          DataBinding.FieldName = 'dt_ven'
          Options.Editing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 75
        end
        object colMovcompt: TcxGridDBColumn
          Caption = 'Compet.'
          DataBinding.FieldName = 'compt'
          Options.Editing = False
          Width = 60
        end
        object colMovds_tpd: TcxGridDBColumn
          Caption = 'Tipo de Documento'
          DataBinding.FieldName = 'calc_ds_tpd'
          Options.Editing = False
          Width = 185
        end
        object colNRDOC: TcxGridDBColumn
          Caption = 'Nr. Documento'
          DataBinding.FieldName = 'nr_doc'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.OnChange = colNRDOCPropertiesChange
          Width = 142
        end
        object colMovvl_bas: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'calc_ValorDC'
          Options.Editing = False
          Width = 81
        end
        object colMovdescr: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descr'
          Options.Editing = False
          Width = 305
        end
        object colMovbanco: TcxGridDBColumn
          Caption = 'Banco'
          DataBinding.FieldName = 'banco'
          Options.Editing = False
          Width = 46
        end
        object colMovagencia: TcxGridDBColumn
          Caption = 'Ag'#234'ncia'
          DataBinding.FieldName = 'agencia'
          Options.Editing = False
          Width = 62
        end
        object colMovconta: TcxGridDBColumn
          Caption = 'Nr. Conta'
          DataBinding.FieldName = 'nr_conta'
          Options.Editing = False
        end
        object colMovtipo: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'calc_ds_tp_conta'
          Options.Editing = False
          Width = 42
        end
        object colMovID: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          Visible = False
        end
        object gviewMovColumn1: TcxGridDBColumn
          Caption = 'Obs.'
          DataBinding.FieldName = 'obs'
          Width = 512
        end
      end
      object glevelMov: TcxGridLevel
        GridView = gviewMov
      end
    end
    object pnlAguarde: TPanel
      Left = 144
      Top = 88
      Width = 329
      Height = 57
      Caption = 'Aguarde! Opera'#231#227'o em Andamento!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  object edIDPES: TMaskEdit
    Left = 120
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
  object cbIDPES: TcxLookupComboBox
    Left = 240
    Top = 112
    Properties.CharCase = ecUpperCase
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
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
    Width = 385
  end
  object cbIDCNT: TcxLookupComboBox
    Left = 208
    Top = 16
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
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
    OnKeyPress = edProxFocusKeyPress
    Width = 361
  end
  object edIDCNT: TzeroEdit
    Left = 144
    Top = 16
    Width = 57
    Height = 23
    OnChange = edIDCNTChange
    OnKeyPress = edProxFocusKeyPress
    OnKeyDown = edIDCNTKeyDown
    TabOrder = 0
    MaxLength = 4
  end
  object DSMOV: TDataSource
    AutoEdit = False
    DataSet = DM.QYMOV
    Left = 688
    Top = 16
  end
end
