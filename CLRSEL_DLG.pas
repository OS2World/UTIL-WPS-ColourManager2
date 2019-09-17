Unit CLRSEL_DLG;

Interface

Uses
  Classes, Forms, Graphics, Spin, ExtCtrls, Buttons, StdCtrls;

Type
  TCLR_SEL_DLG = Class (TForm)
    Red_Scroll: TScrollBar;
    Green_Scroll: TScrollBar;
    Blue_Scroll: TScrollBar;
    Red_Entry: TSpinEdit;
    Green_Entry: TSpinEdit;
    Blue_Entry: TSpinEdit;
    ColourPanel: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    LIMIT: TCheckBox;
    GroupBox2: TGroupBox;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    Procedure SpeedButton5OnClick (Sender: TObject);
    Procedure CLR_SEL_DLGOnCreate (Sender: TObject);
    Procedure LIMITOnClick (Sender: TObject);
    Procedure CLRSEL_DLGOnClose (Sender: TObject; Var Action: TCloseAction);
    Procedure SpeedButton1OnClick (Sender: TObject);
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
  CLR_SEL_DLG: TCLR_SEL_DLG;

Implementation

uses globrout;

Procedure TCLR_SEL_DLG.SpeedButton5OnClick (Sender: TObject);
VAR R,G,B:BYTE;
Begin
  SPEEDBUTTON1.DOWN:=FALSE;
  SPEEDBUTTON2.DOWN:=FALSE;
  SPEEDBUTTON3.DOWN:=FALSE;
  SPEEDBUTTON4.DOWN:=FALSE;

  IF SPEEDBUTTON5.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON5.COLOR;
  IF SPEEDBUTTON6.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON6.COLOR;
  IF SPEEDBUTTON7.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON7.COLOR;
  IF SPEEDBUTTON8.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON8.COLOR;
  IF SPEEDBUTTON9.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON9.COLOR;

  rgbtovalues(ColourPanel.COLOR,R,G,B);
  Red_Scroll.POSITION:=R;
  GREEN_Scroll.POSITION:=G;
  BLUE_Scroll.POSITION:=B;
  UpdateDialog(True);
End;

Procedure TCLR_SEL_DLG.CLR_SEL_DLGOnCreate (Sender: TObject);
Begin

End;

Procedure TCLR_SEL_DLG.LIMITOnClick (Sender: TObject);
Begin
  UpdateDialog(true);
End;

Procedure TCLR_SEL_DLG.CLRSEL_DLGOnClose (Sender: TObject;
  Var Action: TCloseAction);
Begin
  SPEEDBUTTON1.DOWN:=FALSE;
  SPEEDBUTTON2.DOWN:=FALSE;
  SPEEDBUTTON3.DOWN:=FALSE;
  SPEEDBUTTON4.DOWN:=FALSE;
  SPEEDBUTTON5.DOWN:=FALSE;
  SPEEDBUTTON6.DOWN:=FALSE;
  SPEEDBUTTON7.DOWN:=FALSE;
  SPEEDBUTTON8.DOWN:=FALSE;
  SPEEDBUTTON9.DOWN:=FALSE;
End;

Procedure TCLR_SEL_DLG.SpeedButton1OnClick (Sender: TObject);
VAR R,G,B:BYTE;
Begin
  SPEEDBUTTON5.DOWN:=FALSE;
  SPEEDBUTTON6.DOWN:=FALSE;
  SPEEDBUTTON7.DOWN:=FALSE;
  SPEEDBUTTON8.DOWN:=FALSE;
  SPEEDBUTTON9.DOWN:=FALSE;

  IF SPEEDBUTTON1.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON1.COLOR;
  IF SPEEDBUTTON2.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON2.COLOR;
  IF SPEEDBUTTON3.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON3.COLOR;
  IF SPEEDBUTTON4.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON4.COLOR;
  IF SPEEDBUTTON10.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON10.COLOR;
  IF SPEEDBUTTON11.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON11.COLOR;
  IF SPEEDBUTTON12.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON12.COLOR;
  IF SPEEDBUTTON13.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON13.COLOR;
  IF SPEEDBUTTON14.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON14.COLOR;
  IF SPEEDBUTTON15.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON15.COLOR;
  IF SPEEDBUTTON16.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON16.COLOR;
  IF SPEEDBUTTON17.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON17.COLOR;
  IF SPEEDBUTTON18.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON18.COLOR;
  IF SPEEDBUTTON19.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON19.COLOR;
  IF SPEEDBUTTON20.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON20.COLOR;
  IF SPEEDBUTTON21.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON21.COLOR;
  IF SPEEDBUTTON22.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON22.COLOR;
  IF SPEEDBUTTON23.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON23.COLOR;
  IF SPEEDBUTTON24.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON24.COLOR;
  IF SPEEDBUTTON25.DOWN THEN ColourPanel.COLOR:=SPEEDBUTTON25.COLOR;

  rgbtovalues(ColourPanel.COLOR,R,G,B);
  Red_Scroll.POSITION:=R;
  GREEN_Scroll.POSITION:=G;
  BLUE_Scroll.POSITION:=B;
  UpdateDialog(True);
