program ProvaDelphiApp;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  ChildWin in 'ChildWin.pas' {MDIChild},
  ufTarefa1 in 'View\ufTarefa1.pas' {MDIChild1},
  ufTarefa3 in 'View\ufTarefa3.pas' {MDIChild2},
  ufTarefa2 in 'View\ufTarefa2.pas' {Tarefa2},
  sa.Tarefas.Controller in 'Controller\sa.Tarefas.Controller.pas',
  sa.Tarefas.Interfaces in 'Controller\sa.Tarefas.Interfaces.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
