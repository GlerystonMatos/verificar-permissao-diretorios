object frmDgVerificarPermissaoDiretorios: TfrmDgVerificarPermissaoDiretorios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Verificar Permiss'#227'o Diret'#243'rios'
  ClientHeight = 309
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbAcessoliberado: TLabel
    Left = 8
    Top = 62
    Width = 79
    Height = 13
    Caption = 'Acesso liberado:'
  end
  object lbAcessoBloqueado: TLabel
    Left = 8
    Top = 186
    Width = 91
    Height = 13
    Caption = 'Acesso bloqueado:'
  end
  object btnIniciarVerificacao: TBitBtn
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Iniciar Verifica'#231#227'o'
    TabOrder = 0
    OnClick = btnIniciarVerificacaoClick
  end
  object pbProgresso: TProgressBar
    Left = 8
    Top = 39
    Width = 591
    Height = 17
    TabOrder = 1
  end
  object mAcessoliberado: TMemo
    Left = 8
    Top = 82
    Width = 591
    Height = 95
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object mAcessoBloqueado: TMemo
    Left = 8
    Top = 206
    Width = 591
    Height = 95
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
