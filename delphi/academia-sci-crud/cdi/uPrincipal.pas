unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrPrincipal = class(TForm)
    bProduto: TButton;
    bCategoria: TButton;
    bCliente: TButton;
    bLoja: TButton;
    bNota: TButton;
    bNotaItem: TButton;
    procedure bProdutoClick(Sender: TObject);
    procedure bCategoriaClick(Sender: TObject);
    procedure bClienteClick(Sender: TObject);
    procedure bLojaClick(Sender: TObject);
    procedure bNotaClick(Sender: TObject);
    procedure bNotaItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation


uses uCadastroTeste, uCadastroCategoria, uCadastroCliente, uCadastroLoja,
  uCadastroNota, uCadastroNotaItem;

{$R *.dfm}

procedure TfrPrincipal.bProdutoClick(Sender: TObject);
begin
  frCadastroProdutoTeste := TfrCadastroProdutoTeste.Create(Self);
  frCadastroProdutoTeste.ShowModal;
  FreeAndNil(frCadastroProdutoTeste);
end;

procedure TfrPrincipal.bCategoriaClick(Sender: TObject);
begin
  frCadastroCategoria := TfrCadastroCategoria.Create(Self);
  frCadastroCategoria.ShowModal;
  FreeAndNil(frCadastroCategoria);
end;

procedure TfrPrincipal.bClienteClick(Sender: TObject);
begin
  frCadastroCliente := TfrCadastroCliente.Create(Self);
  frCadastroCliente.ShowModal;
  FreeAndNil(frCadastroCliente);
end;

procedure TfrPrincipal.bLojaClick(Sender: TObject);
begin
  frCadastroLoja := TfrCadastroLoja.Create(Self);
  frCadastroLoja.ShowModal;
  FreeAndNil(frCadastroLoja);
end;

procedure TfrPrincipal.bNotaClick(Sender: TObject);
begin
  frCadastroNota := TfrCadastroNota.Create(Self);
  frCadastroNota.ShowModal;
  FreeAndNil(frCadastroNota);
end;

procedure TfrPrincipal.bNotaItemClick(Sender: TObject);
begin
  frCadastroNotaItem := TfrCadastroNotaItem.Create(Self);
  frCadastroNotaItem.ShowModal;
  FreeAndNil(frCadastroNotaItem);
end;

end.
