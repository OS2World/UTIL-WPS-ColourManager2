Unit main_old;

Interface

Uses
  Classes, Forms, StdCtrls, Buttons, ExtCtrls, ComCtrls, Spin, ColorGrd, BmpList;

Type
  TMainDLG = Class (TForm)
    GroupBox1: TGroupBox;
    Button3: TButton;
    Bevel1: TBevel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ProgressBar1: TProgressBar;
    CheckBox1: TCheckBox;
    Button4: TButton;
    Button5: TButton;
    Panel4: TPanel;
    Edit1: TEdit;
    Image1: TImage;
    Label7: TLabel;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Panel5: TPanel;
    ComboBox3: TComboBox;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Panel6: TPanel;
    ComboBox4: TComboBox;
    Label9: TLabel;
    ComboBox5: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    Label12: TLabel;
    ComboBox8: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Procedure Button5OnClick (Sender: TObject);
    Procedure MainDLGOnShow (Sender: TObject);
    Procedure MainDLGOnCreate (Sender: TObject);
    Procedure Label1OnClick (Sender: TObject);
    Procedure Button3OnClick (Sender: TObject);
    Procedure Button4OnClick (Sender: TObject);
    PROCEDURE UPDATEPAGE;
    Procedure TrackBar3OnChange (Sender: TObject);
    Procedure TrackBar2OnChange (Sender: TObject);
    Procedure TrackBar1OnChange (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
    Procedure SelectEntry (Data:byte);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

  PROCEDURE REG_VARIABLES;

Var
  MainDLG: TMainDLG;
  basecolour,light3d,dark3d:longint;

Const
  QUIET:BYTE=1;

CONST
     CL_STATIC                      =1;
     CL_STATICTEXT                  =2;
     CL_GROUPBOX                    =3;
     CL_PUSHBUTTON                  =4;
     CL_CHECKBOX                    =5;
     CL_RADIOBUTTON                 =6;
     CL_ENTRYFIELD                  =7;
     CL_LISTBOX                     =8;
     CL_COMBOBOX                    =9;
     CL_SCROLLBAR                   =10;
     CL_FRAME                       =11;
     CL_MENU                        =12;
     CL_TITLEBAR                    =13;
     CL_SPINBUTTON                  =14;
     CL_SLIDER                      =15;
     CL_CIRCULARSLIDER              =16;
     CL_VALUESET                    =17;
     CL_MLE                         =18;
     CL_CONTAINER                   =19;
     CL_NOTEBOOK                    =20;
     CL_DIALOG                      =21;

Type
   Colour_ID_Rec=Record
     Name:String[30];
     Font:TFont;
     Back_Colour:TColour;
     Transparent:Boolean;
   End;



Implementation

USES COLOURCHANGE,PMWP, GlobRout,demowin,demowin1,graphics;

VAR COLOUR_ID:ARRAY[1..40] OF COLOUR_ID_REC;

PROCEDURE REG_VARIABLES;
BEGIN
  COLOUR_ID[1].NAME:='3D Bright';
  COLOUR_ID[2].NAME:='3D Dark';
  COLOUR_ID[3].NAME:='Active Border';
  COLOUR_ID[4].NAME:='Inactive Border';
  COLOUR_ID[5].NAME:='Active Title';
  COLOUR_ID[6].NAME:='Application Workspace';
  COLOUR_ID[7].NAME:='Desktop';
  COLOUR_ID[8].NAME:='Desktop Icons';
  COLOUR_ID[9].NAME:='Desktop Icons';
  COLOUR_ID[10].NAME:='Dialog Box';
  COLOUR_ID[11].NAME:='Entryfield/Listbox';
  COLOUR_ID[12].NAME:='Folder';
  COLOUR_ID[13].NAME:='Folder Icons';
  COLOUR_ID[14].NAME:='Help Window';
  COLOUR_ID[15].NAME:='Help Highlight Text';
  COLOUR_ID[16].NAME:='Inactive Title';
END;

Procedure TMainDLG.SelectEntry (Data:byte);
begin
  edit1.text:=tostr(data);
end;

Procedure TMainDLG.Button5OnClick (Sender: TObject);
Begin
  with Demo_DLG do begin
    show;
    left:=500;
    top:=100;
    height:=200;
    width:=300;
  end;
  with Demo1_DLG do begin
    show;
    left:=400;
    top:=20;
    height:=150;
    width:=200;
  end;

End;

Procedure TMainDLG.MainDLGOnShow (Sender: TObject);
VAR ICON:TICON;
    GUNKBYTE1:BYTE;
Begin
  REG_VARIABLES;
  ICON.CREATE;ICON.LOADFROMRESOURCEID(100);
  IMAGE1.ICON:=ICON;
  ICON.DESTROY;

  FOR GUNKBYTE1:=1 TO 16 DO COMBOBOX1.ITEMS.ADD(COLOUR_ID[GUNKBYTE1].NAME);
End;

Procedure TMainDLG.MainDLGOnCreate (Sender: TObject);
VAR R,G,B:BYTE;
Begin
  BASECOLOUR:=0;
  BASECOLOUR:=TOINT(OS2INI('DE','Last_Selected','BaseColour','READ',''));
  IF BASECOLOUR=0 THEN basecolour:=CLLTGRAY;

  IF (PARAMCOUNT<>0) AND (PARAMSTR(1)='\SYS_STARTUP') THEN BEGIN
     APPLYSCHEME(BASECOLOUR,TRUE,FALSE);
     HALT;
  END;

  rgbtovalues(BASECOLOUR,R,G,B);
  light3d:=valuestorgb(R+30,G+30,B+30);
  DARK3d:=valuestorgb(R-30,G-30,B-30);

  trackbar1.position:=R; spinedit1.value:=trackbar1.position;
  trackbar2.position:=G; spinedit2.value:=trackbar2.position;
  trackbar3.position:=B; spinedit3.value:=trackbar3.position;

  UPDATEPAGE;
End;

Procedure TMainDLG.Label1OnClick (Sender: TObject);
Begin

End;

Procedure TMainDLG.Button4OnClick (Sender: TObject);
Begin
  PROGRESSBAR1.VISIBLE:=TRUE;

  BUTTON1.ENABLED:=FALSE; BUTTON2.ENABLED:=FALSE; BUTTON4.ENABLED:=FALSE;

  APPLYSCHEME(BASECOLOUR,FALSE,TRUE);

  //FOR SOME REASON, I NEED TO RESET THE COLOUR OF THE BUTTONS TOO!
  Demo_DLG.button1.color:=basecolour;
  Demo_DLG.edit1.color:=basecolour;


  PROGRESSBAR1.VISIBLE:=FALSE;
  PROGRESSBAR1.Position:=0;
  BUTTON1.ENABLED:=TRUE;  BUTTON2.ENABLED:=TRUE; BUTTON4.ENABLED:=TRUE;
End;

Procedure TMainDLG.Button3OnClick (Sender: TObject);
VAR R,G,B:BYTE;
Begin
  BASECOLOUR:=CLLTGRAY;
  rgbtovalues(BASECOLOUR,R,G,B);
  light3d:=valuestorgb(R+30,G+30,B+30);
  DARK3d:=valuestorgb(R-30,G-30,B-30);

  trackbar1.position:=R; spinedit1.value:=trackbar1.position;
  trackbar2.position:=G; spinedit2.value:=trackbar2.position;
  trackbar3.position:=B; spinedit3.value:=trackbar3.position;
End;

PROCEDURE TMainDLG.UPDATEPAGE;
BEGIN
  basecolour:=valuestorgb(trackbar1.position,trackbar2.position,trackbar3.position);
  DARK3D:=valuestorgb(trackbar1.position-30,trackbar2.position-30,trackbar3.position-30);
  LIGHT3D:= valuestorgb(trackbar1.position+30,trackbar2.position+30,trackbar3.position+30);

  PANEL1.color:=basecolour;
  PANEL2.color:=LIGHT3D;
  PANEL3.color:=DARK3D;
END;

Procedure TMainDLG.TrackBar3OnChange (Sender: TObject);
Begin
  spinedit3.value:=trackbar3.position;
  updatepage;
End;

Procedure TMainDLG.TrackBar2OnChange (Sender: TObject);
Begin
  spinedit2.value:=trackbar2.position;
  updatepage;
End;

Procedure TMainDLG.TrackBar1OnChange (Sender: TObject);
Begin
  spinedit1.value:=trackbar1.position;
  updatepage;
End;

Procedure TMainDLG.Button2OnClick (Sender: TObject);
Begin

  PROGRESSBAR1.VISIBLE:=TRUE;

  BUTTON1.ENABLED:=FALSE; BUTTON2.ENABLED:=FALSE; BUTTON4.ENABLED:=FALSE;

  APPLYSCHEME(BASECOLOUR,FALSE,FALSE);

  //FOR SOME REASON, I NEED TO RESET THE COLOUR OF THE BUTTONS TOO!
  button1.color:=basecolour;
  button2.color:=basecolour;
  button3.color:=basecolour;
  button4.color:=basecolour;
  SPINEDIT1.COLOR:=basecolour;
  SPINEDIT2.COLOR:=basecolour;
  SPINEDIT3.COLOR:=basecolour;

  PROGRESSBAR1.VISIBLE:=FALSE;
  PROGRESSBAR1.Position:=0;
  BUTTON1.ENABLED:=TRUE;  BUTTON2.ENABLED:=TRUE; BUTTON4.ENABLED:=TRUE;
End;

Procedure TMainDLG.Button1OnClick (Sender: TObject);
VAR RC:INTEGER;
    SETUPSTRING,CURDIR:STRING;
    GUNKLWRD1:LONGWORD;
Begin
  //SAVE OUT THE CURRENT SELECTION
  OS2INI('DE','Last_Selected','BaseColour','WRITE',TOSTR(BASECOLOUR));

  IF CHECKBOX1.CHECKED THEN BEGIN
    GETDIR(0,CURDIR);
    SETUPSTRING:='OBJECTID=<DE_CLRMANAGER2_STARTUPOBJECT>;EXENAME='+CURDIR+'\CLRMAN2.EXE;PARAMETERS=\SYS_STARTUP';
    RC:=WINCREATEOBJECT('WPProgram','ColourManager 2',SETUPSTRING,'<WP_START>',1);
  END
  ELSE BEGIN
    GUNKLWRD1:=WINQUERYOBJECT('<DE_CLRMANAGER2_STARTUPOBJECT>');
    WINDESTROYOBJECT(GUNKLWRD1);
  END;

  close;
End;

Initialization
  RegisterClasses ([TMainDLG, TLabel, TGroupBox, TButton, TBevel,
    TTrackBar, TSpinEdit, TProgressBar, TCheckBox, TPanel, TEdit, TImage,
    TComboBox]);
End.
