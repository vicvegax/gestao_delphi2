object fLogin: TfLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe o Usu'#225'rio'
  ClientHeight = 392
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object lbVersao: TLabel
    Left = 7
    Top = 320
    Width = 34
    Height = 15
    Alignment = taRightJustify
    Caption = 'Vers'#227'o'
  end
  object Label1: TLabel
    Left = 80
    Top = 32
    Width = 24
    Height = 15
    Caption = 'CPF:'
  end
  object Label2: TLabel
    Left = 80
    Top = 72
    Width = 35
    Height = 15
    Caption = 'Senha:'
  end
  object lbBDLOCAL: TLabel
    Left = 136
    Top = 224
    Width = 92
    Height = 45
    Alignment = taCenter
    Caption = 'ATEN'#199#195'O'#13#10'BASE DE DADOS'#13#130'VINDO DE FORA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object imgLogo: TImage
    Left = 368
    Top = 16
    Width = 511
    Height = 346
    Proportional = True
    Stretch = True
    Transparent = True
  end
  object pnDEV: TPanel
    Left = 8
    Top = 136
    Width = 345
    Height = 65
    BevelWidth = 5
    Color = 8421631
    ParentBackground = False
    TabOrder = 5
    OnDblClick = pnDEVDblClick
    object lbDEV: TLabel
      Left = 32
      Top = 8
      Width = 282
      Height = 50
      Alignment = taCenter
      Caption = '(*** DESENVOLVEDOR ***)'#13#10'Clique duas vezes para desativar!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnDblClick = pnDEVDblClick
    end
  end
  object pnUSU: TPanel
    Left = 32
    Top = 144
    Width = 297
    Height = 81
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 281
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Seja bem-vindo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbUSU: TLabel
      Left = 8
      Top = 29
      Width = 281
      Height = 44
      Alignment = taCenter
      AutoSize = False
      Caption = '(USU'#193'RIO)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edCPF: TEdit
    Left = 128
    Top = 24
    Width = 120
    Height = 23
    TabOrder = 0
    OnChange = edCPFChange
    OnKeyPress = edCPFKeyPress
  end
  object edSENHA: TEdit
    Left = 128
    Top = 64
    Width = 121
    Height = 23
    MaxLength = 8
    PasswordChar = '*'
    TabOrder = 1
  end
  object btOK: TBitBtn
    Left = 32
    Top = 208
    Width = 113
    Height = 25
    Caption = 'OK'
    Default = True
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
    TabOrder = 2
    OnClick = btOKClick
  end
  object btCancel: TBitBtn
    Left = 216
    Top = 208
    Width = 113
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
  end
  object LinkLabel1: TLinkLabel
    Left = 128
    Top = 104
    Width = 129
    Height = 24
    Caption = '<a>Esqueceu a Senha?</a>'
    TabOrder = 6
    UseVisualStyle = True
    OnLinkClick = LinkLabel1LinkClick
  end
  object smtp1: TIdSMTP
    Host = 'smtp.grupopadilha.com.br'
    Password = '%Aa041016'
    Port = 1025
    SASLMechanisms = <>
    Username = 'sede@grupopadilha.com.br'
    Left = 296
    Top = 72
  end
  object msg1: TIdMessage
    AttachmentEncoding = 'UUE'
    Body.Strings = (
      '<table cellpadding="0" cellspacing="0" style="width:516px">'
      '  <tbody>'
      '    <tr>'
      '      <td>'
      
        '      <h2><strong>Senha do Sistema Solu&ccedil;&atilde;o gerada!' +
        '</strong></h2>'
      ''
      '      <p><strong>Ol&aacute;, %usuario%,</strong></p>'
      ''
      
        '      <p>Uma nova senha foi gerada para seu acesso ao sistema. A' +
        'p&oacute;s entrar no sistema, recomendamos que a altere indo em ' +
        'Utilit&aacute;rios/Alterar Senha</p>'
      ''
      '      <p>Nova Senha: %senha%</p>'
      '      </td>'
      '    </tr>'
      '  </tbody>'
      '</table>')
    BccList = <>
    CharSet = 'us-ascii'
    CCList = <>
    ContentType = 'text/html'
    Encoding = meDefault
    FromList = <
      item
        Address = 'sede@grupopadilha.com.br'
        Name = 'Solu'#231#227'o - Grupo Padilha'
        Text = '"Solu'#231#227'o - Grupo Padilha" <sede@grupopadilha.com.br>'
        Domain = 'grupopadilha.com.br'
        User = 'sede'
      end>
    From.Address = 'sede@grupopadilha.com.br'
    From.Name = 'Solu'#231#227'o - Grupo Padilha'
    From.Text = '"Solu'#231#227'o - Grupo Padilha" <sede@grupopadilha.com.br>'
    From.Domain = 'grupopadilha.com.br'
    From.User = 'sede'
    Recipients = <>
    ReplyTo = <>
    Subject = 'Novo senha para o Sistema Solu'#231#227'o'
    ConvertPreamble = True
    Left = 264
    Top = 272
  end
end
