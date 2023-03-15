unit uBombaModel;

interface
  Type
  TBombaModel = class
    private
      // campos
      FIdBomba: integer;
      FNomeBomba: string;
      FTipoCombustivel: string;

      // getters
      function GetIdBomba: integer;
      function GetNomeBomba: string;
      function GetTipoCombustivel: string;

      // setters
      procedure SetIdBomba(const Value: integer);
      procedure SetNomeBomba(const Value: string);
      procedure SetTipoCombustivel(const Value: string);

    public
      // propriedades
      property IdBomba : integer read GetIdBomba write SetIdBomba;
      property NomeBomba : string read GetNomeBomba write SetNomeBomba;
      property TipoCombustivel : string read GetTipoCombustivel write SetTipoCombustivel;
   end;

implementation

function TBombaModel.GetIdBomba: integer;
begin
  Result := FIdBomba;
end;

function TBombaModel.GetNomeBomba: string;
begin
  Result := FNomeBomba;
end;

function TBombaModel.GetTipoCombustivel: string;
begin
  Result := FTipoCombustivel;
end;

procedure TBombaModel.SetIdBomba(const Value: integer);
begin
  FIdBomba := Value;
end;

procedure TBombaModel.SetNomeBomba(const Value: string);
begin
  FNomeBomba := Value;
end;

procedure TBombaModel.SetTipoCombustivel(const Value: string);
begin
  FTipoCombustivel := Value;
end;

end.
