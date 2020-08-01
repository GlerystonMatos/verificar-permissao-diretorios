unit KrVerificarPermissaoDiretorios;

interface

uses
  System.Classes, System.SysUtils, StrUtils;

type
  TDiretorioVerificacao = record
    Diretorio: string;
    Descricao: string;
  end;

  TDiretorioVerificacaoArray = array of TDiretorioVerificacao;

procedure VerificaAcessoDiretorio(ADiretorio: string);

implementation

procedure VerificaAcessoDiretorio(ADiretorio: string);
var
  nomeArquivo: string;
  arquivo: TStringList;
begin
  try
    if (ADiretorio = '') then
      raise Exception.Create('Não foi passado um diretório para ser verificado.');

    nomeArquivo := 'Teste.txt';
    nomeArquivo := IncludeTrailingPathDelimiter(ADiretorio) + nomeArquivo;

    arquivo := TStringList.Create;
    try
      arquivo.Add('Teste de acesso ao diretório do conhecimento');
      arquivo.SaveToFile(nomeArquivo);
    finally;
      arquivo.Free;
    end;

    if (FileExists(NomeArquivo)) then
      DeleteFile(NomeArquivo);
  except
    on e: Exception do
    begin
      if AnsiContainsStr(UpperCase(E.Message), 'I/O ERROR') or AnsiContainsStr(UpperCase(E.Message), 'CANNOT CREATE FILE') then
        raise Exception.Create('Não foi possível acessar o diretório. O usuário não tem permissão ao diretório ' + ADiretorio +
        ' ou o mesmo não existe.')
      else
        raise Exception.Create(E.Message);
    end;
  end;
end;

end.
