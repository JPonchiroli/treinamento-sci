program cadastro;

uses
  Forms,
  frCadastro in 'frCadastro.pas' {AcademiaSci},
  uCadastroPadrao in 'uCadastroPadrao.pas' {frCadastroPadrao},
  uCadastroTeste in 'uCadastroTeste.pas' {frCadastroTeste};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAcademiaSci, AcademiaSci);
  Application.CreateForm(TfrCadastroTeste, frCadastroTeste);
  Application.Run;
end.
