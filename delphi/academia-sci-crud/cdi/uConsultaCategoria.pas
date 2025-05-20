unit uConsultaCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, ExtCtrls;

type
  TfrConsultaCategoria = class(TForm)
    dsCategoria: TDataSource;
    DBGrid1: TDBGrid;
    pPainel: TPanel;
    bOk: TButton;
    bCancelar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frConsultaCategoria: TfrConsultaCategoria;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

end.
