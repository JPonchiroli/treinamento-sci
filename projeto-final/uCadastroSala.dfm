inherited frCadastroSala: TfrCadastroSala
  Caption = 'Cadastro Sala'
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomeSala_Label: TLabel [0]
    Left = 80
    Top = 120
    Width = 35
    Height = 13
    Caption = '* Nome'
  end
  object lbLotacaoMaximaSala_Label: TLabel [1]
    Left = 30
    Top = 152
    Width = 85
    Height = 13
    Caption = '* Lota'#231#227'o M'#225'xima'
  end
  object lbCodigoSala_Label: TLabel [2]
    Left = 82
    Top = 88
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object edNomeSala_Edit: TEdit [4]
    Left = 128
    Top = 116
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object enLotacaoMaximaSala_EditNumerico: TEditNumerico [5]
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
  object enCodigoSala_EditNumerico: TEditNumerico [6]
    Left = 128
    Top = 84
    Width = 121
    Height = 21
    TabOrder = 3
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
