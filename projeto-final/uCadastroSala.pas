unit uCadastroSala;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, ImgList, ComCtrls, ToolWin, StdCtrls,
  uEditNumerico, DBClient;

type
  TfrCadastroSala = class(TfrCadastroPadrao)
    edNomeSala_Edit: TEdit;
    enLotacaoMaximaSala_EditNumerico: TEditNumerico;
    lbNomeSala_Label: TLabel;
    lbLotacaoMaximaSala_Label: TLabel;
    lbCodigoSala_Label: TLabel;
    enCodigoSala_EditNumerico: TEditNumerico;
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
  edNomeSala_Edit.Text :=  Tabela.FieldByName('BDNOMESALA').AsString;
  enLotacaoMaximaSala_EditNumerico.Text := Tabela.FieldByName('BDLOTACAOMAXIMASALA').AsString;
end;

function TfrCadastroSala.Consultar: TForm;
begin
  Result := TfrConsultaSala.Create(enCodigoSala_EditNumerico);
end;

function TfrCadastroSala.ConsultarSala: Boolean;
var
  wCodigoSala: Integer;
begin
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.cdsConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
  'select bdcodsala ' +
  'from tsala ' +
  'where bdcodsala = :bdcodsala ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodsala').AsInteger := enCodigoSala_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  wCodigoSala := dmProjeto_DataModule.cdsConsulta.FieldByName('bdcodsala').AsInteger;

  if wCodigoSala > 0 then
    Result := true
  else
    Result := false;
end;

procedure TfrCadastroSala.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODSALA').AsInteger := enCodigoSala_EditNumerico.Codigo;
  Tabela.FieldByName('BDNOMESALA').AsString := edNomeSala_Edit.Text;
  Tabela.FieldByName('BDLOTACAOMAXIMASALA').AsInteger := enLotacaoMaximaSala_EditNumerico.Codigo;
end;

function TfrCadastroSala.setEditCodigo: TEdit;
begin
  Result := enCodigoSala_EditNumerico;
end;

function TfrCadastroSala.setIndice: string;
begin
  Result := 'BDCODSALA';
end;

function TfrCadastroSala.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsSala;
end;

function TfrCadastroSala.Validar: Boolean;
begin
  if (edNomeSala_Edit.Text = EmptyStr) or
     (enLotacaoMaximaSala_EditNumerico.Text = EmptyStr) then
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
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.cdsConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
  'select bdcodsala ' +
  'from tetapa ' +
  'where bdcodsala = :bdcodsala ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodsala').AsInteger := enCodigoSala_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  wChaveEstrangeira := dmProjeto_DataModule.cdsConsulta.FieldByName('bdcodsala').AsInteger;

  if wChaveEstrangeira > 0 then
    Result := false
  else
    Result := true;
end;

procedure TfrCadastroSala.FormCreate(Sender: TObject);
begin
  inherited;
  dmProjeto_DataModule.cdsSala.Refresh
end;

end.
