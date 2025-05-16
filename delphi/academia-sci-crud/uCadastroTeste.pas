unit uCadastroTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrCadastroProdutoTeste = class(TForm)
    bSalvar: TButton;
    bExcluir: TButton;
    bConsultar: TButton;
    eCodigoProduto: TEdit;
    eNomeProduto: TEdit;
    ePrecoUnitarioProduto: TEdit;
    lPrecoUnitarioProduto: TLabel;
    lCodigoProduto: TLabel;
    lNomeProduto: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroProdutoTeste: TfrCadastroProdutoTeste;

implementation

{$R *.dfm}

end.
