unit uCadastroEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, ImgList, ComCtrls, ToolWin, DBClient,
  uEditNumerico;

type
  TfrCadastroEtapa = class(TfrCadastroPadrao)
    lCodigoPessoa: TLabel;
    lNumeroEtapa: TLabel;
    lCodigoEspacoCafe: TLabel;
    lCodigoSala: TLabel;
    cmNumeroEtapa: TComboBox;
    enCodigoPessoa: TEditNumerico;
    enCodigoSala: TEditNumerico;
    enCodigoEspacoCafe: TEditNumerico;
    eNomePessoa: TEdit;
    lNomePessoa: TLabel;
    eSobrenomePessoa: TEdit;
    lSobrenomePessoa: TLabel;
    lNomeSala: TLabel;
    lSituacaoAtualSala: TLabel;
    eNomeSala: TEdit;
    eSituacaoSala: TEdit;
    lNomeEspacoCafe: TLabel;
    lSituacaoEspacoCafe: TLabel;
    eNomeEspacoCafe: TEdit;
    eSituacaoEspacoCafe: TEdit;
    lCodigoEtapa: TLabel;
    enCodigoEtapa: TEditNumerico;
    procedure enCodigoPessoaExit(Sender: TObject);
    procedure enCodigoSalaExit(Sender: TObject);
    procedure enCodigoEspacoCafeExit(Sender: TObject);
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
    function ConsultarEtapa: Boolean;
    function ValidaCamposZerados: Boolean;
  end;

var
  frCadastroEtapa: TfrCadastroEtapa;

implementation

uses uConsultaEtapa, uSimples, DateUtils, uDmProjeto;

{$R *.dfm}


{ TfrCadastroEtapa }

function TfrCadastroEtapa.Consultar: TForm;
begin
  Result := TfrConsultaEtapa.Create(enCodigoEtapa);
end;

procedure TfrCadastroEtapa.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODETAPA').AsInteger := enCodigoEtapa.Codigo;
  Tabela.FieldByName('BDNUMETAPA').AsInteger := StrToIntDef(cmNumeroEtapa.Text, 0);
  Tabela.FieldByName('BDCODPESSOA').AsInteger := enCodigoPessoa.Codigo;
  Tabela.FieldByName('BDCODSALA').AsInteger := enCodigoSala.Codigo;
  Tabela.FieldByName('BDCODESPACOCAFE').AsInteger := enCodigoEspacoCafe.Codigo;
end;

function TfrCadastroEtapa.setEditCodigo: TEdit;
begin
  Result := enCodigoEtapa;
end;

function TfrCadastroEtapa.setIndice: string;
begin
  Result := 'BDCODETAPA';
end;

function TfrCadastroEtapa.setTabela: TClientDataSet;
begin
  Result := dmProjeto.cdsEtapa;
end;

procedure TfrCadastroEtapa.Carregar;
begin
  inherited;
  enCodigoPessoa.Codigo := Tabela.FieldByName('BDCODPESSOA').AsInteger;
  enCodigoSala.Codigo := Tabela.FieldByName('BDCODSALA').AsInteger;
  enCodigoEspacoCafe.Codigo := Tabela.FieldByName('BDCODESPACOCAFE').AsInteger;
  cmNumeroEtapa.ItemIndex := Tabela.FieldByName('BDNUMETAPA').AsInteger - 1;
end;

procedure TfrCadastroEtapa.enCodigoPessoaExit(Sender: TObject);
begin
    if not dmProjeto.SQLConnection.Connected then
      dmProjeto.SQLConnection.Connected := True;

    dmProjeto.qConsultaPessoa.Close;
    dmProjeto.qConsultaPessoa.SQL.Clear;

    dmProjeto.qConsultaPessoa.SQL.Add(
      'select bdnomepessoa, bdsobrenomepessoa ' +
      'from tpessoa ' +
      'where bdcodpessoa = :bdcodpessoa ');

    dmProjeto.qConsultaPessoa.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa.Codigo;
    dmProjeto.qConsultaPessoa.Open;

    if not dmProjeto.qConsultaPessoa.IsEmpty then
    begin
      eNomePessoa.Text := dmProjeto.qConsultaPessoa.FieldByName('bdnomepessoa').AsString;
      eSobrenomePessoa.Text := dmProjeto.qConsultaPessoa.FieldByName('bdsobrenomepessoa').AsString;
    end
    else
    begin
      ShowMessage('A pessoa escolhida não existe, favor escolher outra pessoa');
      eNomePessoa.Text := 'Não existe';
      eSobrenomePessoa.Text := 'Não existe';
      enCodigoPessoa.SetFocus;
    end;
