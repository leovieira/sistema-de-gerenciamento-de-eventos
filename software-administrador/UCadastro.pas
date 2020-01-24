unit UCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects,

  //--------------------
  REST.Client,
  Web.HTTPApp,
  REST.Types,
  System.JSON,
  FireDAC.Stan.Param,
  REST.Response.Adapter
  ;

type
  TFrmCadastro = class(TForm)
    Rectangle1: TRectangle;
    Layout5: TLayout;
    Text1: TText;
    BtnEntrar: TRoundRect;
    Text2: TText;
    StyleBook1: TStyleBook;
    ScaledLayout1: TScaledLayout;
    VertScrollBox1: TVertScrollBox;
    Label1: TLabel;
    EdtUsuario: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    ScaledLayout2: TScaledLayout;
    BtnCadastrar: TRoundRect;
    Text3: TText;
    EdtSenha: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure BtnEntrarClick(Sender: TObject);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtUsuarioEnter(Sender: TObject);
    procedure EdtSenhaEnter(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
  private
    { Private declarations }

    foco: TControl;
  public
    { Public declarations }
  end;

var
  FrmCadastro: TFrmCadastro;
  status_scroll: boolean;

const
  key = 'dpc0p1yim82b5s0tfk3s';
  msg_error = true;

implementation

{$R *.fmx}

uses UDtM, ULogin;

procedure Ajustar_Scroll();
var
  x: integer;
begin
  with FrmCadastro do
  begin
    VertScrollBox1.Height := VertScrollBox1.Height - 270;
    VertScrollBox1.ViewportPosition := PointF(VertScrollBox1.ViewportPosition.X,
    TControl(foco).Position.Y - 30);
  end;
end;

procedure TFrmCadastro.FormCreate(Sender: TObject);
begin
  status_scroll := false;
end;

procedure TFrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmCadastro.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  {$IF DEFINED (ANDROID) || (IOS)}
    VertScrollBox1.ViewportPosition := PointF(VertScrollBox1.ViewportPosition.X,
      TControl(foco).Position.Y + VertScrollBox1.Height + 270);
    VertScrollBox1.Height := VertScrollBox1.Height + 270;
    status_scroll := false;
  {$ENDIF}
end;

procedure TFrmCadastro.BtnEntrarClick(Sender: TObject);
begin
  FrmLogin.Show;
  FrmCadastro.Hide;
end;

procedure TFrmCadastro.EdtNomeEnter(Sender: TObject);
begin
  {$IF DEFINED (ANDROID) || (IOS)}
    if (status_scroll = false) then
    begin
      foco := TControl(TEdit(Sender));
      Ajustar_Scroll();
      status_scroll := true;
    end;
  {$ENDIF}
end;

procedure TFrmCadastro.EdtUsuarioEnter(Sender: TObject);
begin
  {$IF DEFINED (ANDROID) || (IOS)}
    if (status_scroll = false) then
    begin
      foco := TControl(TEdit(Sender));
      Ajustar_Scroll();
      status_scroll := true;
    end;
  {$ENDIF}
end;

procedure TFrmCadastro.EdtSenhaEnter(Sender: TObject);
begin
  {$IF DEFINED (ANDROID) || (IOS)}
    if (status_scroll = false) then
    begin
      foco := TControl(TEdit(Sender));
      Ajustar_Scroll();
      status_scroll := true;
    end;
  {$ENDIF}
end;

procedure TFrmCadastro.BtnCadastrarClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  try
    if (EdtNome.Text <> '') and (EdtUsuario.Text <> '') and (EdtSenha.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'cadastra-administrador.php?key={key}&nome={nome}&usuario={usuario}&senha={senha}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNome.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('usuario', EdtUsuario.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('senha', EdtSenha.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        ShowMessage('Cadastro realizado com sucesso!');
        EdtNome.Text := '';
        EdtUsuario.Text := '';
        EdtSenha.Text := '';
        EdtNome.SetFocus;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNome.Text := '';
          EdtUsuario.Text := '';
          EdtSenha.Text := '';
          EdtNome.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNome.Text := '';
          EdtUsuario.Text := '';
          EdtSenha.Text := '';
          EdtNome.SetFocus;
        end;
      end;
    end
    else
    begin
      ShowMessage('Preencha todos os campos!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtNome.Text := '';
    EdtUsuario.Text := '';
    EdtSenha.Text := '';
    EdtNome.SetFocus;
  end;
end;

end.
