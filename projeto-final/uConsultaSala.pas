unit uConsultaSala;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaSala = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaSala: TfrConsultaSala;

implementation

uses uDmProjeto;

{$R *.dfm}

{ TfrConsultaSala }

function TfrConsultaSala.setChave: String;
begin
  Result := 'BDCODSALA';
end;

function TfrConsultaSala.setTabela: TClientDataSet;
begin
  Result := dmProjeto.cdsSala;
end;

end.
