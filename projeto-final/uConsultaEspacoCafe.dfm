inherited frConsultaEspacoCafe: TfrConsultaEspacoCafe
  Left = 256
  Top = 183
  Width = 957
  Height = 308
  Caption = 'Consulta Espa'#231'o Cafe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tbFerramentas: TToolBar
    Width = 941
  end
  inherited grPadrao_Grid: TDBGrid
    Width = 585
    Height = 123
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODESPACOCAFE'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEESPACOCAFE'
        Title.Caption = 'Nome'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDLOTACAOMAXIMAESPACOCAFE'
        Title.Caption = 'Lota'#231#227'o M'#225'xima'
        Width = 120
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
