unit uCadastroProdutoMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, ImgList, ComCtrls, ToolWin, StdCtrls, DBClient,
  uEditNumerico;

type
  TfrCadastroProdutoMdi = class(TfrCadastroPadrao)
    lCodigoProduto: TLabel;
    lNomeProduto: TLabel;
    lPrecoUnitarioProduto: TLabel;
    lCodigoCategoria: TLabel;
    eNomeProduto: TEdit;
    ePrecoUnitarioProduto: TEdit;
    eCodigoCategoria: TEdit;
    eCodigoProduto: TEditNumerico;
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
  frCadastroProdutoMdi: TfrCadastroProdutoMdi;

implementation

uses uDmAcademiaSci, uConsultaProdutoMdi;

{$R *.dfm}

{ TfrCadastroProdutoMdi }

procedure TfrCadastroProdutoMdi.Carregar;
begin
  inherited;
  eCodigoProduto.Text := Tabela.FieldByName('BDCODPROD').AsString;
  eCodigoCategoria.Text := Tabela.FieldByName('BDCODCAT').AsString;
  eNomeProduto.Text := Tabela.FieldByName('BDNOMEPROD').AsString;
  ePrecoUnitarioProduto.Text := Tabela.FieldByName('BDPRECOUNIPROD').AsString;
end;

function TfrCadastroProdutoMdi.Consultar: TForm;
begin
  Result := TfrConsultaProdutoMdi.Create(eCodigoProduto);
end;

procedure TfrCadastroProdutoMdi.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODPROD').AsInteger := eCodigoProduto.Codigo;
  Tabela.FieldByName('BDCODCAT').AsInteger := StrToIntDef(eCodigoCategoria.Text, 0);
  Tabela.FieldByName('BDNOMEPROD').AsString := eNomeProduto.Text;
  Tabela.FieldByName('BDPRECOUNIPROD').AsFloat := StrToFloatDef(ePrecoUnitarioProduto.Text, 0);
end;

function TfrCadastroProdutoMdi.setEditCodigo: TEdit;
begin
  Result := eCodigoProduto;
end;

function TfrCadastroProdutoMdi.setIndice: string;
begin
  Result := 'BDCODPROD';
end;

function TfrCadastroProdutoMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsProduto;
end;

end.
