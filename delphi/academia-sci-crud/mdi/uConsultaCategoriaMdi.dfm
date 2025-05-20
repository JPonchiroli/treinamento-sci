inherited frConsultaCategoriaMdi: TfrConsultaCategoriaMdi
  Caption = 'frConsultaCategoriaMdi'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grPadrao: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODCAT'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMECAT'
        Title.Caption = 'Nome Categoria'
        Width = 115
        Visible = True
      end>
  end
  inherited dsPadrao: TDataSource
    DataSet = dmAcademiaSci.cdsCategoria
  end
end
