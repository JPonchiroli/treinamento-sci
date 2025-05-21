unit uCadastroCategoriaMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, ImgList, ComCtrls, ToolWin, StdCtrls, DBClient,
  uEditNumerico;

type
  TfrCadastroCategoriaMdi = class(TfrCadastroPadrao)
    lCodigoProduto: TLabel;
    lNomeProduto: TLabel;
    eNomeCategoria: TEdit;
    eCodigoCategoria: TEditNumerico;
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setIndice: string; override;
    function setEditCodigo: TEdit; override;
    procedure Salvar; override;
    function Consultar: TForm; override;
    procedure Carregar; override;
  end;

var
  frCadastroCategoriaMdi: TfrCadastroCategoriaMdi;

implementation

uses uDmAcademiaSci, uConsultaCategoriaMdi;

{$R *.dfm}

{ TfrCadastroCategoriaMdi }

function TfrCadastroCategoriaMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsCategoria;
end;

function TfrCadastroCategoriaMdi.setIndice: string;
begin
  Result := 'BDCODCAT'
end;

function TfrCadastroCategoriaMdi.setEditCodigo: TEdit;
begin
  Result := eCodigoCategoria;
end;

procedure TfrCadastroCategoriaMdi.Carregar;
begin
  inherited;
  eCodigoCategoria.Text := Tabela.FieldByName('BDCODCAT').AsString;
  eNomeCategoria.Text := Tabela.FieldByName('BDNOMECAT').AsString;
end;

function TfrCadastroCategoriaMdi.Consultar: TForm;
begin
  Result := TfrConsultaCategoriaMdi.Create(eCodigoCategoria);
end;

procedure TfrCadastroCategoriaMdi.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODCAT').AsInteger := eCodigoCategoria.Codigo;
  Tabela.FieldByName('BDNOMECAT').AsString := eNomeCategoria.Text;

  ShowMessage('Categoria Criada com Sucesso!');
end;

end.
