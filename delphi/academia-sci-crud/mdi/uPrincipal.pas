unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TfrPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Categoria1: TMenuItem;
    Produto1: TMenuItem;
    Cliente1: TMenuItem;
    Loja1: TMenuItem;
    Nota1: TMenuItem;
    NotaItem1: TMenuItem;
    Simples1: TMenuItem;
    procedure Categoria1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Loja1Click(Sender: TObject);
    procedure Nota1Click(Sender: TObject);
    procedure NotaItem1Click(Sender: TObject);
    procedure Simples1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation


uses uCadastroTeste, uCadastroLoja,
  uCadastroNota, uCadastroNotaItem, uSimples, uCadastroCategoriaMdi,
  uCadastroClienteMdi;

{$R *.dfm}

procedure TfrPrincipal.Categoria1Click(Sender: TObject);
begin
  TfrCadastroCategoriaMdi.Create(Self);
end;

procedure TfrPrincipal.Produto1Click(Sender: TObject);
begin
  frCadastroProdutoTeste := TfrCadastroProdutoTeste.Create(Self);
  frCadastroProdutoTeste.ShowModal;
  FreeAndNil(frCadastroProdutoTeste);
end;

procedure TfrPrincipal.Cliente1Click(Sender: TObject);
begin
  TfrCadastroClienteMdi.Create(Self);
end;

procedure TfrPrincipal.Loja1Click(Sender: TObject);
begin
  frCadastroLoja := TfrCadastroLoja.Create(Self);
  frCadastroLoja.ShowModal;
  FreeAndNil(frCadastroLoja);
end;

procedure TfrPrincipal.Nota1Click(Sender: TObject);
begin
  frCadastroNota := TfrCadastroNota.Create(Self);
  frCadastroNota.ShowModal;
  FreeAndNil(frCadastroNota);
end;

procedure TfrPrincipal.NotaItem1Click(Sender: TObject);
begin
  frCadastroNotaItem := TfrCadastroNotaItem.Create(Self);
  frCadastroNotaItem.ShowModal;
  FreeAndNil(frCadastroNotaItem);
end;

procedure TfrPrincipal.Simples1Click(Sender: TObject);
begin
  TfrSimples.Create(Self);
end;

end.
