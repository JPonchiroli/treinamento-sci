unit uCadastroEspacoCafe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, ImgList, ComCtrls, ToolWin, DBClient, StdCtrls,
  uEditNumerico;

type
  TfrCadastroEspacoCafe = class(TfrCadastroPadrao)
    edNomeEspacoCafe_Edit: TEdit;
    enLotacaoMaximaEspacoCafe_EditNumerico: TEditNumerico;
    lbNomeEspacoCafe_Label: TLabel;
    lbLotacaoMaximaEspacoCafe_Label: TLabel;
    lbCodigoEspacoCafe_Label: TLabel;
    enCodigoEspacoCafe_EditNumerico: TEditNumerico;
    procedure tbExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    function ConsultarEspacoCafe: Boolean;
    function ConsultarChaveEstrangeira: Boolean;
  end;

var
  frCadastroEspacoCafe: TfrCadastroEspacoCafe;

implementation

uses uConsultaEspacoCafe, uDmProjeto;

{$R *.dfm}

{ TfrCadastroEspacoCafe }

procedure TfrCadastroEspacoCafe.Carregar;
begin
  inherited;
  edNomeEspacoCafe_Edit.Text :=  Tabela.FieldByName('BDNOMEESPACOCAFE').AsString;
  enLotacaoMaximaEspacoCafe_EditNumerico.Text := Tabela.FieldByName('BDLOTACAOMAXIMAESPACOCAFE').AsString;
end;

function TfrCadastroEspacoCafe.Consultar: TForm;
begin
  Result := TfrConsultaEspacoCafe.Create(enCodigoEspacoCafe_EditNumerico);
end;

function TfrCadastroEspacoCafe.ConsultarEspacoCafe: Boolean;
var
  wCodigoEspaco: Integer;
begin
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.cdsConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
  'select bdcodespacocafe ' +
  'from tespacocafe ' +
  'where bdcodespacocafe = :bdcodespacocafe ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodespacocafe').AsInteger := enCodigoEspacoCafe_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  wCodigoEspaco := dmProjeto_DataModule.cdsConsulta.FieldByName('bdcodespacocafe').AsInteger;

  if wCodigoEspaco > 0 then
    Result := true
  else
    Result := false;
end;

procedure TfrCadastroEspacoCafe.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODESPACOCAFE').AsInteger := enCodigoEspacoCafe_EditNumerico.Codigo;
  Tabela.FieldByName('BDNOMEESPACOCAFE').AsString := edNomeEspacoCafe_Edit.Text;
  Tabela.FieldByName('BDLOTACAOMAXIMAESPACOCAFE').AsInteger := enLotacaoMaximaEspacoCafe_EditNumerico.Codigo;
end;

function TfrCadastroEspacoCafe.setEditCodigo: TEdit;
begin
  Result := enCodigoEspacoCafe_EditNumerico;
end;

function TfrCadastroEspacoCafe.setIndice: string;
begin
  Result := 'BDCODESPACOCAFE';
end;

function TfrCadastroEspacoCafe.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsEspacoCafe;
end;

function TfrCadastroEspacoCafe.Validar: Boolean;
begin
  if (edNomeEspacoCafe_Edit.Text = EmptyStr) or
     (enLotacaoMaximaEspacoCafe_EditNumerico.Text = EmptyStr) then
  begin
    ShowMessage('Erro de Inserção. O cadastro possui campos vazios');
    Result := false;
  end else
  begin
    Result := true;
  end;
end;

procedure TfrCadastroEspacoCafe.tbExcluirClick(Sender: TObject);
begin
  if not ConsultarEspacoCafe then
    ShowMessage('Espaço de café não cadastrado, favor escolher outro espaço')
  else if not ConsultarChaveEstrangeira then
    ShowMessage('Espaço de café já cadastrado em uma etapa, favor escolher outro espaço')
  else
    inherited;
end;

function TfrCadastroEspacoCafe.ConsultarChaveEstrangeira: Boolean;
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
  'select bdcodespacocafe ' +
  'from tetapa ' +
  'where bdcodespacocafe = :bdcodespacocafe ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodespacocafe').AsInteger := enCodigoEspacoCafe_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  wChaveEstrangeira := dmProjeto_DataModule.cdsConsulta.FieldByName('bdcodespacocafe').AsInteger;

  if wChaveEstrangeira > 0 then
    Result := false
  else
    Result := true;
end;

procedure TfrCadastroEspacoCafe.FormCreate(Sender: TObject);
begin
  inherited;
  dmProjeto_DataModule.cdsEspacoCafe.Refresh
end;

end.
