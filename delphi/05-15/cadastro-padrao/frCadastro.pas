unit frCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr;

type
  TAcademiaSci = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AcademiaSci: TAcademiaSci;

implementation

uses uCadastroPadrao, uCadastroTeste;

{$R *.dfm}

procedure TAcademiaSci.Button1Click(Sender: TObject);
var
  wForm: TForm;

begin
  wForm := TfrCadastroTeste.Create(Self);
  wForm.ShowModal;
  if wForm is TfrCadastroPadrao then
    TfrCadastroPadrao(wForm).Salvar;

  FreeAndNil(wForm);
end;

end.
