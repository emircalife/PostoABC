unit uAbastecimentoModel;

interface
  Type
  TAbastecimentoModel = class
    private
      FIdAbastecimento: integer;
      FValorImposto: currency;
      FDia: tdate;
      FIdBomba: integer;
      FLitros: currency;
      FValorAbastecido: currency;

      function GetIdAbastecimento: integer;
      function GetValorImposto: currency;
      function GetDia: tdate;
      function GetIdBomba: integer;
      function GetLitros: currency;
      function GetValorAbastecido: currency;

      procedure SetIdAbastecimento(const Value: integer);
      procedure SetValorImposto(const Value: currency);
      procedure SetDia(const Value: tdate);
      procedure SetIdBomba(const Value: integer);
      procedure SetLitros(const Value: currency);
      procedure SetValorAbastecido(const Value: currency);

    public
      property IdAbastecimento : integer read GetIdAbastecimento write SetIdAbastecimento;
      property ValorImposto : currency read GetValorImposto write SetValorImposto;
      property Dia : tdate read GetDia write SetDia;
      property IdBomba : integer read GetIdBomba write SetIdBomba;
      property Litros : currency read GetLitros write SetLitros;
      property ValorAbastecido : currency read GetValorAbastecido write SetValorAbastecido;
   end;

implementation


function TAbastecimentoModel.GetIdAbastecimento: integer;
begin
  Result := FIdAbastecimento;
end;

function TAbastecimentoModel.GetValorImposto: currency;
begin
  Result := FValorImposto;
end;

function TAbastecimentoModel.GetDia: tdate;
begin
  Result := FDia;
end;

function TAbastecimentoModel.GetIdBomba: integer;
begin
  Result := FIdBomba;
end;

function TAbastecimentoModel.GetLitros: currency;
begin
  Result := FLitros;
end;

function TAbastecimentoModel.GetValorAbastecido: currency;
begin
  Result := FValorAbastecido;
end;



procedure TAbastecimentoModel.SetIdAbastecimento(const Value: integer);
begin
  FIdAbastecimento := Value;
end;

procedure TAbastecimentoModel.SetValorImposto(const Value: currency);
begin
  FValorImposto := Value;
end;

procedure TAbastecimentoModel.SetDia(const Value: tdate);
begin
  FDia := Value;
end;

procedure TAbastecimentoModel.SetIdBomba(const Value: integer);
begin
  FIdBomba := Value;
end;

procedure TAbastecimentoModel.SetLitros(const Value: currency);
begin
  FLitros := Value;
end;

procedure TAbastecimentoModel.SetValorAbastecido(const Value: currency);
begin
  FValorAbastecido := Value;
end;

end.
