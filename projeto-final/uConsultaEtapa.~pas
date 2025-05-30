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

uses uDmAcademiaSci;

{$R *.dfm}

{ TfrConsultaEtapa }

function TfrConsultaEtapa.setChave: String;
begin
  Result := 'BDCODPESSOA;BDCODSALA;BDCODESPACOCAFE';
end;

function TfrConsultaEtapa.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsEtapa;
end;

end.
