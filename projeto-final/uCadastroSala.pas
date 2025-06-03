unit uCadastroSala;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, ImgList, ComCtrls, ToolWin, StdCtrls,
  uEditNumerico, DBClient;

type
  TfrCadastroSala = class(TfrCadastroPadrao)
    eNomeSala: TEdit;
    enLotacaoMaximaSala: TEditNumerico;
    enLotacaoAtualSala: TEditNumerico;
    lNomeSala: TLabel;
    lLotacaoMaximaSala: TLabel;
    lLotacaoAtualSala: TLabel;
    lCodigoSala: TLabel;
    enCodigoSala: TEditNumerico;
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
    function ConsultarSala: Boolean;
    function ConsultarChaveEstrangeira: Boolean;
  end;

var
  frCadastroSala: TfrCadastroSala;

implementation

uses uConsultaSala, uDmProjeto;

{$R *.dfm}

{ TfrCadastroSala }

procedure TfrCadastroSala.Carregar;
begin
  inherited;
  eNomeSala.Text :=  Tabela.FieldByName('BDNOMESALA').AsString;
  enLotacaoMaximaSala.Text := Tabela.FieldByName('BDLOTACAOMAXIMASALA').AsString;
  enLotacaoAtualSala.Text := Tabela.FieldByName('BDLOTACAOATUALSALA').AsString;
end;

function TfrCadastroSala.Consultar: TForm;
begin
  Result := TfrConsultaSala.Create(enCodigoSala);
end;

function TfrCadastroSala.ConsultarSala: Boolean;
var
  wCodigoSala: Integer;
begin
  if not dmProjeto.SQLConnection.Connected then
    dmProjeto.SQLConnection.Connected := True;

  if dmProjeto.cdsConsultaSala.Active then
    dmProjeto.cdsConsultaSala.Close;

  dmProjeto.cdsConsultaSala.Close;
  dmProjeto.qConsultaSala.SQL.Clear;

  dmProjeto.qConsultaSala.SQL.Add(
  'select bdcodsala ' +
  'from tsala ' +
  'where bdcodsala = :bdcodsala ');

  dmProjeto.qConsultaSala.ParamByName('bdcodsala').AsInteger := enCodigoSala.Codigo;
  dmProjeto.cdsConsultaSala.Open;
  wCodigoSala := dmProjeto.cdsConsultaSala.FieldByName('bdcodsala').AsInteger;

  if wCodigoSala > 0 then
    Result := true
  else
    Result := false;
end;

procedure TfrCadastroSala.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODSALA').AsInteger := enCodigoSala.Codigo;
  Tabela.FieldByName('BDNOMESALA').AsString := eNomeSala.Text;
  Tabela.FieldByName('BDLOTACAOMAXIMASALA').AsInteger := enLotacaoMaximaSala.Codigo;
  Tabela.FieldByName('BDLOTACAOATUALSALA').AsInteger := enLotacaoAtualSala.Codigo;
end;

function TfrCadastroSala.setEditCodigo: TEdit;
begin
  Result := enCodigoSala;
end;

function TfrCadastroSala.setIndice: string;
begin
  Result := 'BDCODSALA';
end;

function TfrCadastroSala.setTabela: TClientDataSet;
begin
  Result := dmProjeto.cdsSala;
end;

function TfrCadastroSala.Validar: Boolean;
begin
  if (eNomeSala.Text = EmptyStr) or
     (enLotacaoMaximaSala.Text = EmptyStr) or
     (enLotacaoAtualSala.Text = EmptyStr) then
  begin
    ShowMessage('Erro de Inserção. O cadastro possui campos vazios');
    Result := false;
  end else
  begin
    Result := true;
  end;
end;

procedure TfrCadastroSala.tbExcluirClick(Sender: TObject);
begin
  if not ConsultarSala then
    ShowMessage('Sala não cadastrada, favor escolher outra sala')
  else if not ConsultarChaveEstrangeira then
    ShowMessage('Sala já cadastrada em uma etapa, favor escolher outra sala')
  else
    inherited;
end;

function TfrCadastroSala.ConsultarChaveEstrangeira: Boolean;
var
  wChaveEstrangeira: Integer;
begin
  if not dmProjeto.SQLConnection.Connected then
    dmProjeto.SQLConnection.Connected := True;

  if dmProjeto.cdsConsultaSala.Active then
    dmProjeto.cdsConsultaSala.Close;

  dmProjeto.cdsConsultaSala.Close;
  dmProjeto.qConsultaSala.SQL.Clear;

  dmProjeto.qConsultaSala.SQL.Add(
  'select bdcodsala ' +
  'from tetapa ' +
  'where bdcodsala = :bdcodsala ');

  dmProjeto.qConsultaSala.ParamByName('bdcodsala').AsInteger := enCodigoSala.Codigo;
  dmProjeto.cdsConsultaSala.Open;
  wChaveEstrangeira := dmProjeto.cdsConsultaSala.FieldByName('bdcodsala').AsInteger;

  if wChaveEstrangeira > 0 then
    Result := false
  else
    Result := true;
end;

end.
