unit uConsultaEspacoCafeJoin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient, StdCtrls, uEditNumerico;

type
  TfrConsultaEspacoCafeJoin = class(TfrConsultaPadraoMdi)
    lbCodigoEspacoCafe_Label: TLabel;
    enCodigoEspacoCafe_EditNumerico: TEditNumerico;
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

uses uDmProjeto;

{$R *.dfm}

{ TfrConsultaEspacoCafeJoin }

function TfrConsultaEspacoCafeJoin.setChave: String;
begin
  Result := 'BDCODESPACOCAFE';
end;

function TfrConsultaEspacoCafeJoin.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsConsulta;
end;

procedure TfrConsultaEspacoCafeJoin.tbConfirmarClick(Sender: TObject);
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
          'ec.bdnomeespacocafe, ' +
          'p.bdnomepessoa, p.bdsobrenomepessoa ' +
  'from tetapa et ' +
  'join tpessoa p on (p.bdcodpessoa = et.bdcodpessoa) ' +
  'join tespacocafe ec on (ec.bdcodespacocafe = et.bdcodespacocafe) ' +
  'where et.bdcodespacocafe = :bdcodespacocafe ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodespacocafe').AsInteger := enCodigoEspacoCafe_EditNumerico.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  dsPadrao.DataSet := dmProjeto_DataModule.cdsConsulta;

  if dmProjeto_DataModule.cdsConsulta.IsEmpty then
    ShowMessage('Espaço para café não registrado em nenhuma etapa, favor escolha outro espaço');
end;

end.
