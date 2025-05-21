inherited frConsultaNotaMdi: TfrConsultaNotaMdi
  Width = 927
  Caption = 'frConsultaNotaMdi'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tbFerramentas: TToolBar
    Width = 911
  end
  inherited grPadrao: TDBGrid
    Width = 769
    Height = 321
    Columns = <
      item
        Expanded = False
        FieldName = 'BDNUMNOTA'
        Title.Caption = 'N'#250'mero Nota'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODCLI'
        Title.Caption = 'C'#243'digo Cliente'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODLOJ'
        Title.Caption = 'C'#243'digo Loja'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDDATAEMISSAONOTA'
        Title.Caption = 'Data Emiss'#227'o'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDSTATUSNOTA'
        Title.Caption = 'Status'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDDESCCANCELAMENTO'
        Title.Caption = 'Descri'#231#227'o Cancelamento'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDDATACANCELAMENTO'
        Title.Caption = 'Data Cancelamento'
        Width = 119
        Visible = True
      end>
  end
  inherited imImages: TImageList
    Left = 872
    Top = 96
  end
  inherited imHotImages: TImageList
    Left = 872
    Top = 136
  end
  inherited imDisableImages: TImageList
    Left = 872
    Top = 176
  end
  inherited dsPadrao: TDataSource
    DataSet = dmAcademiaSci.cdsNota
    Left = 872
  end
end
