unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, System.JSON, REST.Client, IPPeerClient, Vcl.ComCtrls,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage, IdAttachmentFile;

type
  TfrmPrncipal = class(TForm)
    DBGrid1: TDBGrid;
    cdsCliente: TClientDataSet;
    dsrCliente: TDataSource;
    cdsClienteNome: TStringField;
    cdsClienteIdentidade: TStringField;
    cdsClienteCPF: TStringField;
    cdsClienteTelefone: TStringField;
    cdsClienteEmail: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteLogradouro: TStringField;
    cdsClienteNumero: TStringField;
    cdsClienteComplemento: TStringField;
    cdsClienteBairro: TStringField;
    cdsClienteCidade: TStringField;
    cdsClienteEstado: TStringField;
    cdsClientePais: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbeNome: TDBEdit;
    dbeIdentidade: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeCPF: TDBEdit;
    dbeEmail: TDBEdit;
    dbeCEP: TDBEdit;
    dbeLogradouro: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    dbeNumero: TDBEdit;
    dbeComplemento: TDBEdit;
    Label9: TLabel;
    btnCep: TSpeedButton;
    dbeBairro: TDBEdit;
    Label10: TLabel;
    dbeCidade: TDBEdit;
    Label11: TLabel;
    dbeEstado: TDBEdit;
    Label12: TLabel;
    dbePais: TDBEdit;
    Label13: TLabel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    StatusBar1: TStatusBar;
    btnTeste: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsrClienteStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCepClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dbeCPFKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCEPKeyPress(Sender: TObject; var Key: Char);
    procedure btnTesteClick(Sender: TObject);
  private
      Procedure SomenteNumero(Tipo : integer; var key : Char);
      function  BuscarCEP(UmCEP: string): TStringList;
      procedure GerarArqCadastro;
      procedure EnviarEmail;
      function ValidarEMail(aStr: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrncipal: TfrmPrncipal;

implementation

{$R *.dfm}

procedure TfrmPrncipal.btnSalvarClick(Sender: TObject);
begin
  if not ValidarEmail(dbeEmail.Text) then
  begin
    ShowMessage('Informe um endereço de email válido.');
    dbeEmail.SelectAll;
    dbeEmail.SetFocus;
    Exit;
  end;

  cdsCliente.Post;
  EnviarEmail;
  cdsCliente.SaveToFile('clientes.xml', dfXMLUTF8);
end;

procedure TfrmPrncipal.btnCancelarClick(Sender: TObject);
begin
  cdsCliente.Cancel;
end;

procedure TfrmPrncipal.btnTesteClick(Sender: TObject);
begin
   cdsCliente.LoadFromFIle('clientes.xml');
   EnviarEmail;
end;

procedure TfrmPrncipal.btnNovoClick(Sender: TObject);
begin
  cdsCliente.Append;
  dbeNome.SetFocus;
end;

procedure TfrmPrncipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrncipal.dbeCEPKeyPress(Sender: TObject; var Key: Char);
begin
 // SomenteNumero(key);

  if Key = #13 then
  btnCep.Click;
end;

procedure TfrmPrncipal.dbeCPFKeyPress(Sender: TObject; var Key: Char);
begin
  //SomenteNumero(key);
end;

procedure TfrmPrncipal.dsrClienteStateChange(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TDBEdit) then
    begin
      (Components[i] as TDBEdit).Enabled :=  cdsCliente.State in [dsEdit, dsInsert];
    end;

  end;

  DBGrid1.Enabled := cdsCliente.State = dsBrowse;
end;

procedure TfrmPrncipal.EnviarEmail;
var
 AuthSSL : TIdSSLIOHandlerSocketOpenSSL;
 IdSMTP    : TIdSMTP;
 IdMessage : TIdMessage;
 Anexo, Dados : String;
 i : Integer;
begin

  try
    Screen.Cursor := crHourGlass;
    frmPrncipal.Enabled := false;

    GerarArqCadastro;
    Anexo := 'cliente-' + cdsClienteCPF.AsString + '.xml';

    IdSMTP    := TIdSMTP.Create(nil);
    IdMessage := TIdMessage.Create(nil);

    IdSMTP.Host     := 'smtp.live.com';
    IdSMTP.Port     := 587;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Username := '.com';
    IdSMTP.Password := '';

    AuthSSL                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    AuthSSL.SSLOptions.Method := sslvTLSv1;
    AuthSSL.SSLOptions.Mode := sslmUnassigned;
    AuthSSL.SSLOptions.VerifyMode := [];
    AuthSSL.SSLOptions.VerifyDepth := 0;

    IdSMTP.AuthType := satDefault;
    IdSMTP.IOHandler := AuthSSL;
    IdSMTP.UseTLS := utUseExplicitTLS;

    try
      IdSMTP.Connect;

      IdMessage.From.Address               := '.com';
      IdMessage.Recipients.EMailAddresses  := cdsClienteEmail.AsString;
      IdMessage.Subject                    := 'Seu cadasto no sistema';

      for i := 0 to cdsCliente.FieldCount - 1 do
      Dados := Dados +cdsCliente.Fields[i].FieldName + ': ' + cdsCliente.Fields[i].AsString + sLineBreak;

      IdMessage.Body.Text :=   Dados + sLineBreak + sLineBreak + sLineBreak  + 'Data/Hora: ' + FormatDateTime('dd/MM/yyyy HH:mm:ss', Now);

      if FileExists(Anexo) then
      begin
        IdMessage.Body.SaveToFile(Anexo);
        IdMessage.MessageParts.Clear;
        TIdAttachmentFile.Create(IdMessage.MessageParts, TFileName(Anexo));
      end
      else
      begin
        ShowMessage('Anexo não encontrado, Verifique');
        Exit;
      end;

      IdSMTP.Send(IdMessage);
      ShowMessage('E-Mail Enviado com sucesso para: ' +  IdMessage.Recipients.EMailAddresses);
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao enviar E-Mail:'+#13#10+e.Message);
        Exit;
      end;
    end;
  finally
    IdSMTP.Disconnect;
    frmPrncipal.Enabled := True;
    FreeAndNil(IdSMTP);
    FreeAndNil(IdMessage);
    if AuthSSL <> nil then
    FreeAndNil(AuthSSL);

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrncipal.FormShow(Sender: TObject);
begin
 // if FileExists('clientes.xml') then
 // cdsCliente.LoadFromFile('clientes.xml')
 // else
  cdsCliente.CreateDataSet;
end;

procedure TfrmPrncipal.GerarArqCadastro;
var
  cdsTemp : TClientDataSet;
  i : Integer;
begin
  //CLONAR SOMENTE A LINHA INSERIDA NO DATASET
  cdsTemp := TClientDataSet.Create(nil);

  try
    cdsTemp.FieldDefs.Assign(cdsCliente.FieldDefs);
    cdsTemp.CreateDataSet;
    cdsTemp.Append;

    for i :=0 to cdsCliente.FieldCount - 1 do
    cdsTemp.Fields[i].AsString := cdsCliente.Fields[i].AsString;

    cdsTemp.Post;
    cdsTemp.SaveToFile('cliente-' + cdsClienteCPF.AsString + '.xml', dfXMLUTF8);
  finally
    cdsTemp.Free;
  end;
end;

procedure TfrmPrncipal.SomenteNumero(Tipo: integer; var key: Char);
begin
  if not( key in['0'..'9', #08, #13, #27, #42 , #22, #24, #3, #27] ) then
  begin
     key := #0;
  end;
end;

procedure TfrmPrncipal.btnCepClick(Sender: TObject);
begin
  if Length(dbeCEP.Text) = 8 then
  BuscarCEP(dbeCEP.Text);
end;

function TfrmPrncipal.ValidarEMail(aStr: string): Boolean;
begin
 aStr := Trim(UpperCase(aStr));
 if Pos('@', aStr) > 1 then
 begin
   Delete(aStr, 1, pos('@', aStr));
   Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
 end
 else
   Result := False;
end;

function TfrmPrncipal.BuscarCEP(UmCEP: string): TStringList;
var
  obj, data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
begin
    RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + UmCEP + '/json';
  RESTRequest1.Execute;
  obj := RESTResponse1.JSONValue as TJSONObject;
  try
    data := RESTResponse1.JSONValue as TJSONObject;
    if Assigned(data) then
    begin
     { Endereco.Add(data.Values['logradouro'].Value);
      Endereco.Add(data.Values['bairro'].Value);
      Endereco.Add(data.Values['estado'].Value);
      Endereco.Add(data.Values['cidade'].Value);
      Endereco.Add(data.Values['ddd'].Value);  }
      cdsClienteLogradouro.Value := data.Values['logradouro'].Value;
      cdsClienteBairro.Value     := data.Values['bairro'].Value;
      cdsClienteCidade.Value := data.Values['localidade'].Value;
      cdsClienteEstado.Value := data.Values['uf'].Value;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

end.
