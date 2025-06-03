object dmProjeto: TdmProjeto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 214
  Top = 177
  Height = 285
  Width = 956
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
  object TPessoa: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TPESSOA'
    Left = 128
    Top = 16
  end
  object dspPessoa: TDataSetProvider
    DataSet = TPessoa
    Left = 128
    Top = 80
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPessoa'
    StoreDefs = True
    Left = 128
    Top = 144
  end
  object TSala: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TSALA'
    Left = 216
    Top = 16
  end
  object dspSala: TDataSetProvider
    DataSet = TSala
    Left = 216
    Top = 80
  end
  object cdsSala: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSala'
    Left = 216
    Top = 144
  end
  object TEspacoCafe: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TESPACOCAFE'
    Left = 296
    Top = 16
  end
  object dspEspacoCafe: TDataSetProvider
    DataSet = TEspacoCafe
    Left = 296
    Top = 80
  end
  object cdsEspacoCafe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEspacoCafe'
    Left = 296
    Top = 144
  end
  object TEtapa: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'TETAPA'
    Left = 384
    Top = 16
  end
  object dspEtapa: TDataSetProvider
    DataSet = TEtapa
    Left = 384
    Top = 80
  end
  object cdsEtapa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEtapa'
    Left = 384
    Top = 144
  end
  object qConsultaPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'bdcodpessoa'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM TPESSOA '
      'WHERE BDCODPESSOA = :bdcodpessoa')
    SQLConnection = SQLConnection
    Left = 512
    Top = 16
  end
  object dspConsultaPessoa: TDataSetProvider
    DataSet = qConsultaPessoa
    Left = 512
    Top = 72
  end
  object cdsConsultaPessoa: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspConsultaPessoa'
    StoreDefs = True
    Left = 512
    Top = 136
  end
  object qConsultaSala: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'bdcodpessoa'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM TPESSOA '
      'WHERE BDCODPESSOA = :bdcodpessoa')
    SQLConnection = SQLConnection
    Left = 616
    Top = 16
  end
  object dspConsultaSala: TDataSetProvider
    DataSet = qConsultaSala
    Left = 616
    Top = 72
  end
  object cdsConsultaSala: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspConsultaSala'
    StoreDefs = True
    Left = 616
    Top = 136
  end
  object qConsultaEspacoCafe: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'bdcodpessoa'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM TPESSOA '
      'WHERE BDCODPESSOA = :bdcodpessoa')
    SQLConnection = SQLConnection
    Left = 728
    Top = 16
  end
  object dspConsultaEspacoCafe: TDataSetProvider
    DataSet = qConsultaEspacoCafe
    Left = 728
    Top = 72
  end
  object cdsConsultaEspacoCafe: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspConsultaEspacoCafe'
    StoreDefs = True
    Left = 728
    Top = 136
  end
  object qConsultaEtapa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'bdcodpessoa'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM TPESSOA '
      'WHERE BDCODPESSOA = :bdcodpessoa')
    SQLConnection = SQLConnection
    Left = 840
    Top = 16
  end
  object dspConsultaEtapa: TDataSetProvider
    DataSet = qConsultaEtapa
    Left = 840
    Top = 72
  end
  object cdsConsultaEtapa: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspConsultaEtapa'
    StoreDefs = True
    Left = 840
    Top = 136
  end
end
