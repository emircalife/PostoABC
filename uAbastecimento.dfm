object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Abastecimento'
  ClientHeight = 120
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblLitros: TLabel
    Left = 24
    Top = 32
    Width = 26
    Height = 13
    Caption = 'Litros'
  end
  object lblValorAbastecido: TLabel
    Left = 24
    Top = 59
    Width = 69
    Height = 13
    Caption = 'R$ Abastecido'
  end
  object edtLitros: TEdit
    Left = 112
    Top = 29
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 0
    OnExit = edtLitrosExit
    OnKeyPress = edtLitrosKeyPress
  end
  object edtValorAbastecido: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 1
    OnExit = edtValorAbastecidoExit
    OnKeyPress = edtValorAbastecidoKeyPress
  end
  object btnAbastecer: TBitBtn
    Left = 77
    Top = 87
    Width = 75
    Height = 25
    Caption = '&Abastecer'
    TabOrder = 2
    OnClick = btnAbastecerClick
  end
  object btnCancelar: TBitBtn
    Left = 158
    Top = 87
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
