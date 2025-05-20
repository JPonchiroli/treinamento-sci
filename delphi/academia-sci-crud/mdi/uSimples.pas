unit uSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ToolWin, ComCtrls;

type
  TfrSimples = class(TForm)
    tbFerramentas: TToolBar;
    imImages: TImageList;
    imHotImages: TImageList;
    imDisableImages: TImageList;
    tbConfirmar: TToolButton;
    tbExcluir: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frSimples: TfrSimples;

implementation

{$R *.dfm}

procedure TfrSimples.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrSimples.tbExcluirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrSimples.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    Close;
end;

end.
