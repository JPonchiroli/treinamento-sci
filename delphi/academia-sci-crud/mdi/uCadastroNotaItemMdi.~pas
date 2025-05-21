unit uCadastroNotaItemMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, uEditNumerico, ImgList, ComCtrls,
  ToolWin, DBClient;

type
  TfrCadastroNotaItemMdi = class(TfrCadastroPadrao)
    lCodigoProduto: TLabel;
    lNumeroNota: TLabel;
    lQuantidadeVendida: TLabel;
    lPrecoUnitario: TLabel;
    ePrecoUnitario: TEditNumerico;
    eQuantidadeVendida: TEditNumerico;
    eNumeroNota: TEditNumerico;
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
  frCadastroNotaItemMdi: TfrCadastroNotaItemMdi;

implementation

uses uDmAcademiaSci, uConsultaNotaItemMdi;

{$R *.dfm}

{ TfrCadastroNotaItemMdi }

procedure TfrCadastroNotaItemMdi.Carregar;
begin
  inherited;
  eCodigoProduto.Codigo := Tabela.FieldByName('BDCODPROD').AsInteger;
  eNumeroNota.Codigo := Tabela.FieldByName('BDNUMNOTA').AsInteger;
  eQuantidadeVendida.Codigo := Tabela.FieldByName('BDQTDVENDIDA').AsInteger;
  ePrecoUnitario.Codigo := Tabela.FieldByName('BDVALORUNI').AsInteger;
end;

function TfrCadastroNotaItemMdi.Consultar: TForm;
begin
  Result := TfrConsultaNotaItemMdi.Create(eCodigoProduto);
end;

procedure TfrCadastroNotaItemMdi.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODPROD').AsInteger := eCodigoProduto.Codigo;
  Tabela.FieldByName('BDNUMNOTA').AsInteger := eNumeroNota.Codigo;
  Tabela.FieldByName('BDQTDVENDIDA').AsInteger := eQuantidadeVendida.Codigo;
  Tabela.FieldByName('BDVALORUNI').AsInteger := ePrecoUnitario.Codigo;

  ShowMessage('Nota Item Criada com Sucesso');
end;

function TfrCadastroNotaItemMdi.setEditCodigo: TEdit;
begin
  Result := eCodigoProduto;
end;

function TfrCadastroNotaItemMdi.setIndice: string;
begin
  Result := 'BDCODPROD';
end;

function TfrCadastroNotaItemMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsNotaItem;
end;

end.
