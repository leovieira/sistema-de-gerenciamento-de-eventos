unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.ListBox, FMX.Layouts, FMX.TabControl, FMX.MultiView, System.Rtti,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, 
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, 
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, 
  jsonadapter, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, 
  FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.Memo, FMX.Platform,

  //--------------------
  REST.Client,
  Web.HTTPApp,
  REST.Types,
  System.JSON,
  FireDAC.Stan.Param,
  REST.Response.Adapter,  
  FireDAC.Stan.Option
  ;

type
  TFrmMain = class(TForm)
    Rectangle1: TRectangle;
    BtnMenu1: TSpeedButton;
    BtnSair1: TSpeedButton;
    MultiView1: TMultiView;
    TabControl1: TTabControl;
    TabEventos: TTabItem;
    ListBox1: TListBox;
    BtnLogout: TListBoxItem;
    Line1: TLine;
    GroupBox1: TGroupBox;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtCodigo: TEdit;
    Label4: TLabel;
    BtnBuscarEvento: TRoundRect;
    TxtBtnBuscarEvento: TText;
    StringGrid1: TStringGrid;
    FDMemTable1: TFDMemTable;
    FDMemTable1cod_evento: TStringField;
    FDMemTable1nome: TStringField;
    FDMemTable1descricao: TStringField;
    FDMemTable1instituicao: TStringField;
    FDMemTable1cod_administrador: TStringField;
    FDMemTable1cod_avaliadores: TStringField;
    JSONDatasetAdapter1: TJSONDatasetAdapter;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    VertScrollBox1: TVertScrollBox;
    BtnCadastraEvento: TRoundRect;
    TxtBtnCadastraEvento: TText;
    Text1: TText;
    BtnAtualizaEvento: TRoundRect;
    TxtBtnAtualizaEvento: TText;
    BtnDeletaEvento: TRoundRect;
    TxtBtnDeletaEvento: TText;
    BtnMais: TRoundRect;
    TxtBtnMais: TText;
    BtnAtualizaDados: TListBoxItem;
    Line2: TLine;
    BtnDeletaConta: TListBoxItem;
    Line3: TLine;
    TabAtualizaDados: TTabItem;
    TabCadastraEvento: TTabItem;
    BtnEventos: TListBoxItem;
    Line4: TLine;
    VertScrollBox2: TVertScrollBox;
    StyleBook1: TStyleBook;
    BtnAtualizarDados: TRoundRect;
    TxtBtnAtualizarDados1: TText;
    EdtNomeAtualizar: TEdit;
    EdtSenhaAtualizar: TEdit;
    EdtUsuarioAtualizar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Rectangle2: TRectangle;
    BtnVoltar1: TSpeedButton;
    BtnSair2: TSpeedButton;
    Text2: TText;
    Rectangle3: TRectangle;
    BtnVoltar2: TSpeedButton;
    BtnSair: TSpeedButton;
    Text3: TText;
    VertScrollBox3: TVertScrollBox;
    BtnCadastrarEvento: TRoundRect;
    TxtBtnCadastrarEvento: TText;
    EdtNomeEventoCadastrar: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MmDescricaoEventoCadastrar: TMemo;
    EdtInstituicaoEventoCadastrar: TEdit;
    Rectangle4: TRectangle;
    TabAtualizaEvento: TTabItem;
    Rectangle5: TRectangle;
    BtnVoltar3: TSpeedButton;
    BtnSair3: TSpeedButton;
    Text4: TText;
    VertScrollBox4: TVertScrollBox;
    BtnAtualizarEvento: TRoundRect;
    TxtBtnAtualizarEvento: TText;
    EdtNomeEventoAtualizar: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdtInstituicaoEventoAtualizar: TEdit;
    Rectangle6: TRectangle;
    MmDescricaoEventoAtualizar: TMemo;
    TabMais: TTabItem;
    Rectangle7: TRectangle;
    BtnVoltar4: TSpeedButton;
    BtnSair4: TSpeedButton;
    Text5: TText;
    VertScrollBox5: TVertScrollBox;
    BtnGeraVotantes: TRoundRect;
    TxtBtnGeraVotantes: TText;
    BtnCopiaVotantes: TRoundRect;
    TxtBtnCopiaVotantes: TText;
    BtnVerificaGanhador: TRoundRect;
    TxtBtnVerificaGanhador: TText;
    TabEquipes: TTabItem;
    TabCadastraEquipe: TTabItem;
    TabAtualizaEquipe: TTabItem;
    TabGeraVotantes: TTabItem;
    TabVerificaGanhador: TTabItem;
    Rectangle8: TRectangle;
    BtnVoltar6: TSpeedButton;
    BtnSair6: TSpeedButton;
    Text6: TText;
    VertScrollBox6: TVertScrollBox;
    BtnCadastrarEquipe: TRoundRect;
    TxtBtnCadastrarEquipe: TText;
    EdtNomeEquipeCadastrar: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtIntegrantesEquipeCadastrar: TEdit;
    Rectangle9: TRectangle;
    MmDescricaoEquipeCadastrar: TMemo;
    Rectangle10: TRectangle;
    BtnVoltar5: TSpeedButton;
    BtnSair5: TSpeedButton;
    Text7: TText;
    VertScrollBox7: TVertScrollBox;
    BtnAtualizaEquipe: TRoundRect;
    TxtBtnAtualizaEquipe: TText;
    BtnCadastraEquipe: TRoundRect;
    TxtBtnCadastraEquipe: TText;
    BtnDeletaEquipe: TRoundRect;
    TxtBtnDeletaEquipe: TText;
    BtnEquipes: TRoundRect;
    TxtBtnEquipes: TText;
    GroupBox2: TGroupBox;
    EdtNomeEquipe: TEdit;
    Label15: TLabel;
    EdtCodigoEquipe: TEdit;
    Label16: TLabel;
    BtnBuscarEquipe: TRoundRect;
    Text8: TText;
    StringGrid2: TStringGrid;
    FDMemTable2: TFDMemTable;
    JSONDatasetAdapter2: TJSONDatasetAdapter;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Rectangle11: TRectangle;
    BtnVoltar7: TSpeedButton;
    BtnSair7: TSpeedButton;
    Text9: TText;
    VertScrollBox8: TVertScrollBox;
    BtnAtualizarEquipe: TRoundRect;
    TxtBtnAtualizarEquipe: TText;
    EdtNomeEquipeAtualizar: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EdtIntegrantesEquipeAtualizar: TEdit;
    Rectangle12: TRectangle;
    MmDescricaoEquipeAtualizar: TMemo;
    Rectangle13: TRectangle;
    BtnVoltar8: TSpeedButton;
    BtnSair8: TSpeedButton;
    Text10: TText;
    VertScrollBox9: TVertScrollBox;
    BtnGerarVotantes: TRoundRect;
    TxtBtnGerarVotantes: TText;
    EdtQuantidadeVotantes: TEdit;
    Label20: TLabel;
    ScaledLayout1: TScaledLayout;
    BtnDeletaVotantes: TRoundRect;
    TxtBtnDeletaVotantes: TText;
    Rectangle14: TRectangle;
    BtnVoltar9: TSpeedButton;
    BtnSair9: TSpeedButton;
    Text11: TText;
    VertScrollBox10: TVertScrollBox;
    BtnAtualizarGanhador: TRoundRect;
    TxtBtnAtualizarGanhador: TText;
    Layout1: TLayout;
    Text12: TText;
    Layout2: TLayout;
    Text13: TText;
    TxtNomeEquipe1: TText;
    Layout3: TLayout;
    Text14: TText;
    TxtDescricaoEquipe1: TText;
    Layout4: TLayout;
    Text15: TText;
    TxtIntegrantesEquipe1: TText;
    Layout5: TLayout;
    Text16: TText;
    TxtVotosEquipe1: TText;
    Layout6: TLayout;
    Text17: TText;
    Layout7: TLayout;
    Text18: TText;
    TxtNomeEquipe2: TText;
    Layout8: TLayout;
    Text20: TText;
    TxtDescricaoEquipe2: TText;
    Layout9: TLayout;
    Text22: TText;
    TxtIntegrantesEquipe2: TText;
    Layout10: TLayout;
    Text24: TText;
    TxtVotosEquipe2: TText;
    Layout11: TLayout;
    Text19: TText;
    Layout12: TLayout;
    Text21: TText;
    TxtNomeEquipe3: TText;
    Layout13: TLayout;
    Text25: TText;
    TxtDescricaoEquipe3: TText;
    Layout14: TLayout;
    Text27: TText;
    TxtIntegrantesEquipe3: TText;
    Layout15: TLayout;
    Text29: TText;
    TxtVotosEquipe3: TText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSair1Click(Sender: TObject);
    procedure BtnEventosClick(Sender: TObject);
    procedure BtnAtualizaDadosClick(Sender: TObject);
    procedure BtnDeletaContaClick(Sender: TObject);
    procedure BtnLogoutClick(Sender: TObject);
    procedure BtnVoltar1Click(Sender: TObject);
    procedure BtnSair2Click(Sender: TObject);
    procedure BtnAtualizarDadosClick(Sender: TObject);
    procedure BtnBuscarEventoClick(Sender: TObject);
    procedure BtnCadastraEventoClick(Sender: TObject);
    procedure BtnVoltar2Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCadastrarEventoClick(Sender: TObject);
    procedure BtnAtualizaEventoClick(Sender: TObject);
    procedure BtnVoltar3Click(Sender: TObject);
    procedure BtnSair3Click(Sender: TObject);
    procedure BtnAtualizarEventoClick(Sender: TObject);
    procedure BtnDeletaEventoClick(Sender: TObject);
    procedure BtnMaisClick(Sender: TObject);
    procedure BtnVoltar4Click(Sender: TObject);
    procedure BtnSair4Click(Sender: TObject);
    procedure BtnEquipesClick(Sender: TObject);
    procedure BtnVoltar5Click(Sender: TObject);
    procedure BtnSair5Click(Sender: TObject);
    procedure BtnBuscarEquipeClick(Sender: TObject);
    procedure BtnCadastraEquipeClick(Sender: TObject);
    procedure BtnVoltar6Click(Sender: TObject);
    procedure BtnSair6Click(Sender: TObject);
    procedure BtnCadastrarEquipeClick(Sender: TObject);
    procedure BtnAtualizaEquipeClick(Sender: TObject);
    procedure BtnVoltar7Click(Sender: TObject);
    procedure BtnSair7Click(Sender: TObject);
    procedure BtnAtualizarEquipeClick(Sender: TObject);
    procedure BtnDeletaEquipeClick(Sender: TObject);
    procedure BtnGeraVotantesClick(Sender: TObject);
    procedure BtnVoltar8Click(Sender: TObject);
    procedure BtnSair8Click(Sender: TObject);
    procedure BtnGerarVotantesClick(Sender: TObject);
    procedure BtnCopiaVotantesClick(Sender: TObject);
    procedure BtnDeletaVotantesClick(Sender: TObject);
    procedure BtnVerificaGanhadorClick(Sender: TObject);
    procedure BtnVoltar9Click(Sender: TObject);
    procedure BtnSair9Click(Sender: TObject);
    procedure BtnAtualizarGanhadorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  cod_administrador, cod_evento, cod_equipe, votos: integer;

