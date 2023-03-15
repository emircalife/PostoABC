object frmRelAbastecimento: TfrmRelAbastecimento
  Left = 0
  Top = 0
  Caption = 'frmRelAbastecimento'
  ClientHeight = 363
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = -32
    Width = 794
    Height = 1123
    DataSource = dsListarRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Listagem de Abastecimentos'
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 27
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 3
        Top = 8
        Width = 712
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Listagem dos abastecimentos'
      end
    end
  end
  object dsListarRelatorio: TDataSource
    DataSet = DM.qryListar
    Left = 344
    Top = 104
  end
end
