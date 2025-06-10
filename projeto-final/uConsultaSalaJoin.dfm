inherited frConsultaSalaJoin: TfrConsultaSalaJoin
  Width = 1010
  Height = 538
  Caption = 'Consulta Sala'
  PixelsPerInch = 96
  TextHeight = 13
  object enCodigoSala_EditNumerico: TLabel [0]
    Left = 8
    Top = 64
    Width = 57
    Height = 13
    Caption = 'C'#243'digo Sala'
  end
  inherited tbFerramentas: TToolBar
    Width = 994
  end
  inherited grPadrao_Grid: TDBGrid
    Top = 94
    Width = 577
    Height = 155
    Columns = <
      item
        Expanded = False
        FieldName = 'BDNUMETAPA'
        Title.Caption = 'N'#250'mero Etapa'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMESALA'
        Title.Caption = 'Nome Sala'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEPESSOA'
        Title.Caption = 'Nome Participante'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDSOBRENOMEPESSOA'
        Title.Caption = 'Sobrenome Participante'
        Width = 140
        Visible = True
      end>
  end
  object enCodigoSala: TEditNumerico [3]
    Left = 80
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
    Left = 752
  end
end
