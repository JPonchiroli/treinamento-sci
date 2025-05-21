unit uCadastroLojaMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, ImgList, ComCtrls, ToolWin, DBClient,
  uEditNumerico;

type
  TfrCadastroLojaMdi = class(TfrCadastroPadrao)
    lCodigoLoja: TLabel;
    lRazaoSocialLoja: TLabel;
    lCnpjLoja: TLabel;
    lEnderecoLoja: TLabel;
    lTelefone: TLabel;
    eRazaoSocialLoja: TEdit;
    eCnpjLoja: TEdit;
    eEnderecoLoja: TEdit;
    eTelefoneLoja: TEdit;
    eCodigoLoja: TEditNumerico;
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setIndice: string; override;
    function setEditCodigo: TEdit; override;
    procedure Salvar; override;
    function Consultar: TForm; override;
    procedure Carregar; override;
  end;

var
  frCadastroLojaMdi: TfrCadastroLojaMdi;

implementation

uses uDmAcademiaSci, uConsultaLojaMdi;

{$R *.dfm}

{ TfrCadastroLojaMdi }

procedure TfrCadastroLojaMdi.Carregar;
begin
  inherited;
  eCodigoLoja.Text := Tabela.FieldByName('BDCODLOJ').AsString;
  eRazaoSocialLoja.Text := Tabela.FieldByName('BDRAZAOSOCIALLOJ').AsString;
  eCnpjLoja.Text := Tabela.FieldByName('BDCNPJLOJ').AsString;
  eEnderecoLoja.Text := Tabela.FieldByName('BDENDERECOLOJ').AsString;
  eTelefoneLoja.Text := Tabela.FieldByName('BDFONELOJ').AsString;
end;

function TfrCadastroLojaMdi.Consultar: TForm;
begin
  Result := TfrConsultaLojaMdi.Create(eCodigoLoja);
end;

procedure TfrCadastroLojaMdi.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODLOJ').AsInteger := eCodigoLoja.Codigo;
  Tabela.FieldByName('BDRAZAOSOCIALLOJ').AsString := eRazaoSocialLoja.Text;
  Tabela.FieldByName('BDCNPJLOJ').AsString := eCnpjLoja.Text;
  Tabela.FieldByName('BDENDERECOLOJ').AsString := eEnderecoLoja.Text;
  Tabela.FieldByName('BDFONELOJ').AsString := eTelefoneLoja.Text;

  ShowMessage('Loja Criada com Sucesso!');
end;

function TfrCadastroLojaMdi.setEditCodigo: TEdit;
begin
  Result := eCodigoLoja;
end;

function TfrCadastroLojaMdi.setIndice: string;
begin
  Result := 'BDCODLOJ'
end;

function TfrCadastroLojaMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsLoja;
end;

end.