const
  key = 'dpc0p1yim82b5s0tfk3s';
  msg_error = true;

implementation

{$R *.fmx}

uses UDtM, ULogin;

function IsNumeric(s : string) : boolean;
begin
  result := true;
  try
    StrToInt(s);
  except
    result := false;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := TabEventos;
  MultiView1.Visible := false;
  MultiView1.HideMaster;
end;

procedure TFrmMain.FormShow(Sender: TObject);
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
              end
              else
              begin
                ShowMessage('Oops... Algo deu errado!');
              end;
            end;
          end
          else
          begin
            FrmLogin.Show;
            FrmMain.Hide;
            DtM.FDQryDeleteAdmin.Close;
            DtM.FDQryDeleteAdmin.OpenOrExecute;
          end;
        end
        else
        begin
          FrmLogin.Show;
          FrmMain.Hide;
          DtM.FDQryDeleteAdmin.Close;
          DtM.FDQryDeleteAdmin.OpenOrExecute;
        end;
      end
      else
      begin
        FrmLogin.Show;
        FrmMain.Hide;
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
        end;
        DtM.FDQryDeleteAdmin.Close;
        DtM.FDQryDeleteAdmin.OpenOrExecute;
      end;
    end
    else
    begin
      FrmLogin.Show;
      FrmMain.Hide;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
    end;
  except
    FrmLogin.Show;
    FrmMain.Hide;
    ShowMessage('Oops... Algo deu errado!');
    DtM.FDQryDeleteAdmin.Close;
    DtM.FDQryDeleteAdmin.OpenOrExecute;
  end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnSair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnEventosClick(Sender: TObject);
