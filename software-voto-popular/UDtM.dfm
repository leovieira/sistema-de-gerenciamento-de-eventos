object DtM: TDtM
  OldCreateOrder = False
  Height = 324
  Width = 468
  object RESTClient1: TRESTClient
    Accept = 'application/json;q=0.9,text/plain;q=0.9,text/html'
    AcceptCharset = 'UTF-8'
    BaseURL = 'http://localhost/sistema-de-gerenciamento-de-eventos/api'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 48
    Top = 32
  end
  object RESTRequest1: TRESTRequest
    Accept = 'application/json;q=0.9,text/plain;q=0.9,text/html'
    AcceptCharset = 'UTF-8'
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Timeout = 0
    SynchronizedEvents = False
    Left = 152
    Top = 32
  end
  object RESTResponse1: TRESTResponse
    Left = 264
    Top = 32
  end
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Leonardo Paiva\Desktop\SGE\software-voto-popul' +
        'ar\db\sge.s3db'
      'DriverID=SQLite'
      'LockingMode=Normal')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 112
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 160
    Top = 112
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 304
    Top = 112
  end
  object FDQryDeleteAdmin: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'DELETE FROM administrador;')
    Left = 320
    Top = 192
  end
  object FDQrySelectAdmin: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM administrador;')
    Left = 192
    Top = 192
    object FDQrySelectAdmincod_administrador: TIntegerField
      FieldName = 'cod_administrador'
      Origin = 'cod_administrador'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQrySelectAdminnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 200
    end
    object FDQrySelectAdminusuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 200
    end
    object FDQrySelectAdminsenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 200
    end
  end
  object FDQryInsertAdmin: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      
        'INSERT INTO administrador(cod_administrador, nome, usuario, senh' +
        'a) VALUES(:cod_administrador, :nome, :usuario, :senha);')
    Left = 64
    Top = 192
    ParamData = <
      item
        Name = 'COD_ADMINISTRADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
