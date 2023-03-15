unit uPostoABC;

interface

uses
  uTanqueModel, uAbastecimentoModel, uBombaModel, uTanqueDAO, uAbastecimentoDAO,
  uBombaDAO, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPostoABC = class(TForm)
    imgBombaGasolina01: TImage;
    imgBombaGasolina02: TImage;
    imgBombaDiesel01: TImage;
    imgBombaDiesel02: TImage;
    lblBombaGasolina01: TLabel;
    lblBombaGasolina02: TLabel;
    lblBombaDiesel01: TLabel;
    lblBombaDiesel02: TLabel;
    btnListar: TBitBtn;
    procedure imgBombaGasolina01Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgBombaGasolina02Click(Sender: TObject);
    procedure imgBombaDiesel01Click(Sender: TObject);
    procedure imgBombaDiesel02Click(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
    nPercImposto : Currency;
    function CalculaImposto(nPercImposto:Currency; nValorCobrado: Currency):Currency;
    procedure Abastecer(cNomeTanque, cNomeBomba, cTipoCombustivel:String);
  public
    { Public declarations }
  end;

var
  frmPostoABC: TfrmPostoABC;

implementation

{$R *.dfm}

uses uAbastecimento, uRelAbastecimento, uDM;

procedure TfrmPostoABC.FormCreate(Sender: TObject);
begin
  nPercImposto := 13;
end;

procedure TfrmPostoABC.imgBombaDiesel01Click(Sender: TObject);
const
  NomeTanque      : String = 'Tanque 02';
  NomeBomba       : String = 'Bomba 03';
  TipoCombustivel : String = 'Diesel';

begin
  Abastecer(NomeTanque, NomeBomba, TipoCombustivel);
end;

procedure TfrmPostoABC.imgBombaDiesel02Click(Sender: TObject);
const
  NomeTanque      : String = 'Tanque 02';
  NomeBomba       : String = 'Bomba 04';
  TipoCombustivel : String = 'Diesel';

begin
  Abastecer(NomeTanque, NomeBomba, TipoCombustivel);
end;

procedure TfrmPostoABC.imgBombaGasolina01Click(Sender: TObject);
const
  NomeTanque      : String = 'Tanque 01';
  NomeBomba       : String = 'Bomba 01';
  TipoCombustivel : String = 'Gasolina';

begin
  Abastecer(NomeTanque, NomeBomba, TipoCombustivel);
end;

procedure TfrmPostoABC.imgBombaGasolina02Click(Sender: TObject);
const
  NomeTanque      : String = 'Tanque 01';
  NomeBomba       : String = 'Bomba 02';
  TipoCombustivel : String = 'Gasolina';

begin
  Abastecer(NomeTanque, NomeBomba, TipoCombustivel);
end;

procedure TfrmPostoABC.btnListarClick(Sender: TObject);
const
  cSQLRel : String = 'SELECT A.IDABASTECIMENTO, A.PERCIMPOSTO,         '+
                     '       A.DIA, A.LITROS, A.VALORABASTECIDO,       '+
                     '       T.IDTANQUE, T.NOMETANQUE,                 '+
                     '       B.IDBOMBA, B.NOMEBOMBA, B.TIPOCOMBUSTIVEL '+
                     ' FROM ABASTECIMENTO A                            '+
                     ' INNER JOIN BOMBA B ON (A.BOMBA = B.IDBOMBA)     '+
                     ' INNER JOIN TANQUE T ON (A.BOMBA = T.BOMBA)      '+
                     ' ORDER BY A.DIA, T.IDTANQUE, B.IDBOMBA,          '+
                     '          A.VALORABASTECIDO                      ';

begin
  try
    try
      DM.qryListar.Close;
      DM.qryListar.SQL.Clear;
      DM.qryListar.SQL.Add(cSQLRel);
      DM.qryListar.Open();
    except on E : Exception do
      ShowMessage('N�o foi poss�vel executar o relat�rio' + #13 + E.Message);
    end;

    frmRelAbastecimento := TfrmRelAbastecimento.Create(self);
    frmRelAbastecimento.RLReport1.Preview();
  finally
    FreeAndNil(frmRelAbastecimento);
  end;
{
  Relat�rio em que os abastecimentos fossem agrupados, exibindo o dia, o tanque,
    a bomba e o valor. E ao final do relat�rio a soma total do per�odo.
}
end;

function TfrmPostoABC.CalculaImposto(nPercImposto:Currency; nValorCobrado: Currency):Currency;
var
  valorImposto: Currency;
begin
  valorImposto  := (nPercImposto * nValorCobrado / 100);
  result := valorImposto;
end;

procedure TfrmPostoABC.Abastecer(cNomeTanque, cNomeBomba, cTipoCombustivel:String);
var
  BomBaModel: TBombaModel;
  BombaDAO: TBombaDAO;

  TanqueModel: TTanqueModel;
  TanqueDAO: TTanqueDAO;

  AbastecimentoModel: TAbastecimentoModel;
  AbastecimentoDAO: TAbastecimentoDAO;

begin
  frmAbastecimento := TfrmAbastecimento.Create(self);
  frmAbastecimento.Caption := 'Abastecimento de ' + cTipoCombustivel + ' no ' + cNomeTanque + ' da ' + cNomeBomba;
  frmAbastecimento.ShowModal;

  if(frmAbastecimento.Litros > 0.00) and (frmAbastecimento.ValorAbastecido > 0.00) then
  begin
    BomBaModel  := TBombaModel.Create;
    BombaDAO    := TBombaDAO.Create;

    BomBaModel.NomeBomba := cNomeBomba;
    BombaModel := BombaDAO.FindByName(BomBaModel);

    if(BombaModel.IdBomba <= 0)then
    begin
      BomBaModel.NomeBomba        := cNomeBomba;
      BombaModel.TipoCombustivel  := cTipoCombustivel;
      BombaDAO.Save(BombaModel);

      BomBaModel.NomeBomba := cNomeBomba;
      BombaModel := BombaDAO.FindByName(BomBaModel);
    end;

    TanqueModel := TTanqueModel.Create;
    TanqueDAO   := TTanqueDAO.Create;

    TanqueModel.NomeTanque  := cNomeBomba;
    TanqueModel.IdBomba     := BombaModel.IdBomba;
    TanqueModel := TanqueDAO.FindByName(TanqueModel);

    if(TanqueModel.IdTanque <= 0 )then
    begin
      BomBaModel := BombaDAO.FindByName(BomBaModel);

      TanqueModel.NomeTanque := cNomeTanque;
      TanqueModel.IdBomba := BomBaModel.IdBomba;
      TanqueDAO.Save(TanqueModel);

      TanqueModel.NomeTanque  := cNomeTanque;
      TanqueModel.IdBomba     := BombaModel.IdBomba;
      TanqueModel := TanqueDAO.FindByName(TanqueModel);
    end;

    AbastecimentoModel := TAbastecimentoModel.Create;
    AbastecimentoDAO   := TAbastecimentoDAO.Create;

    AbastecimentoModel.IdBomba          := BomBaModel.IdBomba;
    AbastecimentoModel.Dia              := Date();
    AbastecimentoModel.Litros           := frmAbastecimento.Litros;
    AbastecimentoModel.ValorAbastecido  := frmAbastecimento.ValorAbastecido;
    AbastecimentoModel.PercImposto      := CalculaImposto(nPercImposto, AbastecimentoModel.ValorAbastecido);

    AbastecimentoDAO.Save(AbastecimentoModel);

    FreeAndNil(frmAbastecimento);
  end;
end;

end.
