object frmPrncipal: TfrmPrncipal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 715
  ClientWidth = 937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 294
    Width = 937
    Height = 402
    Align = alBottom
    DataSource = dsrCliente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Identidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Logradouro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Complemento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pais'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 937
    Height = 294
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 52
      Height = 13
      Caption = 'Identidade'
    end
    object Label4: TLabel
      Left = 16
      Top = 112
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label3: TLabel
      Left = 191
      Top = 64
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label5: TLabel
      Left = 191
      Top = 112
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label6: TLabel
      Left = 16
      Top = 159
      Width = 145
      Height = 13
      Caption = 'CEP ( Enter -> Consultar CEP)'
    end
    object Label7: TLabel
      Left = 191
      Top = 159
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label8: TLabel
      Left = 16
      Top = 202
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label9: TLabel
      Left = 191
      Top = 202
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object btnCep: TSpeedButton
      Left = 160
      Top = 176
      Width = 23
      Height = 22
      Hint = 'Consultar CEP'
      Caption = '@'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCepClick
    end
    object Label10: TLabel
      Left = 447
      Top = 204
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label11: TLabel
      Left = 16
      Top = 252
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label12: TLabel
      Left = 224
      Top = 252
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label13: TLabel
      Left = 271
      Top = 252
      Width = 19
      Height = 13
      Caption = 'Pais'
    end
    object dbeNome: TDBEdit
      Left = 16
      Top = 27
      Width = 633
      Height = 21
      DataField = 'Nome'
      DataSource = dsrCliente
      TabOrder = 0
    end
    object dbeIdentidade: TDBEdit
      Left = 16
      Top = 83
      Width = 169
      Height = 21
      DataField = 'Identidade'
      DataSource = dsrCliente
      TabOrder = 1
    end
    object dbeTelefone: TDBEdit
      Left = 16
      Top = 131
      Width = 169
      Height = 21
      DataField = 'Telefone'
      DataSource = dsrCliente
      TabOrder = 3
    end
    object dbeCPF: TDBEdit
      Left = 191
      Top = 83
      Width = 274
      Height = 21
      DataField = 'CPF'
      DataSource = dsrCliente
      TabOrder = 2
      OnKeyPress = dbeCPFKeyPress
    end
    object dbeEmail: TDBEdit
      Left = 191
      Top = 131
      Width = 458
      Height = 21
      DataField = 'Email'
      DataSource = dsrCliente
      TabOrder = 4
    end
    object dbeCEP: TDBEdit
      Left = 16
      Top = 178
      Width = 137
      Height = 21
      DataField = 'CEP'
      DataSource = dsrCliente
      TabOrder = 5
      OnKeyPress = dbeCEPKeyPress
    end
    object dbeLogradouro: TDBEdit
      Left = 191
      Top = 178
      Width = 458
      Height = 21
      DataField = 'Logradouro'
      DataSource = dsrCliente
      TabOrder = 6
    end
    object dbeNumero: TDBEdit
      Left = 16
      Top = 221
      Width = 169
      Height = 21
      DataField = 'Numero'
      DataSource = dsrCliente
      TabOrder = 7
    end
    object dbeComplemento: TDBEdit
      Left = 191
      Top = 221
      Width = 250
      Height = 21
      DataField = 'Complemento'
      DataSource = dsrCliente
      TabOrder = 8
    end
    object dbeBairro: TDBEdit
      Left = 447
      Top = 221
      Width = 202
      Height = 21
      DataField = 'Bairro'
      DataSource = dsrCliente
      TabOrder = 9
    end
    object dbeCidade: TDBEdit
      Left = 16
      Top = 269
      Width = 202
      Height = 21
      DataField = 'Cidade'
      DataSource = dsrCliente
      TabOrder = 10
    end
    object dbeEstado: TDBEdit
      Left = 224
      Top = 269
      Width = 33
      Height = 21
      DataField = 'Estado'
      DataSource = dsrCliente
      TabOrder = 11
    end
    object dbePais: TDBEdit
      Left = 271
      Top = 269
      Width = 378
      Height = 21
      DataField = 'Pais'
      DataSource = dsrCliente
      TabOrder = 12
    end
    object btnNovo: TBitBtn
      Left = 804
      Top = 145
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 13
      OnClick = btnNovoClick
    end
    object btnSalvar: TBitBtn
      Left = 804
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 14
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 804
      Top = 207
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 15
      OnClick = btnCancelarClick
    end
    object btnSair: TBitBtn
      Left = 804
      Top = 238
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 16
      OnClick = btnSairClick
    end
    object btnTeste: TBitBtn
      Left = 804
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Teste'
      TabOrder = 17
      Visible = False
      OnClick = btnTesteClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 696
    Width = 937
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 56
    object cdsClienteNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object cdsClienteIdentidade: TStringField
      FieldName = 'Identidade'
    end
    object cdsClienteCPF: TStringField
      FieldName = 'CPF'
      EditMask = '000\.000\.000\.00;0;_'
      Size = 11
    end
    object cdsClienteTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 11
    end
    object cdsClienteEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-999;0;_'
      Size = 8
    end
    object cdsClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 90
    end
    object cdsClienteNumero: TStringField
      FieldName = 'Numero'
    end
    object cdsClienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object cdsClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object cdsClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object cdsClienteEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object cdsClientePais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
  end
  object dsrCliente: TDataSource
    DataSet = cdsCliente
    OnStateChange = dsrClienteStateChange
    Left = 592
    Top = 56
  end
end
