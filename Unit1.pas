Unit Unit1;

Interface

Uses
  Classes, Forms, Graphics, ColorWheel, Spin, ExtCtrls, Buttons;

Type
  TEmptyForm1 = Class (TForm)
    Red_Scroll: TScrollBar;
    Green_Scroll: TScrollBar;
    Blue_Scroll: TScrollBar;
    Red_Entry: TSpinEdit;
    Green_Entry: TSpinEdit;
    Blue_Entry: TSpinEdit;
    ColourPanel: TPanel;
    Button1: TButton;
    Button2: TButton;
    Procedure EmptyForm1OnShow (Sender: TObject);
    Procedure Blue_ScrollOnChange (Sender: TObject);
    Procedure Green_ScrollOnChange (Sender: TObject);
    Procedure Red_ScrollOnChange (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Private
      {Insert private declarations here}
    Public
      {Insert public declarations here}
      Procedure UpdateDialog(ScrollUse:boolean);
  End;

Var
  EmptyForm1: TEmptyForm1;

Implementation

Procedure TEmptyForm1.EmptyForm1OnShow (Sender: TObject);
Begin
  UpdateDialog(True);
End;

Procedure TEmptyForm1.Blue_ScrollOnChange (Sender: TObject);
Begin
  UpdateDialog(True);
End;

Procedure TEmptyForm1.Green_ScrollOnChange (Sender: TObject);
Begin
  UpdateDialog(True);
End;

Procedure TEmptyForm1.Red_ScrollOnChange (Sender: TObject);
Begin
  UpdateDialog(True);
End;

Procedure TEmptyForm1.Button1OnClick (Sender: TObject);
Begin
  Close;
End;

Procedure TEmptyForm1.Button2OnClick (Sender: TObject);
Begin
  Close;
End;

Procedure TEmptyForm1.UpdateDialog(ScrollUse:boolean);
begin
  if ScrollUse then begin
    Red_Entry.Value:=Red_Scroll.Position;
    Green_Entry.Value:=Green_Scroll.Position;
    Blue_Entry.Value:=Blue_Scroll.Position;
  end
  else begin
    Red_Scroll.Position:=Red_Entry.Value;
    Green_Scroll.Position:=Green_Entry.Value;
    Blue_Scroll.Position:=Blue_Entry.Value;
  end;
  ColourPanel.color:=valuestorgb(Red_Scroll.Position,Green_Scroll.Position,Blue_Scroll.Position)
end;

Initialization
  RegisterClasses ([TEmptyForm1, TScrollBar, TSpinEdit, TPanel, TButton]);
End.
