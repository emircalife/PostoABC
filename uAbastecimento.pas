unit uAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmAbastecimento = class(TForm)
    lblLitros: TLabel;
    lblValorAbastecido: TLabel;
    edtLitros: TEdit;
    edtValorAbastecido: TEdit;
    btnAbastecer: TBitBtn;
    btnCancelar: TBitBtn;
    procedure edtLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure edtLitrosExit(Sender: TObject);
    procedure edtValorAbastecidoExit(Sender: TObject);
    procedure edtValorAbastecidoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAbastecerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Litros : Currency;
    ValorAbastecido : Currency;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

procedure TfrmAbastecimento.btnAbastecerClick(Sender: TObject);
begin
  if(edtLitros.Text <> EmptyStr) and (edtValorAbastecido.Text <> EmptyStr) then
  begin
    Litros          := StrToCurr(StringReplace(edtLitros.text, '.', '', [rfReplaceAll]));
    ValorAbastecido := StrToCurr(StringReplace(edtValorAbastecido.text, '.', '', [rfReplaceAll]));
  end
  else
  begin
    Litros          := 0.00;
    ValorAbastecido := 0.00;
  end;

  Close();
end;

procedure TfrmAbastecimento.btnCancelarClick(Sender: TObject);
begin
  Litros          := 0.00;
  ValorAbastecido := 0.00;

  Close();
end;

procedure TfrmAbastecimento.edtLitrosExit(Sender: TObject);
begin
  try
    if edtLitros.Text <> EmptyStr then
      edtLitros.Text:=FormatFloat('.00',strtofloat(edtLitros.Text));
  except
    on econverterror do
    begin
      showmessage('número inválido');
      edtLitros.SetFocus;
    end;
  end;
end;

procedure TfrmAbastecimento.edtLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

  if not (key in ['0'..'9']) and (key <> ',') Then
    key :=  #0;
end;

procedure TfrmAbastecimento.edtValorAbastecidoExit(Sender: TObject);
begin
  try
    if edtValorAbastecido.Text <> EmptyStr then
      edtValorAbastecido.Text:=FormatFloat('.00',strtofloat(edtValorAbastecido.Text));
  except
    on econverterror do
    begin
      showmessage('número inválido');
      edtValorAbastecido.SetFocus;
    end;
  end;
end;

procedure TfrmAbastecimento.edtValorAbastecidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

  if not (key in ['0'..'9']) and (key <> ',') Then
    key :=  #0;
end;

end.
