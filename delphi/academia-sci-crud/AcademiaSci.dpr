program AcademiaSci;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  uDmAcademiaSci in 'uDmAcademiaSci.pas' {dmAcademiaSci: TDataModule},
  uCadastroTeste in 'uCadastroTeste.pas' {frCadastroProdutoTeste};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Academia SCI';
  Application.CreateForm(TdmAcademiaSci, dmAcademiaSci);
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.CreateForm(TfrCadastroProdutoTeste, frCadastroProdutoTeste);
  Application.Run;
end.
