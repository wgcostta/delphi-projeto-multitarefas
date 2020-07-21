unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ChildWin, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TTarefa2 = class(TMDIChild)
    edtTempo: TEdit;
    edtContadorThread: TEdit;
    ProgressBar1: TProgressBar;
    btnIniciar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TTarefa2.btnIniciarClick(Sender: TObject);
begin
  inherited;
   processarThread;
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
   if edtTempo.Text = EmptyStr then
   begin
      ShowMessage('Informe um tempo em MiliSegundos');
      edtTempo.SetFocus;
   end;

   if edtContadorThread.Text = EmptyStr then
   begin
      ShowMessage('Informe a quantidade de Threads');
      edtContadorThread.SetFocus;
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
