unit uCadastroPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, ImgList, ComCtrls, ToolWin, DBClient,
  uEditNumerico;

type
  TfrCadastroPessoa = class(TfrCadastroPadrao)
    eNomePessoa: TEdit;
    eSobrenomePessoa: TEdit;
    lNomePessoa: TLabel;
    lSobrenomePessoa: TLabel;
    lCodigoPessoa: TLabel;
    enCodigoPessoa: TEditNumerico;
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
  eNomePessoa.Text := Tabela.FieldByName('BDNOMEPESSOA').AsString;
  eSobrenomePessoa.Text := Tabela.FieldByName('BDSOBRENOMEPESSOA').AsString;
end;

function TfrCadastroPessoa.Consultar: TForm;
begin
  Result := TfrConsultaPessoa.Create(enCodigoPessoa);
end;

function TfrCadastroPessoa.ConsultarPessoa: Boolean;
var
  wCodigoPessoa: Integer;
begin
  if not dmProjeto.SQLConnection.Connected then
    dmProjeto.SQLConnection.Connected := True;

  if dmProjeto.cdsConsultaPessoa.Active then
    dmProjeto.cdsConsultaPessoa.Close;

  dmProjeto.cdsConsultaPessoa.Close;
  dmProjeto.qConsultaPessoa.SQL.Clear;

  dmProjeto.qConsultaPessoa.SQL.Add(
  'select bdcodpessoa ' +
  'from tpessoa ' +
  'where bdcodpessoa = :bdcodpessoa ');

  dmProjeto.qConsultaPessoa.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa.Codigo;
  dmProjeto.cdsConsultaPessoa.Open;
  wCodigoPessoa := dmProjeto.cdsConsultaPessoa.FieldByName('bdcodpessoa').AsInteger;

  if wCodigoPessoa > 0 then
    Result := true
  else
    Result := false;
end;

procedure TfrCadastroPessoa.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODPESSOA').AsInteger := enCodigoPessoa.Codigo;
  Tabela.FieldByName('BDNOMEPESSOA').AsString := eNomePessoa.Text;
  Tabela.FieldByName('BDSOBRENOMEPESSOA').AsString := eSobrenomePessoa.Text;
end;

function TfrCadastroPessoa.setEditCodigo: TEdit;
begin
  Result := enCodigoPessoa
end;

function TfrCadastroPessoa.setIndice: String;
begin
  Result := 'BDCODPESSOA';
end;

function TfrCadastroPessoa.setTabela: TClientDataSet;
begin
  Result := dmProjeto.cdsPessoa;
end;

function TfrCadastroPessoa.Validar: Boolean;
begin
  if (eNomePessoa.Text = EmptyStr) or
     (eSobrenomePessoa.Text = EmptyStr) then
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
  if not dmProjeto.SQLConnection.Connected then
    dmProjeto.SQLConnection.Connected := True;

  if dmProjeto.cdsConsultaPessoa.Active then
    dmProjeto.cdsConsultaPessoa.Close;

  dmProjeto.cdsConsultaPessoa.Close;
  dmProjeto.qConsultaPessoa.SQL.Clear;

  dmProjeto.qConsultaPessoa.SQL.Add(
  'select bdcodpessoa ' +
  'from tetapa ' +
  'where bdcodpessoa = :bdcodpessoa ');

  dmProjeto.qConsultaPessoa.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa.Codigo;
  dmProjeto.cdsConsultaPessoa.Open;
  wChaveEstrangeira := dmProjeto.cdsConsultaPessoa.FieldByName('bdcodpessoa').AsInteger;

  if wChaveEstrangeira > 0 then
    Result := false
  else
    Result := true;
end;

end.
