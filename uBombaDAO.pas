unit uBombaDAO;

interface
  uses
    uBombaModel, System.SysUtils, System.Classes, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
    FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.Dialogs;
  type
     TBombaDAO = class

    public
      function Save(BombaModel: TBombaModel): Boolean;
      procedure FindAll();
      function FindById(BombaModel: TBombaModel): TBombaModel;
      function FindByName(BombaModel: TBombaModel): TBombaModel;
    end;

implementation

uses uDM;

function TBombaDAO.Save(BombaModel: TBombaModel): Boolean;
const
  cSalvarBomba : String = 'INSERT INTO BOMBA (            '+
                          'NOMEBOMBA, TIPOCOMBUSTIVEL     '+
                          ')VALUES(                       '+
                          ':PNOMEBOMBA, :PTIPOCOMBUSTIVEL)';
begin
  try
    DM.qrySalvar.Close;
    DM.qrySalvar.SQL.Clear;
    DM.qrySalvar.SQL.Add(cSalvarBomba);
    DM.qrySalvar.ParamByName('PNOMEBOMBA').AsString        := BombaModel.NomeBomba;
    DM.qrySalvar.ParamByName('PTIPOCOMBUSTIVEL').AsString  := BombaModel.TipoCombustivel;
    DM.qrySalvar.ExecSQL;
  except on E : Exception do
    ShowMessage('Não foi possível salvar a bomba' + #13 + E.Message);
  end;
end;

procedure TBombaDAO.FindAll();
begin
  try
    DM.qryListar.Close;
    DM.qryListar.SQL.Clear;
    DM.qryListar.SQL.Add('SELECT * FROM BOMBA');
    DM.qryListar.Open();
  except on E : Exception do
    ShowMessage('Não foi possível listar todas as bombas' + #13 + E.Message);
  end;
end;

function TBombaDAO.FindById(BombaModel: TBombaModel): TBombaModel;
var
  BombaMdl  : TBombaModel;
begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add('SELECT * FROM BOMBA WHERE IDBOMBA=:PIDBOMBA');
      DM.qryListar.ParamByName('PIDBOMBA').AsInteger  := BombaModel.IdBomba;
      DM.qryListar.Open();

      BombaMdl := TBombaModel.Create;
      BombaMdl.IdBomba          := DM.qryListar.FieldByName('IDBOMBA').AsInteger;
      BombaMdl.NomeBomba        := DM.qryListar.FieldByName('NOMEBOMBA').AsString;
      BombaMdl.TipoCombustivel  := DM.qryListar.FieldByName('TIPOCOMBUSTIVEL').AsString;
    except on E : Exception do
      ShowMessage('Não foi possível listar a bomba pelo id' + #13 + E.Message);
    end;
  finally
    result := BombaMdl;
  end;
end;

function TBombaDAO.FindByName(BombaModel: TBombaModel): TBombaModel;
var
  BombaMdl  : TBombaModel;

begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add('SELECT * FROM BOMBA WHERE NOMEBOMBA =:PNOMEBOMBA');
      DM.qryListar.ParamByName('PNOMEBOMBA').AsString  := BombaModel.NomeBomba;
      DM.qryListar.Open();

      BombaMdl := TBombaModel.Create;
      BombaMdl.IdBomba          := DM.qryListar.FieldByName('IDBOMBA').AsInteger;
      BombaMdl.NomeBomba        := DM.qryListar.FieldByName('NOMEBOMBA').AsString;
      BombaMdl.TipoCombustivel  := DM.qryListar.FieldByName('TIPOCOMBUSTIVEL').AsString;

    except on E : Exception do
      ShowMessage('Não foi possível listar a bomba pelo nome' + #13 + E.Message);
    end;
  finally
    result := BombaMdl;
  end;
end;

end.
