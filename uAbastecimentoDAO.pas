unit uAbastecimentoDAO;

interface
  uses
    uAbastecimentoModel, System.SysUtils, System.Classes, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
    FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.Dialogs;
  type
     TAbastecimentoDAO = class

    public
      var
        conn : TFDConnection;

      function Save(AbastecimentoModel: TAbastecimentoModel): Boolean;
      procedure FindAll();
      function FindById(AbastecimentoModel: TAbastecimentoModel): TAbastecimentoModel;
      function FindByBomba(AbastecimentoModel: TAbastecimentoModel): boolean;
      function FindByDia(AbastecimentoModel: TAbastecimentoModel): boolean;
    end;

implementation

uses uDM;

function TAbastecimentoDAO.Save(AbastecimentoModel: TAbastecimentoModel): Boolean;
const
  cSalvarBomba : String = 'INSERT INTO ABASTECIMENTO (      '+
                          'VALORIMPOSTO, DIA, LITROS,       '+
                          'VALORABASTECIDO, BOMBA           '+
                          ')VALUES(                         '+
                          ':PVALORIMPOSTO, :PDIA, :PLITROS, '+
                          ':PVALORABASTECIDO, :PBOMBA )     ';

begin
  try
    DM.qrySalvar.Close;
    DM.qrySalvar.SQL.Clear;
    DM.qrySalvar.SQL.Add(cSalvarBomba);
    DM.qrySalvar.ParamByName('PVALORIMPOSTO').AsCurrency     := AbastecimentoModel.ValorImposto;
    DM.qrySalvar.ParamByName('PDIA').AsDate                  := AbastecimentoModel.Dia;
    DM.qrySalvar.ParamByName('PLITROS').AsCurrency           := AbastecimentoModel.Litros;
    DM.qrySalvar.ParamByName('PVALORABASTECIDO').AsCurrency  := AbastecimentoModel.ValorAbastecido;
    DM.qrySalvar.ParamByName('PBOMBA').AsInteger             := AbastecimentoModel.IdBomba;
    DM.qrySalvar.ExecSQL;
  except on E : Exception do
    ShowMessage('Não foi possível salvar o abastecimento' + #13 + E.Message);
  end;
end;

procedure TAbastecimentoDAO.FindAll();
begin
  try
    DM.qryListar.Close;
    DM.qryListar.SQL.Clear;
    DM.qryListar.SQL.Add('SELECT * FROM ABASTECIMENTO');
    DM.qryListar.Open();
  except on E : Exception do
    ShowMessage('Não foi possível listar todos os abastecimentos' +
      #13 + E.Message);
  end;
end;

function TAbastecimentoDAO.FindById(AbastecimentoModel: TAbastecimentoModel): TAbastecimentoModel;
var
  AbastecimentoMdl : TAbastecimentoModel;

begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add('SELECT * FROM ABASTECIMENTO ');
      DM.qryListar.SQL.Add('WHERE IDABASTECIMENTO =:PIDABASTECIMENTO');
      DM.qryListar.ParamByName('PIDABASTECIMENTO').AsInteger := AbastecimentoModel.IdAbastecimento;
      DM.qryListar.Open();

      AbastecimentoMdl := TAbastecimentoModel.Create;

      AbastecimentoMdl.ValorImposto     :=  DM.qryListar.FieldByName('VALORIMPOSTO').AsCurrency;
      AbastecimentoMdl.Dia              :=  DM.qryListar.FieldByName('DIA').AsDateTime;
      AbastecimentoMdl.Litros           :=  DM.qryListar.FieldByName('LITROS').AsCurrency;
      AbastecimentoMdl.ValorAbastecido  :=  DM.qryListar.FieldByName('VALORABASTECIDO').AsCurrency;
      AbastecimentoMdl.IdBomba          :=  DM.qryListar.FieldByName('BOMBA').AsInteger;
    except on E : Exception do
      ShowMessage('Não foi possível listar o abastecimento pelo id' +
        #13 + E.Message);
    end;
  finally
  end;
end;

function TAbastecimentoDAO.FindByBomba(AbastecimentoModel: TAbastecimentoModel): boolean;
var
  AbastecimentoMdl : TAbastecimentoModel;

begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add('SELECT * FROM ABASTECIMENTO ');
      DM.qryListar.SQL.Add('WHERE IDBOMBA =:PIDBOMBA');
      DM.qryListar.ParamByName('PIDBOMBA').AsInteger := AbastecimentoModel.IdBomba;
      DM.qryListar.Open();

    except on E : Exception do
      ShowMessage('Não foi possível listar todos os abastecimentos '+
        'da bomba selecionada' + #13 + E.Message);
    end;
  finally
    result := (DM.qryListar.RecordCount > 0);
  end;
end;

function TAbastecimentoDAO.FindByDia(AbastecimentoModel: TAbastecimentoModel): boolean;

begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add('SELECT * FROM ABASTECIMENTO ');
      DM.qryListar.SQL.Add('WHERE DIA =:PDIA');
      DM.qryListar.ParamByName('PDIA').AsDate := AbastecimentoModel.Dia;
      DM.qryListar.Open();
    except on E : Exception do
      ShowMessage('Não foi possível listar todos os abastecimentos '+
        'da data selecionada' + #13 + E.Message);
    end;
  finally
    result := (DM.qryListar.RecordCount > 0);
  end;
end;

end.
