unit uPrincipal;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.SysUtils,
  DgVerificarPermissaoDiretorios, KrVerificarPermissaoDiretorios;

type
  TfrmPrincipal = class(TForm)
    btnVerificar: TBitBtn;
    mDiretorios: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnVerificarClick(Sender: TObject);
  private
    { Private declarations }
    function GetDiretoriosVerificacao: TDiretorioVerificacaoArray;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnVerificarClick(Sender: TObject);
var
  frmDgVerificarPermissaoDiretorios: TfrmDgVerificarPermissaoDiretorios;
  diretorioVerificacaoArray: TDiretorioVerificacaoArray;
begin
  diretorioVerificacaoArray := GetDiretoriosVerificacao;
  frmDgVerificarPermissaoDiretorios := TfrmDgVerificarPermissaoDiretorios.Create(Application, diretorioVerificacaoArray);
  frmDgVerificarPermissaoDiretorios.ShowModal;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
end;

function TfrmPrincipal.GetDiretoriosVerificacao: TDiretorioVerificacaoArray;
var
  diretorioVerificacaoArray: TDiretorioVerificacaoArray;
  diretorioVerificacao: TDiretorioVerificacao;
  diretorios: TStringList;
  novoTamanho: Integer;
  contador: Integer;
begin
  diretorios := TStringList.Create();
  try
    diretorios.Text := mDiretorios.Lines.Text;
    for contador := 0 to Pred(diretorios.Count) do
    begin
      diretorioVerificacao.Diretorio := diretorios[contador];
      diretorioVerificacao.Descricao := 'Diretório ' + IntToStr(contador + 1);

      novoTamanho := (Length(diretorioVerificacaoArray) + 1);
      SetLength(diretorioVerificacaoArray, novoTamanho);
      diretorioVerificacaoArray[contador] := diretorioVerificacao;
    end;

    Result := diretorioVerificacaoArray;
  finally
    diretorios.Free;
  end;
end;

end.
