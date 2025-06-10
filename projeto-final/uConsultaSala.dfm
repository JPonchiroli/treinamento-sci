inherited frConsultaSala: TfrConsultaSala
  Left = 271
  Top = 189
  Width = 947
  Height = 327
  Caption = 'Consulta Sala'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tbFerramentas: TToolBar
    Width = 931
  end
  inherited grPadrao_Grid: TDBGrid
    Width = 681
    Height = 155
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODSALA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMESALA'
        Title.Caption = 'Nome'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDLOTACAOMAXIMASALA'
        Title.Caption = 'Lota'#231#227'o M'#225'xima'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        Width = -1
        Visible = False
      end>
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
