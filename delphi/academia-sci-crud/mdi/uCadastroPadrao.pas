unit uCadastroPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSimples, ImgList, ComCtrls, ToolWin, ExtCtrls, DBClient, StdCtrls, DB;

type
  TfrCadastroPadrao = class(TfrSimples)
    tbConsultar: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure EditCodigoExit(Sender: TObject);
    procedure tbConfirmarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbConsultarClick(Sender: TObject);
  private
   FTabela: TClientDataSet;
   FIndice: String;
   FEditCodigo: TEdit;
  public
    function setTabela: TClientDataSet; virtual; abstract;
    function setIndice: String; virtual; abstract;
    function setEditCodigo: TEdit; virtual; abstract;
    procedure Salvar; virtual; abstract;
    function Consultar: TForm; virtual; abstract;
    procedure Carregar; virtual; abstract;
    procedure LimparCampos; virtual;
    function getChaveComposta: Boolean; virtual;
    function getInsercaoChaveComposta: Boolean; virtual;
  published
    property Tabela: TClientDataSet read FTabela write FTabela;
  end;

var
  frCadastroPadrao: TfrCadastroPadrao;

implementation

{$R *.dfm}

{ TfrCadastroPadrao }

procedure TfrCadastroPadrao.FormCreate(Sender: TObject);
begin
  inherited;

  FTabela := setTabela;
  FIndice := setIndice;
  FEditCodigo := setEditCodigo;

  if Assigned(FEditCodigo) then
    FEditCodigo.OnExit := EditCodigoExit;

  if (Trim(FIndice) <> EmptyStr) and Assigned(FTabela) then
  begin
    FTabela.IndexDefs.Clear;
    FTabela.IndexDefs.Add('iPK', FIndice, [ixCaseInsensitive]);
    FTabela.IndexFieldNames := FIndice;
    FTabela.Open;
  end;

  LimparCampos;
end;

procedure TfrCadastroPadrao.EditCodigoExit(Sender: TObject);
var
  wEncontrou: Boolean;
begin
  if Assigned(FTabela) and Assigned(FEditCodigo) then
  begin
    FTabela.IndexFieldNames := FIndice;
    
    if Pos(';', FIndice) > 0 then
      wEncontrou := getChaveComposta
    else
      wEncontrou := FTabela.FindKey([StrToIntDef(Trim(FEditCodigo.Text), 0)]);

    if wEncontrou then
       Carregar
    else
      LimparCampos;
      
  end;
end;

procedure TfrCadastroPadrao.LimparCampos;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i] <> FEditCodigo then
    begin
      if Self.Components[i] is TEdit then
        TEdit(Self.Components[i]).Clear
      else
      if Self.Components[i] is TComboBox then
        TComboBox(Self.Components[i]).ItemIndex := -1;
    end;
  end;
end;

procedure TfrCadastroPadrao.tbConfirmarClick(Sender: TObject);
var
  wEncontrou: Boolean;
begin
  inherited;
  if Assigned(FTabela) and Assigned(FEditCodigo) then
  begin
    FTabela.IndexFieldNames := FIndice;
    if Pos(';', FIndice) > 0 then
       wEncontrou := getChaveComposta
    else
       wEncontrou := FTabela.FindKey([StrToIntDef(Trim(FEditCodigo.Text), 0)]);

    if wEncontrou then
       FTabela.Edit
    else
    begin
      FTabela.Insert;
      if not getInsercaoChaveComposta then
        FTabela.FieldByName(FIndice).AsInteger := StrToIntDef(FEditCodigo.Text, 0);
    end;

    Salvar;

    FTabela.Post;
    FTabela.ApplyUpdates(0);
    FTabela.Refresh;

    if FEditCodigo.CanFocus then
      FEditCodigo.SetFocus;
    LimparCampos;
  end;
end;

procedure TfrCadastroPadrao.tbExcluirClick(Sender: TObject);
var
  wEncontrou: Boolean;
begin
  if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    if Assigned(FTabela) and Assigned(FEditCodigo) then
    begin
      FTabela.IndexFieldNames := FIndice;
      if Pos(';', FIndice) > 0 then
        wEncontrou := getChaveComposta
      else
        wEncontrou := FTabela.FindKey([StrToIntDef(Trim(FEditCodigo.Text), 0)]);

      if wEncontrou then
        FTabela.Delete;

      FTabela.ApplyUpdates(0);
      FTabela.Refresh;

      if FEditCodigo.CanFocus then
        FEditCodigo.SetFocus;
      LimparCampos;
    end;
  end;
end;

procedure TfrCadastroPadrao.tbConsultarClick(Sender: TObject);
begin
  Consultar;
end;

procedure TfrCadastroPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  begin
    if ActiveControl <> FEditCodigo then
      FEditCodigo.SetFocus
    else
      inherited;
  end
  else
  if Key = vk_f3 then
     tbConsultar.Click;
end;

function TfrCadastroPadrao.getChaveComposta: Boolean;
begin
  Result := False;
end;

function TfrCadastroPadrao.getInsercaoChaveComposta: Boolean;
begin
 Result := False;
end;

end.
