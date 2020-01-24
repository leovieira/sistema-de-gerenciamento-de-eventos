unit ULogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,

  //--------------------
  REST.Client,
  Web.HTTPApp,
  REST.Types,
  System.JSON,
  FireDAC.Stan.Param,
  REST.Response.Adapter
  ;

type
  TFrmLogin = class(TForm)
    Rectangle1: TRectangle;
    ScaledLayout1: TScaledLayout;
    VertScrollBox1: TVertScrollBox;
    Label1: TLabel;
    EdtSenha: TEdit;
    Label2: TLabel;
    BtnEntrar: TRoundRect;
    Text3: TText;
    BtnRecSenha: TLabel;
    ScaledLayout2: TScaledLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Line1: TLine;
    Line2: TLine;
    BtnCadastrar: TRoundRect;
    Text4: TText;
    Text5: TText;
    EdtUsuario: TEdit;
    StyleBook1: TStyleBook;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    Image1: TImage;
    Layout4: TLayout;
    Text1: TText;
    Text2: TText;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

const
  key = 'dpc0p1yim82b5s0tfk3s';
  msg_error = true;

implementation

{$R *.fmx}

uses UDtM, UCadastro, UMain;

procedure TFrmLogin.FormActivate(Sender: TObject);
var
  retorno: TJSONObject;
begin
  try
    DtM.FDQrySelectAdmin.Close;
    DtM.FDQrySelectAdmin.OpenOrExecute;

    if (DtM.FDQrySelectAdmin.RecordCount = 1) then
    begin
      DtM.RESTRequest1.Resource := 'login-administrador.php?key={key}&usuario={usuario}&senha={senha}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('usuario', DtM.FDQrySelectAdminusuario.Value);
      DtM.RESTRequest1.Params.AddUrlSegment('senha', DtM.FDQrySelectAdminsenha.Value);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) = 1) then
        begin
          if (retorno.GetValue('login').Value = 'true') then
          begin
            FrmMain.Show;
            FrmLogin.Hide;
          end
          else
          begin
            DtM.FDQryDeleteAdmin.Close;
            DtM.FDQryDeleteAdmin.OpenOrExecute;
          end;
        end
        else
        begin
          DtM.FDQryDeleteAdmin.Close;
          DtM.FDQryDeleteAdmin.OpenOrExecute;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtUsuario.Text := '';
          EdtSenha.Text := '';
          EdtUsuario.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtUsuario.Text := '';
          EdtSenha.Text := '';
          EdtUsuario.SetFocus;
        end;
        DtM.FDQryDeleteAdmin.Close;
        DtM.FDQryDeleteAdmin.OpenOrExecute;
      end;
    end
    else
    begin
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    DtM.FDQryDeleteAdmin.Close;
    DtM.FDQryDeleteAdmin.OpenOrExecute;
  end;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmLogin.BtnEntrarClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  if (EdtUsuario.Text <> '') and (EdtSenha.Text <> '') then
  begin
    try
      DtM.RESTRequest1.Resource := 'login-administrador.php?key={key}&usuario={usuario}&senha={senha}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('usuario', EdtUsuario.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('senha', EdtSenha.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) = 1) then
        begin
          if (retorno.GetValue('login').Value = 'true') then
          begin
            DtM.FDQryDeleteAdmin.Close;
            DtM.FDQryDeleteAdmin.OpenOrExecute;

            DtM.FDQryInsertAdmin.Close;
            DtM.FDQryInsertAdmin.ParamByName('cod_administrador').AsInteger := StrToInt(retorno.GetValue('cod_administrador').Value);
            DtM.FDQryInsertAdmin.ParamByName('nome').AsString := retorno.GetValue('nome').Value;
            DtM.FDQryInsertAdmin.ParamByName('usuario').AsString := retorno.GetValue('usuario').Value;
            DtM.FDQryInsertAdmin.ParamByName('senha').AsString := retorno.GetValue('senha').Value;
            DtM.FDQryInsertAdmin.OpenOrExecute;

            FrmMain.Show;
            FrmLogin.Hide;

            //ShowMessage('Login realizado com sucesso!');
            EdtUsuario.Text := '';
            EdtSenha.Text := '';
            EdtUsuario.SetFocus;
          end
          else
          begin
            ShowMessage('Senha incorreta!');
            EdtSenha.Text := '';
            EdtSenha.SetFocus;
          end;
        end
        else
        begin
          ShowMessage('Usuário incorreto!');
          EdtUsuario.Text := '';
          EdtUsuario.SetFocus;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtUsuario.Text := '';
          EdtSenha.Text := '';
          EdtUsuario.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtUsuario.Text := '';
          EdtSenha.Text := '';
          EdtUsuario.SetFocus;
        end;
      end;
    except
      ShowMessage('Oops... Algo deu errado!');
      EdtUsuario.Text := '';
      EdtSenha.Text := '';
      EdtUsuario.SetFocus;
    end;
  end
  else if (EdtUsuario.Text = '') and (EdtSenha.Text <> '') then
  begin
    ShowMessage('Preencha o campo "Usuário"!');
    EdtUsuario.SetFocus;
  end
  else if (EdtUsuario.Text <> '') and (EdtSenha.Text = '') then
  begin
    ShowMessage('Preencha o campo "Senha"!');
    EdtSenha.SetFocus;
  end
  else
  begin
    ShowMessage('Preencha todos os campos!');
    EdtUsuario.SetFocus;
  end;
end;

procedure TFrmLogin.BtnCadastrarClick(Sender: TObject);
begin
  FrmCadastro.Show;
  FrmLogin.Hide;
end;

end.
