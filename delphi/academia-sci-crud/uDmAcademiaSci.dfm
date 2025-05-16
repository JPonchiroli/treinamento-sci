object dmAcademiaSci: TdmAcademiaSci
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 430
  Top = 188
  Height = 336
  Width = 487
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
end
