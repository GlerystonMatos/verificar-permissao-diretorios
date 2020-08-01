unit DgVerificarPermissaoDiretorios;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  KrVerificarPermissaoDiretorios, System.SysUtils;

type
  TfrmDgVerificarPermissaoDiretorios = class(TForm)
    btnIniciarVerificacao: TBitBtn;
    pbProgresso: TProgressBar;
    mAcessoliberado: TMemo;
    lbAcessoliberado: TLabel;
    mAcessoBloqueado: TMemo;
    lbAcessoBloqueado: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIniciarVerificacaoClick(Sender: TObject);
  private
    { Private declarations }
    FDiretorioVerificacaoArray: TDiretorioVerificacaoArray;
    procedure HabilitarBotoes(AValue: Boolean);
    procedure ConfigurarProgresso;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADiretorioVerificacaoArray: TDiretorioVerificacaoArray); overload;
  end;

var
  frmDgVerificarPermissaoDiretorios: TfrmDgVerificarPermissaoDiretorios;

implementation

{$R *.dfm}

procedure TfrmDgVerificarPermissaoDiretorios.btnIniciarVerificacaoClick(Sender: TObject);
var
  Contador: Integer;
begin
  try
    mAcessoliberado.Lines.Clear;
    mAcessoBloqueado.Lines.Clear;
    HabilitarBotoes(False);
    ConfigurarProgresso;

    for Contador := 0 to Pred(Length(FDiretorioVerificacaoArray)) do
    begin
      try
        if (FDiretorioVerificacaoArray[Contador].Diretorio <> '') then
        begin
          VerificaAcessoDiretorio(FDiretorioVerificacaoArray[Contador].Diretorio);
          mAcessoliberado.Lines.Add(FDiretorioVerificacaoArray[Contador].Descricao + ' - ' + FDiretorioVerificacaoArray[Contador].Diretorio);
        end;
      except on E: Exception do
        mAcessoBloqueado.Lines.Add(FDiretorioVerificacaoArray[Contador].Descricao + ' - ' + FDiretorioVerificacaoArray[Contador].Diretorio);
      end;

      pbProgresso.Position := pbProgresso.Position + 1;
    end;

    HabilitarBotoes(True);
  except
    on E: Exception do
    begin
      HabilitarBotoes(True);
      Application.MessageBox(PWideChar(E.Message), 'Erro', MB_OK + MB_ICONERROR);
    end
  end;
end;

procedure TfrmDgVerificarPermissaoDiretorios.ConfigurarProgresso;
begin
  pbProgresso.Min := 0;
  pbProgresso.Max := Length(FDiretorioVerificacaoArray);
  pbProgresso.Position := 0;
end;

constructor TfrmDgVerificarPermissaoDiretorios.Create(AOwner: TComponent; ADiretorioVerificacaoArray: TDiretorioVerificacaoArray);
begin
  inherited Create(AOwner);
  FDiretorioVerificacaoArray := ADiretorioVerificacaoArray;
end;

procedure TfrmDgVerificarPermissaoDiretorios.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
end;

procedure TfrmDgVerificarPermissaoDiretorios.HabilitarBotoes(AValue: Boolean);
begin
  btnIniciarVerificacao.Enabled := AValue;
end;

end.
