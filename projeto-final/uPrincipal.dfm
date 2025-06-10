object frPrincipal: TfrPrincipal
  Left = 343
  Top = 148
  Width = 928
  Height = 486
  Caption = 'Tela Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mMenu: TMainMenu
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
    object mConsulta: TMenuItem
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
    object mRelatorios: TMenuItem
      Caption = 'Exportar CSV'
      object mRelatorioPessoas: TMenuItem
        Caption = 'Pessoas'
        OnClick = mRelatorioPessoasClick
      end
      object mRelatorioSalas: TMenuItem
        Caption = 'Salas'
        OnClick = mRelatorioSalasClick
      end
      object mRelatorioEspacosDeCafe: TMenuItem
        Caption = 'Espa'#231'os de Caf'#233
        OnClick = mRelatorioEspacosDeCafeClick
      end
      object mRelatorioEtapas: TMenuItem
        Caption = 'Etapas'
        OnClick = mRelatorioEtapasClick
      end
    end
  end
end
