program PrjVotoPopular;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UDtM in 'UDtM.pas' {DtM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TDtM, DtM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
