program PjrAdministrador;

uses
  System.StartUpCopy,
  FMX.Forms,
  ULogin in 'ULogin.pas' {FrmLogin},
  UCadastro in 'UCadastro.pas' {FrmCadastro},
  UDtM in 'UDtM.pas' {DtM: TDataModule},
  UMain in 'UMain.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TDtM, DtM);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
