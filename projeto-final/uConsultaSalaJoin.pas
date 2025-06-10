unit uConsultaSalaJoin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMdi, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient, StdCtrls, uEditNumerico;

type
  TfrConsultaSalaJoin = class(TfrConsultaPadraoMdi)
    enCodigoSala_EditNumerico: TLabel;
    enCodigoSala: TEditNumerico;
    procedure tbConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaSalaJoin: TfrConsultaSalaJoin;

implementation

uses uDmProjeto;

{$R *.dfm}

{ TfrConsultaPadraoMdi1 }

function TfrConsultaSalaJoin.setChave: String;
begin
  Result := 'BDCODSALA';
end;

function TfrConsultaSalaJoin.setTabela: TClientDataSet;
begin
  Result := dmProjeto_DataModule.cdsConsulta;
end;

procedure TfrConsultaSalaJoin.tbConfirmarClick(Sender: TObject);
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
          's.bdnomesala, ' +
          'p.bdnomepessoa, p.bdsobrenomepessoa ' +
  'from tetapa et ' +
  'join tpessoa p on (p.bdcodpessoa = et.bdcodpessoa) ' +
  'join tsala s on (s.bdcodsala = et.bdcodsala) ' +
  'where et.bdcodsala = :bdcodsala ');

  dmProjeto_DataModule.qConsulta.ParamByName('bdcodsala').AsInteger := enCodigoSala.Codigo;
  dmProjeto_DataModule.cdsConsulta.Open;
  dsPadrao.DataSet := dmProjeto_DataModule.cdsConsulta;

  if dmProjeto_DataModule.cdsConsulta.IsEmpty then
    ShowMessage('Sala não registrada em nenhuma etapa, favor escolha outra sala');
end;

end.