end;

procedure TfrCadastroEtapa.enCodigoSalaExit(Sender: TObject);
var
  wLotacaoAtualSala, wLotacaoMaximaSala: Integer;
begin
    if not dmProjeto.SQLConnection.Connected then
      dmProjeto.SQLConnection.Connected := True;

    dmProjeto.qConsultaSala.Close;
    dmProjeto.qConsultaSala.SQL.Clear;

    dmProjeto.qConsultaSala.SQL.Add(
      'select bdnomesala, bdlotacaoatualsala, bdlotacaomaximasala ' +
      'from tsala ' +
      'where bdcodsala = :bdcodsala ');

    dmProjeto.qConsultaSala.ParamByName('bdcodsala').AsInteger := enCodigoSala.Codigo;
    dmProjeto.qConsultaSala.Open;

    if not dmProjeto.qConsultaSala.IsEmpty then
    begin
      eNomeSala.Text := dmProjeto.qConsultaSala.FieldByName('bdnomesala').AsString;
      wLotacaoAtualSala := dmProjeto.qConsultaSala.FieldByName('bdlotacaoatualsala').AsInteger;
      wLotacaoMaximaSala := dmProjeto.qConsultaSala.FieldByName('bdlotacaomaximasala').AsInteger;

      if wLotacaoAtualSala >= wLotacaoMaximaSala then
      begin
        eSituacaoSala.Text := 'Não há vagas';
        ShowMessage('A sala escolhida está cheia, favor escolher outra sala');
        enCodigoSala.SetFocus;
      end
      else
        eSituacaoSala.Text := 'Há vagas';
      
    end
    else
    begin
      ShowMessage('A sala escolhida não existe, favor escolher outra sala');
      eNomeSala.Text := 'Não existe';
      eSituacaoSala.Text := 'Não existe';
      enCodigoSala.SetFocus;
    end;
end;

procedure TfrCadastroEtapa.enCodigoEspacoCafeExit(Sender: TObject);
var
  wLotacaoAtualEspacoCafe, wLotacaoMaximaEspacoCafe: Integer;
begin
    if not dmProjeto.SQLConnection.Connected then
      dmProjeto.SQLConnection.Connected := True;

    dmProjeto.qConsultaEspacoCafe.Close;
    dmProjeto.qConsultaEspacoCafe.SQL.Clear;

    dmProjeto.qConsultaEspacoCafe.SQL.Add(
      'select bdnomeespacocafe, bdlotacaoatualespacocafe, bdlotacaomaximaespacocafe ' +
      'from tespacocafe ' +
      'where bdcodespacocafe = :bdcodespacocafe ');

    dmProjeto.qConsultaEspacoCafe.ParamByName('bdcodespacocafe').AsInteger := enCodigoEspacoCafe.Codigo;
    dmProjeto.qConsultaEspacoCafe.Open;

    if not dmProjeto.qConsultaEspacoCafe.IsEmpty then
    begin
      eNomeEspacoCafe.Text := dmProjeto.qConsultaEspacoCafe.FieldByName('bdnomeespacocafe').AsString;
      wLotacaoAtualEspacoCafe := dmProjeto.qConsultaEspacoCafe.FieldByName('bdlotacaoatualespacocafe').AsInteger;
      wLotacaoMaximaEspacoCafe := dmProjeto.qConsultaEspacoCafe.FieldByName('bdlotacaomaximaespacocafe').AsInteger;

      if wLotacaoAtualEspacoCafe >= wLotacaoMaximaEspacoCafe then
      begin
        eSituacaoEspacoCafe.Text := 'Não há vagas';
        ShowMessage('O espaço para café escolhido está cheio, favor escolher outro espaço');
        enCodigoEspacoCafe.SetFocus;
      end
      else
        eSituacaoEspacoCafe.Text := 'Há vagas';

    end
    else
    begin
      ShowMessage('O espaço para café escolhido não existe, favor escolher outro espaço');
      eNomeEspacoCafe.Text := 'Não existe';
      eSituacaoEspacoCafe.Text := 'Não existe';
      enCodigoEspacoCafe.SetFocus;
    end;
