unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
  Conn.Params.DriverID  := 'FB';
  Conn.Params.Database  := 'localhost/3050:D:\Testes\Fortes Informática\Win32\Debug\DB\DBPostoABC.fdb';
  Conn.Params.UserName  := 'SYSDBA';
  Conn.Params.Password  := 'masterkey';
  Conn.Connected        := true;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Conn.Connected  := false;
end;

end.
