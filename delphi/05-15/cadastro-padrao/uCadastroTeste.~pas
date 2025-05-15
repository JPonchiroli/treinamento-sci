unit uCadastroTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, ExtCtrls;

type
  TfrCadastroTeste = class(TfrCadastroPadrao)
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure Salvar; override;

  end;

var
  frCadastroTeste: TfrCadastroTeste;

implementation

{$R *.dfm}


procedure TfrCadastroTeste.Salvar();
begin
  inherited;
  ShowMessage('Salvar')
end;

procedure TfrCadastroTeste.Button3Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Teste');
end;

end.
