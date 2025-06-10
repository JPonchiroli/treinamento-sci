unit uCadastroEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, ImgList, ComCtrls, ToolWin, DBClient,
  uEditNumerico;

type
  TfrCadastroEtapa = class(TfrCadastroPadrao)
    lbCodigoPessoa_Label: TLabel;
    lbNumeroEtapa_Label: TLabel;
    lbCodigoEspacoCafe_Label: TLabel;
    lbCodigoSala_Label: TLabel;
    cbNumeroEtapa_ComboBox: TComboBox;
    enCodigoPessoa_EditNumerico: TEditNumerico;
    enCodigoSala_EditNumerico: TEditNumerico;
    enCodigoEspacoCafe_EditNumerico: TEditNumerico;
    edNomePessoa_Edit: TEdit;
    lbNomePessoa_Label: TLabel;
    edSobrenomePessoa_Edit: TEdit;
    lbSobrenomePessoa_Label: TLabel;
    lbNomeSala_Label: TLabel;
    lbSituacaoAtualSala_Label: TLabel;
    edNomeSala_Edit: TEdit;
    edSituacaoSala_Edit: TEdit;
    lbNomeEspacoCafe_Label: TLabel;
    lbSituacaoEspacoCafe_Label: TLabel;
    edNomeEspacoCafe_Edit: TEdit;
    edSituacaoEspacoCafe_Edit: TEdit;
    lbCodigoEtapa_Label: TLabel;
    enCodigoEtapa_EditNumerico: TEditNumerico;
    procedure enCodigoPessoa_EditNumericoExit(Sender: TObject);
    procedure enCodigoSala_EditNumericoExit(Sender: TObject);
    procedure enCodigoEspacoCafe_EditNumericoExit(Sender: TObject);
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
  Result := TfrConsultaEtapa.Create(enCodigoEtapa_EditNumerico);
end;

procedure TfrCadastroEtapa.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODETAPA').AsInteger := enCodigoEtapa_EditNumerico.Codigo;
  Tabela.FieldByName('BDNUMETAPA').AsInteger := cbNumeroEtapa_ComboBox.ItemIndex + 1;
  Tabela.FieldByName('BDCODPESSOA').AsInteger := enCodigoPessoa_EditNumerico.Codigo;
  Tabela.FieldByName('BDCODSALA').AsInteger := enCodigoSala_EditNumerico.Codigo;
  Tabela.FieldByName('BDCODESPACOCAFE').AsInteger := enCodigoEspacoCafe_EditNumerico.Codigo;
end;

function TfrCadastroEtapa.setEditCodigo: TEdit;
begin
  Result := enCodigoEtapa_EditNumerico;
end;

function TfrCadastroEtapa.setIndice: string;
begin
  Result := 'BDCODETAPA';
end;

function TfrCadastroEtapa.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsEtapa;
end;

procedure TfrCadastroEtapa.Carregar;
begin
  inherited;
  enCodigoPessoa_EditNumerico.Codigo := Tabela.FieldByName('BDCODPESSOA').AsInteger;
  enCodigoSala_EditNumerico.Codigo := Tabela.FieldByName('BDCODSALA').AsInteger;
  enCodigoEspacoCafe_EditNumerico.Codigo := Tabela.FieldByName('BDCODESPACOCAFE').AsInteger;
  cbNumeroEtapa_ComboBox.ItemIndex := Tabela.FieldByName('BDNUMETAPA').AsInteger - 1;
end;

