unit uCadastroNotaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TfrCadastroNotaItem = class(TForm)
    eCodigoProduto: TEdit;
    eNumeroNota: TEdit;
    eQuantidadeVendida: TEdit;
    eValorUnitario: TEdit;
    lCodigoProduto: TLabel;
    lNumeroNota: TLabel;
    lQuantidadeVendida: TLabel;
    lPrecoUnitario: TLabel;
    bSalvar: TButton;
    bExcluir: TButton;
    bConsultar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bSalvarClick(Sender: TObject);
    procedure eCodigoProdutoExit(Sender: TObject);
    procedure bConsultarClick(Sender: TObject);
    procedure bExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroNotaItem: TfrCadastroNotaItem;

implementation

uses uDmAcademiaSci, uConsultaNotaItem;

{$R *.dfm}

procedure TfrCadastroNotaItem.FormCreate(Sender: TObject);
begin
  dmAcademiaSci.cdsNotaItem.IndexDefs.Clear;
  dmAcademiaSci.cdsNotaItem.IndexDefs.Add('iCODPROD_NUMNOTA', 'BDCODPROD;BDNUMNOTA', [ixCaseInsensitive]);
  dmAcademiaSci.cdsNotaItem.Open;
end;

procedure TfrCadastroNotaItem.bSalvarClick(Sender: TObject);
begin
  dmAcademiaSci.cdsNotaItem.IndexFieldNames := 'BDCODPROD;BDNUMNOTA';
  if dmAcademiaSci.cdsNotaItem.FindKey(
  [StrToIntDef(eCodigoProduto.Text, 0), StrToIntDef(eNumeroNota.Text, 0)]) then
    dmAcademiaSci.cdsNotaItem.Edit
  else
  begin
    dmAcademiaSci.cdsNotaItem.Insert;
    dmAcademiaSci.cdsNotaItem.FieldByName('BDCODPROD').AsInteger := StrToIntDef(eCodigoProduto.Text, 0);
    dmAcademiaSci.cdsNotaItem.FieldByName('BDNUMNOTA').AsInteger := StrToIntDef(eNumeroNota.Text, 0);
  end;

  dmAcademiaSci.cdsNotaItem.FieldByName('BDQTDVENDIDA').AsInteger := StrToIntDef(eQuantidadeVendida.Text, 0);
  dmAcademiaSci.cdsNotaItem.FieldByName('BDVALORUNI').AsFloat := StrToFloatDef(eValorUnitario.Text, 0);
  dmAcademiaSci.cdsNotaItem.Post;
  dmAcademiaSci.cdsNotaItem.ApplyUpdates(0);
  dmAcademiaSci.cdsNotaItem.Refresh;

  eCodigoProduto.Clear;
  eNumeroNota.Clear;
  eQuantidadeVendida.Clear;
  eValorUnitario.Clear;

  ShowMessage('Item de Nota Criado com Sucesso');
end;



procedure TfrCadastroNotaItem.eCodigoProdutoExit(Sender: TObject);
begin
  dmAcademiaSci.cdsNotaItem.IndexFieldNames := 'BDCODPROD;BDNUMNOTA';
  if dmAcademiaSci.cdsNotaItem.FindKey(
  [StrToIntDef(eCodigoProduto.Text, 0),
   StrToIntDef(eNumeroNota.Text, 0)]) then
  begin
    eQuantidadeVendida.Text := dmAcademiaSci.cdsNotaItem.FieldByName('BDQTDVENDIDA').AsString;
    eValorUnitario.Text := dmAcademiaSci.cdsNotaItem.FieldByName('BDVALORUNI').AsString;
  end
  else
  begin
    eQuantidadeVendida.Clear;
    eValorUnitario.Clear;
  end;
end;

procedure TfrCadastroNotaItem.bExcluirClick(Sender: TObject);
begin
if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmAcademiaSci.cdsNotaItem.IndexFieldNames := 'BDCODPROD;BDNUMNOTA';
    if dmAcademiaSci.cdsNotaItem.FindKey(
    [StrToIntDef(eCodigoProduto.Text, 0),
     StrToIntDef(eNumeroNota.Text, 0)]) then
    begin
      dmAcademiaSci.cdsNotaItem.Delete;
      dmAcademiaSci.cdsNotaItem.ApplyUpdates(0);
      dmAcademiaSci.cdsNotaItem.Refresh;
                                            
      eCodigoProduto.Clear;
      eNumeroNota.Clear;
      eQuantidadeVendida.Clear;
      eValorUnitario.Clear;

      ShowMessage(' Deletado com Sucesso');

      eCodigoProduto.SetFocus;
    end
    else
      ShowMessage('Item de Nota Não Existe')
  end;
end;

procedure TfrCadastroNotaItem.bConsultarClick(Sender: TObject);
var
  wForm: TForm;
begin
  wForm := TfrConsultaNotaItem.Create(Self);
  wForm.ShowModal;
  if wForm.ModalResult = mrOk then
  begin
    dmAcademiaSci.cdsNotaItem.IndexFieldNames := ';BDCODPROD;BDNUMNOTA';
    if dmAcademiaSci.cdsNotaItem.FindKey(
    [StrToIntDef(eCodigoProduto.Text, 0),
     StrToIntDef(eNumeroNota.Text, 0)]) then
    begin
      eCodigoProduto.SetFocus();
      eCodigoProdutoExit(eCodigoProduto);
    end;
  end;
  FreeAndNil(wForm)
end;

end.
