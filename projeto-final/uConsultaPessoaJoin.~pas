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

uses uDmAcademiaSci, SqlExpr;

{$R *.dfm}

function TfrConsultaPessoaJoin.setChave: String;
begin
  Result := 'BDCODPESSOA'
end;

function TfrConsultaPessoaJoin.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsConsultaPessoa;
end;

procedure TfrConsultaPessoaJoin.tbConfirmarClick(Sender: TObject);
begin
  inherited;
  if not dmAcademiaSci.SQLConnection.Connected then
    dmAcademiaSci.SQLConnection.Connected := True;

  if dmAcademiaSci.cdsConsultaPessoa.Active then
    dmAcademiaSci.cdsConsultaPessoa.Close;

  dmAcademiaSci.cdsConsultaPessoa.Close;
  dmAcademiaSci.qConsultaPessoa.SQL.Clear;

  dmAcademiaSci.qConsultaPessoa.SQL.Add(
  'select et.bdnumetapa, ' +
          'p.bdnomepessoa, p.bdsobrenomepessoa, ' +
          's.bdnomesala, ' +
          'ec.bdnomeespacocafe ' +
  'from tetapa et ' +
  'join tpessoa p on (p.bdcodpessoa = et.bdcodpessoa) ' +
  'join tsala s on (s.bdcodsala = et.bdcodsala) ' +
  'join tespacocafe ec on (ec.bdcodespacocafe = et.bdcodespacocafe) ' +
  'where et.bdcodpessoa = :bdcodpessoa ');

  dmAcademiaSci.qConsultaPessoa.ParamByName('bdcodpessoa').AsInteger := enCodigoPessoa.Codigo;
  dmAcademiaSci.cdsConsultaPessoa.Open;
  dsPadrao.DataSet := dmAcademiaSci.cdsConsultaPessoa;
end;

end.
