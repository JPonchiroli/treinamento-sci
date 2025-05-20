unit uCadastroCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TfrCadastroCategoria = class(TForm)
    bSalvar: TButton;
    bExcluir: TButton;
    bConsultar: TButton;
    eNomeCategoria: TEdit;
    eCodigoCategoria: TEdit;
    lCodigoProduto: TLabel;
    lNomeProduto: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure bSalvarClick(Sender: TObject);
    procedure bExcluirClick(Sender: TObject);
    procedure eCodigoCategoriaExit(Sender: TObject);
    procedure bConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroCategoria: TfrCadastroCategoria;

implementation

uses uDmAcademiaSci, uConsultaCategoria ;

{$R *.dfm}

procedure TfrCadastroCategoria.FormCreate(Sender: TObject);
begin
  dmAcademiaSci.cdsCategoria.IndexDefs.Clear;
  dmAcademiaSci.cdsCategoria.IndexDefs.Add('iCODCAT', 'BDCODCAT', [ixCaseInsensitive]);
  dmAcademiaSci.cdsCategoria.Open;
end;

procedure TfrCadastroCategoria.bSalvarClick(Sender: TObject);
begin
  dmAcademiaSci.cdsCategoria.IndexFieldNames := 'BDCODCAT';
  if dmAcademiaSci.cdsCategoria.FindKey([StrToIntDef(eCodigoCategoria.Text, 0)]) then
    dmAcademiaSci.cdsCategoria.Edit
  else
  begin
    dmAcademiaSci.cdsCategoria.Insert;
    dmAcademiaSci.cdsCategoria.FieldByName('BDCODCAT').AsInteger := StrToIntDef(eCodigoCategoria.Text, 0)
  end;

  dmAcademiaSci.cdsCategoria.FieldByName('BDNOMECAT').AsString := eNomeCategoria.Text;
  dmAcademiaSci.cdsCategoria.Post;
  dmAcademiaSci.cdsCategoria.ApplyUpdates(0);
  dmAcademiaSci.cdsCategoria.Refresh;

  eCodigoCategoria.Clear;
  eNomeCategoria.Clear;

  ShowMessage('Categoria Cadastrado com Sucesso');
end;

procedure TfrCadastroCategoria.bExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmAcademiaSci.cdsCategoria.IndexFieldNames := 'BDCODCAT';
    if dmAcademiaSci.cdsCategoria.FindKey([StrToInt(eCodigoCategoria.Text)]) then
    begin
      dmAcademiaSci.cdsCategoria.Delete;
      dmAcademiaSci.cdsCategoria.ApplyUpdates(0);
      dmAcademiaSci.cdsCategoria.Refresh;

      eCodigoCategoria.Clear;
      eNomeCategoria.Clear;

      ShowMessage('Categoria Deletada com Sucesso');

      eCodigoCategoria.SetFocus;
    end
    else
      ShowMessage('Categoria Não Existe')
  end;
end;

procedure TfrCadastroCategoria.eCodigoCategoriaExit(Sender: TObject);
begin
  dmAcademiaSci.cdsCategoria.IndexFieldNames := 'BDCODCAT';
  if dmAcademiaSci.cdsCategoria.FindKey([StrToIntDef(eCodigoCategoria.Text, 0)]) then
    eNomeCategoria.Text := dmAcademiaSci.cdsCategoria.FieldByName('BDNOMECAT').AsString
  else
    eNomeCategoria.Clear;
end;

procedure TfrCadastroCategoria.bConsultarClick(Sender: TObject);
var
  wForm: TForm;
begin
  wForm := TfrConsultaCategoria.Create(Self);
  wForm.ShowModal;
  if wForm.ModalResult = mrOk then
  begin
    eCodigoCategoria.Text := dmAcademiaSci.cdsCategoria.FieldByName('BDCODCAT').AsString;
    eCodigoCategoria.SetFocus();
    eCodigoCategoriaExit(eCodigoCategoria);
  end;
  FreeAndNil(wForm)
end;

end.