end;


function TfrCadastroEtapa.Validar: Boolean;
var
  wEtapasCadastradas, wJaEtapa1, wJaEtapa2: Integer;
begin
  if not dmProjeto.SQLConnection.Connected then
    dmProjeto.SQLConnection.Connected := True;

  dmProjeto.qConsultaEtapa.Close;
  dmProjeto.qConsultaEtapa.SQL.Clear;

  dmProjeto.qConsultaEtapa.SQL.Add(
    'select ' +
    'bdcodpessoa, ' +
    'count(distinct bdnumetapa) as etapas_cadastradas, ' +
    'max(case when bdnumetapa = 1 then 1 else 0 end) AS ja_etapa_1, ' +
    'max(case when bdnumetapa = 2 then 1 else 0 end) AS ja_etapa_2 ' +
    'from tetapa ' +
    'where bdcodpessoa = :bdcodpessoa ' +
    'group by bdcodpessoa ');

  dmProjeto.qConsultaEtapa.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa.Codigo;
  dmProjeto.qConsultaEtapa.Open;

  if not dmProjeto.qConsultaEtapa.IsEmpty then
  begin
    wEtapasCadastradas := dmProjeto.qConsultaEtapa.FieldByName('etapas_cadastradas').AsInteger;
    wJaEtapa1 := dmProjeto.qConsultaEtapa.FieldByName('ja_etapa_1').AsInteger;
    wJaEtapa2 := dmProjeto.qConsultaEtapa.FieldByName('ja_etapa_2').AsInteger;

    if wEtapasCadastradas = 2 then
    begin
      ShowMessage('A pessoa inserida já está cadastrada em duas etapas, escolha outra pessoa');
      Result := false;
    end else if (wJaEtapa1 = 1) and (cmNumeroEtapa.Text = IntToStr(1)) then
    begin
      ShowMessage('A pessoa inserida já está cadastrada na etapa 1, escolha outra etapa');
      Result := false;
    end else if (wJaEtapa2 = 1) and (cmNumeroEtapa.Text = IntToStr(2)) then
    begin
      ShowMessage('A pessoa inserida já está cadastrada na etapa 2, escolha outra etapa');
      Result := false;
    end else
      Result := true;
  end else if not ValidaCamposZerados then
  begin
    ShowMessage('Erro de inserção, o cadastro possui campos vazios');
    Result := false;
  end
  else
    Result := true;
end;


function TfrCadastroEtapa.ConsultarEtapa: Boolean;
var
  wCodigoEtapa: Integer;
begin
  if not dmProjeto.SQLConnection.Connected then
    dmProjeto.SQLConnection.Connected := True;

  if dmProjeto.cdsConsultaEtapa.Active then
    dmProjeto.cdsConsultaEtapa.Close;

  dmProjeto.cdsConsultaEtapa.Close;
  dmProjeto.qConsultaEtapa.SQL.Clear;

  dmProjeto.qConsultaEtapa.SQL.Add(
  'select bdcodetapa ' +
  'from tetapa ' +
  'where bdcodetapa = :bdcodetapa ');

  dmProjeto.qConsultaEtapa.ParamByName('bdcodetapa').AsInteger := enCodigoEtapa.Codigo;
  dmProjeto.cdsConsultaEtapa.Open;
  wCodigoEtapa := dmProjeto.cdsConsultaEtapa.FieldByName('bdcodetapa').AsInteger;

  if wCodigoEtapa > 0 then
    Result := true
  else
    Result := false;
end;

procedure TfrCadastroEtapa.tbExcluirClick(Sender: TObject);
begin
  if not ConsultarEtapa then
    ShowMessage('Etapa não cadastrada, favor escolher outra etapa')
  else
    inherited;
end;

function TfrCadastroEtapa.ValidaCamposZerados: Boolean;
begin

  if (cmNumeroEtapa.ItemIndex <> 0) and (cmNumeroEtapa.ItemIndex <> 1) then
    Result := false
  else
  begin
    if (enCodigoPessoa.Codigo = 0) or
       (enCodigoSala.Codigo = 0) or
       (enCodigoEspacoCafe.Codigo = 0) then
      Result := false
    else
      Result := true;
  end
end;

end.
