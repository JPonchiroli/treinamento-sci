unit uConsultaPessoaJoin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, StdCtrls, uEditNumerico, DB, ImgList, Grids,
  DBGrids, ComCtrls, ToolWin, DBClient;

type
  TfrConsultaPessoaJoin = class(TfrConsultaPadraoMdi)
    lbCodigoPessoa_Label: TLabel;
    enCodigoPessoa_EditNumerico: TEditNumerico;
    procedure tbConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaPessoaJoin: TfrConsultaPessoaJoin;

implementation

uses SqlExpr, uDmProjeto;

{$R *.dfm}

function TfrConsultaPessoaJoin.setChave: String;
begin
  Result := 'BDCODPESSOA'
end;

function TfrConsultaPessoaJoin.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsConsulta;
end;

procedure TfrConsultaPessoaJoin.tbConfirmarClick(Sender: TObject);
begin
  inherited;
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.cdsConsulta.Close;
  dmProjeto_DataModule.qConsulta.SQL.Clear;

  dmProjeto_DataModule.qConsulta.SQL.Add(
  'select et.bdnumetapa, ' +
          'p.bdnomepessoa, p.bdsobrenomepessoa, ' +
          's.bdnomesala, ' +
          'ec.bdnomeespacocafe ' +
  'from tetapa et ' +
  'join tpessoa p on (p.bdcodpessoa = et.bdcodpessoa) ' +
  'join tsala s on (s.bdcodsala = et.bdcodsala) ' +
  'join tespacocafe ec on (ec.bdcodespacocafe = et.bdcodespacocafe) ' +
  'where et.bdcodpessoa = :bdcodpessoa ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  dsPadrao.DataSet := dmProjeto_DataModule.cdsConsulta;

  if dmProjeto_DataModule.cdsConsulta.IsEmpty then
    ShowMessage('Pessoa n�o registrada em nenhuma etapa, favor escolha outra pessoa');
end;

end.
