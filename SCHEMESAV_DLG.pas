Unit SCHEMESAV_DLG;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, Buttons;

Type
  TSchSave_DLG = Class (TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Procedure Edit1OnChange (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  SchSave_DLG: TSchSave_DLG;

Implementation

Procedure TSchSave_DLG.Edit1OnChange (Sender: TObject);
Begin
  if edit1.text<>'' then button1.enabled:=true
  else button1.enabled:=false;
End;

Procedure TSchSave_DLG.Button2OnClick (Sender: TObject);
Begin
  CLOSE;
End;

Procedure TSchSave_DLG.Button1OnClick (Sender: TObject);
Begin
  CLOSE;
End;

Initialization
  RegisterClasses ([TSchSave_DLG, TEdit, TLabel, TButton]);
End.
