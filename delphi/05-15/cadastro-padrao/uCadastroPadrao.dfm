object frCadastroPadrao: TfrCadastroPadrao
  Left = 349
  Top = 189
  Width = 931
  Height = 455
  Caption = 'frCadastroPadrao'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 913
    Height = 41
    Color = clActiveCaption
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Exluir'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
