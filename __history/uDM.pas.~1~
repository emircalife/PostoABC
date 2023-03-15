unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, INIFiles, Winapi.Windows,
  Winapi.Messages, System.Variants, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TDM = class(TDataModule)
    Conn: TFDConnection;
    Tran: TFDTransaction;
    qryListar: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qrySalvar: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    var
      Database, cArquivoIni: String;
      procedure LerINI;
      procedure GravarINI;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  cArquivoIni := ExtractFilePath(ParamStr(0)) + 'Config.ini';

  if not FileExists(cArquivoIni) then
  begin
    GravarINI;
    Application.Terminate;
  end
  else
  begin
    LerINI;

    Conn.Params.DriverID  := 'FB';
    Conn.Params.Database  := 'localhost/3050:' + Database;
    Conn.Params.UserName  := 'SYSDBA';
    Conn.Params.Password  := 'masterkey';
    Conn.Connected        := true;
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Conn.Connected  := false;
end;

procedure TDM.LerINI;
var
  oArquivoINI: Tinifile;

begin
  oArquivoINI := Tinifile.Create(cArquivoIni);

  try
    Database  := oArquivoINI.ReadString('Servidor', 'Database', EmptyStr);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure TDM.GravarINI;
var
	oArquivoIni: TIniFile;

begin
	oArquivoIni := TIniFile.Create(cArquivoIni);

	try
    oArquivoIni.WriteString('Servidor', 'Database', '');
	finally
		FreeAndNil(oArquivoIni);
	end;

  ShowMessage('Va no arquivo ' + cArquivoIni + ', na linha Database=, acreccente o caminho e banco de dados. Ex: Database=D:\PostoABC\DB\DBPostoABC.fdb');
end;

end.
