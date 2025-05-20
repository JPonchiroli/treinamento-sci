object frConsultaNotaItem: TfrConsultaNotaItem
  Left = 192
  Top = 117
  Width = 928
  Height = 480
  Caption = 'frConsultaNotaItem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 649
    Height = 345
    DataSource = dsNotaItem
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODPROD'
        Title.Caption = 'C'#243'digo Produto'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNUMNOTA'
        Title.Caption = 'N'#250'mero Nota'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDQTDVENDIDA'
        Title.Caption = 'Quantidade Vendida'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDVALORUNI'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 91
        Visible = True
      end>
  end
  object dsNotaItem: TDataSource
    DataSet = dmAcademiaSci.cdsNotaItem
    Left = 672
    Top = 32
  end
end
