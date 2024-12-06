object fplaMov: TfplaMov
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Movimento'
  ClientHeight = 558
  ClientWidth = 1246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 20
  object gridMov: TcxGrid
    Left = 0
    Top = 130
    Width = 1234
    Height = 351
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 1
    LookAndFeel.ScrollbarMode = sbmClassic
    object gviewMov: TcxGridDBTableView
      PopupMenu = DM.popInfo
      OnDblClick = gviewMovDblClick
      OnMouseDown = gviewMovMouseDown
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FilterBox.Visible = fvAlways
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCustomDrawCell = gviewMovCustomDrawCell
      OnSelectionChanged = gviewMovSelectionChanged
      DataController.DataSource = DSMOV
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.TranslateLike = True
      DataController.KeyFieldNames = 'id'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00 C;,0.00 D'
          Kind = skSum
          FieldName = 'valor'
          Column = gvmVALOR
          DisplayText = 'Total'
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soMultipleSelectedRecords]
      DataController.OnFilterRecord = gviewMovDataControllerFilterRecord
      Filtering.ColumnPopupMode = fpmExcel
      FilterRow.InfoText = 'Clique aqui para definir Filtros'
      FilterRow.SeparatorWidth = 8
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      FixedDataRows.SeparatorWidth = 8
      NewItemRow.SeparatorWidth = 8
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvColumnHeader]
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.ShowCheckBoxesDynamically = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.NavigatorOffset = 63
      OptionsView.FixedColumnSeparatorWidth = 1
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      OptionsView.ShowColumnFilterButtons = sfbAlways
      Preview.LeftIndent = 25
      Preview.Place = ppTop
      Preview.RightIndent = 6
      Preview.Visible = True
      RowLayout.MinValueWidth = 100
      object colNUM: TcxGridDBColumn
        Caption = 'Num.'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taRightJustify
        OnGetDataText = colNUMGetDataText
        FixedKind = fkLeft
        MinWidth = 25
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 54
      end
      object gvmSit: TcxGridDBColumn
        Caption = 'Sit.'
        DataBinding.FieldName = 'st_mov'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        OnCustomDrawCell = gvmSitCustomDrawCell
        MinWidth = 25
        Options.Editing = False
        Options.Moving = False
        Width = 54
      end
      object colIDUNI: TcxGridDBColumn
        Caption = 'Centro de Custos'
        DataBinding.FieldName = 'calc_ds_uni'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Options.Editing = False
        Options.FilterRowOperator = foContains
        SortIndex = 1
        SortOrder = soAscending
        Width = 196
      end
      object gvmUF: TcxGridDBColumn
        Caption = 'UF'
        DataBinding.FieldName = 'calc_uf_uni'
        Visible = False
        MinWidth = 25
      end
      object gvmIDPES: TcxGridDBColumn
        Caption = 'Favorecido'
        DataBinding.FieldName = 'calc_ds_pes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 305
      end
      object colIDEVE: TcxGridDBColumn
        Caption = 'Evento'
        DataBinding.FieldName = 'calc_ds_eve'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Options.Editing = False
        Options.FilterRowOperator = foContains
        SortIndex = 2
        SortOrder = soAscending
        Width = 199
      end
      object colDTVEN: TcxGridDBColumn
        Caption = 'Dt. Venc.'
        DataBinding.FieldName = 'dt_ven'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taRightJustify
        OnCustomDrawCell = colDTVENCustomDrawCell
        OnGetDisplayText = colDTVENGetDisplayText
        MinWidth = 25
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 109
      end
      object colDTLIQ: TcxGridDBColumn
        Caption = 'Dt. Liquid.'
        DataBinding.FieldName = 'dt_bxa'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taRightJustify
        OnCustomDrawCell = colDTLIQCustomDrawCell
        OnGetDataText = colDTLIQGetDataText
        MinWidth = 25
        Options.Editing = False
        Width = 109
      end
      object gvmCOMPT: TcxGridDBColumn
        Caption = 'Compet.'
        DataBinding.FieldName = 'compt'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Options.Editing = False
        Width = 88
      end
      object gvmVALOR: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'calc_ValorDC'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;,0.00'
        OnCustomDrawCell = gvmVALORCustomDrawCell
        MinWidth = 25
        Options.Editing = False
        Width = 125
        OnCustomDrawFooterCell = gvmVALORCustomDrawFooterCell
      end
      object gvmNTREG: TcxGridDBColumn
        Caption = 'NT.'
        DataBinding.FieldName = 'nt_reg'
        Visible = False
        OnCustomDrawCell = gvmNTREGCustomDrawCell
        MinWidth = 25
        Options.Editing = False
        Width = 40
      end
      object colNTREG: TcxGridDBColumn
        Caption = 'Natur.'
        DataBinding.FieldName = 'nt_reg'
        OnCustomDrawCell = colNTREGCustomDrawCell
        MinWidth = 25
      end
      object gvmIDTPD: TcxGridDBColumn
        Caption = 'Tipo de Documento'
        DataBinding.FieldName = 'calc_ds_tpd'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        MinWidth = 25
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 178
      end
      object gvmNRDOC: TcxGridDBColumn
        Caption = 'Nr. Documento'
        DataBinding.FieldName = 'nr_doc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.OnEditValueChanged = gviewMovColumn2PropertiesEditValueChanged
        MinWidth = 25
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 164
      end
      object gvmDESCR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'calc_descr'
        PropertiesClassName = 'TcxTextEditProperties'
        MinWidth = 25
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 500
      end
      object gvmBANCO: TcxGridDBColumn
        Caption = 'Banco'
        DataBinding.FieldName = 'banco'
        MinWidth = 25
        Options.Editing = False
        Width = 74
      end
      object gvmAGENCIA: TcxGridDBColumn
        Caption = 'Ag'#234'ncia'
        DataBinding.FieldName = 'agencia'
        MinWidth = 25
        Options.Editing = False
        Width = 89
      end
      object gvmCONTA: TcxGridDBColumn
        Caption = 'Conta'
        DataBinding.FieldName = 'nr_conta'
        MinWidth = 25
        Options.Editing = False
        Width = 141
      end
      object gvmTIPO: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'calc_ds_tp_conta'
        MinWidth = 25
        Options.Editing = False
        Width = 69
      end
      object gvmOBS: TcxGridDBColumn
        Caption = 'Obs'
        DataBinding.FieldName = 'obs'
        MinWidth = 25
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 625
      end
      object colDTINC: TcxGridDBColumn
        Caption = 'Dt. Inc.'
        DataBinding.FieldName = 'dt_inc'
        MinWidth = 25
        Options.Editing = False
      end
      object colIDFULL: TcxGridDBColumn
        Caption = 'Id.'
        DataBinding.FieldName = 'idfull'
        MinWidth = 25
        Options.Editing = False
        Width = 79
      end
      object colTPR: TcxGridDBColumn
        Caption = 'Origem'
        DataBinding.FieldName = 'tp_mov'
        MinWidth = 25
        Options.Editing = False
        Width = 44
      end
      object colDTENTREG: TcxGridDBColumn
        DataBinding.FieldName = 'dt_entreg'
        Visible = False
        MinWidth = 25
        VisibleForCustomization = False
      end
      object colTPCNT: TcxGridDBColumn
        DataBinding.FieldName = 'tp_conta'
        Visible = False
        MinWidth = 25
        VisibleForCustomization = False
      end
      object colTPINS: TcxGridDBColumn
        DataBinding.FieldName = 'calc_tp_ins'
        Visible = False
        MinWidth = 25
        VisibleForCustomization = False
      end
      object colID: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
        MinWidth = 25
        SortIndex = 3
        SortOrder = soAscending
        VisibleForCustomization = False
      end
      object colIDCTR: TcxGridDBColumn
        DataBinding.FieldName = 'id_ctr'
        Visible = False
        MinWidth = 25
        VisibleForCustomization = False
      end
      object colUMOV: TcxGridDBColumn
        DataBinding.FieldName = 'ultmov'
        Visible = False
        MinWidth = 25
        VisibleForCustomization = False
      end
    end
    object glevelMov: TcxGridLevel
      GridView = gviewMov
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 506
    Width = 1246
    Height = 52
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 505
    ExplicitWidth = 1240
    object btAvulso: TButton
      Left = 10
      Top = 10
      Width = 121
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Lan'#231'ar Avulso'
      TabOrder = 0
      OnClick = btAvulsoClick
    end
    object btEfetivar: TButton
      Left = 430
      Top = 10
      Width = 101
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Efetivar'
      TabOrder = 3
      OnClick = btEfetivarClick
    end
    object btExcluir: TButton
      Left = 760
      Top = 10
      Width = 91
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'E&xcluir'
      TabOrder = 6
      OnClick = btExcluirClick
    end
    object btAlterar: TButton
      Left = 660
      Top = 10
      Width = 91
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Alterar'
      TabOrder = 5
      OnClick = btAlterarClick
    end
    object btParcela: TButton
      Left = 140
      Top = 10
      Width = 121
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Parcelamento'
      TabOrder = 1
      OnClick = btParcelaClick
    end
    object btRelDesembolso: TButton
      Left = 870
      Top = 10
      Width = 101
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Desembolso'
      TabOrder = 7
      OnClick = btRelDesembolsoClick
    end
    object btRelConta: TButton
      Left = 980
      Top = 10
      Width = 101
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Movimento'
      TabOrder = 8
      OnClick = btRelContaClick
    end
    object btEmConta: TButton
      Left = 280
      Top = 10
      Width = 141
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Agendar em Conta'
      TabOrder = 2
      OnClick = btEmContaClick
    end
    object btEstornar: TButton
      Left = 540
      Top = 10
      Width = 101
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Estornar'
      TabOrder = 4
      OnClick = btEstornarClick
    end
    object btCNAB240: TButton
      Left = 1100
      Top = 10
      Width = 101
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'CNAB240'
      TabOrder = 9
      OnClick = btCNAB240Click
    end
  end
  object pnBar: TPanel
    Left = 0
    Top = 0
    Width = 1246
    Height = 121
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1240
    object Label5: TLabel
      Left = 790
      Top = 10
      Width = 80
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Saldo Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 620
      Top = 10
      Width = 90
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Saldo Anterior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 20
      Top = 20
      Width = 39
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Conta'
    end
    object Label2: TLabel
      Left = 330
      Top = 90
      Width = 8
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'e'
    end
    object Label1: TLabel
      Left = 20
      Top = 90
      Width = 114
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Movimento entre'
    end
    object Label7: TLabel
      Left = 620
      Top = 60
      Width = 49
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Cr'#233'dito'
    end
    object Label8: TLabel
      Left = 788
      Top = 60
      Width = 46
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      Caption = 'D'#233'bito'
    end
    object Label9: TLabel
      Left = 960
      Top = 10
      Width = 110
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Saldo Projetado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgMostra: TImage
      Left = 1070
      Top = 70
      Width = 32
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      OnClick = imgMostraClick
    end
    object imgSelo: TImage
      Left = 1140
      Top = 20
      Width = 274
      Height = 70
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Proportional = True
      Stretch = True
    end
    object Label6: TLabel
      Left = 20
      Top = 50
      Width = 57
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Empresa'
    end
    object lbDSEMP: TLabel
      Left = 90
      Top = 50
      Width = 61
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'lbDSEMP'
    end
    object edSDATU: TcxCurrencyEdit
      Left = 790
      Top = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.EditFormat = ',0.00'
      Properties.ReadOnly = True
      Properties.OnChange = edSALDOPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 151
    end
    object edSDANT: TcxCurrencyEdit
      Left = 620
      Top = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.EditFormat = ',0.00'
      Properties.ReadOnly = True
      Properties.OnChange = edSALDOPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsItalic]
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 151
    end
    object btFiltra: TButton
      Left = 500
      Top = 40
      Width = 111
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Filtrar'
      TabOrder = 4
      Visible = False
      OnClick = btFiltraClick
    end
    object cbIDCNT: TcxLookupComboBox
      Left = 90
      Top = 10
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.CharCase = ecUpperCase
      Properties.DropDownRows = 15
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'cod_descr'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DM.DSCNT
      Properties.PostPopupValueOnTab = True
      Properties.ValidationOptions = [evoShowErrorIcon]
      Properties.OnEditValueChanged = cbIDCNTPropertiesEditValueChanged
      Properties.OnValidate = cbIDCNTPropertiesValidate
      TabOrder = 0
      Width = 501
    end
    object edDTFIM: TcxDateEdit
      Left = 360
      Top = 80
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.Alignment.Horz = taRightJustify
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = edDTFIMPropertiesEditValueChanged
      TabOrder = 2
      Width = 121
    end
    object edDTINI: TcxDateEdit
      Left = 180
      Top = 80
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.Alignment.Horz = taRightJustify
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = edDTINIPropertiesEditValueChanged
      TabOrder = 1
      Width = 121
    end
    object edTOTC: TcxCurrencyEdit
      Left = 620
      Top = 80
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.EditFormat = ',0.00'
      Properties.ReadOnly = True
      TabOrder = 7
      Width = 151
    end
    object edTOTD: TcxCurrencyEdit
      Left = 790
      Top = 80
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.EditFormat = ',0.00'
      Properties.ReadOnly = True
      TabOrder = 8
      Width = 151
    end
    object edSDPROJ: TcxCurrencyEdit
      Left = 960
      Top = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00 C;,0.00 D'
      Properties.EditFormat = ',0.00'
      Properties.ReadOnly = True
      Properties.OnChange = edSALDOPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 9
      Width = 151
    end
    object pnGuia: TPanel
      Left = 1150
      Top = 30
      Width = 111
      Height = 51
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Pos. Esquerda do Logo'
      TabOrder = 10
      Visible = False
    end
    object btOrdem: TBitBtn
      Left = 500
      Top = 80
      Width = 111
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Ordenar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000090000
        000E000000100000001000000010000000100000001000000010000000100000
        0010000000100000001100000011000000100000000A000000027B5B4EC1AB7E
        6DFFAB7E6DFFAB7D6CFFAA7C6CFFAA7C6BFFA97B6BFFA97B6AFFA97A6AFFA87A
        6AFFA87968FFA87969FFA87868FFA87868FF78554AC20000000ABE9281FFF9F6
        F2FFFAF5F1FFF9F5F1FFFAF5F1FFF9F5F1FFF9F5F1FFF9F5F1FFF9F5F1FFF9F5
        F1FFF9F5F1FFF9F5F1FFF9F5F0FFF9F5F0FFBA8C7AFF0000000EC19483FFFAF6
        F4FFF7F1ECFFE3D6CFFF7B4234FFE3D6CEFFF6F0EBFFF7F0EAFFF6F0EAFFF7F0
        EAFF1A1697FFF6F0EAFFF6EFE9FFF9F5F1FFBD8F7EFF0000000FC49886FFFAF7
        F5FFF8F2EDFFAA8174FF7E4335FFA47B6FFFF7F1ECFFF7F1EBFFF7F1EBFFF7F0
        EBFF1B189AFFF7F1EBFFF7F0EBFFF9F6F2FFC09382FF0000000EC69A89FFFAF8
        F6FFE2D2CBFF894F3EFF854B3BFF7F4436FFDECDC6FFF8F2EDFFF7F2EDFFF7F2
        EDFF1D1B9EFFF7F1ECFFF7F2ECFFFAF6F3FFC39685FF0000000DC89D8BFFFAF9
        F6FFAB7E71FF8F5342FF8D5341FF854A3AFFA17467FFF8F3EEFFF8F3EEFFF8F3
        EEFF1F1DA1FFF7F3EDFFF8F2EDFFFAF6F4FFC59988FF0000000CCB9F8DFFFBFA
        F7FFF9F5F1FFF9F5F1FF935845FFF9F4F0FFF8F4F0FFF9F4F0FF5B59BAFF1F25
        B1FF201FA4FF201FA4FF5A58B8FFFAF7F4FFC89C8AFF0000000BCCA08FFFFCFA
        F7FFF9F6F3FFF9F5F2FF8B503FFFF9F5F2FFF9F6F1FFFAF5F1FFCECCE5FF2128
        B6FF2127B5FF2026B0FFCECAE1FFFAF8F5FFCA9E8CFF0000000BCEA290FFFCFB
        F9FFFAF7F4FFFAF7F4FF8F5441FFFAF6F3FFFAF6F2FFFAF6F2FFFAF5F3FF6A6E
        CCFF242ABAFF696AC3FFF9F5F1FFFBF9F6FFCCA08EFF0000000ACFA391FFFCFB
        FAFFFBF8F5FFFAF8F5FF915644FFFBF7F4FFFBF7F5FFFBF7F4FFFBF7F3FFDCDB
        ECFF2B30BAFFD9D6E8FFFAF6F3FFFBF9F7FFCDA290FF00000009D0A492FFFEFD
        FCFFFDFCFBFFFDFCFBFFFDFBFAFFFDFBFAFFFDFBFAFFFDFBFAFFFDFBFAFFFDFB
        FAFFFDFBFAFFFDFBFAFFFCFBFAFFFDFCFBFFCFA391FF00000008D3A372FFE6C7
        A4FFDBAF7EFFDAAE7DFFDAAD7BFFD9AC7AFFD9AB7AFFD8AA77FFD8A876FFD6A7
        75FFD6A573FFD5A572FFD5A471FFDAAF83FFC88F5DFF00000008D3A473FFF1DD
        C2FFE4BF8FFFE4BE8EFFE4BD8DFFE4BD8CFFE4BD8BFFE3BB8BFFE4BB8AFFE3BA
        89FFE3BA88FFE2B987FFE2B886FFECD1ABFFC8905DFF00000007D3A574FFF3E0
        C5FFF3DFC4FFF3DFC4FFF2DFC3FFF1DFC3FFF1DDC2FFF1DDC2FFF1DDC0FFF1DC
        C0FFF1DCBFFFF1DBBEFFF1DABDFFF0DABCFFC8905DFF00000006A38360C0DCB1
        81FFDBB080FFDBAF7FFFDAAF7EFFDAAE7DFFDAAD7CFFD9AC7CFFD8AB7AFFD8AA
        7AFFD8AA79FFD8A978FFD7A877FFD7A877FFA07B57C000000004}
      TabOrder = 3
      OnClick = btOrdemClick
    end
  end
  object DSMOV: TDataSource
    DataSet = DM.QYMOV
    Left = 416
    Top = 168
  end
end
