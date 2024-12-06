object fImportAgente: TfImportAgente
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Importa'#231#227'o de Agentes'
  ClientHeight = 377
  ClientWidth = 1012
  Color = clBtnFace
  Constraints.MinHeight = 415
  Constraints.MinWidth = 1024
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 134
    Height = 15
    Caption = 'Arquivo CSV deve conter:'
  end
  object Button1: TButton
    Left = 288
    Top = 320
    Width = 177
    Height = 41
    Caption = 'Abrir Arquivo CSV'
    TabOrder = 0
    OnClick = Button1Click
  end
  object grA: TDBGrid
    Left = 208
    Top = 16
    Width = 785
    Height = 297
    DataSource = dsA
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btCancelar: TBitBtn
    Left = 568
    Top = 320
    Width = 177
    Height = 41
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
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 832
    Top = 16
    Width = 177
    Height = 257
    Lines.Strings = (
      'nrins;15;CPF/CNPJ'
      'descr;100;Nome'
      'cod;10;Chave'
      'email;100;E-mail'
      'fone1;20;Celular'
      'fone2;20;Telefone res.'
      'agatu;100;ag'#234'ncia de atua'#231#227'o'
      'UF;2;UF'
      'agencia;15;ag'#234'ncia banc'#225'ria'
      'conta;20;Conta'
      'tpconta;2;Tipo conta'
      'ativo;10;Situa'#231#227'o'
      'exage;3;'
      'exuni;3;'
      'cduni;4;'
      'dsuni;100;')
    TabOrder = 1
    Visible = False
  end
  object Memo2: TMemo
    Left = 16
    Top = 64
    Width = 185
    Height = 201
    Lines.Strings = (
      'CPF/CNPJ'
      'Nome'
      'Chave'
      'E-mail'
      'Celular'
      'Telefone res.'
      'ag'#234'ncia de atua'#231#227'o'
      'UF'
      'ag'#234'ncia banc'#225'ria'
      'Conta'
      'Tipo conta'
      'Situa'#231#227'o')
    ReadOnly = True
    TabOrder = 4
  end
  object dlgA: TOpenDialog
    DefaultExt = 'csv'
    Filter = 'Arquivo CSV|*.csv'
    Left = 456
    Top = 208
  end
  object dsA: TDataSource
    AutoEdit = False
    Left = 368
    Top = 200
  end
end
