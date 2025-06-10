unit uCadastroPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, ImgList, ComCtrls, ToolWin, DBClient,
  uEditNumerico;

type
  TfrCadastroPessoa = class(TfrCadastroPadrao)
    edNomePessoa_Edit: TEdit;
    edSobrenomePessoa_Edit: TEdit;
    lbNomePessoa_Label: TLabel;
    lbSobrenomePessoa_Label: TLabel;
    lbCodigoPessoa_Label: TLabel;
    enCodigoPessoa_EditNumerico: TEditNumerico;
    procedure tbExcluirClick(Sender: TObject);
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
    function Validar: Boolean; override;
    function ConsultarPessoa: Boolean;
    function ConsultarChaveEstrangeira: Boolean;
  end;

var
  frCadastroPessoa: TfrCadastroPessoa;

implementation

uses uDmProjeto, uConsultaPessoa, Math;

{$R *.dfm}

{ TfrCadastroPessoa }

procedure TfrCadastroPessoa.Carregar;
begin
  inherited;
  edNomePessoa_Edit.Text := Tabela.FieldByName('BDNOMEPESSOA').AsString;
  edSobrenomePessoa_Edit.Text := Tabela.FieldByName('BDSOBRENOMEPESSOA').AsString;
end;

function TfrCadastroPessoa.Consultar: TForm;
begin
  Result := TfrConsultaPessoa.Create(enCodigoPessoa_EditNumerico);
end;

function TfrCadastroPessoa.ConsultarPessoa: Boolean;
var
  wCodigoPessoa: Integer;
begin
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.cdsConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
  'select bdcodpessoa ' +
  'from tpessoa ' +
  'where bdcodpessoa = :bdcodpessoa ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  wCodigoPessoa := dmProjeto_DataModule.cdsConsulta.FieldByName('bdcodpessoa').AsInteger;

  if wCodigoPessoa > 0 then
    Result := true
  else
    Result := false;
end;

procedure TfrCadastroPessoa.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODPESSOA').AsInteger := enCodigoPessoa_EditNumerico.Codigo;
  Tabela.FieldByName('BDNOMEPESSOA').AsString := edNomePessoa_Edit.Text;
  Tabela.FieldByName('BDSOBRENOMEPESSOA').AsString := edSobrenomePessoa_Edit.Text;
end;

function TfrCadastroPessoa.setEditCodigo: TEdit;
begin
  Result := enCodigoPessoa_EditNumerico
end;

function TfrCadastroPessoa.setIndice: String;
begin
  Result := 'BDCODPESSOA';
end;

function TfrCadastroPessoa.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsPessoa;
end;

function TfrCadastroPessoa.Validar: Boolean;
begin
  if (edNomePessoa_Edit.Text = EmptyStr) or
     (edSobrenomePessoa_Edit.Text = EmptyStr) then
  begin
    ShowMessage('Erro de Inserção. O cadastro possui campos vazios');
    Result := false;
  end else
  begin
    Result := true;
  end;
end;

procedure TfrCadastroPessoa.tbExcluirClick(Sender: TObject);
begin
  if not ConsultarPessoa then
    ShowMessage('Pessoa não cadastrada, favor escolher outra pessoa')
  else if not ConsultarChaveEstrangeira then
    ShowMessage('Pessoa já cadastrada em uma etapa, favor escolher outra pessoa')
  else
    inherited;
end;

function TfrCadastroPessoa.ConsultarChaveEstrangeira: Boolean;
var
  wChaveEstrangeira: Integer;
begin
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.cdsConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
  'select bdcodpessoa ' +
  'from tetapa ' +
  'where bdcodpessoa = :bdcodpessoa ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  wChaveEstrangeira := dmProjeto_DataModule.cdsConsulta.FieldByName('bdcodpessoa').AsInteger;

  if wChaveEstrangeira > 0 then
    Result := false
  else
    Result := true;
end;

end.
