unit uCadastroSala;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, ImgList, ComCtrls, ToolWin, StdCtrls,
  uEditNumerico, DBClient;

type
  TfrCadastroSala = class(TfrCadastroPadrao)
    eNomeSala: TEdit;
    enLotacaoMaximaSala: TEditNumerico;
    enLotacaoAtualSala: TEditNumerico;
    lNomeSala: TLabel;
    lLotacaoMaximaSala: TLabel;
    lLotacaoAtualSala: TLabel;
    lCodigoSala: TLabel;
    enCodigoSala: TEditNumerico;
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
  frCadastroSala: TfrCadastroSala;

implementation

uses uDmAcademiaSci, uConsultaSala;

{$R *.dfm}

{ TfrCadastroSala }

procedure TfrCadastroSala.Carregar;
begin
  inherited;
  eNomeSala.Text :=  Tabela.FieldByName('BDNOMESALA').AsString;
  enLotacaoMaximaSala.Text := Tabela.FieldByName('BDLOTACAOMAXIMASALA').AsString;
  enLotacaoAtualSala.Text := Tabela.FieldByName('BDLOTACAOATUALSALA').AsString;
end;

function TfrCadastroSala.Consultar: TForm;
begin
  Result := TfrConsultaSala.Create(enCodigoSala);
end;

procedure TfrCadastroSala.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDCODSALA').AsInteger := enCodigoSala.Codigo;
  Tabela.FieldByName('BDNOMESALA').AsString := eNomeSala.Text;
  Tabela.FieldByName('BDLOTACAOMAXIMASALA').AsInteger := enLotacaoMaximaSala.Codigo;
  Tabela.FieldByName('BDLOTACAOATUALSALA').AsInteger := enLotacaoAtualSala.Codigo;

  ShowMessage('Sala criada com sucesso!');
end;

function TfrCadastroSala.setEditCodigo: TEdit;
begin
  Result := enCodigoSala;
end;

function TfrCadastroSala.setIndice: string;
begin
  Result := 'BDCODSALA';
end;

function TfrCadastroSala.setTabela: TClientDataSet;
begin
  Result := dmAcademiaSci.cdsSala;
end;

procedure TfrCadastroSala.tbExcluirClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Sala Exlu�da com Sucesso');
end;

end.
