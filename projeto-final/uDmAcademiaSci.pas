unit uDmAcademiaSci;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Dialogs, Forms, FMTBcd,
  DBClient, Provider;

type
  TdmAcademiaSci = class(TDataModule)
    SQLConnection: TSQLConnection;
    TPessoa: TSQLTable;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    TSala: TSQLTable;
    dspSala: TDataSetProvider;
    cdsSala: TClientDataSet;
    TEspacoCafe: TSQLTable;
    dspEspacoCafe: TDataSetProvider;
    cdsEspacoCafe: TClientDataSet;
    TEtapa: TSQLTable;
    dspEtapa: TDataSetProvider;
    cdsEtapa: TClientDataSet;
    qConsultaPessoa: TSQLQuery;
    dspConsultaPessoa: TDataSetProvider;
    cdsConsultaPessoa: TClientDataSet;
    qConsultaSala: TSQLQuery;
    dspConsultaSala: TDataSetProvider;
    cdsConsultaSala: TClientDataSet;
    qConsultaEspacoCafe: TSQLQuery;
    dspConsultaEspacoCafe: TDataSetProvider;
    cdsConsultaEspacoCafe: TClientDataSet;
    qConsultaEtapa: TSQLQuery;
    dspConsultaEtapa: TDataSetProvider;
    cdsConsultaEtapa: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAcademiaSci: TdmAcademiaSci;

implementation

{$R *.dfm}

procedure TdmAcademiaSci.DataModuleCreate(Sender: TObject);
begin
  SQLConnection.Close;

  SQLConnection.LoginPrompt := False;
  SQLConnection.ConnectionName := 'FBConnection';
  SQLConnection.DriverName := 'Firebird';
  SQLConnection.GetDriverFunc := 'getSQLDriverINTERBASE';
  SQLConnection.LibraryName := 'dbexpint.dll';//'dbxfb.dll';
  SQLConnection.VendorLib := 'fbembed.dll';

  SQLConnection.Params.Clear;
  SQLConnection.Params.Values['DriverName'] := 'Firebird';
  SQLConnection.Params.Values['Database'] := 'C:\Users\Prog11\Desktop\Projeto Final Academia\Projeto Final Academia\Banco\BANCO.fdb';
  SQLConnection.Params.Values['RoleName'] := EmptyStr;
  SQLConnection.Params.Values['User_Name'] := 'SYSDBA';
  SQLConnection.Params.Values['Password'] := 'masterkey';
  SQLConnection.Params.Values['ServerCharSet'] := 'WIN1252';
  SQLConnection.Params.Values['SQLDialect'] := '3';
  SQLConnection.Params.Values['ErrorResourceFile'] := EmptyStr;
  SQLConnection.Params.Values['LocaleCode'] := '0000';
  SQLConnection.Params.Values['BlobSize'] := '-1';
  SQLConnection.Params.Values['CommitRetain'] := 'True';
  SQLConnection.Params.Values['WaitOnLocks'] := 'True';
  SQLConnection.Params.Values['IsolationLevel'] := 'ReadCommitted';
  SQLConnection.Params.Values['Trim Char'] := 'False';

  SQLConnection.Open;

  if not SQLConnection.Connected then
  begin
    ShowMessage('Não foi possível conectar no banco.');
    Application.Terminate;
  end;
end;

end.
