unit uConsultaNotaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB;

type
  TfrConsultaNotaItem = class(TForm)
    dsNotaItem: TDataSource;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frConsultaNotaItem: TfrConsultaNotaItem;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

end.
