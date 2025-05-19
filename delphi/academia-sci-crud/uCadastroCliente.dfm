object frCadastroCliente: TfrCadastroCliente
  Left = 538
  Top = 167
  Width = 646
  Height = 340
  Caption = 'frCadastroCliente'
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
  object lCodigoCliente: TLabel
    Left = 48
    Top = 40
    Width = 39
    Height = 13
    Caption = 'C'#243'digo: '
  end
  object lCnpj: TLabel
    Left = 48
    Top = 104
    Width = 30
    Height = 13
    Caption = 'CNPJ:'
  end
  object lCpf: TLabel
    Left = 56
    Top = 136
    Width = 26
    Height = 13
    Caption = 'CPF: '
  end
  object lNomeCliente: TLabel
    Left = 24
    Top = 72
    Width = 66
    Height = 13
    Caption = 'Nome Cliente:'
  end
  object lEndereco: TLabel
    Left = 40
    Top = 168
    Width = 52
    Height = 13
    Caption = 'Endere'#231'o: '
  end
  object lTelefone: TLabel
    Left = 56
    Top = 200
    Width = 48
    Height = 13
    Caption = 'Telefone: '
  end
  object eCodigoCliente: TEdit
    Left = 104
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = eCodigoClienteExit
  end
  object bSalvar: TButton
    Left = 288
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = bSalvarClick
  end
  object bExcluir: TButton
    Left = 288
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = bExcluirClick
  end
  object bConsultar: TButton
    Left = 288
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 3
    OnClick = bConsultarClick
  end
  object eCnpjCliente: TEdit
    Left = 104
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object eCpfCliente: TEdit
    Left = 104
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object eNomeCliente: TEdit
    Left = 104
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object eEnderecoCliente: TEdit
    Left = 104
    Top = 168
    Width = 201
    Height = 21
    TabOrder = 7
  end
  object eTelefoneCliente: TEdit
    Left = 104
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 8
  end
end
