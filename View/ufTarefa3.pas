unit ufTarefa3;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  ChildWin,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Datasnap.DBClient, sa.Tarefas.Controller, System.Actions, Vcl.ActnList;

type
  TTarefa3 = class(TMDIChild)
    edtTotalDivisoes: TEdit;
    edtTotal: TEdit;
    btnObterTotal: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    btnObterDivisoes: TButton;
    ActionList1: TActionList;
    ACT_OBTERTOTAL: TAction;
    ACT_CARREGARREGISTROS: TAction;
    ACT_OBTERDIVISOES: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ACT_OBTERTOTALExecute(Sender: TObject);
    procedure ACT_CARREGARREGISTROSExecute(Sender: TObject);
    procedure ACT_OBTERDIVISOESExecute(Sender: TObject);

  private
    cdsTarefas : TClientDataSet;
    dsTarefas  : TDataSource;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa3: TTarefa3;

implementation

{$R *.dfm}



procedure TTarefa3.ACT_CARREGARREGISTROSExecute(Sender: TObject);
begin
  inherited;
   TSaTarefasController.New
                    .setDataSet(cdsTarefas)
                    .carregarRegistros;

   dsTarefas.DataSet := cdsTarefas;
   DBGrid1.DataSource := dsTarefas;
end;

procedure TTarefa3.ACT_OBTERDIVISOESExecute(Sender: TObject);
begin
  inherited;
    edtTotalDivisoes.Text := TSaTarefasController.New
                              .setDataSet(cdsTarefas)
                              .calcularDivisoes;
end;

procedure TTarefa3.ACT_OBTERTOTALExecute(Sender: TObject);
begin
  inherited;
  edtTotal.Text := TSaTarefasController.New
                    .setDataSet(cdsTarefas)
                    .calcularValorTotal;
end;

procedure TTarefa3.FormCreate(Sender: TObject);
begin
  inherited;
   cdsTarefas := TClientDataSet.Create(Self);
   dsTarefas  := TDataSource.Create(Self);
end;

procedure TTarefa3.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(cdsTarefas);
   FreeAndNil(dsTarefas);
end;

procedure TTarefa3.FormShow(Sender: TObject);
begin
  inherited;
   ACT_CARREGARREGISTROS.Execute;
end;

end.
