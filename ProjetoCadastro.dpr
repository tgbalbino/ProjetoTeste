program ProjetoCadastro;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrncipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrncipal, frmPrncipal);
  Application.Run;
end.
