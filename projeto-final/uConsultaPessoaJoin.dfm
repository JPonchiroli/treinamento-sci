inherited frConsultaPessoaJoin: TfrConsultaPessoaJoin
  Left = 270
  Top = 170
  Width = 982
  Height = 506
  Caption = 'Consulta Pessoa'
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigoPessoa_Label: TLabel [0]
    Left = 8
    Top = 64
    Width = 71
    Height = 13
    Caption = 'C'#243'digo Pessoa'
  end
  inherited tbFerramentas: TToolBar
    Width = 966
  end
  inherited grPadrao_Grid: TDBGrid
    Top = 96
    Width = 641
    Height = 145
    Columns = <
      item
        Expanded = False
        FieldName = 'BDNUMETAPA'
        Title.Caption = 'N'#250'mero Etapa'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEPESSOA'
        Title.Caption = 'Nome'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDSOBRENOMEPESSOA'
        Title.Caption = 'Sobrenome'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMESALA'
        Title.Caption = 'Nome Sala'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEESPACOCAFE'
        Title.Caption = 'Nome Espa'#231'o Caf'#233
        Width = 134
        Visible = True
      end>
  end
  object enCodigoPessoa_EditNumerico: TEditNumerico [3]
    Left = 88
    Top = 60
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    Codigo = 0
    Decimal = False
    Separador = ','
  end
  inherited imImages: TImageList
    Left = 792
  end
  inherited imHotImages: TImageList
    Left = 832
  end
  inherited imDisableImages: TImageList
    Left = 872
  end
  inherited dsPadrao: TDataSource
    AutoEdit = False
    Left = 752
  end
end
