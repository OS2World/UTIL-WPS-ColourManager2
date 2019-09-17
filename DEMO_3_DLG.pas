Unit DEMO_3_DLG;

Interface

Uses
  Classes, Forms, Graphics;

Implementation

Procedure TDemo_3_DLG.Demo_3_DLGOnMDIActivate (Sender: TObject; Child: TForm);
Begin

End;

Procedure TDemo_3_DLG.Demo_3_DLGOnShow (Sender: TObject);
Begin
  moveable:=false;SIZEABLE:=FALSE;
  left:=20;
  top:=20;
  height:=160;
  width:=170;
End;

Procedure TDemo_3_DLG.Demo_3_DLGOnCreate (Sender: TObject);
Begin

End;

Initialization
End.
