object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Verificar Permiss'#227'o Diret'#243'rios'
  ClientHeight = 252
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnVerificar: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Verificar'
    TabOrder = 0
    OnClick = btnVerificarClick
  end
  object mDiretorios: TMemo
    Left = 8
    Top = 39
    Width = 340
    Height = 205
    Lines.Strings = (
      'C:\inetpub'
      'C:\inetpub\ServerSac'
      'C:\'
      'C:\Projetos'
      'C:\Projetos\Cargas'
      'C:\Projetos\Cargas\cargas'
      'C:\Projetos\Cargas\cargas\Testes'
      'C:\Projetos\Cargas\cargas\Testes\bin'
      'C:\Projetos\Cargas\FileTranslator\Testes\bin'
      'D:\Teste'
      'I:\'
      'I:\Teste'
      'Z:\'
      'Z:\Teste')
    TabOrder = 1
  end
end
