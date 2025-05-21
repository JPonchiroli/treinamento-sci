inherited frCadastroProdutoMdi: TfrCadastroProdutoMdi
  Left = 442
  Top = 215
  Width = 519
  Height = 315
  Caption = 'frCadastroProdutoMdi'
  PixelsPerInch = 96
  TextHeight = 13
  object lCodigoProduto: TLabel [0]
    Left = 72
    Top = 88
    Width = 39
    Height = 13
    Caption = 'C'#243'digo: '
  end
  object lNomeProduto: TLabel [1]
    Left = 72
    Top = 152
    Width = 34
    Height = 13
    Caption = 'Nome: '
  end
  object lPrecoUnitarioProduto: TLabel [2]
    Left = 48
    Top = 184
    Width = 73
    Height = 13
    Caption = 'Pre'#231'o Unit'#225'rio: '
  end
  object lCodigoCategoria: TLabel [3]
    Left = 32
    Top = 120
    Width = 87
    Height = 13
    Caption = 'C'#243'digo Categoria: '
  end
  inherited tbFerramentas: TToolBar
    Width = 503
  end
  object eNomeProduto: TEdit [5]
    Left = 128
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object ePrecoUnitarioProduto: TEdit [6]
    Left = 128
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object eCodigoCategoria: TEdit [7]
    Left = 128
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eCodigoProduto: TEditNumerico [8]
    Left = 128
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    Codigo = 0
  end
end
