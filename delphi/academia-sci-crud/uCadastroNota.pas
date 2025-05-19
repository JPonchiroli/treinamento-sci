unit uCadastroNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TfrCadastroNota = class(TForm)
    eNumeroNota: TEdit;
    eCodigoCliente: TEdit;
    eCodigoLoja: TEdit;
    lNumeroNota: TLabel;
    lCodigoCliente: TLabel;
    lCodigoLoja: TLabel;
    bSalvar: TButton;
    bExcluir: TButton;
    bConsultar: TButton;
    bCancelar: TButton;
    lStatus: TLabel;
    eStatus: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bSalvarClick(Sender: TObject);
    procedure eNumeroNotaExit(Sender: TObject);
    procedure bConsultarClick(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure bExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroNota: TfrCadastroNota;

implementation

uses uDmAcademiaSci, uConsultaNota, uCancelamentoNota;

{$R *.dfm}

procedure TfrCadastroNota.FormCreate(Sender: TObject);
begin
  dmAcademiaSci.cdsNota.IndexDefs.Clear;
  dmAcademiaSci.cdsNota.IndexDefs.Add('iNUMNOTA', 'BDNUMNOTA', [ixCaseInsensitive]);
  dmAcademiaSci.cdsNota.Open;
end;

procedure TfrCadastroNota.bSalvarClick(Sender: TObject);
begin
  dmAcademiaSci.cdsNota.IndexFieldNames := 'BDNUMNOTA';
  if dmAcademiaSci.cdsNota.FindKey([StrToIntDef(eNumeroNota.Text, 0)]) then
    dmAcademiaSci.cdsNota.Edit
  else
  begin
    dmAcademiaSci.cdsNota.Insert;
    dmAcademiaSci.cdsNota.FieldByName('BDNUMNOTA').AsInteger := StrToIntDef(eNumeroNota.Text, 0)
  end;

  dmAcademiaSci.cdsNota.FieldByName('BDCODCLI').AsInteger := StrToIntDef(eCodigoCliente.Text, 0);
  dmAcademiaSci.cdsNota.FieldByName('BDCODLOJ').AsInteger := StrToIntDef(eCodigoLoja.Text, 0);
  dmAcademiaSci.cdsNota.FieldByName('BDDATAEMISSAONOTA').AsDateTime := Date;
  dmAcademiaSci.cdsNota.FieldByName('BDSTATUSNOTA').AsString := 'EMITIDA';
  dmAcademiaSci.cdsNota.Post;
  dmAcademiaSci.cdsNota.ApplyUpdates(0);
  dmAcademiaSci.cdsNota.Refresh;

  eNumeroNota.Clear;
  eCodigoCliente.Clear;
  eCodigoLoja.Clear;
  eStatus.Clear;

  ShowMessage('Nota Emitida com Sucesso');
end;

procedure TfrCadastroNota.bExcluirClick(Sender: TObject);
begin
if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmAcademiaSci.cdsNota.IndexFieldNames := 'BDNUMNOTA;BDCODCLI;BDCODLOJ';
    if dmAcademiaSci.cdsNota.FindKey(
    [StrToIntDef(eNumeroNota.Text, 0),
     StrToIntDef(eCodigoCliente.Text, 0),
     StrToIntDef(eCodigoLoja.Text, 0)]) then
    begin
      dmAcademiaSci.cdsNota.Delete;
      dmAcademiaSci.cdsNota.ApplyUpdates(0);
      dmAcademiaSci.cdsNota.Refresh;
                                            
      eNumeroNota.Clear;
      eCodigoCliente.Clear;
      eCodigoLoja.Clear;
      eStatus.Clear;

      ShowMessage('Nota Deletada com Sucesso');

      eNumeroNota.SetFocus;
    end
    else
      ShowMessage('Produto Não Existe')
  end;
end;

procedure TfrCadastroNota.eNumeroNotaExit(Sender: TObject);
begin
  dmAcademiaSci.cdsNota.IndexFieldNames := 'BDNUMNOTA;BDCODCLI;BDCODLOJ';
  if dmAcademiaSci.cdsNota.FindKey(
  [StrToIntDef(eNumeroNota.Text, 0),
   StrToIntDef(eCodigoCliente.Text, 0),
   StrToIntDef(eCodigoLoja.Text, 0)]) then
  begin
    eStatus.Text := dmAcademiaSci.cdsNota.FieldByName('BDSTATUSNOTA').AsString
  end
  else
    eStatus.Clear;
end;

procedure TfrCadastroNota.bCancelarClick(Sender: TObject);
begin
  frCancelamentoNota := TfrCancelamentoNota.Create(Self);
  frCancelamentoNota.ShowModal;
  FreeAndNil(frCancelamentoNota);
end;

procedure TfrCadastroNota.bConsultarClick(Sender: TObject);
var
  wForm: TForm;
begin
  wForm := TfrConsultaNota.Create(Self);
  wForm.ShowModal;
  if wForm.ModalResult = mrOk then
  begin
    dmAcademiaSci.cdsNota.IndexFieldNames := 'BDNUMNOTA;BDCODCLI;BDCODLOJ';
    if dmAcademiaSci.cdsNota.FindKey(
    [StrToIntDef(eNumeroNota.Text, 0),
     StrToIntDef(eCodigoCliente.Text, 0),
     StrToIntDef(eCodigoLoja.Text, 0)]) then
    begin
      eNumeroNota.SetFocus();
      eNumeroNotaExit(eNumeroNota);
    end;
  end;
  FreeAndNil(wForm)
end;

end.
