unit uCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TfrCadastroCliente = class(TForm)
    lCodigoCliente: TLabel;
    lCnpj: TLabel;
    lCpf: TLabel;
    lNomeCliente: TLabel;
    eCodigoCliente: TEdit;
    bSalvar: TButton;
    bExcluir: TButton;
    bConsultar: TButton;
    eCnpjCliente: TEdit;
    eCpfCliente: TEdit;
    eNomeCliente: TEdit;
    lEndereco: TLabel;
    lTelefone: TLabel;
    eEnderecoCliente: TEdit;
    eTelefoneCliente: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bSalvarClick(Sender: TObject);
    procedure bExcluirClick(Sender: TObject);
    procedure eCodigoClienteExit(Sender: TObject);
    procedure bConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroCliente: TfrCadastroCliente;

implementation

uses uDmAcademiaSci, uConsultaCliente;

{$R *.dfm}

procedure TfrCadastroCliente.FormCreate(Sender: TObject);
begin
  dmAcademiaSci.cdsCliente.IndexDefs.Clear;
  dmAcademiaSci.cdsCliente.IndexDefs.Add('iCODCLI', 'BDCODCLI', [ixCaseInsensitive]);
  dmAcademiaSci.cdsCliente.Open;
end;

procedure TfrCadastroCliente.bSalvarClick(Sender: TObject);
begin
begin
  dmAcademiaSci.cdsCliente.IndexFieldNames := 'BDCODCLI';
  if dmAcademiaSci.cdsCliente.FindKey([StrToIntDef(eCodigoCliente.Text, 0)]) then
    dmAcademiaSci.cdsCliente.Edit
  else
  begin
    dmAcademiaSci.cdsCliente.Insert;
    dmAcademiaSci.cdsCliente.FieldByName('BDCODCLI').AsInteger := StrToIntDef(eCodigoCliente.Text, 0)
  end;

  dmAcademiaSci.cdsCliente.FieldByName('BDNOMECLI').AsString := eNomeCliente.Text;
  dmAcademiaSci.cdsCliente.FieldByName('BDCNPJCLI').AsString := eCnpjCliente.Text;
  dmAcademiaSci.cdsCliente.FieldByName('BDCPFCLI').AsString := eCpfCliente.Text;
  dmAcademiaSci.cdsCliente.FieldByName('BDENDERECOCLI').AsString := eEnderecoCliente.Text;
  dmAcademiaSci.cdsCliente.FieldByName('BDFONECLI').AsString := eTelefoneCliente.Text;
  dmAcademiaSci.cdsCliente.Post;
  dmAcademiaSci.cdsCliente.ApplyUpdates(0);
  dmAcademiaSci.cdsCliente.Refresh;

  eCodigoCliente.Clear;
  eNomeCliente.Clear;
  eCnpjCliente.Clear;
  eCpfCliente.Clear;
  eEnderecoCliente.Clear;
  eTelefoneCliente.Clear;

  ShowMessage('Cliente Cadastrado com Sucesso');

  eCodigoCliente.SetFocus;
end;
end;

procedure TfrCadastroCliente.bExcluirClick(Sender: TObject);
begin
if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmAcademiaSci.cdsCliente.IndexFieldNames := 'BDCODCLI';
    if dmAcademiaSci.cdsCliente.FindKey([StrToInt(eCodigoCliente.Text)]) then
    begin
      dmAcademiaSci.cdsCliente.Delete;
      dmAcademiaSci.cdsCliente.ApplyUpdates(0);
      dmAcademiaSci.cdsCliente.Refresh;

      eCodigoCliente.Clear;
      eNomeCliente.Clear;
      eCnpjCliente.Clear;
      eCpfCliente.Clear;
      eEnderecoCliente.Clear;
      eTelefoneCliente.Clear;

      ShowMessage('Cliente Deletado com Sucesso');

      eCodigoCliente.SetFocus;
    end
    else
      ShowMessage('Cliente Não Existe')
  end;
end;

procedure TfrCadastroCliente.eCodigoClienteExit(Sender: TObject);
begin
  dmAcademiaSci.cdsCliente.IndexFieldNames := 'BDCODCLI';
  if dmAcademiaSci.cdsCliente.FindKey(
  [StrToIntDef(eCodigoCliente.Text, 0)]) then
  begin
    eNomeCliente.Text := dmAcademiaSci.cdsCliente.FieldByName('BDNOMECLI').AsString;
    eCnpjCliente.Text := dmAcademiaSci.cdsCliente.FieldByName('BDCNPJCLI').AsString;
    eCpfCliente.Text := dmAcademiaSci.cdsCliente.FieldByName('BDCPFCLI').AsString;
    eEnderecoCliente.Text := dmAcademiaSci.cdsCliente.FieldByName('BDENDERECOCLI').AsString;
    eTelefoneCliente.Text := dmAcademiaSci.cdsCliente.FieldByName('BDFONECLI').AsString;
  end
  else
  begin
    eNomeCliente.Clear;
    eCnpjCliente.Clear;
    eCpfCliente.Clear;
    eEnderecoCliente.Clear;
    eTelefoneCliente.Clear;
  end
end;

procedure TfrCadastroCliente.bConsultarClick(Sender: TObject);
var
  wForm: TForm;
begin
    wForm := TfrConsultaCliente.Create(Self);
    wForm.ShowModal;
    if wForm.ModalResult = mrOk then
    begin
      eCodigoCliente.Text := dmAcademiaSci.cdsCliente.FieldByName('BDCODCLI').AsString;
      eCodigoCliente.SetFocus();
      eCodigoClienteExit(eCodigoCliente);
    end;
    FreeAndNil(wForm)
end;

end.