begin
  MultiView1.HideMaster;
  TabControl1.ActiveTab := TabEventos;
end;

procedure TFrmMain.BtnAtualizaDadosClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  MultiView1.HideMaster;
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

            cod_administrador := DtM.FDQrySelectAdmincod_administrador.Value;

            EdtNomeAtualizar.Text := DtM.FDQrySelectAdminnome.Value;
            EdtUsuarioAtualizar.Text := DtM.FDQrySelectAdminusuario.Value;
            EdtSenhaAtualizar.Text := '';

            TabControl1.ActiveTab := TabAtualizaDados;
          end
          else
          begin
            FrmLogin.Show;
            FrmMain.Hide;
            DtM.FDQryDeleteAdmin.Close;
            DtM.FDQryDeleteAdmin.OpenOrExecute;
          end;
        end
        else
        begin
          FrmLogin.Show;
          FrmMain.Hide;
          DtM.FDQryDeleteAdmin.Close;
          DtM.FDQryDeleteAdmin.OpenOrExecute;
        end;
      end
      else
      begin
        FrmLogin.Show;
        FrmMain.Hide;
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
        end;
        DtM.FDQryDeleteAdmin.Close;
        DtM.FDQryDeleteAdmin.OpenOrExecute;
      end;
    end
    else
    begin
      FrmLogin.Show;
      FrmMain.Hide;
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
    end;
  except
    FrmLogin.Show;
    FrmMain.Hide;
    ShowMessage('Oops... Algo deu errado!');
    DtM.FDQryDeleteAdmin.Close;
    DtM.FDQryDeleteAdmin.OpenOrExecute;
  end;
end;

