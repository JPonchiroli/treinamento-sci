unit uEditNumerico;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TEditNumerico = class(TEdit)
  private
    FDecimal: Boolean;
    FSeparador: Char;
    function getCodigo: Integer;
    procedure setCodigo(const Value: Integer);
    function getValor: Extended;
    procedure setValor(const Value: Extended);
    { Private declarations }
  protected
    procedure KeyPress(var Key: Char); override;
    { Protected declarations }

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property Codigo: Integer read getCodigo write setCodigo;
    property Valor: Extended read getValor write setValor;

    property Decimal: Boolean read FDecimal write FDecimal;
    property Separador: Char read FSeparador write FSeparador;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Academia SCI', [TEditNumerico]);
end;

{ TEditNumerico }

constructor TEditNumerico.Create(AOwner: TComponent);
begin
  inherited;
  Decimal := False;
  Separador := ',';
  Text := EmptyStr;
end;

function TEditNumerico.getCodigo: Integer;
begin
  Result := StrToIntDef(Text, 0);
end;

function TEditNumerico.getValor: Extended;
begin
  Result := StrToFloatDef(Text, 0);
end;

procedure TEditNumerico.KeyPress(var Key: Char);
begin
  inherited;
  if Decimal then
  begin
    if Key = #46 then
       Key := Separador;

    if not (Key in['0'..'9', Chr(8), Separador]) then
       Key := #0
    else
    if (Key = Separador) and (Pos(Key, Text ) > 0) then
       Key := #0;
  end
  else
  begin
    if not (Key in ['0'..'9', Chr(8)]) then
       Key := #0;
  end;
end;

procedure TEditNumerico.setCodigo(const Value: Integer);
begin
  Text := IntToStr(Value);
end;

procedure TEditNumerico.setValor(const Value: Extended);
begin
  Text := FloatToStr(Value);
end;

end.
