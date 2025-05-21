unit uConsultaLojaMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls, DBClient,
  ToolWin;

type
  TfrConsultaLojaMdi = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaLojaMdi: TfrConsultaLojaMdi;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

{ TfrConsultaLojaMdi }

function TfrConsultaLojaMdi.setChave: String;
begin
  Result := 'BDCODLOJ'
end;

function TfrConsultaLojaMdi.setTabela: TClientDataSet;
begin
   Result := dmAcademiaSci.cdsLoja;
end;

end.
