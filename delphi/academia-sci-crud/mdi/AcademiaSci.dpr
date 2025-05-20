program AcademiaSci;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  uDmAcademiaSci in 'uDmAcademiaSci.pas' {dmAcademiaSci: TDataModule},
  uCadastroTeste in 'uCadastroTeste.pas' {frCadastroProdutoTeste},
  uConsultaProduto in 'uConsultaProduto.pas' {frConsultaProduto},
  uConsultaCliente in 'uConsultaCliente.pas' {frConsultaCliente},
  uCadastroLoja in 'uCadastroLoja.pas' {frCadastroLoja},
  uConsultaLoja in 'uConsultaLoja.pas' {frConsultaLoja},
  uConsultaNota in 'uConsultaNota.pas' {frConsultaNota},
  uCadastroNota in 'uCadastroNota.pas' {frCadastroNota},
  uCancelamentoNota in 'uCancelamentoNota.pas' {frCancelamentoNota},
  uCadastroNotaItem in 'uCadastroNotaItem.pas' {frCadastroNotaItem},
  uConsultaNotaItem in 'uConsultaNotaItem.pas' {frConsultaNotaItem},
  uSimples in 'uSimples.pas' {frSimples},
  uCadastroPadrao in 'uCadastroPadrao.pas' {frCadastroPadrao},
  uCadastroCategoriaMdi in 'uCadastroCategoriaMdi.pas' {frCadastroCategoriaMdi},
  uCadastroClienteMdi in 'uCadastroClienteMdi.pas' {frCadastroClienteMdi},
  uConsultaPadraoMdi in 'uConsultaPadraoMdi.pas' {frConsultaPadraoMdi},
  uConsultaCategoriaMdi in 'uConsultaCategoriaMdi.pas' {frConsultaCategoriaMdi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Academia SCI';
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.CreateForm(TdmAcademiaSci, dmAcademiaSci);
  Application.Run;
end.
