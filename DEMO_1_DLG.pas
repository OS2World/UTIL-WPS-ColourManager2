Unit DEMO_1_DLG;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, Buttons;

Implementation

Procedure TDemo_1_DLG.Demo_1_DLGOnActivate (Sender: TObject);
Begin
  //WinSetFocus(HWND_DESKTOP,Demo_2_DLG.Handle);
End;

Procedure TDemo_1_DLG.ListBox1OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_1_DLG.MenuItemOnClick (Sender: TObject);
Begin

End;

Procedure TDemo_1_DLG.Button1OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_1_DLG.Label2OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_1_DLG.Label1OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_1_DLG.Edit1OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_1_DLG.Demo_DLGOnClick (Sender: TObject);
Begin

End;

Procedure TDemo_1_DLG.Demo_DLGOnShow (Sender: TObject);
Begin
  moveable:=false;SIZEABLE:=FALSE;
  left:=120;
  top:=200;
  height:=250;
  width:=250;
End;

Procedure TDemo_1_DLG.Demo_DLGOnCloseQuery (Sender: TObject;
  Var CanClose: Boolean);
Begin
  //CanClose:=false;
End;

Initialization
End.
