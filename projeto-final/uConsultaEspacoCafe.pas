unit uConsultaEspacoCafe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaEspacoCafe = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaEspacoCafe: TfrConsultaEspacoCafe;

implementation

uses uDmProjeto;

{$R *.dfm}

{ TfrConsultaEspacoCafe }

function TfrConsultaEspacoCafe.setChave: String;
begin
  Result := 'BDCODESPACOCAFE';
end;

function TfrConsultaEspacoCafe.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsEspacoCafe;
end;

end.
