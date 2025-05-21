inherited frConsultaProdutoMdi: TfrConsultaProdutoMdi
  Caption = 'frConsultaProdutoMdi'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grPadrao: TDBGrid
    Width = 713
    Height = 265
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODPROD'
        Title.Caption = 'C'#243'digo Produto'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODCAT'
        Title.Caption = 'C'#243'digo Categoria'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEPROD'
        Title.Caption = 'Nome Produto'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDPRECOUNIPROD'
        Title.Caption = 'Pre'#231'o Unit'#225'rio'
        Width = 112
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
    DataSet = dmAcademiaSci.cdsProduto
    Left = 752
  end
end
