unit uRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmRelAbastecimento = class(TForm)
    dsListarRelatorio: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    rllTitulo: TRLLabel;
    rlgDia: TRLGroup;
    rlbDetalheDia: TRLBand;
    rldbDia: TRLDBText;
    rldbTanque: TRLDBText;
    rldbBomba: TRLDBText;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    rllValorComImposto: TRLLabel;
    rldbValorCobrado: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    rlbFoooterGrupoDia: TRLBand;
    rldbrSumValorCobrado: TRLDBResult;
    rllTotal: TRLLabel;
    procedure rldbrSumValorCobradoCompute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAbastecimento: TfrmRelAbastecimento;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmRelAbastecimento.rldbrSumValorCobradoCompute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value     := DM.qryListar.FieldByName('VALORCOBRADO').AsCurrency;
  ComputeIt := True;
end;

end.
