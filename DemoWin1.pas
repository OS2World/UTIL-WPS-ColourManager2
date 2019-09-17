Unit DemoWin1;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, ExtCtrls, ListView;

Type
  TDemo1_DLG = Class (TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Procedure Demo1_DLGOnShow (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  Demo1_DLG: TDemo1_DLG;

Implementation

Procedure TDemo1_DLG.Demo1_DLGOnShow (Sender: TObject);
VAR ICON:TICON;
Begin
  moveable:=false;
  left:=20;
  top:=20;
  height:=150;
  width:=200;
  ICON.CREATE;ICON.LOADFROMRESOURCEID(100);
  IMAGE1.ICON:=ICON;
  ICON.DESTROY;
End;

Initialization
  RegisterClasses ([TDemo1_DLG, TImage, TLabel]);
End.
