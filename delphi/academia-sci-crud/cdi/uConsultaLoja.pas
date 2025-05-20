unit uConsultaLoja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, ExtCtrls;

type
  TfrConsultaLoja = class(TForm)
    dsLoja: TDataSource;
    DBGrid1: TDBGrid;
    pPainel: TPanel;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frConsultaLoja: TfrConsultaLoja;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

end.
