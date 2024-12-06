object frelAnalisePonto: TfrelAnalisePonto
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Relat'#243'rio de An'#225'lise de Ponto (Centro de Custo)'
  ClientHeight = 498
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnBar: TPanel
    Left = 0
    Top = 0
    Width = 1034
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1028
    object Label5: TLabel
      Left = 768
      Top = 40
      Width = 62
      Height = 15
      Caption = 'Saldo Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 496
      Top = 40
      Width = 74
      Height = 15
      Caption = 'Saldo Anterior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 32
      Height = 15
      Caption = 'Conta'
    end
    object Label2: TLabel
      Left = 264
      Top = 64
      Width = 6
      Height = 15
      Caption = 'e'
    end
    object Label1: TLabel
      Left = 16
      Top = 64
      Width = 92
      Height = 15
      Caption = 'Movimento entre'
    end
    object Label7: TLabel
      Left = 896
      Top = 40
      Width = 39
      Height = 15
      Caption = 'Cr'#233'dito'
      Visible = False
    end
    object Label8: TLabel
      Left = 1032
      Top = 40
      Width = 35
      Height = 15
      Alignment = taRightJustify
      Caption = 'D'#233'bito'
      Visible = False
    end
    object imgMostra: TImage
      Left = 968
      Top = 24
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
        0020000000200806000000737A7AF40000000F744558745469746C650053686F
        773B4579653B49E307250000082D49444154785EED977B7054D51DC73FF7EE6E
        EEEEE69D4D4840E499F012484010498D451404918750B45140A516B5286069ED
        68AD62B1DAAA14B4B66A7CC088542C2D502D69512402A252098490101E059294
        8404926C5EBB7BDFA7EBCEDD99D4D169FF71FCC733F399B333FBDBFBFD9C73EE
        3DE7AE2484E09B6C32DF70FB5640FA1A7E2BBE2E01A9472F7D858870A067FF7F
        09546E580942208058EF30E6AEE762812FAD989D7259FFCC99D8F69428F9C2B6
        465BA6896918588689A16BD59AAA558655BDEC48EDC5BFAE79FF6410B01D787E
        DA25C2D4754CF3F37A83873E09FDB7C091D71FE0C33A30848C6AD83CF2D4DA58
        F0D6C76FED9393E65FA52809C549E9A97E25D18737D14F82CF8BDBE3C1B62C42
        ED9D74B6B4D27ABE99B628AD4D17AC4828B4B9AE35F4CBDFEC6DA8052CC05EB1
        B058282E48ACDCC2A3874C00DC384DD836D8123F59BD263EC5F2BE75772DCB08
        A43D9596939990989A8A5BF1227B1424570292DB831CED91DD787B59A40F34E9
        1DE9466D0FD272AED6D570ACE636CFF153C54F5CAD3DF5FA91F65F9FE930D575
        1BDFB21EBCE3FBE24B9F02DB3259BE7A5D2C7CD94D57FACA5F5EBAE392817DD6
        640DEC979098D99BA0AEB0E340236BDF2A67E9933B98B5740357CCFF2D05B39E
        64DAE23FB064D516D66D2E67F7F12E944BF319356D361366CF92478E2DF8F9FD
        1372765ED5DB9306B89FDEB059FED27BE0B3DFDFC3F8A52FC9D78E19A83C73CF
        B48AD45E5943FC816CAAEABBF9F07003E71A2E628682A8BA852679B03D7E50FC
        189685DB8840A41BD908E396243CC9012E1DD0976BC7F56778968BFA239F5173
        E060DD13BB4EE73786EC306002222ED073365C7B9EBDFD4FBDFAF699D3410AEF
        1D6E26DCDE4A4B58A2B2C1206FD810025901D23252494F4DC5E7F36298466CF9
        3ABABAE9087670A1F90227AA4FD0CF1722C36B93DEA73FD3C76463379DE260D9
        9E5D3F7DAF7E0EA0023620E41E3321BFB9F2C66929C989736A9AE1FD4FCF9092
        96CEF8EBE7531B49A770F20DE45E36967113AF64F2F593A29F733973B69E0F77
        7FC2E9D3E7C8CDCB63F498715C5E78355367CFA359EEC78499B7919C9CC83BBB
        8FD220653164F4C8EB968DC99805243899F41470E764A43E7726E4E3F4BF5B19
        51349DE9738B09862532B3FB931495494B4D6160DE25C86E895EBDB398B76036
        A150986355C7F9E31B5B70BB24D2539249CF0844EB86D2D06A3277C16226DC38
        9FCAEAB3047D9732B85FF6D38002B800C9150F5F7FDF946B948C9CFB6B5B7446
        4EFE1E0563C7929999C9E6773E425692494949242B904A72AA823FC987A22800
        EC7CE7032CDB44D77422519961C38612523574DDE2EC997A8AE74E212B2B0B7F
        4E7F2AF6EF25909E9292D571667F459BA8032CD911700592BDB7D4B7A85AEEC4
        990C1D3A9CA4A414649787A60B415CAE0410126E59E66F7F29257E826F5EBF05
        5D0D63681AA6AE73EAF8493C2E17322EFCFE241A9A5B71BB3D51E934468CB88C
        8937DF4D5D6B440B244833000F20B9E3022E59FA4EF2802B230307E52A5EAF1F
        49929CDDD026125689683A9A6E70F840051F977D8C00404202400012081BC3B4
        D0349D88AAE1965DD842204B724C68F0E7CB5234A7FDEC89BD85803B2E00206D
        D3E6C9B70E1E9E162D0449C2B404029BF4B414C2A68504085BD0A74F6FAAAB8E
        2149F15010124842903774B0A3051155252D3509CBB2A3088424E3F3F91930B2
        287BDBC8673AA87C0000D9D1B7754DDD5ADBAC01128625304C13C330199ED78F
        AECE76B488494797CA77275F8792E0C150F5281A86AE616A6A6CB453A74E89D6
        4408470C5A9A2E3062483F0CC3C23463003255A782A8E1CEED800588B88079AC
        62D72B876ACEB7B675AAE8BA19C542372C26158EA1BBAB8D901AA6BD3D44B76A
        B364E95246178C22293911BFDFC7A8512359BE72051E2599D66077B4AE8BA6F3
        E7993A697CEC1A9A6E44B168EB8C70E0505DC7D99ADD1B0103102E9CD6587F4C
        EB3B687C9B6629337207041048B1F5F37915D4884665D549146F22922CE35112
        C8CFCF67D2359329BCEA2A468CCE27A4D9343605E90C85A93C52C9B8D183B9B6
        E8724CD38EED968661F3F6F60A8E56963F7CF4D34DFB800860F73CDBDD40D2CD
        3FFCDD13938B0A7E54387E50ECB9965C3212F05CC916FE55DBCCE0BC21A4A7A7
        E2F37BF1296E0CDDC2E371A16A262DAD416A8E55D32B90C443CB16E276BB9C7B
        C066D7BE93BC5BBAFFD5DDDB1E7904E80074407CF1252301489AB778DD6379B9
        83EE9B3A691881345F6CD40889AD3BCAF8605F3999D9BD09646490929E866599
        A86195B6968B9C6F6C647CC1506EBF653A2E971B61DB5C0C86D8567A94EAEA9A
        92B2EDBF781C6807544038C09D3FDE149790012F10B866E6CAE2E27BD79FFBD5
        F33BC5DFCBAAC5C1CA3A71E8689D28DD5D211E7E7283B8E9CE5562E28DCBA22C
        1733173D2A563E5622B6FDE39FE270B4E660ACAE5A3CF66CA998B1F0C5C6CBAF
        BEFB762007488CEF803316968013886DC3A2E56FC68D74A0ABECDD35A5DBDF78
        A070CFDE4F57BDBA69FFD9928D9FF0DE9E93345D8C70C5D80256DEBB80B5BF5C
        C1DAD52BF8D97D8B289A3881B6A04969D9095E78EDA32865B51F947DB47AD796
        078BCAF7BEFC6E8F91DBD17021448FE378E1B28D0804C2864D2F2C92001C538F
        3323BE5113E60FCFEE3B6A86A2248D903D09035C2EEF00094911086C5B68A6AE
        D61946A45657BB6B2E3456EDAC29DF5A0584810860C41FBB1B169438D150FAE6
        122480DBEE8F0A08E140AC7FFBC53BA41ECBE27664E2B81D411920BE9700A613
        A60386830D889EA3EE29E0765EC79C604700C1FC25EB633A7F2E591CBFB80EC8
        0E520F1C0107273086130C100FFF226E00BB4738C24608E71C00E6DEF59AC0F9
        6ADB6B3F1080C5FF683316BE22C0062427F8ABF9F6CFE9372EF01F75B9F19784
        79AF730000000049454E44AE426082}
      Visible = False
    end
    object imgSelo: TImage
      Left = 992
      Top = 24
      Width = 219
      Height = 56
      Proportional = True
      Stretch = True
    end
    object Label6: TLabel
      Left = 16
      Top = 36
      Width = 45
      Height = 15
      Caption = 'Empresa'
    end
    object lbDSEMP: TLabel
      Left = 72
      Top = 36
      Width = 48
      Height = 15
      Caption = 'lbDSEMP'
    end
    object Label9: TLabel
      Left = 632
      Top = 40
      Width = 90
      Height = 15
      Caption = 'Saldo do Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 784
      Top = 16
      Width = 57
      Height = 15
      Caption = '% Imposto'
    end
    object edSDATU: TcxCurrencyEdit
      Left = 768
      Top = 56
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.ReadOnly = True
      Properties.OnChange = edTOTCPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 8
      Width = 121
    end
    object edSDANT: TcxCurrencyEdit
      Left = 496
      Top = 56
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.ReadOnly = True
      Properties.ValidateOnEnter = False
      Properties.OnChange = edTOTCPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsItalic]
      Style.IsFontAssigned = True
      TabOrder = 7
      Width = 121
    end
    object btFiltra: TButton
      Left = 400
      Top = 56
      Width = 89
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 5
      Visible = False
      OnClick = btFiltraClick
    end
    object cbIDCNT: TcxLookupComboBox
      Left = 56
      Top = 8
      Properties.CharCase = ecUpperCase
      Properties.DropDownRows = 15
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'cod_descr'
        end
        item
          Width = 200
          FieldName = 'nrins'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DM.DSCNT
      Properties.PostPopupValueOnTab = True
      Properties.ValidationOptions = [evoShowErrorIcon]
      Properties.OnEditValueChanged = cbIDCNTPropertiesEditValueChanged
      Properties.OnInitPopup = cbIDCNTPropertiesInitPopup
      Properties.OnValidate = cbIDCNTPropertiesValidate
      TabOrder = 0
      OnExit = cbIDCNTExit
      Width = 481
    end
    object edDTFIM: TcxDateEdit
      Left = 288
      Top = 56
      Properties.Alignment.Horz = taRightJustify
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnEditValueChanged = edDTFIMPropertiesEditValueChanged
      TabOrder = 4
      Width = 97
    end
    object edDTINI: TcxDateEdit
      Left = 144
      Top = 56
      Properties.Alignment.Horz = taRightJustify
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnEditValueChanged = edDTINIPropertiesEditValueChanged
      TabOrder = 3
      Width = 97
    end
    object edTOTC: TcxCurrencyEdit
      Left = 896
      Top = 56
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.ReadOnly = True
      Properties.OnChange = edTOTCPropertiesChange
      TabOrder = 9
      Visible = False
      Width = 121
    end
    object edTOTD: TcxCurrencyEdit
      Left = 1032
      Top = 56
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.ReadOnly = True
      Properties.OnChange = edTOTCPropertiesChange
      TabOrder = 10
      Visible = False
      Width = 121
    end
    object pnGuia: TPanel
      Left = 1008
      Top = 24
      Width = 89
      Height = 41
      Caption = 'Pos. Esquerda do Logo'
      TabOrder = 11
      Visible = False
    end
    object edSDPER: TcxCurrencyEdit
      Left = 632
      Top = 56
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.EditFormat = True
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.ReadOnly = True
      Properties.ValidateOnEnter = False
      Properties.OnChange = edTOTCPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 12
      Width = 121
    end
    object btSEL: TBitBtn
      Left = 888
      Top = 8
      Width = 129
      Height = 25
      Caption = 'Selecionar V'#225'rias'
      Enabled = False
      TabOrder = 6
      Visible = False
      OnClick = btSELClick
    end
    object chIncRec: TCheckBox
      Left = 544
      Top = 16
      Width = 153
      Height = 17
      Caption = 'Incluir Receita/Comiss'#227'o'
      TabOrder = 1
      OnClick = chIncRecClick
    end
    object edVLI: TvalorEdit
      Left = 720
      Top = 10
      Width = 57
      Height = 23
      OnExit = edVLIExit
      TabOrder = 2
      Value = 20.000000000000000000
    end
  end
  object tab1: TTabControl
    Left = 8
    Top = 104
    Width = 1025
    Height = 305
    TabOrder = 1
    Tabs.Strings = (
      'S'#237'ntetico'
      'Anal'#237'tico')
    TabIndex = 0
    OnChange = tab1Change
    object grMov: TcxGrid
      Left = 4
      Top = 26
      Width = 1017
      Height = 275
      Align = alClient
      TabOrder = 0
      object gvMov: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = True
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Enabled = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Enabled = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Enabled = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Enabled = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Enabled = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = True
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsMov
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting, dcoGroupsAlwaysExpanded]
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = ',0.00'
            Kind = skSum
            Position = spFooter
            Column = colVLC
          end
          item
            Format = ',0.00'
            Kind = skSum
            Position = spFooter
            Column = colVLD
          end
          item
            Format = ',0.00 C;,0.00 D'
            Kind = skSum
            Position = spFooter
            Column = gvMovColumn2
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'
            Kind = skSum
            Column = colVLD
          end
          item
            Format = ',0.00'
            Kind = skSum
            Column = colVLC
          end
          item
            Column = colSALDO
          end
          item
            Format = ',0.00 C;,0.00 D'
            Kind = skSum
            Column = gvMovColumn2
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.Summary.Options = [soMultipleSelectedRecords]
        Filtering.ColumnPopupMode = fpmExcel
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        FilterRow.OperatorCustomization = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvColumnHeader]
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.ShowCheckBoxesDynamically = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupByHeaderLayout = ghlHorizontal
        OptionsView.GroupFooterMultiSummaries = True
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderFilterButtonShowMode = fbmButton
        OptionsView.Indicator = True
        OnColumnHeaderClick = gvMovColumnHeaderClick
        object gvMovColumn1: TcxGridDBColumn
          Caption = 'N'#250'm.'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          OnGetDataText = gvMovColumn1GetDataText
          Options.Editing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
        end
        object colPONTO: TcxGridDBColumn
          Caption = 'Centro de Custo'
          DataBinding.FieldName = 'ponto'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
          Visible = False
          GroupIndex = 0
          Options.FilterRowOperator = foContains
          Width = 300
        end
        object colPONTO2: TcxGridDBColumn
          Caption = 'Centro de Custo'
          DataBinding.FieldName = 'ponto'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
          Options.FilterRowOperator = foContains
          Width = 300
        end
        object colEVENTO: TcxGridDBColumn
          Caption = 'Evento'
          DataBinding.FieldName = 'evento'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
          Options.FilterRowOperator = foContains
          Width = 300
        end
        object colVLD: TcxGridDBColumn
          Caption = 'D'#233'bito'
          DataBinding.FieldName = 'tot_debito'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;,0.00;'
          OnCustomDrawCell = colVLDCustomDrawCell
          OnGetDisplayText = colVLDGetDisplayText
          Width = 110
          OnCustomDrawFooterCell = colVLDCustomDrawFooterCell
        end
        object colVLC: TcxGridDBColumn
          Caption = 'Cr'#233'dito'
          DataBinding.FieldName = 'tot_credito'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;,0.00;'
          OnCustomDrawCell = colVLCCustomDrawCell
          OnGetDisplayText = colVLCGetDisplayText
          Width = 110
          OnCustomDrawFooterCell = colVLCCustomDrawFooterCell
        end
        object colSALDO: TcxGridDBColumn
          Caption = 'Saldo'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          OnCustomDrawCell = colSALDOCustomDrawCell
          OnGetDisplayText = colSALDOGetDisplayText
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 110
          OnCustomDrawFooterCell = colSALDOCustomDrawFooterCell
        end
        object gvMovColumn2: TcxGridDBColumn
          Caption = 'Saldo'
          DataBinding.FieldName = 'saldo'
          OnCustomDrawCell = gvMovColumn2CustomDrawCell
          Width = 110
          OnCustomDrawFooterCell = gvMovColumn2CustomDrawFooterCell
        end
      end
      object glMov: TcxGridLevel
        GridView = gvMov
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 452
    Width = 1034
    Height = 46
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 443
    ExplicitWidth = 1028
    object btPDF: TButton
      Left = 8
      Top = 8
      Width = 153
      Height = 33
      Caption = 'Exportar PDF'
      TabOrder = 0
      OnClick = btXLSClick
    end
    object btXLS: TButton
      Tag = 1
      Left = 168
      Top = 8
      Width = 137
      Height = 33
      Caption = 'Exportar Excel'
      TabOrder = 1
      OnClick = btXLSClick
    end
  end
  object dsMov: TDataSource
    AutoEdit = False
    DataSet = qyMov
    Left = 411
    Top = 246
  end
  object qyMov: TFDQuery
    OnCalcFields = qyMovCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DM.DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select '
      '  uni.descr as ponto, '
      '  eve.descr as evento,'
      '  if(mov.valor<0,mov.valor,0) as tot_debito, '
      '  if(mov.valor>0,mov.valor,0) as tot_credito'
      'from plmovimento mov '
      '  left join tbcontas cnt on cnt.id = mov.id_cnt'
      '  left join tbunidades uni on uni.id = mov.id_uni'
      '  left join tbeventos eve on eve.id = mov.id_eve'
      'where '
      '  (st_fim = "N") and '
      '  (st_mov = "L")'
      'group by uni.id, eve.id'
      'order by uni.descr, eve.descr, mov.id')
    Left = 510
    Top = 249
    object qyMovsaldo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'saldo'
      DisplayFormat = ',0.00 C;,0.00 D'
      Calculated = True
    end
  end
  object frxDBR: TfrxDBDataset
    UserName = 'mov'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ponto=ponto'
      'evento=evento'
      'tot_debito=totd'
      'tot_credito=totc')
    DataSource = dsMov
    BCDToCurrency = False
    DataSetOptions = []
    Left = 200
    Top = 312
  end
  object tbR: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 272
    Top = 272
  end
end
