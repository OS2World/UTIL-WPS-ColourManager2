Unit DEMO_2_DLG;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, ExtCtrls, ListView;

Implementation

Procedure TDemo_2_DLG.ICONTEXTOnClick (Sender: TObject);
Begin

End;

Procedure TDemo_2_DLG.Demo1_DLGOnShow (Sender: TObject);
VAR ICON:TICON;
Begin
  moveable:=false;SIZEABLE:=FALSE;
  left:=230;
  top:=20;
  height:=130;
  width:=150;
  ICON.CREATE;ICON.LOADFROMRESOURCEID(100);
  IMAGE1.ICON:=ICON;
  ICON.DESTROY;
End;

Initialization
End.
