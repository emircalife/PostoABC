unit uTanqueDAO;

interface
  uses
    uTanqueModel, System.SysUtils, System.Classes, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
    FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.Dialogs;
  type
     TTanqueDAO = class

    public
      var
        conn : TFDConnection;

      function Save(TanqueModel: TTanqueModel): Boolean;
      procedure FindAll();
      function FindById(TanqueModel: TTanqueModel): TTanqueModel;
      function FindByName(TanqueModel: TTanqueModel): TTanqueModel;
    end;

implementation

uses uDM;

function TTanqueDAO.Save(TanqueModel: TTanqueModel): Boolean;
const
  cSalvarBomba : String = 'INSERT INTO TANQUE (  '+
                          'NOMETANQUE, BOMBA     '+
                          ')VALUES(              '+
                          ':PNOMETANQUE, :PBOMBA)';

begin
  try
    DM.qrySalvar.Close;
    DM.qrySalvar.SQL.Clear;
    DM.qrySalvar.SQL.Add(cSalvarBomba);
    DM.qrySalvar.ParamByName('PNOMETANQUE').AsString := TanqueModel.NomeTanque;
    DM.qrySalvar.ParamByName('PBOMBA').AsInteger     := TanqueModel.IdBomba;
    DM.qrySalvar.ExecSQL;
  except on E : Exception do
    ShowMessage('Não foi possível salvar o tanque' + #13 + E.Message);
  end;
end;

procedure TTanqueDAO.FindAll();
begin
  try
    DM.qryListar.Close;
    DM.qryListar.SQL.Clear;
    DM.qryListar.SQL.Add('SELECT * FROM TANQUE');
    DM.qryListar.Open();
  except on E : Exception do
    ShowMessage('Não foi possível listar todos os tanques' + #13 + E.Message);
  end;
end;

function TTanqueDAO.FindById(TanqueModel: TTanqueModel): TTanqueModel;
var
  TanqueMdl : TTanqueModel;
begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add('SELECT * FROM TANQUE ');
      DM.qryListar.SQL.Add('WHERE IDTANQUE =:PIDTANQUE ');
      DM.qryListar.SQL.Add('AND BOMBA =:PBOMBA');
      DM.qryListar.ParamByName('PIDTANQUE').AsInteger := TanqueModel.IdTanque;
      DM.qryListar.ParamByName('PBOMBA').AsInteger    := TanqueModel.IdBomba;

      DM.qryListar.Open();

      TanqueMdl := TTanqueModel.Create;
      TanqueMdl.IdTanque    :=  DM.qryListar.FieldByName('IDTANQUE').AsInteger;
      TanqueMdl.NomeTanque  :=  DM.qryListar.FieldByName('NOMETANQUE').AsString;
      TanqueMdl.IdBomba     :=  DM.qryListar.FieldByName('IDBOMBA').AsInteger;
    except on E : Exception do
      ShowMessage('Não foi possível listar o tanque pelo id' + #13 + E.Message);
    end;
  finally
    Result := TanqueMdl;
  end;
end;

function TTanqueDAO.FindByName(TanqueModel: TTanqueModel): TTanqueModel;
var
  TanqueMdl : TTanqueModel;

begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add('SELECT * FROM TANQUE ');
      DM.qryListar.SQL.Add('WHERE NOMETANQUE =:PNOMETANQUE ');
      DM.qryListar.SQL.Add('AND BOMBA =:PBOMBA ');
      DM.qryListar.ParamByName('PNOMETANQUE').AsString := TanqueModel.NomeTanque;
      DM.qryListar.ParamByName('PBOMBA').AsInteger     := TanqueModel.IdBomba;
      DM.qryListar.Open();

      TanqueMdl := TTanqueModel.Create;
      TanqueMdl.IdTanque    :=  DM.qryListar.FieldByName('IDTANQUE').AsInteger;
      TanqueMdl.NomeTanque  :=  DM.qryListar.FieldByName('NOMETANQUE').AsString;
      TanqueMdl.IdBomba     :=  DM.qryListar.FieldByName('BOMBA').AsInteger;

    except on E : Exception do
      ShowMessage('Não foi possível listar o tanque pelo nome' + #13 + E.Message);
    end;
  finally
    Result := TanqueMdl;
  end;
end;

end.
