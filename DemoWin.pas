Unit DemoWin;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, Buttons;

Type
  TDemo_DLG = Class (TForm)
    Static: TLabel;
    Output: TLabel;
    Button: TButton;
    EditBox: TEdit;
    Procedure MenuItemOnClick (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
    Procedure Label2OnClick (Sender: TObject);
    Procedure Label1OnClick (Sender: TObject);
    Procedure Edit1OnClick (Sender: TObject);
    Procedure Demo_DLGOnClick (Sender: TObject);
    Procedure Demo_DLGOnShow (Sender: TObject);
    Procedure Demo_DLGOnCloseQuery (Sender: TObject; Var CanClose: Boolean);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  Demo_DLG: TDemo_DLG;

Implementation

Procedure TDemo_DLG.MenuItemOnClick (Sender: TObject);
Begin

End;

Procedure TDemo_DLG.Button1OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_DLG.Label2OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_DLG.Label1OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_DLG.Edit1OnClick (Sender: TObject);
Begin

End;

Procedure TDemo_DLG.Demo_DLGOnClick (Sender: TObject);
Begin

End;

Procedure TDemo_DLG.Demo_DLGOnShow (Sender: TObject);
Begin
  moveable:=false;
  left:=120;
  top:=200;
  height:=160;
  width:=300;
End;

Procedure TDemo_DLG.Demo_DLGOnCloseQuery (Sender: TObject;
  Var CanClose: Boolean);
Begin
  //CanClose:=false;
End;

Initialization
  RegisterClasses ([TDemo_DLG, TLabel, TButton, TEdit]);
End.
