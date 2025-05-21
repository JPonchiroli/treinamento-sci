unit uConsultaNotaItemMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaNotaItemMdi = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaNotaItemMdi: TfrConsultaNotaItemMdi;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

{ TfrConsultaNotaItemMdi }

function TfrConsultaNotaItemMdi.setChave: String;
begin
  Result := 'BDCODPROD';
end;

function TfrConsultaNotaItemMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsNotaItem;
end;

end.
