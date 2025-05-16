unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrPrincipal = class(TForm)
    bProduto: TButton;
    procedure bProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation


uses uCadastroTeste;

{$R *.dfm}

procedure TfrPrincipal.bProdutoClick(Sender: TObject);
begin
  frCadastroProdutoTeste := TfrCadastroProdutoTeste.Create(Self);
  frCadastroProdutoTeste.ShowModal;
  FreeAndNil(frCadastroProdutoTeste);
end;

end.
