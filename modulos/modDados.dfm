object DM: TDM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 727
  Width = 698
  PixelsPerInch = 120
  object DBCON: TFDConnection
    Params.Strings = (
      'Database=gestaocrm_dev'
      'User_Name=root'
      'Password=admin'
      'Server=127.0.0.1'
      'ReadTimeout=5'
      'WriteTimeout=5'
      'Port=13306'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evMode, evRowsetSize]
    FetchOptions.RowsetSize = 200
    ResourceOptions.AssignedValues = [rvAutoConnect, rvAutoReconnect]
    ResourceOptions.AutoConnect = False
    ResourceOptions.AutoReconnect = True
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    OnRestored = DBCONRestored
    OnRecover = DBCONRecover
    Left = 32
    Top = 80
  end
  object qyCat: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    SQL.Strings = (
      'select * from tbcateg')
    Left = 32
    Top = 328
  end
  object qyUni: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select * from tbunidades order by cod, ponto')
    Left = 104
    Top = 328
    object qyUnicodpt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codpt'
      Origin = 'codpt'
      EditMask = '9999.99;0;_'
      FixedChar = True
      Size = 6
    end
  end
  object qyEVE: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    SQL.Strings = (
      
        'SELECT *, IF(LEFT(cod, 1) = "1", "DES", "REC") as tipo, RIGHT(co' +
        'd, 2) as rgtCOD FROM tbeventos WHERE (ativo >= 0) ORDER BY id')
    Left = 176
    Top = 408
    object qyEVEcod: TStringField
      FieldName = 'cod'
      Origin = 'cod'
      Required = True
    end
  end
  object qyInv: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    SQL.Strings = (
      'select * from tbinvent')
    Left = 104
    Top = 408
  end
  object qyPes: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    SQL.Strings = (
      'select * from tbpessoal order by nr_ins')
    Left = 176
    Top = 328
  end
  object qyCnt: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    OnCalcFields = qyCntCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    SQL.Strings = (
      'select * from tbcontas ORDER BY cod')
    Left = 32
    Top = 408
    object qyCntcod_descr: TStringField
      DisplayWidth = 60
      FieldKind = fkInternalCalc
      FieldName = 'cod_descr'
      Size = 100
    end
  end
  object DSUNI: TDataSource
    AutoEdit = False
    DataSet = qyUni
    Left = 643
    Top = 40
  end
  object DSPES: TDataSource
    AutoEdit = False
    DataSet = qyPes
    Left = 643
    Top = 168
  end
  object DSEVE: TDataSource
    AutoEdit = False
    DataSet = qyEVE
    Left = 643
    Top = 232
  end
  object DSCNT: TDataSource
    AutoEdit = False
    DataSet = qyCnt
    Left = 643
    Top = 104
  end
  object QYFER: TFDQuery
    AutoCalcFields = False
    OnCalcFields = QYFERCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    IndexFieldNames = 'data'
    Connection = DBCON
    SQL.Strings = (
      'select * from tbFeriados ORDER BY data')
    Left = 240
    Top = 328
  end
  object DSCAT: TDataSource
    AutoEdit = False
    DataSet = qyCat
    Left = 643
    Top = 296
  end
  object qyTPD: TFDQuery
    AutoCalcFields = False
    FieldOptions.AutoCreateMode = acCombineAlways
    IndexFieldNames = 'id'
    Connection = DBCON
    SQL.Strings = (
      'select * from tbtipodoc order by id')
    Left = 344
    Top = 16
  end
  object DSTPD: TDataSource
    AutoEdit = False
    DataSet = qyTPD
    Left = 416
    Top = 16
  end
  object qry: TFDQuery
    Connection = DBCON
    Left = 400
    Top = 344
  end
  object linkMYSQL: TFDPhysMySQLDriverLink
    Left = 120
    Top = 8
  end
  object qyTPC: TFDQuery
    AutoCalcFields = False
    FieldOptions.AutoCreateMode = acCombineAlways
    IndexFieldNames = 'id'
    Connection = DBCON
    SQL.Strings = (
      'select * from tbtipocontrato  order by id')
    Left = 344
    Top = 96
  end
  object qyTPR: TFDQuery
    AutoCalcFields = False
    FieldOptions.AutoCreateMode = acCombineAlways
    IndexFieldNames = 'id'
    Connection = DBCON
    SQL.Strings = (
      'select * from tbtiporeajus order by id')
    Left = 344
    Top = 176
  end
  object DSTPC: TDataSource
    AutoEdit = False
    DataSet = qyTPC
    Left = 416
    Top = 96
  end
  object DSTPR: TDataSource
    AutoEdit = False
    DataSet = qyTPR
    Left = 416
    Top = 176
  end
  object DBTRANS: TFDTransaction
    Connection = DBCON
    Left = 32
    Top = 8
  end
  object qyTCB: TFDQuery
    AutoCalcFields = False
    FieldOptions.AutoCreateMode = acCombineAlways
    IndexFieldNames = 'id'
    Connection = DBCON
    SQL.Strings = (
      'select * from tbtipocontabanc  order by id')
    Left = 344
    Top = 256
  end
  object DSTCB: TDataSource
    AutoEdit = False
    DataSet = qyTCB
    Left = 416
    Top = 256
  end
  object qyLogin: TFDQuery
    Connection = DBCON
    SQL.Strings = (
      'select * from tbusuario order by nr_ins')
    Left = 40
    Top = 192
  end
  object qyCFG: TFDQuery
    AutoCalcFields = False
    Connection = DBCON
    SQL.Strings = (
      'select * from tbcateg')
    Left = 328
    Top = 432
  end
  object frxRel: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45272.797269652800000000
    ReportOptions.LastChange = 45273.287505266200000000
    ScriptLanguage = 'PascalScript'
    ShowProgress = False
    StoreInDFM = False
    Left = 160
    Top = 136
  end
  object frxPDF: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 256
    Top = 136
  end
  object frxXLS: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    EmptyLines = False
    ExportPageBreaks = False
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 208
    Top = 208
  end
  object QYMOV: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    OnCalcFields = QYMOVCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    SQL.Strings = (
      'select * from plmovimento where tp_mov = "M"')
    Left = 392
    Top = 656
    object movSTFIM: TStringField
      AutoGenerateValue = arDefault
      DefaultExpression = #39'X'#39
      FieldName = 'st_fim'
      Origin = 'st_fim'
      FixedChar = True
      Size = 1
    end
    object QYMOVcalc_ValorDC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'calc_ValorDC'
      DisplayFormat = ',0.00;,0.00'
    end
    object QYMOVcalc_idif: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_idif'
      Size = 10
      Calculated = True
    end
    object QYMOVcalc_ds_uni: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_uni'
      Size = 100
      Calculated = True
    end
    object QYMOVcalc_uf_uni: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_uf_uni'
      Size = 2
      Calculated = True
    end
    object QYMOVcalc_ds_eve: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_eve'
      Size = 100
      Calculated = True
    end
    object QYMOVcalc_tp_ins: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_ins'
      Calculated = True
    end
    object QYMOVcalc_ds_pes: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_pes'
      Size = 100
      Calculated = True
    end
    object QYMOVcalc_ds_tpd: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'calc_ds_tpd'
      Size = 100
    end
    object QYMOVcalc_ds_tp_conta: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_tp_conta'
      Size = 6
      Calculated = True
    end
    object QYMOVcalc_descr: TStringField
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'calc_descr'
      Size = 255
      Calculated = True
    end
    object QYMOVnr_doc: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'nr_doc'
      Origin = 'nr_doc'
      OnGetText = QYMOVnr_docGetText
      Size = 30
    end
    object QYMOVbanco: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'banco'
      Origin = 'banco'
      Size = 4
    end
    object QYMOVagencia: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'agencia'
      Origin = 'agencia'
      OnGetText = QYMOVagenciaGetText
      Size = 6
    end
    object QYMOVnr_conta: TStringField
      Alignment = taRightJustify
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
      OnGetText = QYMOVnr_contaGetText
    end
    object QYMOVidfull: TStringField
      Alignment = taRightJustify
      FieldKind = fkInternalCalc
      FieldName = 'idfull'
      Size = 12
    end
  end
  object QYCTR: TFDQuery
    AutoCalcFields = False
    AfterClose = DATASETAfterClose
    OnCalcFields = QYCTRCalcFields
    FieldOptions.AutoCreateMode = acCombineAlways
    Connection = DBCON
    SQL.Strings = (
      'select * from plcontratos')
    Left = 400
    Top = 576
    object QYCTRcalc_ds_uni: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_uni'
      Size = 100
      Calculated = True
    end
    object QYCTRcalc_ds_eve: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_eve'
      Size = 100
      Calculated = True
    end
    object QYCTRcalc_ds_tpc: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_tpc'
      Size = 100
      Calculated = True
    end
    object QYCTRcalc_ds_tpr: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_tpr'
      Size = 100
      Calculated = True
    end
    object QYCTRcalc_ds_pes: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ds_pes'
      Size = 100
      Calculated = True
    end
    object QYCTRcalc_dt_alt: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'calc_dt_alt'
    end
  end
  object tbUsuNivel: TFDQuery
    Connection = DBCON
    SQL.Strings = (
      'select * from tbusuarionivel')
    Left = 40
    Top = 544
  end
  object dsUsuNivel: TDataSource
    AutoEdit = False
    DataSet = tbUsuNivel
    Left = 139
    Top = 552
  end
  object tbUsuPerm: TFDQuery
    Connection = DBCON
    SQL.Strings = (
      'select * from tbusuarionivel')
    Left = 40
    Top = 640
  end
  object tbUsuRel: TFDQuery
    Connection = DBCON
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from tbusuarionivel')
    Left = 136
    Top = 632
  end
  object imageCol: TcxImageCollection
    Left = 616
    Top = 504
    object imgMostra: TcxImageCollectionItem
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
    end
    object imgEsconde: TcxImageCollectionItem
      Picture.Data = {
        0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
        0020000000200806000000737A7AF40000001C744558745469746C6500486964
        653B52656D6F76653B44656C6574653B65796578098D2D000009744944415478
        5EED977B5053571EC7BF7907084978484880202A20E0032D2260D9A5B65ABBAB
        D647B5E28356B7AD555A4B6BA7AF69ABB52FB7AEA2555B1F557C74A6B5D64771
        B4ED8232088A48612D04020A02824280901094DC2437F7ECBD7772A774BA3BED
        EEEC4CFFD9DFCCF79E5F66CE399FEF3DE7FEEEB9111142F07B8618BF734801A0
        32EFA5FF0A404000866B1910027017C2105FCE80E17F731D08B20EEC130980A2
        9C955C37CC3C7210D2DF060244C372B0101E4F38C1D70A623836DF0A86A617EC
        17FD7DC593DB0343839FB55BAC87671C29587D6EC97202E0970682A436FC9688
        DF7A48847F114D2F3DC1BB12223EFF88F8DBA539055A3F6F4E74CA18FC506859
        F5DC7DA9B9344D7B0403FF2950E49310C37312BFED3011F2ACAC2CC9D925CB0F
        84AA981C6366069A8BCBE1A4DC5B77555FA51F3044E2D70D100276421EB827EF
        51755274E81C30CC0C561309E39DE0A569D01E0FBC1E1A1EB7ABDE45B96A8728
        77498BCD7BA6C2A11ECCD584EC65E1CBA2A6A5A1F97C296EF752BB169FFDE6F5
        638FCC251EB77B980102614F851C02F8E43B4B0DE15AFF8D0A853C5B15A4F157
        04F84119E00FB99F1252990C8CD78B7B76071C7DD6246B972569D0E1CC9EBA22
        874C3B5D6CD7D87B828C195370A3B80CB77AA8DDCBBE3F93C78138D3FCC32918
        60188683FBC087842516976D7F6A5D7088F6436D78A83C40A38154A18458A680
        482287482A83986D21964219E645500C0DBDDB0D89360175874F8A02FBBB828C
        D35271E37C195A7AA98327E4E2573840FD9AC74995C9CA33C141C01BF0F29AB6
        7B270F5F373FCDAF7A6FEED98818C3D61131467940A81E36B702672BEF20FF8B
        6AE47E701673730F2175D13624CFFD00B3567D82F55BBF432B1585EA032781C6
        6B30A64D46D3F972D071E3919CBBF86199C5AC062049FAF498D843BB41B3FAC9
        80978197F682833F382946F1E4AC4935DAB090997E413AFCD8E6C496CFABB171
        57110ACF94A1E66A2D7A2C1648651218A2F5604D42171E8CF9F3E6A0EBEBD390
        5DAF813135194D172EC393988249ABB24175FE236286417CC51020F6E74C3C5D
        7151E471D3C2734650F297670433B2D2BF3D71CAFCE5EBE4CA971F924DAFE691
        D756AF204FB17B9A3A3D9B2C5BBB81ACDBF031797BC761927FE834D973EC3BB2
        EFF877C474BD957CFFF62652BE743EE9D8BE91142F9C4D4EBDF206A9BA5446FE
        BA7103292DD8444A3E5C41B6CC34160108E04C00E08E011E8A07F8B714C49FAF
        9F3D4B1D1830CF6C018AAEDC845A1B84290F2F429B330819D3FF843149939192
        9E86E90F67B1F918747759305A1782F68243F0BB5E0DE37D49682CADC4BD8429
        50CF5E80D66E1B688F138517EA705B34027113C63DB46E52F05C0072A17CC5C3
        6A591A1EACD971F39E1F5A3AAC48CC7C048F2CC8866D4884505D3454AC19AD46
        8D98D80888A522E80D617826E7510C169E82AAB90651C9496828AD02959481B8
        954FE1DB32139ADA07B060F92A4C9DBD08B5F5ADB0F94561B451F71100050089
        880D3177E17E143C37E38F942C30A6A3E72E263CF41852A7A641AF37A0AEA913
        812C5C2C02546C09BA280AFE7E0A44A894A8CBFF18DAD61F619C38168D655570
        C44DC6F835CFA2B2A11344A280F946270C1191484BCF40D6D26771E3562F94FA
        51912B6325F7FB2A502406C01B0809543E7EAB8F728D499F83F8F804A8546A88
        253274F7D820E1CA8D8820158B5172EE3CC29572FCB8651BE4A60A448D8F45FD
        A56AF4C54C40D8A3F3D1DC69C7BD211AFEFE2ADCB6582195CA10A8D122313109
        E98B57A3DDEA7485C8457F0620FB99018958342D70749A3366D4182895FEE016
        46385C9C43149C2E370082B4F171B8F4D626C8EA5878D22834545C43EFC8F1D0
        CD5F804F0F1C87E39E0B2EB6AF9372B18625FC892866319CA1D1B1F188CE9C67
        974A90317C05C025A75C0BC511A3276BB98E2C1DB497B06210A455F3EF8800A5
        0CF7C5EBE12CFC06211D26181362507FA50E96E8712C7C21767C721452A55278
        A0580314B41A15BC5E869F8BB0283F3F7F8C1C97A9BB366E8B72F8070901C0B8
        5DD4C9368B8B1FEE61E11E9A86C7432321D60878293C943A06D7777F8CA0B65A
        44C51961AA34A13B3A09FA058F217F6701BABBFB3073E60C0C0C3A31E4F4A0AF
        BB07896C3F8FC70B9AE6C5E34C376CA0861CA7017839B660806EB856BCBFC6DC
        65ED775070BB69565EB8D9C1D3A74DC2E3B353D071600F34CDD5888C8B84A9DA
        8CBED864442FC9C6DE835F213864045E589F0799221056DB5DD8ED836C897661
        66D6147E0E97DBC3CA8B7E87139535ED03ADE60B4701787803840DCECD0F65C7
        BBEF74B6BD5D74A9C53780E68DE8420371F7C43104DFBC06C328034C354D1848
        48C51F5E7B038C2C14CB573E8D85D9CBE062A468EBE8856D6010F5F526A4A724
        202A42C7CFE3F2D07C7BE24C2D6EDF6A7CA7BDA9F43600FEA11A7EB64B01A816
        3FBDF3BDE999C96BEF4F1D85208D0C15EF6F4640D30F888A0947437D1BFA5978
        CABA1771B9B683BF2B0F2B994C02CA45A3CF6A83B9A11E61212ABCBE6E05A452
        09F70CF02A2EBB8E33E72E7D76E1D49B6F0218100C082B00DF9E38BFDAFFFC86
        8A2AD33E3B7B27E5EFBC0F7FF35544458D80C97413FD635310B36C05F67F518C
        5A530BBA7AEDB0F4DBD0DCDA89DADA3A54575D45526C245E5E930D86015C9407
        5D3D0EEC3D5A81C2B3E5FB58F8060083029C0BBE0A768F9F42007072EB743A67
        57D3A9ED975F7EA151D55485C8C810D436B4E2DE840CCC79772364F20084042A
        60B574A0A2AC14572F5FC69D5B2D30EAD458BF76097216CD02CD1074DCB1E1C4
        B95A6CDB73A1ABA2ACE8C992D36F6DF0DDB98B636D8E8C234215F027E18EB193
        0800114551F2FB9B3B37278A1D6323F441A833B7A3337A221DBF722D0A8B1AD1
        D63988D4C9C958BF6639F237E521FFDD3CBCFA5C0E32D3A7A2DF46E35C491376
        1D286755D276BEA4FCDDE2E3AF64565FDC7B06801D00058011E0C2BEC3EBA5F1
        E2F55ACE4CC08B5AFDC1C911EAB9867035EA6E74E262BBF56B4BB8F5A3A2F7F2
        C3883CE2418542952896C9474A24CA9122881404040C435CB49B6AF7789C6D6E
        EAAEB9E78EE97B73F549138021004E001EA1EC2A67A5931293153F33C0F0350A
        C59B51B13B2746A8E6E9C354A86FEE42494BF7E71743D52F0D56560E592C9646
        00150064BE7112610585770900DA077373AD4F8C00C62F43580186CF8D06FD63
        112324B8D6D285B2D69EA387067A9F87BDE7AE0F000EE8934890604090001434
        1CFCEF0C081F8874737BC767D6DBB2D566477FC11147DF6B00EEE66A755E81FE
        89DDC2A55EFC4A0CDF636EB97FDD00E111AE8FBA5B39E85BBEA573ADD5EA1801
        6E5469B059A521F81FC7FFFF1DFF13005BA4ED8BA07ABF0000000049454E44AE
        426082}
    end
  end
  object fs1: TfsScript
    SyntaxType = 'JScript'
    Left = 208
    Top = 128
  end
  object fsJScript1: TfsJScript
    Left = 224
    Top = 48
  end
  object popInfo: TPopupMenu
    Left = 616
    Top = 456
    object popMov: TMenuItem
      Caption = 'Detalhes do &Registro'
    end
    object popPes: TMenuItem
      Caption = 'Detalhes do &Favorecido'
    end
    object popCtr: TMenuItem
      Caption = 'Detalhes do Contrato'
    end
  end
  object PingMySQL: TTimer
    Enabled = False
    Interval = 20000
    OnTimer = PingMySQLTimer
    Left = 632
    Top = 656
  end
  object qymov_aud: TFDQuery
    AutoCalcFields = False
    Connection = DBCON
    Left = 296
    Top = 576
  end
  object cxLFC: TcxLookAndFeelController
    ScrollbarMode = sbmClassic
    Left = 608
    Top = 568
  end
  object qytab_aud: TFDQuery
    AutoCalcFields = False
    Connection = DBCON
    Left = 296
    Top = 656
  end
end
