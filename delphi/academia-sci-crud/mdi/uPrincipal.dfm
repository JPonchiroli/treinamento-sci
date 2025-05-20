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
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 8
    Top = 16
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Categoria1: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object Loja1: TMenuItem
        Caption = 'Loja'
        OnClick = Loja1Click
      end
      object Nota1: TMenuItem
        Caption = 'Nota'
        OnClick = Nota1Click
      end
      object NotaItem1: TMenuItem
        Caption = 'Nota Item'
        OnClick = NotaItem1Click
      end
      object Simples1: TMenuItem
        Caption = 'Simples'
        OnClick = Simples1Click
      end
    end
  end
end
