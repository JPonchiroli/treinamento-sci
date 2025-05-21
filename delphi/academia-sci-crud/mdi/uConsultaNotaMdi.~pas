unit uConsultaNotaMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaNotaMdi = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
    { Public declarations }
    
  end;

var
  frConsultaNotaMdi: TfrConsultaNotaMdi;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

{ TfrConsultaNotaMdi }

function TfrConsultaNotaMdi.setChave: String;
begin
  Result := 'BDNUMNOTA';
end;

function TfrConsultaNotaMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsNota;
end;

end.
