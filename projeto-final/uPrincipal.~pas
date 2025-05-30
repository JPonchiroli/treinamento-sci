unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, uEditNumerico;

type
  TfrPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mCadastro: TMenuItem;
    mCadastroPessoa: TMenuItem;
    mCadastroSala: TMenuItem;
    mCadastroEspacoCafe: TMenuItem;
    mCadastroEtapa: TMenuItem;
    Consulta1: TMenuItem;
    mConsultaPessoa: TMenuItem;
    mConsultaSala: TMenuItem;
    mConsultaEspacoCafe: TMenuItem;
    procedure mCadastroPessoaClick(Sender: TObject);
    procedure mCadastroSalaClick(Sender: TObject);
    procedure mCadastroEspacoCafeClick(Sender: TObject);
    procedure mCadastroEtapaClick(Sender: TObject);
    procedure mConsultaPessoaClick(Sender: TObject);
    procedure mConsultaSalaClick(Sender: TObject);
    procedure mConsultaEspacoCafeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation


uses uSimples, uCadastroPessoa, uCadastroSala, uCadastroEspacoCafe,
  uCadastroEtapa, uConsultaPessoaJoin, uConsultaSalaJoin,
  uConsultaEspacoCafeJoin;

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

end.