End;

Procedure TCLR_SEL_DLG.EmptyForm1OnShow (Sender: TObject);
BEGIN
  UpdateDialog(True);
End;

Procedure TCLR_SEL_DLG.Blue_ScrollOnChange (Sender: TObject);
Begin
  UpdateDialog(True);
End;

Procedure TCLR_SEL_DLG.Green_ScrollOnChange (Sender: TObject);
Begin
  UpdateDialog(True);
End;

Procedure TCLR_SEL_DLG.Red_ScrollOnChange (Sender: TObject);
Begin
  UpdateDialog(True);
End;

Procedure TCLR_SEL_DLG.Button1OnClick (Sender: TObject);
Begin
  Close;
End;

Procedure TCLR_SEL_DLG.Button2OnClick (Sender: TObject);
Begin
  Close;
End;

Procedure TCLR_SEL_DLG.UpdateDialog(ScrollUse:boolean);
begin
  IF LIMIT.CHECKED THEN BEGIN
    Red_Scroll.MIN:=30;       Red_Scroll.MAX:=225;
    Green_Scroll.MIN:=30;     Green_Scroll.MAX:=225;
    Blue_Scroll.MIN:=30;      Blue_Scroll.MAX:=225;
    Red_Entry.MINVALUE:=30;   Red_Entry.MAXVALUE:=225;
    Green_Entry.MINVALUE:=30; Green_Entry.MAXVALUE:=225;
    Blue_Entry.MINVALUE:=30;  Blue_Entry.MAXVALUE:=225;
  END
  ELSE BEGIN
    Red_Scroll.MIN:=0;       Red_Scroll.MAX:=255;
    Green_Scroll.MIN:=0;     Green_Scroll.MAX:=255;
    Blue_Scroll.MIN:=0;      Blue_Scroll.MAX:=255;
    Red_Entry.MINVALUE:=0;   Red_Entry.MAXVALUE:=255;
    Green_Entry.MINVALUE:=0; Green_Entry.MAXVALUE:=255;
    Blue_Entry.MINVALUE:=0;  Blue_Entry.MAXVALUE:=255;
  END;

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

  ColourPanel.color:=valuestorgb(Red_Scroll.Position,Green_Scroll.Position,Blue_Scroll.Position);

  IF SPEEDBUTTON1.DOWN THEN SPEEDBUTTON1.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON2.DOWN THEN SPEEDBUTTON2.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON3.DOWN THEN SPEEDBUTTON3.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON4.DOWN THEN SPEEDBUTTON4.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON11.DOWN THEN SPEEDBUTTON11.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON12.DOWN THEN SPEEDBUTTON12.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON13.DOWN THEN SPEEDBUTTON13.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON14.DOWN THEN SPEEDBUTTON14.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON15.DOWN THEN SPEEDBUTTON15.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON16.DOWN THEN SPEEDBUTTON16.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON17.DOWN THEN SPEEDBUTTON17.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON18.DOWN THEN SPEEDBUTTON18.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON19.DOWN THEN SPEEDBUTTON19.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON20.DOWN THEN SPEEDBUTTON20.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON21.DOWN THEN SPEEDBUTTON21.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON22.DOWN THEN SPEEDBUTTON22.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON23.DOWN THEN SPEEDBUTTON23.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON24.DOWN THEN SPEEDBUTTON24.COLOR:=ColourPanel.COLOR;
  IF SPEEDBUTTON25.DOWN THEN SPEEDBUTTON25.COLOR:=ColourPanel.COLOR;

  SPEEDBUTTON5.COLOR:=CUR_SCHEME.DATA[1].BACK.COLOR;
  SPEEDBUTTON6.COLOR:=CUR_SCHEME.DATA[1].text.COLOR;
  SPEEDBUTTON7.COLOR:=EXlight(CUR_SCHEME.DATA[1].BACK.COLOR);
  SPEEDBUTTON8.COLOR:=DARK(CUR_SCHEME.DATA[1].BACK.COLOR);
  SPEEDBUTTON9.COLOR:=light(CUR_SCHEME.DATA[1].BACK.COLOR);

end;

Initialization
  RegisterClasses ([TCLR_SEL_DLG, TScrollBar, TSpinEdit, TPanel, TButton,
    TGroupBox, TSpeedButton, TCheckBox]);
End.
