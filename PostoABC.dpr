program PostoABC;

uses
  Vcl.Forms,
  uPostoABC in 'uPostoABC.pas' {frmPostoABC},
  uTanqueModel in 'uTanqueModel.pas',
  uBombaModel in 'uBombaModel.pas',
  uAbastecimentoModel in 'uAbastecimentoModel.pas',
  uBombaDAO in 'uBombaDAO.pas',
  uTanqueDAO in 'uTanqueDAO.pas',
  uAbastecimentoDAO in 'uAbastecimentoDAO.pas',
  uAbastecimento in 'uAbastecimento.pas' {frmAbastecimento},
  uRelAbastecimento in 'uRelAbastecimento.pas' {frmRelAbastecimento},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPostoABC, frmPostoABC);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
