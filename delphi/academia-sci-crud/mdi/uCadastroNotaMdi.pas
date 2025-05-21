unit uCadastroNotaMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, uEditNumerico, StdCtrls, ImgList, ComCtrls,
  ToolWin, DBClient;

type
  TfrCadastroNotaMdi = class(TfrCadastroPadrao)
    lNumeroNota: TLabel;
    lCodigoCliente: TLabel;
    lCodigoLoja: TLabel;
    lStatus: TLabel;
    eStatusNota: TEdit;
    eCodigoLoja: TEditNumerico;
    eCodigoCliente: TEditNumerico;
    eNumeroNota: TEditNumerico;
    tbCancelar: TToolButton;
    procedure tbCancelarClick(Sender: TObject);
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
  frCadastroNotaMdi: TfrCadastroNotaMdi;

implementation

uses uDmAcademiaSci, uConsultaNotaMdi, uCancelamentoNotaMdi;

{$R *.dfm}

{ TfrCadastroNotaMdi }

procedure TfrCadastroNotaMdi.Carregar;
begin
  inherited;
  eNumeroNota.Codigo := Tabela.FieldByName('BDNUMNOTA').AsInteger;
  eCodigoCliente.Codigo := Tabela.FieldByName('BDCODCLI').AsInteger;
  eCodigoLoja.Codigo := Tabela.FieldByName('BDCODLOJ').AsInteger;
  eStatusNota.Text := Tabela.FieldByName('BDSTATUSNOTA').AsString;
end;

function TfrCadastroNotaMdi.Consultar: TForm;
begin
  Result := TfrConsultaNotaMdi.Create(eNumeroNota);
end;

procedure TfrCadastroNotaMdi.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDNUMNOTA').AsInteger := eNumeroNota.Codigo;
  Tabela.FieldByName('BDCODCLI').AsInteger := eCodigoCliente.Codigo;
  Tabela.FieldByName('BDCODLOJ').AsInteger := eCodigoLoja.Codigo;
  Tabela.FieldByName('BDDATAEMISSAONOTA').AsDateTime := Date;
  Tabela.FieldByName('BDSTATUSNOTA').AsString := 'EMITIDA';

  ShowMessage('Nota Emitida com Sucesso!');
end;

function TfrCadastroNotaMdi.setEditCodigo: TEdit;
begin
  Result := eNumeroNota;
end;

function TfrCadastroNotaMdi.setIndice: string;
begin
  Result := 'BDNUMNOTA';
end;

function TfrCadastroNotaMdi.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsNota;
end;

procedure TfrCadastroNotaMdi.tbCancelarClick(Sender: TObject);
begin
  inherited;
  TfrCancelamentoNotaMdi.Create(Self);
end;

end.
