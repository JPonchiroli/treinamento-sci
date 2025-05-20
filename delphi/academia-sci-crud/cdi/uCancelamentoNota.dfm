object frCancelamentoNota: TfrCancelamentoNota
  Left = 375
  Top = 205
  Width = 627
  Height = 367
  Caption = 'frCancelamentoNota'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 168
    Width = 119
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = 'Descri'#231#227'o Cancelamento'
    ParentBiDiMode = False
  end
  object lNumeroNota: TLabel
    Left = 128
    Top = 72
    Width = 63
    Height = 13
    Caption = 'N'#250'mero Nota'
  end
  object lCodigoCliente: TLabel
    Left = 128
    Top = 104
    Width = 68
    Height = 13
    Caption = 'C'#243'digo Cliente'
  end
  object lCodigoLoja: TLabel
    Left = 136
    Top = 136
    Width = 56
    Height = 13
    Caption = 'C'#243'digo Loja'
  end
  object eDescricaoCancelamento: TEdit
    Left = 200
    Top = 168
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object bSalvar: TButton
    Left = 384
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = bSalvarClick
  end
  object eNumeroNota: TEdit
    Left = 200
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eCodigoCliente: TEdit
    Left = 200
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object eCodigoLoja: TEdit
    Left = 200
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
