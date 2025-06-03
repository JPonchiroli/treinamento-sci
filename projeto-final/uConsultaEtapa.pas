unit uConsultaEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaEtapa = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaEtapa: TfrConsultaEtapa;

implementation

uses uDmProjeto;

{$R *.dfm}

{ TfrConsultaEtapa }

function TfrConsultaEtapa.setChave: String;
begin
  Result := 'BDCODETAPA';
end;

function TfrConsultaEtapa.setTabela: TClientDataSet;
begin
  Result := dmProjeto.cdsEtapa;
end;

end.
