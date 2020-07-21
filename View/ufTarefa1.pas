unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ChildWin, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery, FireDAC.Phys.MySQLDef, FireDAC.Phys,
  FireDAC.Phys.MySQL, System.Actions, Vcl.ActnList;

type
  TTarefa1 = class(TMDIChild)
    memoColunas: TMemo;
    memoTabelas: TMemo;
    memoCondicoes: TMemo;
    btnGerarSQL: TButton;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblGerarSQL: TLabel;
    spQuery1: TspQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    ActionList1: TActionList;
    ACT_GERARSQL: TAction;
    procedure ACT_GERARSQLExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TTarefa1;

implementation

{$R *.dfm}

procedure TTarefa1.ACT_GERARSQLExecute(Sender: TObject);
begin
  inherited;
    try
    Memo1.Text := '';
    spQuery1.spColunas.Text := memoColunas.Text;
    spQuery1.spTabelas.Text := memoTabelas.Text;
    spQuery1.spCondicoes.Text := memoCondicoes.Text;
    spQuery1.GeraSQL;
    Memo1.Text := spQuery1.SQL.Text;
  except
    on E: Exception do
    begin
      ShowMessage('Aten��o! ' + E.Message)
    end;
  end;
end;

end.
