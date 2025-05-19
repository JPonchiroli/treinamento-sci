object frCadastroNotaItem: TfrCadastroNotaItem
  Left = 436
  Top = 183
  Width = 608
  Height = 361
  Caption = 'frCadastroNotaItem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lCodigoProduto: TLabel
    Left = 72
    Top = 56
    Width = 73
    Height = 13
    Caption = 'C'#243'digo Produto'
  end
  object lNumeroNota: TLabel
    Left = 80
    Top = 88
    Width = 63
    Height = 13
    Caption = 'N'#250'mero Nota'
  end
  object lQuantidadeVendida: TLabel
    Left = 48
    Top = 120
    Width = 97
    Height = 13
    Caption = 'Quantidade Vendida'
  end
  object lPrecoUnitario: TLabel
    Left = 80
    Top = 152
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Unit'#225'rio'
  end
  object eCodigoProduto: TEdit
    Left = 152
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = eCodigoProdutoExit
  end
  object eNumeroNota: TEdit
    Left = 152
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object eQuantidadeVendida: TEdit
    Left = 152
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eValorUnitario: TEdit
    Left = 152
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object bSalvar: TButton
    Left = 368
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = bSalvarClick
  end
  object bExcluir: TButton
    Left = 368
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
  end
  object bConsultar: TButton
    Left = 368
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 6
    OnClick = bConsultarClick
  end
end
