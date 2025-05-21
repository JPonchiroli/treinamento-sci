program AcademiaSci;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  uDmAcademiaSci in 'uDmAcademiaSci.pas' {dmAcademiaSci: TDataModule},
  uSimples in 'uSimples.pas' {frSimples},
  uCadastroPadrao in 'uCadastroPadrao.pas' {frCadastroPadrao},
  uCadastroCategoriaMdi in 'uCadastroCategoriaMdi.pas' {frCadastroCategoriaMdi},
  uCadastroClienteMdi in 'uCadastroClienteMdi.pas' {frCadastroClienteMdi},
  uConsultaPadraoMdi in 'uConsultaPadraoMdi.pas' {frConsultaPadraoMdi},
  uConsultaCategoriaMdi in 'uConsultaCategoriaMdi.pas' {frConsultaCategoriaMdi},
  uConsultaClienteMdi in 'uConsultaClienteMdi.pas' {frConsultaClienteMdi},
  uCadastroLojaMdi in 'uCadastroLojaMdi.pas' {frCadastroLojaMdi},
  uConsultaLojaMdi in 'uConsultaLojaMdi.pas' {frConsultaLojaMdi},
  uCadastroProdutoMdi in 'uCadastroProdutoMdi.pas' {frCadastroProdutoMdi},
  uConsultaProdutoMdi in 'uConsultaProdutoMdi.pas' {frConsultaProdutoMdi},
  uCadastroNotaMdi in 'uCadastroNotaMdi.pas' {frCadastroNotaMdi},
  uConsultaNotaMdi in 'uConsultaNotaMdi.pas' {frConsultaNotaMdi},
  uCancelamentoNotaMdi in 'uCancelamentoNotaMdi.pas' {frCancelamentoNotaMdi},
  uCadastroNotaItemMdi in 'uCadastroNotaItemMdi.pas' {frCadastroNotaItemMdi},
  uConsultaNotaItemMdi in 'uConsultaNotaItemMdi.pas' {frConsultaNotaItemMdi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Academia SCI';
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.CreateForm(TdmAcademiaSci, dmAcademiaSci);
  Application.Run;
end.
