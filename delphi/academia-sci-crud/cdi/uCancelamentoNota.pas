unit uCancelamentoNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrCancelamentoNota = class(TForm)
    eDescricaoCancelamento: TEdit;
    Label1: TLabel;
    bSalvar: TButton;
    lNumeroNota: TLabel;
    lCodigoCliente: TLabel;
    lCodigoLoja: TLabel;
    eNumeroNota: TEdit;
    eCodigoCliente: TEdit;
    eCodigoLoja: TEdit;
    procedure bSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCancelamentoNota: TfrCancelamentoNota;

implementation

uses uDmAcademiaSci;

{$R *.dfm}

procedure TfrCancelamentoNota.bSalvarClick(Sender: TObject);
begin
  dmAcademiaSci.cdsNota.Edit;
  dmAcademiaSci.cdsNota.FieldByName('BDCODCLI').AsInteger := StrToIntDef(eCodigoCliente.Text, 0);
  dmAcademiaSci.cdsNota.FieldByName('BDCODLOJ').AsInteger := StrToIntDef(eCodigoLoja.Text, 0);
  dmAcademiaSci.cdsNota.FieldByName('BDDATAEMISSAONOTA').AsDateTime := Date;
  dmAcademiaSci.cdsNota.FieldByName('BDSTATUSNOTA').AsString := 'CANCELADA';
  dmAcademiaSci.cdsNota.FieldByName('BDDESCCANCELAMENTO').AsString := eDescricaoCancelamento.Text;
  dmAcademiaSci.cdsNota.FieldByName('BDDATACANCELAMENTO').AsDateTime := Date;
  dmAcademiaSci.cdsNota.Post;
  dmAcademiaSci.cdsNota.ApplyUpdates(0);
  dmAcademiaSci.cdsNota.Refresh;

  eNumeroNota.Clear;
  eCodigoCliente.Clear;
  eCodigoLoja.Clear;
  eDescricaoCancelamento.Clear;

  ShowMessage('Nota Cancelada com Sucesso');
end;

end.
