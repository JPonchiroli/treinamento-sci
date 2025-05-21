unit uConsultaProdutoMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBCLient;

type
  TfrConsultaProdutoMdi = class(TfrConsultaPadraoMdi)
  private
    { Private declarations }
  public
    { Public declarations }
  function setTabela: TClientDataSet; override;
  function setChave: String; override;end;

var
  frConsultaProdutoMdi: TfrConsultaProdutoMdi;

implementation

uses uDmAcademiaSci, uCadastroCategoriaMdi;

{$R *.dfm}

{ TfrConsultaProdutoMdi }

function TfrConsultaProdutoMdi.setChave: String;
begin
  Result := 'BDCODPROD';
end;

function TfrConsultaProdutoMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsProduto;
end;

end.
