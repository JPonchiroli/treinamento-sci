inherited frConsultaPessoa: TfrConsultaPessoa
  Left = 312
  Top = 192
  Caption = 'Consulta Pessoa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grPadrao_Grid: TDBGrid
    Width = 617
    Height = 155
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODPESSOA'
        Title.Caption = 'C'#243'digo'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEPESSOA'
        Title.Caption = 'Nome'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDSOBRENOMEPESSOA'
        Title.Caption = 'Sobrenome'
        Width = 126
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