procedure TfrCadastroEtapa.enCodigoPessoa_EditNumericoExit(Sender: TObject);
begin
    if not dmProjeto_DataModule.SQLConnection.Connected then
      dmProjeto_DataModule.SQLConnection.Connected := True;

    dmProjeto_DataModule.qConsulta.Close;
    dmProjeto_DataModule.qConsulta.SQL.Clear;

    dmProjeto_DataModule.qConsulta.SQL.Add(
      'select bdnomepessoa, bdsobrenomepessoa ' +
      'from tpessoa ' +
      'where bdcodpessoa = :bdcodpessoa ');

    dmProjeto_DataModule.qConsulta.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa_EditNumerico.Codigo;
    dmProjeto_DataModule.qConsulta.Open;

    if not dmProjeto_DataModule.qConsulta.IsEmpty then
    begin
      edNomePessoa_Edit.Text := dmProjeto_DataModule.qConsulta.FieldByName('bdnomepessoa').AsString;
      edSobrenomePessoa_Edit.Text := dmProjeto_DataModule.qConsulta.FieldByName('bdsobrenomepessoa').AsString;
    end
    else
    begin
      ShowMessage('A pessoa escolhida não existe, favor escolher outra pessoa');
      edNomePessoa_Edit.Text := 'Não existe';
      edSobrenomePessoa_Edit.Text := 'Não existe';
      enCodigoPessoa_EditNumerico.SetFocus;
    end;
end;

procedure TfrCadastroEtapa.enCodigoSala_EditNumericoExit(Sender: TObject);
var
  wLotacaoAtualSala, wLotacaoMaximaSala: Integer;
begin
    if not dmProjeto_DataModule.SQLConnection.Connected then
      dmProjeto_DataModule.SQLConnection.Connected := True;

    dmProjeto_DataModule.qConsulta.Close;
    dmProjeto_DataModule.qConsulta.SQL.Clear;

    dmProjeto_DataModule.qConsulta.SQL.Add(
      'select ' +
        's.bdnomesala, ' +
        's.bdlotacaomaximasala as lotacao_maxima, ' +
        'count(et.bdcodetapa) as total_alocados ' +
      'from tsala s ' +
      'left join tetapa et on (et.bdcodsala = s.bdcodsala) ' +
      'where s.bdcodsala = :bdcodsala ' +
        'group by ' +
          's.bdnomesala, ' +
          's.bdlotacaomaximasala ');

    dmProjeto_DataModule.qConsulta.ParamByName('bdcodsala').AsInteger := enCodigoSala_EditNumerico.Codigo;
    dmProjeto_DataModule.qConsulta.Open;

    if not dmProjeto_DataModule.qConsulta.IsEmpty then
    begin
      edNomeSala_Edit.Text := dmProjeto_DataModule.qConsulta.FieldByName('bdnomesala').AsString;
      wLotacaoAtualSala := dmProjeto_DataModule.qConsulta.FieldByName('total_alocados').AsInteger;
      wLotacaoMaximaSala := dmProjeto_DataModule.qConsulta.FieldByName('lotacao_maxima').AsInteger;

    if wLotacaoAtualSala >= wLotacaoMaximaSala then
      begin
        edSituacaoSala_Edit.Text := 'Não há vagas';
        ShowMessage('A sala escolhida está cheia, favor escolher outra sala');
        enCodigoSala_EditNumerico.SetFocus;
      end
      else
        edSituacaoSala_Edit.Text := 'Há vagas';
      
    end
    else
    begin
      ShowMessage('A sala escolhida não existe, favor escolher outra sala');
      edNomeSala_Edit.Text := 'Não existe';
      edSituacaoSala_Edit.Text := 'Não existe';
      enCodigoSala_EditNumerico.SetFocus;
    end;
end;

procedure TfrCadastroEtapa.enCodigoEspacoCafe_EditNumericoExit(Sender: TObject);
var
  wLotacaoAtualEspacoCafe, wLotacaoMaximaEspacoCafe: Integer;
