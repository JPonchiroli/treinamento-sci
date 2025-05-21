inherited frCadastroCategoriaMdi: TfrCadastroCategoriaMdi
  Left = 494
  Top = 215
  Width = 444
  Height = 272
  Caption = 'frCadastroCategoriaMdi'
  PixelsPerInch = 96
  TextHeight = 13
  object lCodigoProduto: TLabel [0]
    Left = 24
    Top = 88
    Width = 39
    Height = 13
    Caption = 'C'#243'digo: '
  end
  object lNomeProduto: TLabel [1]
    Left = 24
    Top = 120
    Width = 34
    Height = 13
    Caption = 'Nome: '
  end
  inherited tbFerramentas: TToolBar
    Width = 428
  end
  object eNomeCategoria: TEdit [3]
    Left = 80
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eCodigoCategoria: TEditNumerico [4]
    Left = 80
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    Codigo = 0
  end
  inherited imImages: TImageList
    Left = 240
    Top = 56
  end
  inherited imHotImages: TImageList
    Left = 240
    Top = 96
  end
  inherited imDisableImages: TImageList
    Left = 240
    Top = 136
  end
end
