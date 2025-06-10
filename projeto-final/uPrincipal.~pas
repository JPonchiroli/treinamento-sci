unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, uEditNumerico;

type
  TfrPrincipal = class(TForm)
    mMenu: TMainMenu;
    mCadastro: TMenuItem;
    mCadastroPessoa: TMenuItem;
    mCadastroSala: TMenuItem;
    mCadastroEspacoCafe: TMenuItem;
    mCadastroEtapa: TMenuItem;
    mConsulta: TMenuItem;
    mConsultaPessoa: TMenuItem;
    mConsultaSala: TMenuItem;
    mConsultaEspacoCafe: TMenuItem;
    mRelatorios: TMenuItem;
    mRelatorioPessoas: TMenuItem;
    mRelatorioSalas: TMenuItem;
    mRelatorioEspacosDeCafe: TMenuItem;
    mRelatorioEtapas: TMenuItem;
    procedure mCadastroPessoaClick(Sender: TObject);
    procedure mCadastroSalaClick(Sender: TObject);
    procedure mCadastroEspacoCafeClick(Sender: TObject);
    procedure mCadastroEtapaClick(Sender: TObject);
    procedure mConsultaPessoaClick(Sender: TObject);
    procedure mConsultaSalaClick(Sender: TObject);
    procedure mRelatorioPessoasClick(Sender: TObject);
    procedure mRelatorioSalasClick(Sender: TObject);
    procedure mRelatorioEspacosDeCafeClick(Sender: TObject);
    procedure mConsultaEspacoCafeClick(Sender: TObject);
    procedure mRelatorioEtapasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GerarCSV(const wConsulta, wNomeTabela: String);
  end;

var
  frPrincipal: TfrPrincipal;

implementation


uses uSimples, uCadastroPessoa, uCadastroSala, uCadastroEspacoCafe,
  uCadastroEtapa, uConsultaPessoaJoin, uConsultaSalaJoin,
  uConsultaEspacoCafeJoin, uDmProjeto;

{$R *.dfm}


procedure TfrPrincipal.mCadastroPessoaClick(Sender: TObject);
begin
  TfrCadastroPessoa.Create(Self);
end;

procedure TfrPrincipal.mCadastroSalaClick(Sender: TObject);
begin
  TfrCadastroSala.Create(Self);
end;

procedure TfrPrincipal.mCadastroEspacoCafeClick(Sender: TObject);
begin
  TfrCadastroEspacoCafe.Create(Self);
end;

procedure TfrPrincipal.mCadastroEtapaClick(Sender: TObject);
begin
  TfrCadastroEtapa.Create(Self);
end;

procedure TfrPrincipal.mConsultaPessoaClick(Sender: TObject);
begin
  TfrConsultaPessoaJoin.Create(Self);
end;

procedure TfrPrincipal.mConsultaSalaClick(Sender: TObject);
begin
  TfrConsultaSalaJoin.Create(Self);
end;

procedure TfrPrincipal.mConsultaEspacoCafeClick(Sender: TObject);
begin
  TfrConsultaEspacoCafeJoin.Create(Self);
end;


procedure TfrPrincipal.mRelatorioPessoasClick(Sender: TObject);
var
  wConsultaPessoa, wNomeTabela: String;
begin
  wConsultaPessoa := 'select * from tpessoa';
  wNomeTabela := 'pessoas';
  GerarCSV(wConsultaPessoa, wNomeTabela);
end;


procedure TfrPrincipal.mRelatorioSalasClick(Sender: TObject);
var
  wConsultaSala, wNomeTabela: String;
begin
  wConsultaSala := 'select * from tsala';
  wNomeTabela := 'salas';
  GerarCSV(wConsultaSala, wNomeTabela);
end;

procedure TfrPrincipal.mRelatorioEtapasClick(Sender: TObject);
var
  wConsultaEtapa, wNomeTabela: String;
begin
  wConsultaEtapa :=  'select et.bdcodetapa, ' + 
            'et.bdnumetapa, ' +
            'p.bdnomepessoa, p.bdsobrenomepessoa, ' +
            's.bdnomesala, ' +
            'ec.bdnomeespacocafe ' +
    'from tetapa et ' +
    'join tpessoa p on (p.bdcodpessoa = et.bdcodpessoa) ' +
    'join tsala s on (s.bdcodsala = et.bdcodsala) ' +
    'join tespacocafe ec on (ec.bdcodespacocafe = et.bdcodespacocafe) ';
  wNomeTabela := 'etapas';
  GerarCSV(wConsultaEtapa, wNomeTabela);
end;

procedure TfrPrincipal.mRelatorioEspacosDeCafeClick(Sender: TObject);
var
  wConsultaEspacoCafe, wNomeTabela: String;
begin
  wConsultaEspacoCafe := 'SELECT * FROM tespacocafe';
  wNomeTabela := 'espacos-de-cafe';
  GerarCSV(wConsultaEspacoCafe, wNomeTabela);
end;

procedure TfrPrincipal.GerarCSV(const wConsulta, wNomeTabela: String);
var
  wLista: TStringList;
  wCampo: Integer;
  wLinha, wFileName: String;
  wSaveDialog: TSaveDialog;
begin
  if not dmProjeto_DataModule.SQLConnection.Connected then
    dmProjeto_DataModule.SQLConnection.Connected := True;

  if dmProjeto_DataModule.cdsConsulta.Active then
    dmProjeto_DataModule.cdsConsulta.Close;

  dmProjeto_DataModule.qConsulta.SQL.Clear;
  dmProjeto_DataModule.qConsulta.SQL.Add(wConsulta);
  dmProjeto_DataModule.cdsConsulta.Open;

  wSaveDialog := TSaveDialog.Create(nil);
  try
    wSaveDialog.Title := 'Salvar relatório CSV';
    wSaveDialog.Filter := 'Arquivo CSV (*.csv)|*.csv';
    wSaveDialog.DefaultExt := 'csv';
    wSaveDialog.FileName := wNomeTabela + '.csv';

    if wSaveDialog.Execute then
    begin
      wFileName := wSaveDialog.FileName;

      wLista := TStringList.Create;
      try
        wLinha := '';
        for wCampo := 0 to dmProjeto_DataModule.cdsConsulta.Fields.Count - 1 do
          wLinha := wLinha + dmProjeto_DataModule.cdsConsulta.Fields[wCampo].DisplayLabel + ';';
        wLista.Add(wLinha);

        dmProjeto_DataModule.cdsConsulta.First;

        while not dmProjeto_DataModule.cdsConsulta.Eof do
        begin
          wLinha := '';
          for wCampo := 0 to dmProjeto_DataModule.cdsConsulta.Fields.Count - 1 do
            wLinha := wLinha + dmProjeto_DataModule.cdsConsulta.Fields[wCampo].AsString + ';';
          wLista.Add(wLinha);
          dmProjeto_DataModule.cdsConsulta.Next;
        end;

        wLista.SaveToFile(wFileName);
        ShowMessage('Relatório criado com sucesso em: ' + wFileName);
      finally
        wLista.Free;
      end;
    end
    else
    begin
      ShowMessage('Operação cancelada pelo usuário.');
    end;
  finally
    wSaveDialog.Free;
  end;
end;

end.
