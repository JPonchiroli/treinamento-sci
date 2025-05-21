unit uCancelamentoNotaMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, uEditNumerico, StdCtrls, ImgList, ComCtrls,
  ToolWin, DBClient;

type
  TfrCancelamentoNotaMdi = class(TfrCadastroPadrao)
    Label1: TLabel;
    lNumeroNota: TLabel;
    lCodigoCliente: TLabel;
    lCodigoLoja: TLabel;
    eDescricaoCancelamento: TEdit;
    eCodigoLoja: TEditNumerico;
    eCodigoCliente: TEditNumerico;
    eNumeroNota: TEditNumerico;
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
  end;

var
  frCancelamentoNotaMdi: TfrCancelamentoNotaMdi;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

{ TfrCancelamentoNotaMdi }

procedure TfrCancelamentoNotaMdi.Carregar;
begin
  inherited;
end;

function TfrCancelamentoNotaMdi.Consultar: TForm;
begin
  Result := nil;
end;

procedure TfrCancelamentoNotaMdi.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDNUMNOTA').AsInteger := eNumeroNota.Codigo;
  Tabela.FieldByName('BDCODCLI').AsInteger := eCodigoCliente.Codigo;
  Tabela.FieldByName('BDCODLOJ').AsInteger := eCodigoLoja.Codigo;
  Tabela.FieldByName('BDSTATUSNOTA').AsString := 'CANCELADA';
  Tabela.FieldByName('BDDESCCANCELAMENTO').AsString := eDescricaoCancelamento.Text;
  Tabela.FieldByName('BDDATACANCELAMENTO').AsDateTime := Date;

  ShowMessage('Nota Cancelada com Sucesso!');
end;

function TfrCancelamentoNotaMdi.setEditCodigo: TEdit;
begin
  Result := eNumeroNota;
end;

function TfrCancelamentoNotaMdi.setIndice: string;
begin
  Result := 'BDNUMNOTA';
end;

function TfrCancelamentoNotaMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsNota;
end;

procedure TfrCancelamentoNotaMdi.tbExcluirClick(Sender: TObject);
begin
  Close;
end;

end.