begin
    if not dmProjeto_DataModule.SQLConnection.Connected then
      dmProjeto_DataModule.SQLConnection.Connected := True;

    dmProjeto_DataModule.qConsulta.Close;
    dmProjeto_DataModule.qConsulta.SQL.Clear;

    dmProjeto_DataModule.qConsulta.SQL.Add(
      'select ' +
        'ec.bdnomeespacocafe, ' +
        'ec.bdlotacaomaximaespacocafe as lotacao_maxima, ' +
        'count(et.bdcodetapa) as total_alocados ' +
      'from tespacocafe ec ' +
      'left join tetapa et on (ec.bdcodespacocafe = et.bdcodespacocafe) ' +
      'where ec.bdcodespacocafe = :bdcodespacocafe ' +
        'group by ' +
          'ec.bdnomeespacocafe, ' +
          'ec.bdlotacaomaximaespacocafe ');

    dmProjeto_DataModule.qConsulta.ParamByName('bdcodespacocafe').AsInteger := enCodigoEspacoCafe_EditNumerico.Codigo;
    dmProjeto_DataModule.qConsulta.Open;

    if not dmProjeto_DataModule.qConsulta.IsEmpty then
    begin
      edNomeEspacoCafe_Edit.Text := dmProjeto_DataModule.qConsulta.FieldByName('bdnomeespacocafe').AsString;
      wLotacaoAtualEspacoCafe := dmProjeto_DataModule.qConsulta.FieldByName('total_alocados').AsInteger;
      wLotacaoMaximaEspacoCafe := dmProjeto_DataModule.qConsulta.FieldByName('lotacao_maxima').AsInteger;

      if wLotacaoAtualEspacoCafe >= wLotacaoMaximaEspacoCafe then
      begin
        edSituacaoEspacoCafe_Edit.Text := 'Não há vagas';
        ShowMessage('O espaço para café escolhido está cheio, favor escolher outro espaço');
        enCodigoEspacoCafe_EditNumerico.SetFocus;
      end
      else
        edSituacaoEspacoCafe_Edit.Text := 'Há vagas';

    end
    else
    begin
      ShowMessage('O espaço para café escolhido não existe, favor escolher outro espaço');
      edNomeEspacoCafe_Edit.Text := 'Não existe';
      edSituacaoEspacoCafe_Edit.Text := 'Não existe';
      enCodigoEspacoCafe_EditNumerico.SetFocus;
    end;
end;


function TfrCadastroEtapa.Validar: Boolean;
var
  wEtapasCadastradas, wJaEtapa1, wJaEtapa2: Integer;
begin
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  dmProjeto_DataModule.qConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
    'select ' +
      'bdcodpessoa, ' +
    'count(distinct bdnumetapa) as etapas_cadastradas, ' +
    'max(case when bdnumetapa = 1 then 1 else 0 end) AS ja_etapa_1, ' +
    'max(case when bdnumetapa = 2 then 1 else 0 end) AS ja_etapa_2 ' +
    'from tetapa ' +
    'where bdcodpessoa = :bdcodpessoa ' +
      'group by bdcodpessoa ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa_EditNumerico.Codigo;
  dmProjeto_DataModule.qConsulta.Open;

  if not dmProjeto_DataModule.qConsulta.IsEmpty then
  begin
    wEtapasCadastradas := dmProjeto_DataModule.qConsulta.FieldByName('etapas_cadastradas').AsInteger;
    wJaEtapa1 := dmProjeto_DataModule.qConsulta.FieldByName('ja_etapa_1').AsInteger;
    wJaEtapa2 := dmProjeto_DataModule.qConsulta.FieldByName('ja_etapa_2').AsInteger;

    if wEtapasCadastradas = 2 then
    begin
      ShowMessage('A pessoa inserida já está cadastrada em duas etapas, escolha outra pessoa');
      Result := false;
    end else if (wJaEtapa1 = 1) and (cbNumeroEtapa_ComboBox.Text = IntToStr(1)) then
    begin
      ShowMessage('A pessoa inserida já está cadastrada na etapa 1, escolha outra etapa');
      Result := false;
    end else if (wJaEtapa2 = 1) and (cbNumeroEtapa_ComboBox.Text = IntToStr(2)) then
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
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.cdsConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
  'select bdcodetapa ' +
  'from tetapa ' +
  'where bdcodetapa = :bdcodetapa ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodetapa').AsInteger := enCodigoEtapa_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  wCodigoEtapa := dmProjeto_DataModule.cdsConsulta.FieldByName('bdcodetapa').AsInteger;

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

  if (cbNumeroEtapa_ComboBox.ItemIndex <> 0) and (cbNumeroEtapa_ComboBox.ItemIndex <> 1) then
    Result := false
  else
  begin
    if (enCodigoPessoa_EditNumerico.Codigo = 0) or
       (enCodigoSala_EditNumerico.Codigo = 0) or
       (enCodigoEspacoCafe_EditNumerico.Codigo = 0) then
      Result := false
    else
      Result := true;
  end
end;

end.
