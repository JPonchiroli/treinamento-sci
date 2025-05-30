inherited frCadastroSala: TfrCadastroSala
  Caption = 'frCadastroSala'
  PixelsPerInch = 96
  TextHeight = 13
  object lNomeSala: TLabel [0]
    Left = 88
    Top = 120
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object lLotacaoMaximaSala: TLabel [1]
    Left = 38
    Top = 152
    Width = 78
    Height = 13
    Caption = 'Lota'#231#227'o M'#225'xima'
  end
  object lLotacaoAtualSala: TLabel [2]
    Left = 50
    Top = 184
    Width = 66
    Height = 13
    Caption = 'Lota'#231#227'o Atual'
  end
  object lCodigoSala: TLabel [3]
    Left = 83
    Top = 88
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object eNomeSala: TEdit [5]
    Left = 128
    Top = 116
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object enLotacaoMaximaSala: TEditNumerico [6]
    Left = 128
    Top = 148
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  object enLotacaoAtualSala: TEditNumerico [7]
    Left = 128
    Top = 180
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  object enCodigoSala: TEditNumerico [8]
    Left = 128
    Top = 84
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  inherited imImages: TImageList
    Top = 72
  end
  inherited imHotImages: TImageList
    Top = 112
  end
  inherited imDisableImages: TImageList
    Top = 152
  end
end
