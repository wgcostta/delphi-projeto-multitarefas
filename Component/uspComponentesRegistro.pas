unit uspComponentesRegistro;

interface

uses
  uspQuery,
  Vcl.OleServer,
  System.Classes;

type
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TspQuery = class;
{$ENDIF}
  TuspComponentesRegistro = class(TOleServer)
    private
  {$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TspQuery;
    function      GetServerProperties: TspQuery;
  {$ENDIF}
    public
      constructor Create(AOwner: TComponent);
      destructor Destroy; override;
    published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TspQuery read GetServerProperties;
{$ENDIF}

  end;

procedure Register;

resourcestring
  dtlServerPage = 'spComponentes';

implementation

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TspQuery]);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TuspComponentesRegistro.GetServerProperties: TspQuery;
begin
  Result := FProps;
end;
{$ENDIF}

constructor TuspComponentesRegistro.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TspQuery.Create(Self);
{$ENDIF}
end;

destructor TuspComponentesRegistro.Destroy;
begin

  inherited;
end;

end.
