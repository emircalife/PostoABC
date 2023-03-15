object frmRelAbastecimento: TfrmRelAbastecimento
  Left = 0
  Top = 0
  Caption = 'frmRelAbastecimento'
  ClientHeight = 363
  ClientWidth = 812
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
    Left = 8
    Top = -40
    Width = 794
    Height = 1123
    DataSource = dsListarRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 37
      Margins.BottomMargin = 3.000000000000000000
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object rllTitulo: TRLLabel
        Left = 3
        Top = 4
        Width = 712
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 645
        Top = 4
        Width = 41
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
    object rlgDia: TRLGroup
      Left = 38
      Top = 91
      Width = 718
      Height = 39
      DataFields = 'DIA'
      object rlbDetalheDia: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 21
        object rldbDia: TRLDBText
          Left = -2
          Top = 2
          Width = 25
          Height = 16
          DataField = 'DIA'
          DataSource = dsListarRelatorio
          Text = ''
        end
        object rldbTanque: TRLDBText
          Left = 76
          Top = 2
          Width = 96
          Height = 16
          DataField = 'NOMETANQUE'
          DataSource = dsListarRelatorio
          Text = ''
        end
        object rldbBomba: TRLDBText
          Left = 162
          Top = 3
          Width = 91
          Height = 16
          DataField = 'NOMEBOMBA'
          DataSource = dsListarRelatorio
          Text = ''
        end
        object rldbValorCobrado: TRLDBText
          Left = 259
          Top = 3
          Width = 152
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALORCOBRADO'
          DataSource = dsListarRelatorio
          DisplayMask = '#,##0.00'
          Text = ''
        end
      end
      object rlbFoooterGrupoDia: TRLBand
        Left = 0
        Top = 21
        Width = 718
        Height = 17
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object rldbrSumValorCobrado: TRLDBResult
          Left = 259
          Top = 0
          Width = 152
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALORCOBRADO'
          DataSource = dsListarRelatorio
          DisplayMask = '#,##0.00'
          Info = riSum
          Text = ''
          OnCompute = rldbrSumValorCobradoCompute
        end
        object rllTotal: TRLLabel
          Left = 287
          Top = 0
          Width = 52
          Height = 16
          Caption = 'Total R$'
        end
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 75
      Width = 718
      Height = 16
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 0
        Top = 1
        Width = 23
        Height = 16
        Caption = 'Dia'
      end
      object RLLabel2: TRLLabel
        Left = 76
        Top = 1
        Width = 46
        Height = 16
        Caption = 'Tanque'
      end
      object RLLabel3: TRLLabel
        Left = 162
        Top = 0
        Width = 45
        Height = 16
        Caption = 'Bomba'
      end
      object rllValorComImposto: TRLLabel
        Left = 319
        Top = -1
        Width = 20
        Height = 16
        Caption = 'R$'
      end
    end
  end
  object dsListarRelatorio: TDataSource
    DataSet = DM.qryListar
    Left = 504
    Top = 40
  end
end
