unit uspQuery;

interface


uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.Classes,
  FireDAC.VCLUI.Wait;


type
  TspQuery = class(TFDQuery)
  private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;

    { private declarations }
  protected
    { protected declarations }
  public
    function GeraSQL : string;
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
    { public declarations }
  published
    property spCondicoes: TStringList read FspCondicoes write FspCondicoes;
    property spColunas: TStringList read FspColunas write FspColunas;
    property spTabelas: TStringList read FspTabelas write FspTabelas;
    { published declarations }
  end;





implementation

uses
   SysUtils;

{ TspQuery }
constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  spCondicoes := TStringList.Create;
  spColunas   := TStringList.Create;
  spTabelas   := TStringList.Create;

end;

destructor TspQuery.Destroy;
begin
  spCondicoes.Free;
  spColunas.Free;
  spTabelas.Free;
  inherited;
end;

function TspQuery.GeraSQL : string;
var
  iContador : Integer;
begin
   Self.SQL.Text := EmptyStr;

    if spTabelas.Count > 1 then
       raise Exception.Create('Não permitido informar mais de uma tabela.')
    else if spTabelas.Count = 0 then
       raise Exception.Create('Necessário informar uma tabela.');

    if spColunas.Count = 0 then
       spColunas.Text := 'SELECT *'
    else
       spColunas[0] := 'SELECT ' +  spColunas[0];

     for iContador := 0 to Pred(spColunas.Count) do
     begin
        if Self.SQL.Text <> EmptyStr then
           Self.SQL.Text := Self.SQL.Text + ',' + sLineBreak;

         Self.SQL.Text := Self.SQL.Text + spColunas[iContador]
     end;

     Self.SQL.Text := Self.SQL.Text + ' FROM ' + spTabelas[0];

     for iContador := 0 to Pred(spCondicoes.Count) do
     begin
        if spCondicoes[iContador] <> EmptyStr then
        begin
          if iContador = 0 then
             Self.SQL.Text := Self.SQL.Text + ' WHERE ' + spCondicoes[iContador]
          else
             Self.SQL.Text := Self.SQL.Text + ' AND ' + spCondicoes[iContador]
        end;
     end;

     Self.SQL.Text := StringReplace(AnsiUpperCase(Self.SQL.Text),',,',',',[rfReplaceAll,rfIgnoreCase]);
     Result := Self.SQL.Text;
end;



end.
