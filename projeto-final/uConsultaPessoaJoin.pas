unit uConsultaPessoaJoin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, StdCtrls, uEditNumerico, DB, ImgList, Grids,
  DBGrids, ComCtrls, ToolWin, DBClient;

type
  TfrConsultaPessoaJoin = class(TfrConsultaPadraoMdi)
    lCodigoPessoa: TLabel;
    enCodigoPessoa: TEditNumerico;
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
  Result := dmProjeto.cdsConsultaPessoa;
end;

procedure TfrConsultaPessoaJoin.tbConfirmarClick(Sender: TObject);
begin
  inherited;
  if not dmProjeto.SQLConnection.Connected then
    dmProjeto.SQLConnection.Connected := True;

  if dmProjeto.cdsConsultaPessoa.Active then
    dmProjeto.cdsConsultaPessoa.Close;

  dmProjeto.cdsConsultaPessoa.Close;
  dmProjeto.qConsultaPessoa.SQL.Clear;

  dmProjeto.qConsultaPessoa.SQL.Add(
  'select et.bdnumetapa, ' +
          'p.bdnomepessoa, p.bdsobrenomepessoa, ' +
          's.bdnomesala, ' +
          'ec.bdnomeespacocafe ' +
  'from tetapa et ' +
  'join tpessoa p on (p.bdcodpessoa = et.bdcodpessoa) ' +
  'join tsala s on (s.bdcodsala = et.bdcodsala) ' +
  'join tespacocafe ec on (ec.bdcodespacocafe = et.bdcodespacocafe) ' +
  'where et.bdcodpessoa = :bdcodpessoa ');

  dmProjeto.qConsultaPessoa.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa.Codigo;
  dmProjeto.cdsConsultaPessoa.Open;
  dsPadrao.DataSet := dmProjeto.cdsConsultaPessoa;

  if dmProjeto.cdsConsultaPessoa.IsEmpty then
    ShowMessage('Pessoa não registrada em nenhuma etapa, favor escolha outra pessoa');
end;

end.
