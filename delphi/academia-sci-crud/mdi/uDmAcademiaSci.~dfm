object dmAcademiaSci: TdmAcademiaSci
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 331
  Top = 207
  Height = 336
  Width = 705
  object SQLConnection: TSQLConnection
    ConnectionName = 'DB2Connection'
    DriverName = 'DB2'
    GetDriverFunc = 'getSQLDriverDB2'
    LibraryName = 'dbexpdb2.dll'
    Params.Strings = (
      'DriverName=DB2'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DB2 TransIsolation=ReadCommited')
    VendorLib = 'db2cli.dll'
    Left = 32
    Top = 16
  end
  object TProduto: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TPRODUTO'
    Left = 112
    Top = 16
  end
  object dspProduto: TDataSetProvider
    DataSet = TProduto
    Left = 112
    Top = 72
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 112
    Top = 128
  end
  object TCategoria: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TCATEGORIA'
    Left = 200
    Top = 16
  end
  object dspCategoria: TDataSetProvider
    DataSet = TCategoria
    Left = 200
    Top = 72
  end
  object cdsCategoria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCategoria'
    Left = 200
    Top = 128
  end
  object TCliente: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TCLIENTE'
    Left = 288
    Top = 16
  end
  object dspCliente: TDataSetProvider
    DataSet = TCliente
    Left = 288
    Top = 72
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 288
    Top = 128
  end
  object TLoja: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TLOJA'
    Left = 376
    Top = 16
  end
  object dspLoja: TDataSetProvider
    DataSet = TLoja
    Left = 376
    Top = 72
  end
  object cdsLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLoja'
    Left = 376
    Top = 128
  end
  object TNota: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TNOTA'
    Left = 440
    Top = 16
  end
  object dspNota: TDataSetProvider
    DataSet = TNota
    Left = 440
    Top = 72
  end
  object cdsNota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNota'
    Left = 440
    Top = 128
  end
  object TNotaItem: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TNOTA_ITEM'
    Left = 512
    Top = 16
  end
  object dspNotaItem: TDataSetProvider
    DataSet = TNotaItem
    Left = 512
    Top = 72
  end
  object cdsNotaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNotaItem'
    Left = 512
    Top = 128
  end
end
