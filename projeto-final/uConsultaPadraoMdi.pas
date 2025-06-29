unit uConsultaPadraoMdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSimples, DB, Grids, DBGrids, ImgList, ComCtrls, ToolWin, DBClient, StdCtrls;

type
  TfrConsultaPadraoMdi = class(TfrSimples)
    grPadrao_Grid: TDBGrid;
    dsPadrao: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure tbConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FTabela: TClientDataSet;
    FChave: String;
  public
    { Public declarations }
    function setTabela: TClientDataSet; virtual; abstract;
    function setChave: String; virtual; abstract;
  published
    property Tabela: TClientDataSet read FTabela write FTabela;
  end;

var
  frConsultaPadraoMdi: TfrConsultaPadraoMdi;

implementation

uses uDmProjeto;

{$R *.dfm}

procedure TfrConsultaPadraoMdi.FormCreate(Sender: TObject);
begin
  inherited;
  FTabela := setTabela;
  FChave := setChave;

  if Assigned(FTabela) then
  begin
    dsPadrao.DataSet := FTabela;
    grPadrao_Grid.DataSource := dsPadrao;
  end;


  grPadrao_Grid.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgCancelOnExit];
end;

procedure TfrConsultaPadraoMdi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    tbConfirmar.Click
  else
    inherited;
end;

procedure TfrConsultaPadraoMdi.tbConfirmarClick(Sender: TObject);
begin
  inherited;
  if Owner is TEdit then
  begin
    TEdit(Owner).Text := FTabela.FieldByName(FChave).AsString;
    Close;
  end;
end;

end.
