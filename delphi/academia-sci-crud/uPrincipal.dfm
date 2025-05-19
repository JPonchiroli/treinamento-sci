object frPrincipal: TfrPrincipal
  Left = 342
  Top = 148
  Width = 928
  Height = 486
  Caption = 'frPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bProduto: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Produto'
    TabOrder = 0
    OnClick = bProdutoClick
  end
  object bCategoria: TButton
    Left = 128
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Categoria'
    TabOrder = 1
    OnClick = bCategoriaClick
  end
  object bCliente: TButton
    Left = 232
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Cliente'
    TabOrder = 2
    OnClick = bClienteClick
  end
  object bLoja: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Loja'
    TabOrder = 3
    OnClick = bLojaClick
  end
  object bNota: TButton
    Left = 128
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Nota'
    TabOrder = 4
    OnClick = bNotaClick
  end
  object bNotaItem: TButton
    Left = 232
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Nota Item'
    TabOrder = 5
    OnClick = bNotaItemClick
  end
end
