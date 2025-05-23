inherited frCadastroNotaMdi: TfrCadastroNotaMdi
  Left = 430
  Top = 184
  Width = 586
  Height = 330
  Caption = 'frCadastroNotaMdi'
  PixelsPerInch = 96
  TextHeight = 13
  object lNumeroNota: TLabel [0]
    Left = 40
    Top = 80
    Width = 63
    Height = 13
    Caption = 'N'#250'mero Nota'
  end
  object lCodigoCliente: TLabel [1]
    Left = 40
    Top = 112
    Width = 68
    Height = 13
    Caption = 'C'#243'digo Cliente'
  end
  object lCodigoLoja: TLabel [2]
    Left = 48
    Top = 144
    Width = 56
    Height = 13
    Caption = 'C'#243'digo Loja'
  end
  object lStatus: TLabel [3]
    Left = 72
    Top = 176
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  inherited tbFerramentas: TToolBar
    Width = 570
    object tbCancelar: TToolButton
      Left = 153
      Top = 0
      Caption = 'Cancelar'
      ImageIndex = 2
      OnClick = tbCancelarClick
    end
  end
  object eStatusNota: TEdit [5]
    Left = 112
    Top = 176
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object eCodigoLoja: TEditNumerico [6]
    Left = 112
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  object eCodigoCliente: TEditNumerico [7]
    Left = 112
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  object eNumeroNota: TEditNumerico [8]
    Left = 112
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  inherited imImages: TImageList
    Left = 320
    Top = 56
  end
  inherited imHotImages: TImageList
    Left = 320
    Top = 96
  end
  inherited imDisableImages: TImageList
    Left = 320
    Top = 136
  end
end
