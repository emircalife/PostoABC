object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 198
  Width = 295
  object Conn: TFDConnection
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object Tran: TFDTransaction
    Connection = Conn
    Left = 104
    Top = 32
  end
  object qryListar: TFDQuery
    Connection = Conn
    Left = 40
    Top = 96
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 192
    Top = 32
  end
  object qrySalvar: TFDQuery
    Connection = Conn
    Left = 104
    Top = 96
  end
end
