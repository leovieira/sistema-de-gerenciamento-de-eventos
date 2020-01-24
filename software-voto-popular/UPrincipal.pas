unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.TabControl,
  FMX.Effects, FMX.MultiView, FMX.ListBox, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  jsonadapter, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,

  //--------------------
  REST.Client,
  Web.HTTPApp,
  REST.Types,
  System.JSON,
  FireDAC.Stan.Param,
  REST.Response.Adapter
  ;

type
  TFrmPrincipal = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Text1: TText;
    Layout1: TLayout;
    EdtUsuario: TEdit;
    Label1: TLabel;
    EdtSenha: TEdit;
    Label2: TLabel;
    BtnEntrar: TRoundRect;
    TxtBtnEntrar: TText;
    BtnSair: TRoundRect;
    TxtBtnSair: TText;
    Layout2: TLayout;
    Text2: TText;
    Text3: TText;
    TabControl1: TTabControl;
    TabSplash: TTabItem;
    TabLogin: TTabItem;
    TabEventos: TTabItem;
    TabLoginVotante: TTabItem;
    TabVotaEquipe: TTabItem;
    TabConfirma: TTabItem;
    Timer1: TTimer;
    Rectangle4: TRectangle;
    Text4: TText;
    Layout3: TLayout;
    Text5: TText;
    Rectangle5: TRectangle;
    BtnMenu1: TSpeedButton;
    BtnSair1: TSpeedButton;
    MultiView1: TMultiView;
    ListBox1: TListBox;
    BtnRecarregar: TListBoxItem;
    BtnLogout1: TListBoxItem;
    Text6: TText;
    Line1: TLine;
    Line2: TLine;
    AniIndicator1: TAniIndicator;
    GroupBox1: TGroupBox;
    Layout4: TLayout;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtCodigo: TEdit;
    Label4: TLabel;
    BtnBuscar: TRoundRect;
    TxtBtnBuscar: TText;
    FDMemTable1: TFDMemTable;
    JSONDatasetAdapter1: TJSONDatasetAdapter;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    FDMemTable1cod_evento: TStringField;
    FDMemTable1nome: TStringField;
    FDMemTable1descricao: TStringField;
    FDMemTable1instituicao: TStringField;
    FDMemTable1cod_administrador: TStringField;
    FDMemTable1cod_avaliadores: TStringField;
    BtnSelecionarEvento: TRoundRect;
    TxtBtnSelecionarEvento: TText;
    Layout5: TLayout;
    Barra1: TRectangle;
    BtnMenu2: TSpeedButton;
    BtnSair2: TSpeedButton;
    MultiView2: TMultiView;
    ListBox2: TListBox;
    BtnEventos: TListBoxItem;
    BtnLogout2: TListBoxItem;
    Line3: TLine;
    Line4: TLine;
    Layout6: TLayout;
    Text7: TText;
    EdtHashVotante: TEdit;
    Layout7: TLayout;
    BtnEntrar1: TRectangle;
    TxtBtnEntrar1: TText;
    BtnLimpar: TRectangle;
    TxtBtnLimpar: TText;
    Layout8: TLayout;
    Barra2: TRectangle;
    BtnMenu3: TSpeedButton;
    BtnSair3: TSpeedButton;
    MultiView3: TMultiView;
    ListBox3: TListBox;
    BtnEventos1: TListBoxItem;
    Line5: TLine;
    BtnLogout3: TListBoxItem;
    Line6: TLine;
    Text8: TText;
    Text9: TText;
    Layout9: TLayout;
    Layout10: TLayout;
    EdtHashEquipe: TEdit;
    Layout11: TLayout;
    BtnAvancar: TRectangle;
    TxtBtnAvancar: TText;
    BtnLimpar1: TRectangle;
    TxtBtnLimpar1: TText;
    Text12: TText;
    TabMensagem: TTabItem;
    MultiView4: TMultiView;
    ListBox4: TListBox;
    BtnEventos2: TListBoxItem;
    Line7: TLine;
    BtnLogout4: TListBoxItem;
    Line8: TLine;
    Barra3: TRectangle;
    BtnMenu4: TSpeedButton;
    BtnSair4: TSpeedButton;
    Text10: TText;
    Layout12: TLayout;
    Text11: TText;
    TxtNomeEquipe: TText;
    Text13: TText;
    TxtDescricaoEquipe: TText;
    Text14: TText;
    TxtIntegrantesEquipe: TText;
    Layout13: TLayout;
    BtnConfirma: TRectangle;
    TxtBtnConfirma: TText;
    BtnCorrige: TRectangle;
    TxtBtnCorrige: TText;
    Layout14: TLayout;
    MultiView5: TMultiView;
    ListBox5: TListBox;
    BtnEventos3: TListBoxItem;
    Line9: TLine;
    BtnLogout5: TListBoxItem;
    Line10: TLine;
    Barra4: TRectangle;
    BtnSair5: TSpeedButton;
    Text15: TText;
    BtnMenu5: TSpeedButton;
    Layout15: TLayout;
    Text16: TText;
    Layout16: TLayout;
    TxtCountdown: TText;
    Timer2: TTimer;
    Layout17: TLayout;
    Text17: TText;
    Layout19: TLayout;
    Layout18: TLayout;
    Rectangle6: TRectangle;
    Image1: TImage;
    Layout20: TLayout;
    Layout21: TLayout;
    Text18: TText;
    Circle1: TCircle;
    Circle2: TCircle;
    Circle3: TCircle;
    Circle4: TCircle;
    Circle5: TCircle;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnEntrarMouseEnter(Sender: TObject);
    procedure BtnEntrarMouseLeave(Sender: TObject);
    procedure BtnSairMouseEnter(Sender: TObject);
    procedure BtnSairMouseLeave(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLogout1Click(Sender: TObject);
    procedure BtnRecarregarClick(Sender: TObject);
    procedure BtnBuscarMouseEnter(Sender: TObject);
    procedure BtnBuscarMouseLeave(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnSair1Click(Sender: TObject);
    procedure BtnSelecionarEventoMouseEnter(Sender: TObject);
    procedure BtnSelecionarEventoMouseLeave(Sender: TObject);
    procedure BtnSelecionarEventoClick(Sender: TObject);
    procedure BtnSair2Click(Sender: TObject);
    procedure BtnEventosClick(Sender: TObject);
    procedure BtnLogout2Click(Sender: TObject);
    procedure BtnEntrar1MouseEnter(Sender: TObject);
    procedure BtnEntrar1MouseLeave(Sender: TObject);
    procedure BtnLimparMouseEnter(Sender: TObject);
    procedure BtnLimparMouseLeave(Sender: TObject);
    procedure BtnEntrar1Click(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSair3Click(Sender: TObject);
    procedure BtnEventos1Click(Sender: TObject);
    procedure BtnLogout3Click(Sender: TObject);
    procedure BtnAvancarMouseEnter(Sender: TObject);
    procedure BtnAvancarMouseLeave(Sender: TObject);
    procedure BtnLimpar1MouseEnter(Sender: TObject);
    procedure BtnLimpar1MouseLeave(Sender: TObject);
    procedure BtnAvancarClick(Sender: TObject);
    procedure BtnLimpar1Click(Sender: TObject);
    procedure BtnSair4Click(Sender: TObject);
    procedure BtnEventos2Click(Sender: TObject);
    procedure BtnLogout4Click(Sender: TObject);
    procedure BtnConfirmaMouseEnter(Sender: TObject);
    procedure BtnConfirmaMouseLeave(Sender: TObject);
    procedure BtnCorrigeMouseEnter(Sender: TObject);
    procedure BtnCorrigeMouseLeave(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnCorrigeClick(Sender: TObject);
    procedure BtnSair5Click(Sender: TObject);
    procedure BtnEventos3Click(Sender: TObject);
    procedure BtnLogout5Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  cod_administrador, cod_evento, cod_votante, cod_equipe, countdown: integer;
  status_atalho: boolean;

const
  key = 'dpc0p1yim82b5s0tfk3s';
  msg_error = true;

implementation

{$R *.fmx}

uses UDtM;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := TabSplash;
  MultiView1.Visible := false;
  MultiView1.HideMaster;
  MultiView2.Visible := false;
  MultiView2.HideMaster;
  MultiView3.Visible := false;
  MultiView3.HideMaster;
  MultiView4.Visible := false;
  MultiView4.HideMaster;
  MultiView5.Visible := false;
  MultiView5.HideMaster;
  status_atalho := false;
  countdown := 5;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
  AniIndicator1.Enabled := true;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = vkF11) then
  begin
    if (status_atalho = false) then
    begin
      Barra1.Visible := false;
      Barra2.Visible := false;
      Barra3.Visible := false;
      Barra4.Visible := false;
      FrmPrincipal.FullScreen := true;
      status_atalho := true;
    end
    else
    begin
      Barra1.Visible := true;
      Barra2.Visible := true;
      Barra3.Visible := true;
      Barra4.Visible := true;
      FrmPrincipal.FullScreen := false;
      FrmPrincipal.WindowState := TWindowState.wsNormal;
      FrmPrincipal.BorderStyle := TFMxFormBorderStyle.Sizeable;
      FrmPrincipal.Position := TFormPosition.ScreenCenter;
      FrmPrincipal.WindowState := TWindowState.wsMaximized;
      status_atalho := false;
    end;
  end;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
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
            TabControl1.ActiveTab := TabEventos;
            FrmPrincipal.BorderStyle := TFMxFormBorderStyle.Sizeable;
            FrmPrincipal.WindowState := TWindowState.wsMaximized;

            cod_administrador := DtM.FDQrySelectAdmincod_administrador.Value;

            DtM.RESTRequest1.Resource := 'busca-eventos.php?key={key}&cod_administrador={cod_administrador}';
            DtM.RESTRequest1.Params.AddUrlSegment('key', key);
            DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
            DtM.RESTRequest1.Execute;

            retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

            if (retorno.GetValue('error').Value = 'false') then
            begin
              if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
              begin
                prows := retorno.Get('eventos');
                arrayr := prows.JsonValue as TJSONArray;
                sl := TStringList.Create;
                sl.Text := arrayr.ToString;
                JSONDatasetAdapter1.JSON := sl;
                //ShowMessage(arrayr.ToString);
              end
              else
              begin
                sl := TStringList.Create;
                sl.Text := '[]';
                JSONDatasetAdapter1.JSON := sl;
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
          end
          else
          begin
            TabControl1.ActiveTab := TabLogin;
            DtM.FDQryDeleteAdmin.Close;
            DtM.FDQryDeleteAdmin.OpenOrExecute;
          end;
        end
        else
        begin
          TabControl1.ActiveTab := TabLogin;
          DtM.FDQryDeleteAdmin.Close;
          DtM.FDQryDeleteAdmin.OpenOrExecute;
        end;
      end
      else
      begin
        TabControl1.ActiveTab := TabLogin;
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
      TabControl1.ActiveTab := TabLogin;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
    end;
  except
    TabControl1.ActiveTab := TabLogin;
    ShowMessage('Oops... Algo deu errado!');
    DtM.FDQryDeleteAdmin.Close;
    DtM.FDQryDeleteAdmin.OpenOrExecute;
  end;
  Timer1.Enabled := false;
  AniIndicator1.Enabled := false;
end;

procedure TFrmPrincipal.BtnEntrarMouseEnter(Sender: TObject);
begin
  BtnEntrar.Fill.Color := $FFFFFFFF;
  TxtBtnEntrar.TextSettings.FontColor := $FF0077C5;
end;

procedure TFrmPrincipal.BtnEntrarMouseLeave(Sender: TObject);
begin
  BtnEntrar.Fill.Color := $FF0077C5;
  TxtBtnEntrar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnSairMouseEnter(Sender: TObject);
begin
  BtnSair.Fill.Color := $FFFFFFFF;
  TxtBtnSair.TextSettings.FontColor := $FF0077C5;
end;

procedure TFrmPrincipal.BtnSairMouseLeave(Sender: TObject);
begin
  BtnSair.Fill.Color := $FF0077C5;
  TxtBtnSair.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnEntrarClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
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
            cod_administrador := StrToInt(retorno.GetValue('cod_administrador').Value);
            DtM.FDQryInsertAdmin.ParamByName('cod_administrador').AsInteger := cod_administrador;
            DtM.FDQryInsertAdmin.ParamByName('nome').AsString := retorno.GetValue('nome').Value;
            DtM.FDQryInsertAdmin.ParamByName('usuario').AsString := retorno.GetValue('usuario').Value;
            DtM.FDQryInsertAdmin.ParamByName('senha').AsString := retorno.GetValue('senha').Value;
            DtM.FDQryInsertAdmin.OpenOrExecute;

            TabControl1.ActiveTab := TabEventos;
            FrmPrincipal.BorderStyle := TFMxFormBorderStyle.Sizeable;
            FrmPrincipal.WindowState := TWindowState.wsMaximized;

            //ShowMessage('Login realizado com sucesso!');
            EdtUsuario.Text := '';
            EdtSenha.Text := '';
            EdtUsuario.SetFocus;

            DtM.RESTRequest1.Resource := 'busca-eventos.php?key={key}&cod_administrador={cod_administrador}';
            DtM.RESTRequest1.Params.AddUrlSegment('key', key);
            DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
            DtM.RESTRequest1.Execute;

            retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

            if (retorno.GetValue('error').Value = 'false') then
            begin
              if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
              begin
                prows := retorno.Get('eventos');
                arrayr := prows.JsonValue as TJSONArray;
                sl := TStringList.Create;
                sl.Text := arrayr.ToString;
                JSONDatasetAdapter1.JSON := sl;
                //ShowMessage(arrayr.ToString);
              end
              else
              begin
                sl := TStringList.Create;
                sl.Text := '[]';
                JSONDatasetAdapter1.JSON := sl;
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

procedure TFrmPrincipal.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.BtnSair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.BtnRecarregarClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    MultiView1.HideMaster;
    EdtNome.Text := '';
    EdtCodigo.Text := '';

    DtM.RESTRequest1.Resource := 'busca-eventos.php?key={key}&cod_administrador={cod_administrador}';
    DtM.RESTRequest1.Params.AddUrlSegment('key', key);
    DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
    DtM.RESTRequest1.Execute;

    retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

    if (retorno.GetValue('error').Value = 'false') then
    begin
      if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
      begin
        prows := retorno.Get('eventos');
        arrayr := prows.JsonValue as TJSONArray;
        sl := TStringList.Create;
        sl.Text := arrayr.ToString;
        JSONDatasetAdapter1.JSON := sl;
        //ShowMessage(arrayr.ToString);
      end
      else
      begin
        sl := TStringList.Create;
        sl.Text := '[]';
        JSONDatasetAdapter1.JSON := sl;
      end;
    end
    else
    begin
      if (msg_error = true) then
      begin
        ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
      end
      else
      begin
        ShowMessage('Oops... Algo deu errado!');
      end;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.BtnLogout1Click(Sender: TObject);
begin
  try
    if (MessageDlg('Deseja mesmo fazer o logout?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      MultiView1.HideMaster;
      TabControl1.ActiveTab := TabLogin;
      FrmPrincipal.WindowState := TWindowState.wsNormal;
      FrmPrincipal.BorderStyle := TFMxFormBorderStyle.None;
      FrmPrincipal.Width := 1120;
      FrmPrincipal.Height := 500;
      FrmPrincipal.Position := TFormPosition.ScreenCenter;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
      cod_administrador := 0;
      cod_evento := 0;
      cod_votante := 0;
      cod_equipe := 0;
      EdtNome.Text := '';
      EdtCodigo.Text := '';
      EdtHashVotante.Text := '';
      EdtHashEquipe.Text := '';
      TxtNomeEquipe.Text := '';
      TxtDescricaoEquipe.Text := '';
      TxtIntegrantesEquipe.Text := '';
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.BtnBuscarMouseEnter(Sender: TObject);
begin
  BtnBuscar.Fill.Color := $FFFFFFFF;
  BtnBuscar.Stroke.Color := $FF0077C5;
  BtnBuscar.Stroke.Kind := TBrushKind.Solid;
  TxtBtnBuscar.TextSettings.FontColor := $FF0077C5;
end;

procedure TFrmPrincipal.BtnBuscarMouseLeave(Sender: TObject);
begin
  BtnBuscar.Fill.Color := $FF0077C5;
  BtnBuscar.Stroke.Color := $FF0077C5;
  BtnBuscar.Stroke.Kind := TBrushKind.None;
  TxtBtnBuscar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnBuscarClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (EdtNome.Text = '') and (EdtCodigo.Text = '') then
    begin
      DtM.RESTRequest1.Resource := 'busca-eventos.php?key={key}&cod_administrador={cod_administrador}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
        begin
          prows := retorno.Get('eventos');
          arrayr := prows.JsonValue as TJSONArray;
          sl := TStringList.Create;
          sl.Text := arrayr.ToString;
          JSONDatasetAdapter1.JSON := sl;
          //ShowMessage(arrayr.ToString);
        end
        else
        begin
          sl := TStringList.Create;
          sl.Text := '[]';
          JSONDatasetAdapter1.JSON := sl;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
        end;
      end;
    end
    else if (EdtNome.Text <> '') and (EdtCodigo.Text = '') then
    begin
      DtM.RESTRequest1.Resource := 'busca-eventos.php?key={key}&nome={nome}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNome.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
        begin
          prows := retorno.Get('eventos');
          arrayr := prows.JsonValue as TJSONArray;
          sl := TStringList.Create;
          sl.Text := arrayr.ToString;
          JSONDatasetAdapter1.JSON := sl;
          //ShowMessage(arrayr.ToString);
        end
        else
        begin
          ShowMessage('Nenhum resultado para "' + EdtNome.Text + '"!');
          EdtNome.Text := '';
          EdtCodigo.Text := '';
          EdtNome.SetFocus;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNome.Text := '';
          EdtCodigo.Text := '';
          EdtNome.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNome.Text := '';
          EdtCodigo.Text := '';
          EdtNome.SetFocus;
        end;
      end;
    end
    else if (EdtNome.Text = '') and (EdtCodigo.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'busca-eventos.php?key={key}&cod_evento={cod_evento}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', EdtCodigo.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
        begin
          prows := retorno.Get('eventos');
          arrayr := prows.JsonValue as TJSONArray;
          sl := TStringList.Create;
          sl.Text := arrayr.ToString;
          JSONDatasetAdapter1.JSON := sl;
          //ShowMessage(arrayr.ToString);
        end
        else
        begin
          ShowMessage('Nenhum resultado para "' + EdtCodigo.Text + '"!');
          EdtNome.Text := '';
          EdtCodigo.Text := '';
          EdtNome.SetFocus;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNome.Text := '';
          EdtCodigo.Text := '';
          EdtNome.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNome.Text := '';
          EdtCodigo.Text := '';
          EdtNome.SetFocus;
        end;
      end;
    end
    else
    begin
      ShowMessage('Preencha apenas um campo!');
      EdtNome.Text := '';
      EdtCodigo.Text := '';
      EdtNome.SetFocus;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtNome.Text := '';
    EdtCodigo.Text := '';
    EdtNome.SetFocus;
  end;
end;

procedure TFrmPrincipal.BtnSelecionarEventoMouseEnter(Sender: TObject);
begin
  BtnSelecionarEvento.Fill.Color := $FF0077C5;
  TxtBtnSelecionarEvento.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnSelecionarEventoMouseLeave(Sender: TObject);
begin
  BtnSelecionarEvento.Fill.Color := $FFFFFFFF;
  TxtBtnSelecionarEvento.TextSettings.FontColor := $FF0077C5;
end;

procedure TFrmPrincipal.BtnSelecionarEventoClick(Sender: TObject);
begin
  try
    if (StringGrid1.Cells[0, StringGrid1.Row] <> '') then
    begin
      cod_evento := StrToInt(StringGrid1.Cells[0, StringGrid1.Row]);
      //ShowMessage(IntToStr(cod_evento));

      TabControl1.ActiveTab := TabLoginVotante;
      EdtHashVotante.SetFocus;
    end
    else
    begin
      ShowMessage('Nenhum evento selecionado!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.BtnSair2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.BtnEventosClick(Sender: TObject);
begin
  MultiView2.HideMaster;
  TabControl1.ActiveTab := TabEventos;
  cod_votante := 0;
  cod_equipe := 0;
  EdtHashVotante.Text := '';
  EdtHashEquipe.Text := '';
  TxtNomeEquipe.Text := '';
  TxtDescricaoEquipe.Text := '';
  TxtIntegrantesEquipe.Text := '';
end;

procedure TFrmPrincipal.BtnLogout2Click(Sender: TObject);
begin
  try
    if (MessageDlg('Deseja mesmo fazer o logout?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      MultiView2.HideMaster;
      TabControl1.ActiveTab := TabLogin;
      FrmPrincipal.WindowState := TWindowState.wsNormal;
      FrmPrincipal.BorderStyle := TFMxFormBorderStyle.None;
      FrmPrincipal.Width := 1120;
      FrmPrincipal.Height := 500;
      FrmPrincipal.Position := TFormPosition.ScreenCenter;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
      cod_administrador := 0;
      cod_evento := 0;
      cod_votante := 0;
      cod_equipe := 0;
      EdtNome.Text := '';
      EdtCodigo.Text := '';
      EdtHashVotante.Text := '';
      EdtHashEquipe.Text := '';
      TxtNomeEquipe.Text := '';
      TxtDescricaoEquipe.Text := '';
      TxtIntegrantesEquipe.Text := '';
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.BtnEntrar1MouseEnter(Sender: TObject);
begin
  BtnEntrar1.Fill.Color := $FFFFFFFF;
  TxtBtnEntrar1.TextSettings.FontColor := $FF0CB529;
end;

procedure TFrmPrincipal.BtnEntrar1MouseLeave(Sender: TObject);
begin
  BtnEntrar1.Fill.Color := $FF0CB529;
  TxtBtnEntrar1.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnLimparMouseEnter(Sender: TObject);
begin
  BtnLimpar.Fill.Color := $FFD50A0A;
  TxtBtnLimpar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnLimparMouseLeave(Sender: TObject);
begin
  BtnLimpar.Fill.Color := $FFFFFFFF;
  TxtBtnLimpar.TextSettings.FontColor := $FFD50A0A;
end;

procedure TFrmPrincipal.BtnEntrar1Click(Sender: TObject);
var
  retorno: TJSONObject;
begin
  try
    if (EdtHashVotante.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'login-votante.php?key={key}&hash={hash}&cod_evento={cod_evento}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('hash', EdtHashVotante.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) = 1) then
        begin
          if (retorno.GetValue('login').Value = 'true') then
          begin
            TabControl1.ActiveTab := TabVotaEquipe;
            cod_votante := StrToInt(retorno.GetValue('cod_votante').Value);
            EdtHashVotante.Text := '';
          end
          else if (retorno.GetValue('login').Value = 'false') then
          begin
            ShowMessage('O código "' + EdtHashVotante.Text + '" já foi usado!');
            EdtHashVotante.Text := '';
            EdtHashVotante.SetFocus;
          end
          else
          begin
            ShowMessage('Oops... Algo deu errado!');
            EdtHashVotante.Text := '';
            EdtHashVotante.SetFocus;
          end;
        end
        else
        begin
          ShowMessage('O código "' + EdtHashVotante.Text + '" é inválido!');
          EdtHashVotante.Text := '';
          EdtHashVotante.SetFocus;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtHashVotante.Text := '';
          EdtHashVotante.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtHashVotante.Text := '';
          EdtHashVotante.SetFocus;
        end;
      end;
    end
    else
    begin
      ShowMessage('Preencha o campo!');
      EdtHashVotante.SetFocus;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtHashVotante.Text := '';
    EdtHashVotante.SetFocus;
  end;
end;

procedure TFrmPrincipal.BtnLimparClick(Sender: TObject);
begin
  EdtHashVotante.Text := '';
  EdtHashVotante.SetFocus;
end;

procedure TFrmPrincipal.BtnSair3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.BtnEventos1Click(Sender: TObject);
begin
  MultiView3.HideMaster;
  TabControl1.ActiveTab := TabEventos;
  cod_votante := 0;
  cod_equipe := 0;
  EdtHashVotante.Text := '';
  EdtHashEquipe.Text := '';
  TxtNomeEquipe.Text := '';
  TxtDescricaoEquipe.Text := '';
  TxtIntegrantesEquipe.Text := '';
end;

procedure TFrmPrincipal.BtnLogout3Click(Sender: TObject);
begin
  try
    if (MessageDlg('Deseja mesmo fazer o logout?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      MultiView3.HideMaster;
      TabControl1.ActiveTab := TabLogin;
      FrmPrincipal.WindowState := TWindowState.wsNormal;
      FrmPrincipal.BorderStyle := TFMxFormBorderStyle.None;
      FrmPrincipal.Width := 1120;
      FrmPrincipal.Height := 500;
      FrmPrincipal.Position := TFormPosition.ScreenCenter;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
      cod_administrador := 0;
      cod_evento := 0;
      cod_votante := 0;
      cod_equipe := 0;
      EdtNome.Text := '';
      EdtCodigo.Text := '';
      EdtHashVotante.Text := '';
      EdtHashEquipe.Text := '';
      TxtNomeEquipe.Text := '';
      TxtDescricaoEquipe.Text := '';
      TxtIntegrantesEquipe.Text := '';
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.BtnAvancarMouseEnter(Sender: TObject);
begin
  BtnAvancar.Fill.Color := $FFFFFFFF;
  TxtBtnAvancar.TextSettings.FontColor := $FF0CB529;
end;

procedure TFrmPrincipal.BtnAvancarMouseLeave(Sender: TObject);
begin
  BtnAvancar.Fill.Color := $FF0CB529;
  TxtBtnAvancar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnLimpar1MouseEnter(Sender: TObject);
begin
  BtnLimpar1.Fill.Color := $FFD50A0A;
  TxtBtnLimpar1.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnLimpar1MouseLeave(Sender: TObject);
begin
  BtnLimpar1.Fill.Color := $FFFFFFFF;
  TxtBtnLimpar1.TextSettings.FontColor := $FFD50A0A;
end;

procedure TFrmPrincipal.BtnAvancarClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  orows: TJSONObject;
begin
  try
    if (EdtHashEquipe.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&hash={hash}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Params.AddUrlSegment('hash', EdtHashEquipe.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) = 1) then
        begin
          prows := retorno.Get('equipes');
          arrayr := prows.JsonValue as TJSONArray;
          //ShowMessage(arrayr.ToString);
          orows := arrayr.Items[0] as TJSONObject;

          cod_equipe := StrToInt(orows.GetValue('cod_equipe').Value);
          TxtNomeEquipe.Text := orows.GetValue('nome').Value;
          TxtDescricaoEquipe.Text := orows.GetValue('descricao').Value;
          TxtIntegrantesEquipe.Text := orows.GetValue('integrantes').Value;

          TabControl1.ActiveTab := TabConfirma;
        end
        else
        begin
          ShowMessage('Nenhuma equipe foi encontrada com o código "' + EdtHashEquipe.Text + '"!');
          EdtHashEquipe.Text := '';
          EdtHashEquipe.SetFocus;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtHashEquipe.Text := '';
          EdtHashEquipe.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtHashEquipe.Text := '';
          EdtHashEquipe.SetFocus;
        end;
      end;
    end
    else
    begin
      ShowMessage('Preencha o campo!');
      EdtHashEquipe.SetFocus;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtHashEquipe.Text := '';
    EdtHashEquipe.SetFocus;
  end;
end;

procedure TFrmPrincipal.BtnLimpar1Click(Sender: TObject);
begin
  EdtHashEquipe.Text := '';
  EdtHashEquipe.SetFocus;
end;

procedure TFrmPrincipal.BtnSair4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.BtnEventos2Click(Sender: TObject);
begin
  MultiView4.HideMaster;
  TabControl1.ActiveTab := TabEventos;
  cod_votante := 0;
  cod_equipe := 0;
  EdtHashVotante.Text := '';
  EdtHashEquipe.Text := '';
  TxtNomeEquipe.Text := '';
  TxtDescricaoEquipe.Text := '';
  TxtIntegrantesEquipe.Text := '';
end;

procedure TFrmPrincipal.BtnLogout4Click(Sender: TObject);
begin
  try
    if (MessageDlg('Deseja mesmo fazer o logout?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      MultiView4.HideMaster;
      TabControl1.ActiveTab := TabLogin;
      FrmPrincipal.WindowState := TWindowState.wsNormal;
      FrmPrincipal.BorderStyle := TFMxFormBorderStyle.None;
      FrmPrincipal.Width := 1120;
      FrmPrincipal.Height := 500;
      FrmPrincipal.Position := TFormPosition.ScreenCenter;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
      cod_administrador := 0;
      cod_evento := 0;
      cod_votante := 0;
      cod_equipe := 0;
      EdtNome.Text := '';
      EdtCodigo.Text := '';
      EdtHashVotante.Text := '';
      EdtHashEquipe.Text := '';
      TxtNomeEquipe.Text := '';
      TxtDescricaoEquipe.Text := '';
      TxtIntegrantesEquipe.Text := '';
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.BtnConfirmaMouseEnter(Sender: TObject);
begin
  BtnConfirma.Fill.Color := $FFFFFFFF;
  TxtBtnConfirma.TextSettings.FontColor := $FF0CB529;
end;

procedure TFrmPrincipal.BtnConfirmaMouseLeave(Sender: TObject);
begin
  BtnConfirma.Fill.Color := $FF0CB529;
  TxtBtnConfirma.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnCorrigeMouseEnter(Sender: TObject);
begin
  BtnCorrige.Fill.Color := $FFD50A0A;
  TxtBtnCorrige.TextSettings.FontColor := $FFFFFFFF;
end;

procedure TFrmPrincipal.BtnCorrigeMouseLeave(Sender: TObject);
begin
  BtnCorrige.Fill.Color := $FFFFFFFF;
  TxtBtnCorrige.TextSettings.FontColor := $FFD50A0A;
end;

procedure TFrmPrincipal.BtnConfirmaClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  try
    DtM.RESTRequest1.Resource := 'vota-equipe.php?key={key}&cod_equipe={cod_equipe}';
    DtM.RESTRequest1.Params.AddUrlSegment('key', key);
    DtM.RESTRequest1.Params.AddUrlSegment('cod_equipe', IntToStr(cod_equipe));
    DtM.RESTRequest1.Execute;

    retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

    if (retorno.GetValue('error').Value = 'false') then
    begin
      TabControl1.ActiveTab := TabMensagem;
      TxtCountdown.Text := 'Saindo em (5) segundos...';
      countdown := 5;
      Timer2.Enabled := true;
    end
    else
    begin
      if (msg_error = true) then
      begin
        ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
      end
      else
      begin
        ShowMessage('Oops... Algo deu errado!');
      end;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.BtnCorrigeClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabVotaEquipe;
  cod_equipe := 0;
  TxtNomeEquipe.Text := '';
  TxtDescricaoEquipe.Text := '';
  TxtIntegrantesEquipe.Text := '';
end;

procedure TFrmPrincipal.BtnSair5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.BtnEventos3Click(Sender: TObject);
begin
  MultiView5.HideMaster;
  TabControl1.ActiveTab := TabEventos;
  cod_votante := 0;
  cod_equipe := 0;
  EdtHashVotante.Text := '';
  EdtHashEquipe.Text := '';
  TxtNomeEquipe.Text := '';
  TxtDescricaoEquipe.Text := '';
  TxtIntegrantesEquipe.Text := '';
end;

procedure TFrmPrincipal.BtnLogout5Click(Sender: TObject);
begin
  try
    if (MessageDlg('Deseja mesmo fazer o logout?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      MultiView5.HideMaster;
      TabControl1.ActiveTab := TabLogin;
      FrmPrincipal.WindowState := TWindowState.wsNormal;
      FrmPrincipal.BorderStyle := TFMxFormBorderStyle.None;
      FrmPrincipal.Width := 1120;
      FrmPrincipal.Height := 500;
      FrmPrincipal.Position := TFormPosition.ScreenCenter;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
      cod_administrador := 0;
      cod_evento := 0;
      cod_votante := 0;
      cod_equipe := 0;
      EdtNome.Text := '';
      EdtCodigo.Text := '';
      EdtHashVotante.Text := '';
      EdtHashEquipe.Text := '';
      TxtNomeEquipe.Text := '';
      TxtDescricaoEquipe.Text := '';
      TxtIntegrantesEquipe.Text := '';
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmPrincipal.Timer2Timer(Sender: TObject);
begin
  if (countdown = 5) then
  begin
    TxtCountdown.Text := 'Saindo em (4) segundos...';
    countdown := 4;
  end
  else if (countdown = 4) then
  begin
    TxtCountdown.Text := 'Saindo em (3) segundos...';
    countdown := 3;
  end
  else if (countdown = 3) then
  begin
    TxtCountdown.Text := 'Saindo em (2) segundos...';
    countdown := 2;
  end
  else if (countdown = 2) then
  begin
    TxtCountdown.Text := 'Saindo em (1) segundos...';
    countdown := 1;
  end
  else if (countdown = 1) then
  begin
    timer2.Enabled := false;
    TxtCountdown.Text := 'Saindo em (0) segundos...';
    cod_votante := 0;
    cod_equipe := 0;
    EdtHashVotante.Text := '';
    EdtHashEquipe.Text := '';
    TxtNomeEquipe.Text := '';
    TxtDescricaoEquipe.Text := '';
    TxtIntegrantesEquipe.Text := '';
    TabControl1.ActiveTab := TabLoginVotante;
    EdtHashVotante.SetFocus;
  end;
end;

end.
