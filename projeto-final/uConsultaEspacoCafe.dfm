inherited frConsultaEspacoCafe: TfrConsultaEspacoCafe
  Caption = 'frConsultaEspacoCafe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grPadrao: TDBGrid
    Top = 64
    Width = 537
    Height = 177
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
        FieldName = 'BDLOTACAOATUALESPACOCAFE'
        Title.Caption = 'Lota'#231#227'o Atual'
        Width = 154
        Visible = True
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
