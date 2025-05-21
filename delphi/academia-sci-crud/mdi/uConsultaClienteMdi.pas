unit uConsultaClienteMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls, DBClient,
  ToolWin;

type
  TfrConsultaClienteMdi = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaClienteMdi: TfrConsultaClienteMdi;

implementation

uses uDmAcademiaSci;


{$R *.dfm}


{ TfrConsultaClienteMdi }

function TfrConsultaClienteMdi.setChave: String;
begin
  Result := 'BDCODCLI';
end;

function TfrConsultaClienteMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsCliente;
end;

end.
