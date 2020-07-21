unit sa.Tarefas.Interfaces;

interface

uses
  Datasnap.DBClient;

type
  ISaTarefasController = interface
    ['{DCA4C64D-3517-4E5E-BD18-DB0FC4F57BF0}']
     function setDataSet(var cdsRegistros : TClientDataSet) : ISaTarefasController;
     function calcularDivisoes : string;
     function carregarRegistros : TClientDataSet;
     function calcularValorTotal : string;
  end;

implementation

end.