procedure TFrmMain.BtnDeletaContaClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  MultiView1.HideMaster;
  try
    if (MessageDlg('Deseja mesmo deletar a conta?' + #13 +
    'Você perderá todos os eventos relacionados a ela.', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      DtM.RESTRequest1.Resource := 'deleta-administrador.php?key={key}&cod_administrador={cod_administrador}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        DtM.FDQryDeleteAdmin.Close;
        DtM.FDQryDeleteAdmin.OpenOrExecute;
        FrmLogin.Show;
        FrmMain.Hide;
        cod_administrador := 0;
        cod_evento := 0;
        cod_equipe := 0;
        EdtNome.Text := '';
        EdtCodigo.Text := '';
        ShowMessage('Conta deletada com sucesso!');
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
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnLogoutClick(Sender: TObject);
begin
  MultiView1.HideMaster;
  try
    if (MessageDlg('Deseja mesmo fazer o logout?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      DtM.FDQryDeleteAdmin.Close;
      DtM.FDQryDeleteAdmin.OpenOrExecute;
      FrmLogin.Show;
      FrmMain.Hide;
      cod_administrador := 0;
      cod_evento := 0;
      cod_equipe := 0;
      EdtNome.Text := '';
      EdtCodigo.Text := '';
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnVoltar1Click(Sender: TObject);
begin
  MultiView1.HideMaster;
  TabControl1.ActiveTab := TabEventos;
end;

procedure TFrmMain.BtnSair2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnAtualizarDadosClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  try
    if (EdtNomeAtualizar.Text <> '') and (EdtUsuarioAtualizar.Text <> '') and (EdtSenhaAtualizar.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'atualiza-administrador.php?key={key}&cod_administrador={cod_administrador}&nome={nome}&usuario={usuario}&senha={senha}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNomeAtualizar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('usuario', EdtUsuarioAtualizar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('senha', EdtSenhaAtualizar.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        DtM.FDQryUpdateAdmin.Close;
        DtM.FDQryUpdateAdmin.ParamByName('cod_administrador').AsInteger := cod_administrador;
        DtM.FDQryUpdateAdmin.ParamByName('nome').AsString := EdtNomeAtualizar.Text;
        DtM.FDQryUpdateAdmin.ParamByName('usuario').AsString := EdtUsuarioAtualizar.Text;
        DtM.FDQryUpdateAdmin.ParamByName('senha').AsString := EdtSenhaAtualizar.Text;
        DtM.FDQryUpdateAdmin.OpenOrExecute;
        ShowMessage('Os dados foram alterados com sucesso!');
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
    else
    begin
      ShowMessage('Preencha todos os campos!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnBuscarEventoClick(Sender: TObject);
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

procedure TFrmMain.BtnCadastraEventoClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabCadastraEvento;
end;

procedure TFrmMain.BtnVoltar2Click(Sender: TObject);
begin
  MultiView1.HideMaster;
  TabControl1.ActiveTab := TabEventos;
end;

procedure TFrmMain.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnCadastrarEventoClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (EdtNomeEventoCadastrar.Text <> '') and (MmDescricaoEventoCadastrar.Lines.Text <> '') and (EdtInstituicaoEventoCadastrar.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'cadastra-evento.php?key={key}&nome={nome}&descricao={descricao}&instituicao={instituicao}&cod_administrador={cod_administrador}&cod_avaliadores={cod_avaliadores}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNomeEventoCadastrar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('descricao', MmDescricaoEventoCadastrar.Lines.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('instituicao', EdtInstituicaoEventoCadastrar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
      DtM.RESTRequest1.Params.AddUrlSegment('cod_avaliadores', '');
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        ShowMessage('Cadastro realizado com sucesso!');
        EdtNomeEventoCadastrar.Text := '';
        MmDescricaoEventoCadastrar.Lines.Clear;
        EdtInstituicaoEventoCadastrar.Text := '';
        EdtNomeEventoCadastrar.SetFocus;
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
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNomeEventoCadastrar.Text := '';
          MmDescricaoEventoCadastrar.Lines.Clear;
          EdtInstituicaoEventoCadastrar.Text := '';
          EdtNomeEventoCadastrar.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNomeEventoCadastrar.Text := '';
          MmDescricaoEventoCadastrar.Lines.Clear;
          EdtInstituicaoEventoCadastrar.Text := '';
          EdtNomeEventoCadastrar.SetFocus;
        end;
      end;
    end
    else
    begin
      ShowMessage('Preencha todos os campos!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtNomeEventoCadastrar.Text := '';
    MmDescricaoEventoCadastrar.Lines.Clear;
    EdtInstituicaoEventoCadastrar.Text := '';
    EdtNomeEventoCadastrar.SetFocus;
  end;
end;

procedure TFrmMain.BtnAtualizaEventoClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  orows: TJSONObject;
begin
  try
    if (StringGrid1.Cells[0, StringGrid1.Row] <> '') then
    begin
      cod_evento := StrToInt(StringGrid1.Cells[0, StringGrid1.Row]);
      //ShowMessage(IntToStr(cod_evento));
      DtM.RESTRequest1.Resource := 'busca-eventos.php?key={key}&cod_evento={cod_evento}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) = 1) then
        begin
          prows := retorno.Get('eventos');
          arrayr := prows.JsonValue as TJSONArray;
          //ShowMessage(arrayr.ToString);
          orows := arrayr.Items[0] as TJSONObject;

          EdtNomeEventoAtualizar.Text := orows.GetValue('nome').Value;
          MmDescricaoEventoAtualizar.Lines.Text := orows.GetValue('descricao').Value;
          EdtInstituicaoEventoAtualizar.Text := orows.GetValue('instituicao').Value;

          TabControl1.ActiveTab := TabAtualizaEvento;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
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
    else
    begin
      ShowMessage('Nenhum evento selecionado!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnVoltar3Click(Sender: TObject);
begin
  MultiView1.HideMaster;
  TabControl1.ActiveTab := TabEventos;
end;

procedure TFrmMain.BtnSair3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnAtualizarEventoClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (EdtNomeEventoAtualizar.Text <> '') and (MmDescricaoEventoAtualizar.Lines.Text <> '') and (EdtInstituicaoEventoAtualizar.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'atualiza-evento.php?key={key}&cod_evento={cod_evento}&nome={nome}&descricao={descricao}&instituicao={instituicao}&cod_administrador={cod_administrador}&cod_avaliadores={cod_avaliadores}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNomeEventoAtualizar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('descricao', MmDescricaoEventoAtualizar.Lines.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('instituicao', EdtInstituicaoEventoAtualizar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_administrador', IntToStr(cod_administrador));
      DtM.RESTRequest1.Params.AddUrlSegment('cod_avaliadores', '');
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        ShowMessage('Os dados foram alterados com sucesso!');

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
    else
    begin
      ShowMessage('Preencha todos os campos!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnDeletaEventoClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (StringGrid1.Cells[0, StringGrid1.Row] <> '') then
    begin
      cod_evento := StrToInt(StringGrid1.Cells[0, StringGrid1.Row]);
      if (MessageDlg('Deseja mesmo deletar o evento?' + #13 +
      'Você perderá todos os dados relacionados a ele.', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
      begin
        DtM.RESTRequest1.Resource := 'deleta-evento.php?key={key}&cod_evento={cod_evento}';
        DtM.RESTRequest1.Params.AddUrlSegment('key', key);
        DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
        DtM.RESTRequest1.Execute;

        retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

        if (retorno.GetValue('error').Value = 'false') then
        begin
          EdtNome.Text := '';
          EdtCodigo.Text := '';
          ShowMessage('Evento deletado com sucesso!');

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
      end;
    end
    else
    begin
      ShowMessage('Nenhum evento selecionado!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnMaisClick(Sender: TObject);
begin
  if (StringGrid1.Cells[0, StringGrid1.Row] <> '') then
  begin
    cod_evento := StrToInt(StringGrid1.Cells[0, StringGrid1.Row]);
    TabControl1.ActiveTab := TabMais;
  end
  else
  begin
    ShowMessage('Nenhum evento selecionado!');
  end;
end;

procedure TFrmMain.BtnVoltar4Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabEventos;
end;

procedure TFrmMain.BtnSair4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnEquipesClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    TabControl1.ActiveTab := TabEquipes;

    DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe=@all';
    DtM.RESTRequest1.Params.AddUrlSegment('key', key);
    DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
    DtM.RESTRequest1.Execute;

    retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

    if (retorno.GetValue('error').Value = 'false') then
    begin
      if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
      begin
        prows := retorno.Get('equipes');
        arrayr := prows.JsonValue as TJSONArray;
        sl := TStringList.Create;
        sl.Text := arrayr.ToString;
        JSONDatasetAdapter2.JSON := sl;
        //ShowMessage(arrayr.ToString);
      end
      else
      begin
        sl := TStringList.Create;
        sl.Text := '[]';
        JSONDatasetAdapter2.JSON := sl;
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

procedure TFrmMain.BtnVoltar5Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabMais;
end;

procedure TFrmMain.BtnSair5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnBuscarEquipeClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (EdtNomeEquipe.Text = '') and (EdtCodigoEquipe.Text = '') then
    begin
      DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe=@all';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
        begin
          prows := retorno.Get('equipes');
          arrayr := prows.JsonValue as TJSONArray;
          sl := TStringList.Create;
          sl.Text := arrayr.ToString;
          JSONDatasetAdapter2.JSON := sl;
          //ShowMessage(arrayr.ToString);
        end
        else
        begin
          sl := TStringList.Create;
          sl.Text := '[]';
          JSONDatasetAdapter2.JSON := sl;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end;
      end;
    end
    else if (EdtNomeEquipe.Text <> '') and (EdtCodigoEquipe.Text = '') then
    begin
      DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&nome={nome}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNomeEquipe.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
        begin
          prows := retorno.Get('equipes');
          arrayr := prows.JsonValue as TJSONArray;
          sl := TStringList.Create;
          sl.Text := arrayr.ToString;
          JSONDatasetAdapter2.JSON := sl;
          //ShowMessage(arrayr.ToString);
        end
        else
        begin
          ShowMessage('Nenhum resultado para "' + EdtNomeEquipe.Text + '"!');
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end;
      end;
    end
    else if (EdtNomeEquipe.Text = '') and (EdtCodigoEquipe.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe={cod_equipe}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Params.AddUrlSegment('cod_equipe', EdtCodigoEquipe.Text);
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
        begin
          prows := retorno.Get('equipes');
          arrayr := prows.JsonValue as TJSONArray;
          sl := TStringList.Create;
          sl.Text := arrayr.ToString;
          JSONDatasetAdapter2.JSON := sl;
          //ShowMessage(arrayr.ToString);
        end
        else
        begin
          ShowMessage('Nenhum resultado para "' + EdtCodigoEquipe.Text + '"!');
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end;
      end
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          EdtNomeEquipe.SetFocus;
        end;
      end;
    end
    else
    begin
      ShowMessage('Preencha apenas um campo!');
      EdtNomeEquipe.Text := '';
      EdtCodigoEquipe.Text := '';
      EdtNomeEquipe.SetFocus;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtNomeEquipe.Text := '';
    EdtCodigoEquipe.Text := '';
    EdtNomeEquipe.SetFocus;
  end;
end;

procedure TFrmMain.BtnCadastraEquipeClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabCadastraEquipe;  
end;

procedure TFrmMain.BtnVoltar6Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabEquipes;
end;

procedure TFrmMain.BtnSair6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnCadastrarEquipeClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (EdtNomeEquipeCadastrar.Text <> '') and (MmDescricaoEquipeCadastrar.Lines.Text <> '') and (EdtIntegrantesEquipeCadastrar.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'cadastra-equipe.php?key={key}&nome={nome}&descricao={descricao}&integrantes={integrantes}&votos={votos}&cod_evento={cod_evento}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNomeEquipeCadastrar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('descricao', MmDescricaoEquipeCadastrar.Lines.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('integrantes', EdtIntegrantesEquipeCadastrar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('votos', '0');
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        ShowMessage('Cadastro realizado com sucesso!');
        EdtNomeEquipeCadastrar.Text := '';
        MmDescricaoEquipeCadastrar.Lines.Clear;
        EdtIntegrantesEquipeCadastrar.Text := '';
        EdtNomeEquipeCadastrar.SetFocus;

        EdtNomeEquipe.Text := '';
        EdtCodigoEquipe.Text := '';
        EdtNomeEquipe.SetFocus;

        DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe=@all';
        DtM.RESTRequest1.Params.AddUrlSegment('key', key);
        DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
        DtM.RESTRequest1.Execute;

        retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

        if (retorno.GetValue('error').Value = 'false') then
        begin
          if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
          begin
            prows := retorno.Get('equipes');
            arrayr := prows.JsonValue as TJSONArray;
            sl := TStringList.Create;
            sl.Text := arrayr.ToString;
            JSONDatasetAdapter2.JSON := sl;
            //ShowMessage(arrayr.ToString);
          end
          else
          begin
            sl := TStringList.Create;
            sl.Text := '[]';
            JSONDatasetAdapter2.JSON := sl;
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
      else
      begin
        if (msg_error = true) then
        begin
          ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
          EdtNomeEquipeCadastrar.Text := '';
          MmDescricaoEquipeCadastrar.Lines.Clear;
          EdtIntegrantesEquipeCadastrar.Text := '';
          EdtNomeEquipeCadastrar.SetFocus;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
          EdtNomeEquipeCadastrar.Text := '';
          MmDescricaoEquipeCadastrar.Lines.Clear;
          EdtIntegrantesEquipeCadastrar.Text := '';
          EdtNomeEquipeCadastrar.SetFocus;
        end;
      end;
    end
    else
    begin
      ShowMessage('Preencha todos os campos!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtNomeEquipeCadastrar.Text := '';
    MmDescricaoEquipeCadastrar.Lines.Clear;
    EdtIntegrantesEquipeCadastrar.Text := '';
    EdtNomeEquipeCadastrar.SetFocus;
  end;
end;

procedure TFrmMain.BtnAtualizaEquipeClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  orows: TJSONObject;
begin
  try
    if (StringGrid2.Cells[0, StringGrid2.Row] <> '') then
    begin
      cod_equipe := StrToInt(StringGrid2.Cells[0, StringGrid2.Row]);
      DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe={cod_equipe}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Params.AddUrlSegment('cod_equipe', IntToStr(cod_equipe));
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

          EdtNomeEquipeAtualizar.Text := orows.GetValue('nome').Value;
          MmDescricaoEquipeAtualizar.Lines.Text := orows.GetValue('descricao').Value;
          EdtIntegrantesEquipeAtualizar.Text := orows.GetValue('integrantes').Value;
          votos := StrToInt(orows.GetValue('votos').Value);

          TabControl1.ActiveTab := TabAtualizaEquipe;
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
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
    else
    begin
      ShowMessage('Nenhuma equipe selecionada!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnVoltar7Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabEquipes;
end;

procedure TFrmMain.BtnSair7Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnAtualizarEquipeClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (EdtNomeEquipeAtualizar.Text <> '') and (MmDescricaoEquipeAtualizar.Lines.Text <> '') and (EdtIntegrantesEquipeAtualizar.Text <> '') then
    begin
      DtM.RESTRequest1.Resource := 'atualiza-equipe.php?key={key}&cod_equipe={cod_equipe}&nome={nome}&descricao={descricao}&integrantes={integrantes}&votos={votos}&cod_evento={cod_evento}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_equipe', IntToStr(cod_equipe));
      DtM.RESTRequest1.Params.AddUrlSegment('nome', EdtNomeEquipeAtualizar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('descricao', MmDescricaoEquipeAtualizar.Lines.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('integrantes', EdtIntegrantesEquipeAtualizar.Text);
      DtM.RESTRequest1.Params.AddUrlSegment('votos', IntToStr(votos));
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        ShowMessage('Os dados foram alterados com sucesso!');

        EdtNomeEquipe.Text := '';
        EdtCodigoEquipe.Text := '';
        EdtNomeEquipe.SetFocus;

        DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe=@all';
        DtM.RESTRequest1.Params.AddUrlSegment('key', key);
        DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
        DtM.RESTRequest1.Execute;

        retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

        if (retorno.GetValue('error').Value = 'false') then
        begin
          if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
          begin
            prows := retorno.Get('equipes');
            arrayr := prows.JsonValue as TJSONArray;
            sl := TStringList.Create;
            sl.Text := arrayr.ToString;
            JSONDatasetAdapter2.JSON := sl;
            //ShowMessage(arrayr.ToString);
          end
          else
          begin
            sl := TStringList.Create;
            sl.Text := '[]';
            JSONDatasetAdapter2.JSON := sl;
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
    else
    begin
      ShowMessage('Preencha todos os campos!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnDeletaEquipeClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  sl: TStrings;
begin
  try
    if (StringGrid2.Cells[0, StringGrid2.Row] <> '') then
    begin
      cod_equipe := StrToInt(StringGrid2.Cells[0, StringGrid2.Row]);
      if (MessageDlg('Deseja mesmo deletar a equipe?' + #13 +
      'Você perderá todos os dados relacionados a ele.', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
      begin
        DtM.RESTRequest1.Resource := 'deleta-equipe.php?key={key}&cod_equipe={cod_equipe}';
        DtM.RESTRequest1.Params.AddUrlSegment('key', key);
        DtM.RESTRequest1.Params.AddUrlSegment('cod_equipe', IntToStr(cod_equipe));
        DtM.RESTRequest1.Execute;

        retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

        if (retorno.GetValue('error').Value = 'false') then
        begin
          EdtNomeEquipe.Text := '';
          EdtCodigoEquipe.Text := '';
          ShowMessage('Equipe deletada com sucesso!');

          DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe=@all';
          DtM.RESTRequest1.Params.AddUrlSegment('key', key);
          DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
          DtM.RESTRequest1.Execute;

          retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

          if (retorno.GetValue('error').Value = 'false') then
          begin
            if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
            begin
              prows := retorno.Get('equipes');
              arrayr := prows.JsonValue as TJSONArray;
              sl := TStringList.Create;
              sl.Text := arrayr.ToString;
              JSONDatasetAdapter2.JSON := sl;
              //ShowMessage(arrayr.ToString);
            end
            else
            begin
              sl := TStringList.Create;
              sl.Text := '[]';
              JSONDatasetAdapter2.JSON := sl;
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
      end;
    end
    else
    begin
      ShowMessage('Nenhuma equipe selecionada!');
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnGeraVotantesClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabGeraVotantes;
end;

procedure TFrmMain.BtnVoltar8Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabMais;
end;

procedure TFrmMain.BtnSair8Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnGerarVotantesClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  try
    if (EdtQuantidadeVotantes.Text <> '') then
    begin
      if (IsNumeric(EdtQuantidadeVotantes.Text) = true) then
      begin
        DtM.RESTRequest1.Resource := 'gera-votantes.php?key={key}&quantidade={quantidade}&cod_evento={cod_evento}';
        DtM.RESTRequest1.Params.AddUrlSegment('key', key);
        DtM.RESTRequest1.Params.AddUrlSegment('quantidade', EdtQuantidadeVotantes.Text);
        DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
        DtM.RESTRequest1.Execute;

        retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

        if (retorno.GetValue('error').Value = 'false') then
        begin
          if (StrToInt(EdtQuantidadeVotantes.Text) = 1) then
          begin
            ShowMessage(EdtQuantidadeVotantes.Text + ' votante gerado com sucesso!');
          end
          else if (StrToInt(EdtQuantidadeVotantes.Text) > 1) then
          begin
             ShowMessage(EdtQuantidadeVotantes.Text + ' votantes gerados com sucesso!');
          end
          else
          begin
             ShowMessage(EdtQuantidadeVotantes.Text + ' votante(s) gerado(s) com sucesso!');
          end;
          EdtQuantidadeVotantes.Text := '';
          EdtQuantidadeVotantes.SetFocus;
        end
        else
        begin
          if (msg_error = true) then
          begin
            ShowMessage('Oops... Algo deu errado!' + #13 + 'Erro: ' + retorno.GetValue('msg_error').Value);
            EdtQuantidadeVotantes.Text := '';
            EdtQuantidadeVotantes.SetFocus;
          end
          else
          begin
            ShowMessage('Oops... Algo deu errado!');
            EdtQuantidadeVotantes.Text := '';
            EdtQuantidadeVotantes.SetFocus;
          end;
        end;
      end
      else
      begin
        ShowMessage('Digite um número inteiro!');
        EdtQuantidadeVotantes.Text := '';
        EdtQuantidadeVotantes.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('Preencha o campo!');
      EdtQuantidadeVotantes.SetFocus;
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
    EdtQuantidadeVotantes.Text := '';
    EdtQuantidadeVotantes.SetFocus;
  end;
end;

procedure TFrmMain.BtnCopiaVotantesClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  Clipboard: IFMXClipboardService;
  Value: TValue;
begin
  try
    DtM.RESTRequest1.Resource := 'busca-votantes.php?key={key}&cod_evento={cod_evento}&votado=@all';
    DtM.RESTRequest1.Params.AddUrlSegment('key', key);
    DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
    DtM.RESTRequest1.Execute;

    retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

    if (retorno.GetValue('error').Value = 'false') then
    begin
      if (StrToInt(retorno.GetValue('num_linhas').Value) > 0) then
      begin
        prows := retorno.Get('votantes');
        arrayr := prows.JsonValue as TJSONArray;
        //ShowMessage(arrayr.ToString);

        //Aprimorar esta parte!
        if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, 
        IInterface(Clipboard)) then
        begin
          Value := TValue.From(arrayr.ToString);
          Clipboard.SetClipboard(Value);
          ShowMessage('Votantes copiados com sucesso!');
        end
        else
        begin
          ShowMessage('Oops... Algo deu errado!');
        end;
      end
      else
      begin
        ShowMessage('Nenhum votante gerado!');
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

procedure TFrmMain.BtnDeletaVotantesClick(Sender: TObject);
var
  retorno: TJSONObject;
begin
  try
    if (MessageDlg('Deseja mesmo deletar o(s) votante(s)?' + #13 +
    'Você perderá todos os dados relacionados a ele.', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      DtM.RESTRequest1.Resource := 'deleta-votantes.php?key={key}&cod_evento={cod_evento}';
      DtM.RESTRequest1.Params.AddUrlSegment('key', key);
      DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
      DtM.RESTRequest1.Execute;

      retorno := DtM.RESTRequest1.Response.JSONValue as TJSONObject;

      if (retorno.GetValue('error').Value = 'false') then
      begin
        EdtNomeEquipe.Text := '';
        EdtCodigoEquipe.Text := '';
        ShowMessage('Votante(s) deletado(s) com sucesso!');
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
    end;
  except
    ShowMessage('Oops... Algo deu errado!');
  end;
end;

procedure TFrmMain.BtnVerificaGanhadorClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  orows: TJSONObject;
begin
  try
    DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe=@all';
    DtM.RESTRequest1.Params.AddUrlSegment('key', key);
    DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
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
        TxtNomeEquipe1.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe1.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe1.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe1.Text := orows.GetValue('votos').Value;

        TxtNomeEquipe2.Text := '';
        TxtDescricaoEquipe2.Text := '';
        TxtIntegrantesEquipe2.Text := '';
        TxtVotosEquipe2.Text := '';

        TxtNomeEquipe3.Text := '';
        TxtDescricaoEquipe3.Text := '';
        TxtIntegrantesEquipe3.Text := '';
        TxtVotosEquipe3.Text := '';

        TabControl1.ActiveTab := TabVerificaGanhador;
      end
      else if (StrToInt(retorno.GetValue('num_linhas').Value) = 2) then
      begin
        prows := retorno.Get('equipes');
        arrayr := prows.JsonValue as TJSONArray;
        //ShowMessage(arrayr.ToString);

        orows := arrayr.Items[0] as TJSONObject;
        TxtNomeEquipe1.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe1.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe1.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe1.Text := orows.GetValue('votos').Value;

        orows := arrayr.Items[1] as TJSONObject;
        TxtNomeEquipe2.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe2.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe2.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe2.Text := orows.GetValue('votos').Value;

        TxtNomeEquipe3.Text := '';
        TxtDescricaoEquipe3.Text := '';
        TxtIntegrantesEquipe3.Text := '';
        TxtVotosEquipe3.Text := '';

        TabControl1.ActiveTab := TabVerificaGanhador;
      end
      else if (StrToInt(retorno.GetValue('num_linhas').Value) = 3) then
      begin
        prows := retorno.Get('equipes');
        arrayr := prows.JsonValue as TJSONArray;
        //ShowMessage(arrayr.ToString);

        orows := arrayr.Items[0] as TJSONObject;
        TxtNomeEquipe1.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe1.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe1.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe1.Text := orows.GetValue('votos').Value;

        orows := arrayr.Items[1] as TJSONObject;
        TxtNomeEquipe2.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe2.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe2.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe2.Text := orows.GetValue('votos').Value;

        orows := arrayr.Items[2] as TJSONObject;
        TxtNomeEquipe3.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe3.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe3.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe3.Text := orows.GetValue('votos').Value;

        TabControl1.ActiveTab := TabVerificaGanhador;
      end
      else if (StrToInt(retorno.GetValue('num_linhas').Value) = 0) then
      begin
        ShowMessage('Nenhuma equipe possui voto!');
        TxtNomeEquipe1.Text := '';
        TxtDescricaoEquipe1.Text := '';
        TxtIntegrantesEquipe1.Text := '';
        TxtVotosEquipe1.Text := '';

        TxtNomeEquipe2.Text := '';
        TxtDescricaoEquipe2.Text := '';
        TxtIntegrantesEquipe2.Text := '';
        TxtVotosEquipe2.Text := '';

        TxtNomeEquipe3.Text := '';
        TxtDescricaoEquipe3.Text := '';
        TxtIntegrantesEquipe3.Text := '';
        TxtVotosEquipe3.Text := '';
      end
      else
      begin
        ShowMessage('Oops... Algo deu errado!');
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

procedure TFrmMain.BtnVoltar9Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabMais;
end;

procedure TFrmMain.BtnSair9Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BtnAtualizarGanhadorClick(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  orows: TJSONObject;
begin
  try
    DtM.RESTRequest1.Resource := 'busca-equipes.php?key={key}&cod_evento={cod_evento}&cod_equipe=@all';
    DtM.RESTRequest1.Params.AddUrlSegment('key', key);
    DtM.RESTRequest1.Params.AddUrlSegment('cod_evento', IntToStr(cod_evento));
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
        TxtNomeEquipe1.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe1.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe1.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe1.Text := orows.GetValue('votos').Value;

        TxtNomeEquipe2.Text := '';
        TxtDescricaoEquipe2.Text := '';
        TxtIntegrantesEquipe2.Text := '';
        TxtVotosEquipe2.Text := '';

        TxtNomeEquipe3.Text := '';
        TxtDescricaoEquipe3.Text := '';
        TxtIntegrantesEquipe3.Text := '';
        TxtVotosEquipe3.Text := '';
      end
      else if (StrToInt(retorno.GetValue('num_linhas').Value) = 2) then
      begin
        prows := retorno.Get('equipes');
        arrayr := prows.JsonValue as TJSONArray;
        //ShowMessage(arrayr.ToString);

        orows := arrayr.Items[0] as TJSONObject;
        TxtNomeEquipe1.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe1.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe1.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe1.Text := orows.GetValue('votos').Value;

        orows := arrayr.Items[1] as TJSONObject;
        TxtNomeEquipe2.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe2.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe2.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe2.Text := orows.GetValue('votos').Value;

        TxtNomeEquipe3.Text := '';
        TxtDescricaoEquipe3.Text := '';
        TxtIntegrantesEquipe3.Text := '';
        TxtVotosEquipe3.Text := '';
      end
      else if (StrToInt(retorno.GetValue('num_linhas').Value) = 3) then
      begin
        prows := retorno.Get('equipes');
        arrayr := prows.JsonValue as TJSONArray;
        //ShowMessage(arrayr.ToString);

        orows := arrayr.Items[0] as TJSONObject;
        TxtNomeEquipe1.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe1.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe1.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe1.Text := orows.GetValue('votos').Value;

        orows := arrayr.Items[1] as TJSONObject;
        TxtNomeEquipe2.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe2.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe2.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe2.Text := orows.GetValue('votos').Value;

        orows := arrayr.Items[2] as TJSONObject;
        TxtNomeEquipe3.Text := orows.GetValue('nome').Value;
        TxtDescricaoEquipe3.Text := orows.GetValue('descricao').Value;
        TxtIntegrantesEquipe3.Text := orows.GetValue('integrantes').Value;
        TxtVotosEquipe3.Text := orows.GetValue('votos').Value;
      end
      else if (StrToInt(retorno.GetValue('num_linhas').Value) = 0) then
      begin
        ShowMessage('Nenhuma equipe possui voto!');
        TxtNomeEquipe1.Text := '';
        TxtDescricaoEquipe1.Text := '';
        TxtIntegrantesEquipe1.Text := '';
        TxtVotosEquipe1.Text := '';

        TxtNomeEquipe2.Text := '';
        TxtDescricaoEquipe2.Text := '';
        TxtIntegrantesEquipe2.Text := '';
        TxtVotosEquipe2.Text := '';

        TxtNomeEquipe3.Text := '';
        TxtDescricaoEquipe3.Text := '';
        TxtIntegrantesEquipe3.Text := '';
        TxtVotosEquipe3.Text := '';
      end
      else
      begin
        ShowMessage('Oops... Algo deu errado!');
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

end.
