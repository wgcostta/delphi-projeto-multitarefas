unit MAIN;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.Buttons,
  Winapi.Messages,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdActns,
  Vcl.ActnList,
  Vcl.ToolWin,
  Vcl.ImgList,
  System.ImageList,
  System.Actions,
  ufTarefa1,
  ufTarefa2,
  CHILDWIN,
  ufTarefa3;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog: TOpenDialog;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    ImageList1: TImageList;
    Tarefas: TMenuItem;
    ftarefa1: TMenuItem;
    fTarefa2: TMenuItem;
    ACT_TAREFAS01: TAction;
    ACT_TAREFAS02: TAction;
    ACT_TAREFAS03: TAction;
    arefa031: TMenuItem;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure ACT_TAREFAS01Execute(Sender: TObject);
    procedure ACT_TAREFAS02Execute(Sender: TObject);
    procedure ACT_TAREFAS03Execute(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses About;

procedure TMainForm.ACT_TAREFAS01Execute(Sender: TObject);
var
  Child: TTarefa1;
begin
    Child := TTarefa1.Create(Application);

    Child.Caption := Name;
    if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;

procedure TMainForm.ACT_TAREFAS02Execute(Sender: TObject);
var
  Child: TTarefa2;
begin
    Child := TTarefa2.Create(Application);
    Child.Caption := Name;
    if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;

procedure TMainForm.ACT_TAREFAS03Execute(Sender: TObject);
var
  Child: TTarefa3;
begin
    Child := TTarefa3.Create(Application);
    Child.Caption := Name;
    if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  { create a new MDI child window }
  Child := TMDIChild.Create(Application);
  Child.Caption := Name;
  if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('NONAME' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

end.
