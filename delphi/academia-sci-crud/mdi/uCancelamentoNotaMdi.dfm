inherited frCancelamentoNotaMdi: TfrCancelamentoNotaMdi
  Left = 389
  Top = 222
  Width = 661
  Height = 314
  Caption = 'frCancelamentoNotaMdi'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 40
    Top = 176
    Width = 119
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = 'Descri'#231#227'o Cancelamento'
    ParentBiDiMode = False
  end
  object lNumeroNota: TLabel [1]
    Left = 96
    Top = 80
    Width = 63
    Height = 13
    Caption = 'N'#250'mero Nota'
  end
  object lCodigoCliente: TLabel [2]
    Left = 96
    Top = 112
    Width = 68
    Height = 13
    Caption = 'C'#243'digo Cliente'
  end
  object lCodigoLoja: TLabel [3]
    Left = 104
    Top = 144
    Width = 56
    Height = 13
    Caption = 'C'#243'digo Loja'
  end
  inherited tbFerramentas: TToolBar
    Width = 645
    inherited tbExcluir: TToolButton
      Caption = 'Sair'
    end
    inherited tbConsultar: TToolButton
      Visible = False
    end
  end
  object eDescricaoCancelamento: TEdit [5]
    Left = 168
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object eCodigoLoja: TEditNumerico [6]
    Left = 168
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
    Codigo = 0
  end
  object eCodigoCliente: TEditNumerico [7]
    Left = 168
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    Codigo = 0
  end
  object eNumeroNota: TEditNumerico [8]
    Left = 168
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    Codigo = 0
  end
  inherited imImages: TImageList
    Left = 480
    Top = 64
  end
  inherited imHotImages: TImageList
    Left = 480
    Top = 104
  end
  inherited imDisableImages: TImageList
    Left = 480
    Top = 144
  end
end
