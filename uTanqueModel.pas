unit uTanqueModel;

interface
  uses
    System.SysUtils, System.Classes, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
    FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.Dialogs;
  Type
   TTanqueModel = class
    private
      FIdTanque: integer;
      FNomeTanque: string;
      FIdBomba: integer;

      function GetIdTanque: integer;
      function GetNomeTanque: string;
      function GetIdBomba: integer;
      procedure SetIdTanque(const Value: integer);
      procedure SetNomeTanque(const Value: string);
      procedure SetIdBomba(const Value: integer);

    public
      property IdTanque : integer read GetIdTanque write SetIdTanque;
      property NomeTanque : string read GetNomeTanque write SetNomeTanque;
      property IdBomba : integer read GetIdBomba write SetIdBomba;
   end;

implementation

function TTanqueModel.GetIdTanque: integer;
begin
  Result := FIdTanque;
end;

function TTanqueModel.GetNomeTanque: string;
begin
  Result := FNomeTanque;
end;

function TTanqueModel.GetIdBomba: integer;
begin
  Result := FIdBomba;
end;

procedure TTanqueModel.SetIdTanque(const Value: integer);
begin
  FIdTanque := Value;
end;

procedure TTanqueModel.SetNomeTanque(const Value: string);
begin
  FNomeTanque := Value;
end;

procedure TTanqueModel.SetIdBomba(const Value: integer);
begin
  FIdBomba := Value;
end;

end.
