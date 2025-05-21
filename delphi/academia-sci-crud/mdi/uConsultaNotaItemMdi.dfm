inherited frConsultaNotaItemMdi: TfrConsultaNotaItemMdi
  Caption = 'frConsultaNotaItemMdi'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grPadrao: TDBGrid
    Width = 505
    Height = 217
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODPROD'
        Title.Caption = 'C'#243'digo Produto'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNUMNOTA'
        Title.Caption = 'N'#250'mero Nota'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDQTDVENDIDA'
        Title.Caption = 'Quantidade Vendida'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDVALORUNI'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 83
        Visible = True
      end>
  end
  inherited dsPadrao: TDataSource
    DataSet = dmAcademiaSci.cdsNotaItem
    Left = 552
    Top = 96
  end
end
