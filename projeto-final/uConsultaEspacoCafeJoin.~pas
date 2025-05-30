unit uConsultaEspacoCafeJoin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient, StdCtrls, uEditNumerico;

type
  TfrConsultaEspacoCafeJoin = class(TfrConsultaPadraoMdi)
    lCodigoEspacoCafe: TLabel;
    enCodigoEspacoCafe: TEditNumerico;
    procedure tbConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaEspacoCafeJoin: TfrConsultaEspacoCafeJoin;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

{ TfrConsultaEspacoCafeJoin }

function TfrConsultaEspacoCafeJoin.setChave: String;
begin
  Result := 'BDCODESPACOCAFE';
end;

function TfrConsultaEspacoCafeJoin.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsConsultaEspacoCafe;
end;

procedure TfrConsultaEspacoCafeJoin.tbConfirmarClick(Sender: TObject);
begin
  inherited;
  if not dmAcademiaSci.SQLConnection.Connected then
    dmAcademiaSci.SQLConnection.Connected := True;

  if dmAcademiaSci.cdsConsultaEspacoCafe.Active then
     dmAcademiaSci.cdsConsultaEspacoCafe.Close;

  dmAcademiaSci.cdsConsultaEspacoCafe.Close;
  dmAcademiaSci.qConsultaEspacoCafe.SQL.Clear;

  dmAcademiaSci.qConsultaEspacoCafe.SQL.Add(
  'select et.bdnumetapa, ' +
          'ec.bdnomeespacocafe, ' +
          'p.bdnomepessoa, p.bdsobrenomepessoa ' +
  'from tetapa et ' +
  'join tpessoa p on (p.bdcodpessoa = et.bdcodpessoa) ' +
  'join tespacocafe ec on (ec.bdcodespacocafe = et.bdcodespacocafe) ' +
  'where et.bdcodespacocafe = :bdcodespacocafe ');

  dmAcademiaSci.qConsultaEspacoCafe.ParamByName('bdcodespacocafe').AsInteger := enCodigoEspacoCafe.Codigo;
  dmAcademiaSci.cdsConsultaEspacoCafe.Open;
  dsPadrao.DataSet := dmAcademiaSci.cdsConsultaEspacoCafe;
end;

end.
