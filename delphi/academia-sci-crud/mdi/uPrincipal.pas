unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, uEditNumerico;

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
    procedure Nota1Click(Sender: TObject);
    procedure NotaItem1Click(Sender: TObject);
    procedure Simples1Click(Sender: TObject);
    procedure Loja1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation


uses uSimples, uCadastroCategoriaMdi, uCadastroClienteMdi,
     uCadastroLojaMdi, uCadastroProdutoMdi, uCadastroNotaMdi,
  uCadastroNotaItemMdi;

{$R *.dfm}

procedure TfrPrincipal.Categoria1Click(Sender: TObject);
begin
  TfrCadastroCategoriaMdi.Create(Self);
end;

procedure TfrPrincipal.Produto1Click(Sender: TObject);
begin
  TfrCadastroProdutoMdi.Create(Self);
end;

procedure TfrPrincipal.Cliente1Click(Sender: TObject);
begin
  TfrCadastroClienteMdi.Create(Self);
end;

procedure TfrPrincipal.Nota1Click(Sender: TObject);
begin
  TfrCadastroNotaMdi.Create(Self);
end;

procedure TfrPrincipal.NotaItem1Click(Sender: TObject);
begin
  TfrCadastroNotaItemMdi.Create(Self);
end;

procedure TfrPrincipal.Simples1Click(Sender: TObject);
begin
  TfrSimples.Create(Self);
end;

procedure TfrPrincipal.Loja1Click(Sender: TObject);
begin
  TfrCadastroLojaMdi.Create(Self);
end;

end.
