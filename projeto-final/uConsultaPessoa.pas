unit uConsultaPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaPessoa = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaPessoa: TfrConsultaPessoa;

implementation

uses uDmProjeto;

{$R *.dfm}

{ TfrConsultaPessoa }

function TfrConsultaPessoa.setChave: String;
begin
  Result := 'BDDCODPESSOA';
end;

function TfrConsultaPessoa.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsPessoa;
end;

end.
