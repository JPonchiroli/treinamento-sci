inherited frConsultaEtapa: TfrConsultaEtapa
  Caption = 'Consulta Etapa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tbFerramentas: TToolBar
    Width = 920
  end
  inherited grPadrao_Grid: TDBGrid
    Width = 912
    Height = 395
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODETAPA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNUMETAPA'
        Title.Caption = 'Etapa'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODPESSOA'
        Title.Caption = 'C'#243'digo Pessoa'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODSALA'
        Title.Caption = 'C'#243'digo da Sala'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODESPACOCAFE'
        Title.Caption = 'C'#243'digo Espa'#231'o Caf'#233
        Width = 110
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
