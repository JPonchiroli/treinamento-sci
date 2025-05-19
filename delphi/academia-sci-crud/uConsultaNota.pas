unit uConsultaNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, ExtCtrls;

type
  TfrConsultaNota = class(TForm)
    dsNota: TDataSource;
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
  frConsultaNota: TfrConsultaNota;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

end.
