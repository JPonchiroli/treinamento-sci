program AcademiaSci;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  uSimples in 'uSimples.pas' {frSimples},
  uCadastroPadrao in 'uCadastroPadrao.pas' {frCadastroPadrao},
  uConsultaPadraoMdi in 'uConsultaPadraoMdi.pas' {frConsultaPadraoMdi},
  uConsultaPessoa in 'uConsultaPessoa.pas' {frConsultaPessoa},
  uCadastroPessoa in 'uCadastroPessoa.pas' {frCadastroPessoa},
  uConsultaSala in 'uConsultaSala.pas' {frConsultaSala},
  uCadastroSala in 'uCadastroSala.pas' {frCadastroSala},
  uConsultaEspacoCafe in 'uConsultaEspacoCafe.pas' {frConsultaEspacoCafe},
  uCadastroEspacoCafe in 'uCadastroEspacoCafe.pas' {frCadastroEspacoCafe},
  uConsultaEtapa in 'uConsultaEtapa.pas' {frConsultaEtapa},
  uCadastroEtapa in 'uCadastroEtapa.pas' {frCadastroEtapa},
  uConsultaPessoaJoin in 'uConsultaPessoaJoin.pas' {frConsultaPessoaJoin},
  uConsultaSalaJoin in 'uConsultaSalaJoin.pas' {frConsultaSalaJoin},
  uConsultaEspacoCafeJoin in 'uConsultaEspacoCafeJoin.pas' {frConsultaEspacoCafeJoin},
  uDmProjeto in 'uDmProjeto.pas' {dmProjeto_DataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Projeto Final Academia';
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.CreateForm(TdmProjeto_DataModule, dmProjeto_DataModule);
  Application.Run;
end.
