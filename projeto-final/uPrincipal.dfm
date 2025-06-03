object frPrincipal: TfrPrincipal
  Left = 323
  Top = 144
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
    object mCadastro: TMenuItem
      Caption = 'Cadastro'
      object mCadastroPessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = mCadastroPessoaClick
      end
      object mCadastroSala: TMenuItem
        Caption = 'Sala'
        OnClick = mCadastroSalaClick
      end
      object mCadastroEspacoCafe: TMenuItem
        Caption = 'Espa'#231'o Caf'#233
        OnClick = mCadastroEspacoCafeClick
      end
      object mCadastroEtapa: TMenuItem
        Caption = 'Etapa'
        OnClick = mCadastroEtapaClick
      end
    end
    object Consulta1: TMenuItem
      Caption = 'Consulta Etapas'
      object mConsultaPessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = mConsultaPessoaClick
      end
      object mConsultaSala: TMenuItem
        Caption = 'Sala'
        OnClick = mConsultaSalaClick
      end
      object mConsultaEspacoCafe: TMenuItem
        Caption = 'Espa'#231'o Caf'#233
        OnClick = mConsultaEspacoCafeClick
      end
    end
  end
end
