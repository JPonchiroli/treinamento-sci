program AcademiaSci;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  uDmAcademiaSci in 'uDmAcademiaSci.pas' {dmAcademiaSci: TDataModule},
  uCadastroTeste in 'uCadastroTeste.pas' {frCadastroProdutoTeste},
  uCadastroCategoria in 'uCadastroCategoria.pas' {frCadastroCategoria},
  uCadastroCliente in 'uCadastroCliente.pas' {frCadastroCliente},
  uConsultaCategoria in 'uConsultaCategoria.pas' {frConsultaCategoria},
  uConsultaProduto in 'uConsultaProduto.pas' {frConsultaProduto},
  uConsultaCliente in 'uConsultaCliente.pas' {frConsultaCliente},
  uCadastroLoja in 'uCadastroLoja.pas' {frCadastroLoja},
  uConsultaLoja in 'uConsultaLoja.pas' {frConsultaLoja},
  uConsultaNota in 'uConsultaNota.pas' {frConsultaNota},
  uCadastroNota in 'uCadastroNota.pas' {frCadastroNota},
  uCancelamentoNota in 'uCancelamentoNota.pas' {frCancelamentoNota},
  uCadastroNotaItem in 'uCadastroNotaItem.pas' {frCadastroNotaItem},
  uConsultaNotaItem in 'uConsultaNotaItem.pas' {frConsultaNotaItem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Academia SCI';
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.CreateForm(TdmAcademiaSci, dmAcademiaSci);
  Application.CreateForm(TfrConsultaProduto, frConsultaProduto);
  Application.CreateForm(TfrConsultaCliente, frConsultaCliente);
  Application.CreateForm(TfrCadastroLoja, frCadastroLoja);
  Application.CreateForm(TfrConsultaLoja, frConsultaLoja);
  Application.CreateForm(TfrConsultaNota, frConsultaNota);
  Application.CreateForm(TfrCadastroNota, frCadastroNota);
  Application.CreateForm(TfrCancelamentoNota, frCancelamentoNota);
  Application.CreateForm(TfrCadastroNotaItem, frCadastroNotaItem);
  Application.CreateForm(TfrConsultaNotaItem, frConsultaNotaItem);
  Application.Run;
end.
