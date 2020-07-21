unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ChildWin, Vcl.StdCtrls, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList;

type
  TTarefa2 = class(TMDIChild)
    edtTempo: TEdit;
    edtContadorThread: TEdit;
    ProgressBar1: TProgressBar;
    btnIniciar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ActionList1: TActionList;
    ACT_INICIAR: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtContadorThreadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTempoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ACT_INICIARExecute(Sender: TObject);
  private
    FMyThread: TThread;
    property  MyThread: TThread read FMyThread write FMyThread;
    procedure processarThread;
    procedure startProgressBar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa2: TTarefa2;

implementation

{$R *.dfm}

procedure TTarefa2.ACT_INICIARExecute(Sender: TObject);
begin
  inherited;
   processarThread;
end;

procedure TTarefa2.edtContadorThreadKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if Key = VK_RETURN then
      perform(WM_NEXTDLGCTL,0,0);
end;

procedure TTarefa2.edtTempoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if Key = VK_RETURN then
      perform(WM_NEXTDLGCTL,0,0);
end;

procedure TTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    MyThread.Terminate;

end;

procedure TTarefa2.processarThread;
var
  iContadorThread, iContadorMiliSegundos : Integer;
begin
   if edtContadorThread.Text = EmptyStr then
   begin
      ShowMessage('Informe a quantidade de Threads');
      edtContadorThread.SetFocus;
      Exit;
   end;

   if edtTempo.Text = EmptyStr then
   begin
      ShowMessage('Informe um tempo em milissegundos');
      edtTempo.SetFocus;
      Exit;
   end;

  ProgressBar1.Position :=  0;
  for iContadorThread := 0 to StrToInt(edtContadorThread.Text) do
  begin
      try
        MyThread := TThread.CreateAnonymousThread(startProgressBar);
        MyThread.FreeOnTerminate := true;
        MyThread.Start;
     except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro no processamento');
        end;
     end;
  end;

end;

procedure TTarefa2.startProgressBar;
var
  iContador, iValorMaximo : Integer;
begin
   randomize;
   iValorMaximo := 0;
   iValorMaximo := Round(100 / StrToInt(edtContadorThread.Text));
   Memo1.lines.Add(FMyThread.ThreadID.ToString + ' - Iniciando processamento');
   for iContador := 0 to iValorMaximo do
   begin
      sleep(Round(random(StrToInt(edtTempo.Text))));
      ProgressBar1.Position := ProgressBar1.Position + iContador;
   end;
   Memo1.lines.Add(FMyThread.ThreadID.ToString + ' - Processamento Finalizado');
end;

end.
