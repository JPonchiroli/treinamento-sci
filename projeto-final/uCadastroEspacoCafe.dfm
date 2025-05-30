inherited frCadastroEspacoCafe: TfrCadastroEspacoCafe
  Caption = 'frCadastroEspacoCafe'
  PixelsPerInch = 96
  TextHeight = 13
  object lNomeEspacoCafe: TLabel [0]
    Left = 88
    Top = 128
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object lLotacaoMaximaEspacoCafe: TLabel [1]
    Left = 38
    Top = 160
    Width = 78
    Height = 13
    Caption = 'Lota'#231#227'o M'#225'xima'
  end
  object lLotacaoAtualEspacoCafe: TLabel [2]
    Left = 50
    Top = 192
    Width = 66
    Height = 13
    Caption = 'Lota'#231#227'o Atual'
  end
  object lCodigoEspacoCafe: TLabel [3]
    Left = 83
    Top = 96
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object eNomeEspacoCafe: TEdit [5]
    Left = 128
    Top = 124
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object enLotacaoMaximaEspacoCafe: TEditNumerico [6]
    Left = 128
    Top = 156
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  object enLotacaoAtualEspacoCafe: TEditNumerico [7]
    Left = 128
    Top = 188
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  object enCodigoEspacoCafe: TEditNumerico [8]
    Left = 128
    Top = 92
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
end
