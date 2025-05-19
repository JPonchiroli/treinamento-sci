unit uCadastroLoja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TfrCadastroLoja = class(TForm)
    eCodigoLoja: TEdit;
    eRazaoSocialLoja: TEdit;
    eCnpjLoja: TEdit;
    eEnderecoLoja: TEdit;
    eTelefoneLoja: TEdit;
    lCodigoLoja: TLabel;
    lRazaoSocialLoja: TLabel;
    lCnpjLoja: TLabel;
    lEnderecoLoja: TLabel;
    lTelefone: TLabel;
    bSalvar: TButton;
    bExcluir: TButton;
    bConsutlar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bSalvarClick(Sender: TObject);
    procedure bExcluirClick(Sender: TObject);
    procedure eCodigoLojaExit(Sender: TObject);
    procedure bConsutlarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroLoja: TfrCadastroLoja;

implementation

uses uDmAcademiaSci, uConsultaLoja;

{$R *.dfm}

procedure TfrCadastroLoja.FormCreate(Sender: TObject);
begin
  dmAcademiaSci.cdsLoja.IndexDefs.Clear;
  dmAcademiaSci.cdsLoja.IndexDefs.Add('iCODLOJ', 'BDCODLOJ', [ixCaseInsensitive]);
  dmAcademiaSci.cdsLoja.Open;
end;

procedure TfrCadastroLoja.bSalvarClick(Sender: TObject);
begin
  dmAcademiaSci.cdsLoja.IndexFieldNames := 'BDCODLOJ';
  if dmAcademiaSci.cdsLoja.FindKey([StrToIntDef(eCodigoLoja.Text, 0)]) then
    dmAcademiaSci.cdsLoja.Edit
  else
  begin
    dmAcademiaSci.cdsLoja.Insert;
    dmAcademiaSci.cdsLoja.FieldByName('BDCODLOJ').AsInteger := StrToIntDef(eCodigoLoja.Text, 0)
  end;

  dmAcademiaSci.cdsLoja.FieldByName('BDRAZAOSOCIALLOJ').AsString := eRazaoSocialLoja.Text;
  dmAcademiaSci.cdsLoja.FieldByName('BDCNPJLOJ').AsString := eCnpjLoja.Text;
  dmAcademiaSci.cdsLoja.FieldByName('BDENDERECOLOJ').AsString := eEnderecoLoja.Text;
  dmAcademiaSci.cdsLoja.FieldByName('BDFONELOJ').AsString := eTelefoneLoja.Text;
  dmAcademiaSci.cdsLoja.Post;
  dmAcademiaSci.cdsLoja.ApplyUpdates(0);
  dmAcademiaSci.cdsLoja.Refresh;

  eCodigoLoja.Clear;
  eRazaoSocialLoja.Clear;
  eCnpjLoja.Clear;
  eEnderecoLoja.Clear;
  eTelefoneLoja.Clear;

  ShowMessage('Loja Cadastrada com Sucesso');
end;

procedure TfrCadastroLoja.bExcluirClick(Sender: TObject);
begin
if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmAcademiaSci.cdsLoja.IndexFieldNames := 'BDCODLOJ';
    if dmAcademiaSci.cdsLoja.FindKey([StrToInt(eCodigoLoja.Text)]) then
    begin
      dmAcademiaSci.cdsLoja.Delete;
      dmAcademiaSci.cdsLoja.ApplyUpdates(0);
      dmAcademiaSci.cdsLoja.Refresh;

      eCodigoLoja.Clear;
      eRazaoSocialLoja.Clear;
      eCnpjLoja.Clear;
      eEnderecoLoja.Clear;
      eTelefoneLoja.Clear;

      ShowMessage('Loja Deletada com Sucesso');

      eCodigoLoja.SetFocus;
    end
    else
      ShowMessage('Loja Não Existe')
  end;
end;

procedure TfrCadastroLoja.eCodigoLojaExit(Sender: TObject);
begin
  dmAcademiaSci.cdsLoja.IndexFieldNames := 'BDCODLOJ';
  if dmAcademiaSci.cdsLoja.FindKey([StrToIntDef(eCodigoLoja.Text, 0)]) then
  begin
    eRazaoSocialLoja.Text := dmAcademiaSci.cdsLoja.FieldByName('BDRAZAOSOCIALLOJ').AsString;
    eCnpjLoja.Text := dmAcademiaSci.cdsLoja.FieldByName('BDCNPJLOJ').AsString;
    eEnderecoLoja.Text := dmAcademiaSci.cdsLoja.FieldByName('BDENDERECOLOJ').AsString;
    eTelefoneLoja.Text := dmAcademiaSci.cdsLoja.FieldByName('BDFONELOJ').AsString;
  end
  else
  begin
    eRazaoSocialLoja.Clear;
    eCnpjLoja.Clear;
    eEnderecoLoja.Clear;
    eTelefoneLoja.Clear;
  end;
end;

procedure TfrCadastroLoja.bConsutlarClick(Sender: TObject);
var
  wForm: TForm;
begin
  wForm := TfrConsultaLoja.Create(Self);
  wForm.ShowModal;
  if wForm.ModalResult = mrOk then
  begin
    eCodigoLoja.Text := dmAcademiaSci.cdsLoja.FieldByName('BDCODLOJ').AsString;
    eCodigoLoja.SetFocus();
    eCodigoLojaExit(eCodigoLoja);
  end;
  FreeAndNil(wForm)
end;

end.
