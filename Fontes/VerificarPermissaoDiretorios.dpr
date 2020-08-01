program VerificarPermissaoDiretorios;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  DgVerificarPermissaoDiretorios in 'DgVerificarPermissaoDiretorios.pas' {frmDgVerificarPermissaoDiretorios},
  KrVerificarPermissaoDiretorios in 'KrVerificarPermissaoDiretorios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmDgVerificarPermissaoDiretorios, frmDgVerificarPermissaoDiretorios);
  Application.Run;
end.
