inherited frCadastroClienteMdi: TfrCadastroClienteMdi
  Left = 415
  Top = 182
  Width = 643
  Height = 345
  Caption = 'frCadastroClienteMdi'
  PixelsPerInch = 96
  TextHeight = 13
  object lCodigoCliente: TLabel [0]
    Left = 56
    Top = 64
    Width = 39
    Height = 13
    Caption = 'C'#243'digo: '
  end
  object lCnpj: TLabel [1]
    Left = 56
    Top = 128
    Width = 30
    Height = 13
    Caption = 'CNPJ:'
  end
  object lCpf: TLabel [2]
    Left = 64
    Top = 160
    Width = 26
    Height = 13
    Caption = 'CPF: '
  end
  object lNomeCliente: TLabel [3]
    Left = 32
    Top = 96
    Width = 66
    Height = 13
    Caption = 'Nome Cliente:'
  end
  object lEndereco: TLabel [4]
    Left = 48
    Top = 192
    Width = 52
    Height = 13
    Caption = 'Endere'#231'o: '
  end
  object lTelefone: TLabel [5]
    Left = 64
    Top = 224
    Width = 48
    Height = 13
    Caption = 'Telefone: '
  end
  inherited tbFerramentas: TToolBar
    Width = 627
  end
  object eCnpjCliente: TEdit [7]
    Left = 112
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object eCpfCliente: TEdit [8]
    Left = 112
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object eNomeCliente: TEdit [9]
    Left = 112
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eEnderecoCliente: TEdit [10]
    Left = 112
    Top = 192
    Width = 201
    Height = 21
    TabOrder = 5
  end
  object eTelefoneCliente: TEdit [11]
    Left = 112
    Top = 224
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object eCodigoCliente: TEditNumerico [12]
    Left = 112
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    Codigo = 0
  end
  inherited imImages: TImageList
    Left = 344
    Top = 88
  end
  inherited imHotImages: TImageList
    Left = 344
    Top = 128
  end
  inherited imDisableImages: TImageList
    Left = 344
    Top = 168
  end
end
