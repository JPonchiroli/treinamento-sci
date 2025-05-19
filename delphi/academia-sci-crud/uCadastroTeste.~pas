unit uCadastroTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TfrCadastroProdutoTeste = class(TForm)
    bSalvar: TButton;
    bExcluir: TButton;
    bConsultar: TButton;
    eCodigoProduto: TEdit;
    eNomeProduto: TEdit;
    ePrecoUnitarioProduto: TEdit;
    eCodigoCategoria: TEdit;
    lCodigoProduto: TLabel;
    lCodigoCategoria: TLabel;
    lNomeProduto: TLabel;
    lPrecoUnitarioProduto: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure bSalvarClick(Sender: TObject);
    procedure bExcluirClick(Sender: TObject);
    procedure eCodigoProdutoExit(Sender: TObject);
    procedure bConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroProdutoTeste: TfrCadastroProdutoTeste;

implementation

uses uDmAcademiaSci, uConsultaProduto;

{$R *.dfm}

procedure TfrCadastroProdutoTeste.FormCreate(Sender: TObject);
begin
  dmAcademiaSci.cdsProduto.IndexDefs.Clear;
  dmAcademiaSci.cdsProduto.IndexDefs.Add('iCODPROD', 'BDCODPROD', [ixCaseInsensitive]);
  dmAcademiaSci.cdsProduto.Open;
end;

procedure TfrCadastroProdutoTeste.bSalvarClick(Sender: TObject);
begin
  dmAcademiaSci.cdsProduto.IndexFieldNames := 'BDCODPROD';
  if dmAcademiaSci.cdsProduto.FindKey([StrToIntDef(eCodigoProduto.Text, 0)]) then
    dmAcademiaSci.cdsProduto.Edit
  else
  begin
    dmAcademiaSci.cdsProduto.Insert;
    dmAcademiaSci.cdsProduto.FieldByName('BDCODPROD').AsInteger := StrToIntDef(eCodigoProduto.Text, 0)
  end;

  dmAcademiaSci.cdsProduto.FieldByName('BDNOMEPROD').AsString := eNomeProduto.Text;
  dmAcademiaSci.cdsProduto.FieldByName('BDCODCAT').AsInteger := StrToIntDef(eCodigoCategoria.Text, 0);
  dmAcademiaSci.cdsProduto.FieldByName('BDPRECOUNIPROD').AsFloat := StrToFloatDef(ePrecoUnitarioProduto.Text, 0);
  dmAcademiaSci.cdsProduto.Post;
  dmAcademiaSci.cdsProduto.ApplyUpdates(0);
  dmAcademiaSci.cdsProduto.Refresh;

  eCodigoProduto.Clear;
  eCodigoCategoria.Clear;
  eNomeProduto.Clear;
  ePrecoUnitarioProduto.Clear;

  ShowMessage('Produto Cadastrado com Sucesso');

  eCodigoProduto.SetFocus;
end;

procedure TfrCadastroProdutoTeste.bExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmAcademiaSci.cdsProduto.IndexFieldNames := 'BDCODPROD;BDCODCAT';
    if dmAcademiaSci.cdsProduto.FindKey(
    [StrToIntDef(eCodigoProduto.Text, 0), StrToIntDef(eCodigoCategoria.Text, 0)]) then
    begin
      dmAcademiaSci.cdsProduto.Delete;
      dmAcademiaSci.cdsProduto.ApplyUpdates(0);
      dmAcademiaSci.cdsProduto.Refresh;
                                            
      eCodigoProduto.Clear;
      eCodigoCategoria.Clear;
      eNomeProduto.Clear;
      ePrecoUnitarioProduto.Clear;

      ShowMessage('Produto Deletado com Sucesso');

      eCodigoProduto.SetFocus;
    end
    else
      ShowMessage('Produto Não Existe')
  end;
end;

procedure TfrCadastroProdutoTeste.eCodigoProdutoExit(Sender: TObject);
begin
  dmAcademiaSci.cdsProduto.IndexFieldNames := 'BDCODPROD;BDCODCAT';
  if dmAcademiaSci.cdsProduto.FindKey(
  [StrToIntDef(eCodigoProduto.Text, 0), StrToIntDef(eCodigoCategoria.Text, 0)]) then
  begin
    eNomeProduto.Text := dmAcademiaSci.cdsProduto.FieldByName('BDNOMEPROD').AsString;
    ePrecoUnitarioProduto.Text := dmAcademiaSci.cdsProduto.FieldByName('BDPRECOUNIPROD').AsString;
  end
  else
  begin
    eNomeProduto.Clear;
    ePrecoUnitarioProduto.Clear;
  end
end;

procedure TfrCadastroProdutoTeste.bConsultarClick(Sender: TObject);
var
  wForm: TForm;
begin
  wForm := TfrConsultaProduto.Create(Self);
  wForm.ShowModal;
  if wForm.ModalResult = mrOk then
  begin
    dmAcademiaSci.cdsProduto.IndexFieldNames := 'BDCODPROD;BDCODCAT';
    if dmAcademiaSci.cdsProduto.FindKey(
    [StrToIntDef(eCodigoProduto.Text, 0), StrToIntDef(eCodigoCategoria.Text, 0)]) then
    begin
      eCodigoProduto.SetFocus();
      eCodigoProdutoExit(eCodigoProduto);
    end
  end;
  FreeAndNil(wForm)
end;

end.
