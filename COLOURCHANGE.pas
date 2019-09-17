Unit COLOURCHANGE;

Interface

USES CLASSES,GRAPHICS;

FUNCTION PROCESS_COLOR(INDEX:LONGINT;BASECOLOUR:LONGINT;CONTROLID:INTEGER):LONGINT;
FUNCTION PREVIEW_APPLYSCHEME:BYTE;
FUNCTION GLOBAL_APPLYSCHEME:BYTE;

Implementation

USES PMWIN,OS2DEF,pmshl,PMGPI,FORMS,GLOBROUT,PMWP,mainwin_dlg;

FUNCTION PROCESS_COLOR(INDEX:LONGINT;BASECOLOUR:LONGINT;CONTROLID:INTEGER):LONGINT;
VAR EXTRAlight3d,light3d,dark3d:TCOLOR;
    R,G,B:BYTE;
    RN,GN,BN:INTEGER;

BEGIN
  rgbtovalues(BASECOLOUR,R,G,B);
  IF R+60>255 THEN RN:=255 ELSE RN:=R+60;IF G+60>255 THEN GN:=255 ELSE GN:=G+60;IF B+60>255 THEN BN:=255 ELSE BN:=B+60;
  EXTRAlight3d:=valuestorgb(RN,GN,BN);  light3d:=valuestorgb(R+30,G+30,B+30);  DARK3d:=valuestorgb(R-30,G-30,B-30);

  IF INDEX=CCI_FOREGROUND                 THEN RESULT:=CLBLACK;
  IF INDEX=CCI_FOREGROUNDREADONLY         THEN RESULT:=CLBLACK;
  IF INDEX=CCI_BACKGROUND                 THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_BACKGROUNDDIALOG           THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_DISABLEDFOREGROUND         THEN RESULT:=dark3d;
  IF INDEX=CCI_DISABLEDFOREGROUNDREADONLY THEN RESULT:=CLBLACK;
  IF INDEX=CCI_DISABLEDBACKGROUND         THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_DISABLEDBACKGROUNDDIALOG   THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_HIGHLIGHTFOREGROUND        THEN RESULT:=clWHITE;
  IF INDEX=CCI_HIGHLIGHTBACKGROUND        THEN RESULT:=DARK3d;
  IF INDEX=CCI_HIGHLIGHTBACKGROUNDDIALOG  THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_INACTIVEFOREGROUND         THEN RESULT:=light3d;
  IF INDEX=CCI_INACTIVEFOREGROUNDDIALOG   THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_INACTIVEBACKGROUND         THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_INACTIVEBACKGROUNDTEXT     THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_ACTIVEFOREGROUND           THEN RESULT:=light3d;
  IF INDEX=CCI_ACTIVEFOREGROUNDDIALOG     THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_ACTIVEBACKGROUND           THEN RESULT:=DARK3d;
  IF INDEX=CCI_ACTIVEBACKGROUNDTEXT       THEN RESULT:=DARK3d;
  IF INDEX=CCI_PAGEBACKGROUND             THEN RESULT:=CLWHITE;
  IF INDEX=CCI_PAGEFOREGROUND             THEN RESULT:=CLBLACK;
  IF INDEX=CCI_FIELDBACKGROUND            THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_BORDER                     THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_BORDERLIGHT                THEN RESULT:=light3d;
  IF INDEX=CCI_BORDERDARK                 THEN RESULT:=DARK3d;
  IF INDEX=CCI_BORDER2                    THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_BORDER2LIGHT               THEN RESULT:=EXTRAlight3d;
  IF INDEX=CCI_BORDER2DARK                THEN RESULT:=CLBLACK;
  IF INDEX=CCI_BORDERDEFAULT              THEN RESULT:=CLBLACK;
  IF INDEX=CCI_BUTTONBACKGROUND           THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_BUTTONFOREGROUND           THEN RESULT:=RESULT;
  IF INDEX=CCI_BUTTONBORDERLIGHT          THEN RESULT:=light3d;
  IF INDEX=CCI_BUTTONBORDERDARK           THEN RESULT:=DARK3d;
  IF INDEX=CCI_ARROW                      THEN RESULT:=CLBLACK;
  IF INDEX=CCI_DISABLEDARROW              THEN RESULT:=DARK3d;
  IF INDEX=CCI_ARROWBORDERLIGHT           THEN RESULT:=LIGHT3d;
  IF INDEX=CCI_ARROWBORDERDARK            THEN RESULT:=DARK3d;
  IF INDEX=CCI_CHECKLIGHT                 THEN RESULT:=LIGHT3d;
  IF INDEX=CCI_CHECKMIDDLE                THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_CHECKDARK                  THEN RESULT:=DARK3d;
  IF INDEX=CCI_ICONFOREGROUND             THEN RESULT:=RESULT;
  IF INDEX=CCI_ICONBACKGROUND             THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_ICONBACKGROUNDDESKTOP      THEN RESULT:=DARK3d;
  IF INDEX=CCI_ICONHILITEFOREGROUND       THEN RESULT:=RESULT;
  IF INDEX=CCI_ICONHILITEBACKGROUND       THEN RESULT:=RESULT;
  IF INDEX=CCI_MAJORTABFOREGROUND         THEN RESULT:=CLBLACK;
  IF INDEX=CCI_MAJORTABBACKGROUND         THEN RESULT:=BASECOLOUR;
  IF INDEX=CCI_MINORTABFOREGROUND         THEN RESULT:=CLBLACK;
  IF INDEX=CCI_MINORTABBACKGROUND         THEN RESULT:=BASECOLOUR;

  IF (CONTROLID=CCT_ENTRYFIELD) OR (CONTROLID=CCT_LISTBOX) OR (CONTROLID=CCT_COMBOBOX)OR (CONTROLID=CCT_MLE)  THEN BEGIN
    IF INDEX=CCI_BACKGROUND                 THEN RESULT:=CUR_SCHEME.DATA[10].BACK.COLOR;
    IF INDEX=CCI_FOREGROUND                 THEN RESULT:=CUR_SCHEME.DATA[10].TEXT.COLOR;
  END;

  IF (CONTROLID=CCT_TITLEBAR)  THEN BEGIN
    IF INDEX=CCI_INACTIVEFOREGROUND THEN RESULT:=CUR_SCHEME.DATA[8].TEXT.COLOR;
    IF INDEX=CCI_INACTIVEBACKGROUNDTEXT THEN RESULT:=CUR_SCHEME.DATA[8].BACK.COLOR;
    IF INDEX=CCI_INACTIVEBACKGROUND THEN RESULT:=CUR_SCHEME.DATA[8].BACK.COLOR;
    IF INDEX=CCI_ACTIVEFOREGROUND THEN RESULT:=CUR_SCHEME.DATA[7].TEXT.COLOR;
    IF INDEX=CCI_ACTIVEBACKGROUNDTEXT THEN RESULT:=CUR_SCHEME.DATA[7].BACK.COLOR;
    IF INDEX=CCI_ACTIVEBACKGROUND THEN RESULT:=CUR_SCHEME.DATA[7].BACK.COLOR;
  END;

  IF (CONTROLID=CCT_STATICTEXT) AND (INDEX=CCI_FOREGROUND) THEN RESULT:=CUR_SCHEME.DATA[1].TEXT.COLOR;
  IF (CONTROLID=CCT_PUSHBUTTON) AND (INDEX=CCI_FOREGROUND) THEN RESULT:=CUR_SCHEME.DATA[15].TEXT.COLOR;
  IF (CONTROLID=CCT_PUSHBUTTON) AND (INDEX=CCI_BACKGROUND) THEN RESULT:=CUR_SCHEME.DATA[15].BACK.COLOR;

  IF (CONTROLID=CCT_MENU) THEN BEGIN
    IF INDEX=CCI_BACKGROUND                 THEN RESULT:=CUR_SCHEME.DATA[5].BACK.COLOR;
    IF INDEX=CCI_FOREGROUND                 THEN RESULT:=CUR_SCHEME.DATA[5].TEXT.COLOR;
    IF INDEX=CCI_HIGHLIGHTFOREGROUND        THEN RESULT:=CUR_SCHEME.DATA[6].TEXT.COLOR;
    IF INDEX=CCI_HIGHLIGHTBACKGROUND        THEN RESULT:=CUR_SCHEME.DATA[6].BACK.COLOR;
  END;

  IF (CONTROLID=CCT_FRAME) THEN BEGIN
    IF INDEX=CCI_INACTIVEFOREGROUND         THEN RESULT:=BASECOLOUR;
    IF INDEX=CCI_ACTIVEFOREGROUND           THEN RESULT:=BASECOLOUR;
  END;

  IF (CONTROLID=CCT_NOTEBOOK) THEN BEGIN
     IF INDEX=CCI_BORDER2DARK THEN RESULT:=DARK3D;
  END;

  IF (CONTROLID=CCT_PUSHBUTTON) THEN BEGIN   //SETS THE 3D COLOURS TO REFLECT THE COLOUR OF THE BUTTON
    IF INDEX=CCI_BORDERLIGHT          THEN RESULT:=CUR_SCHEME.DATA[15].BACK.COLOR+(30 shl 16)+(30 shl 8)+30;
    IF INDEX=CCI_BORDERDARK           THEN RESULT:=CUR_SCHEME.DATA[15].BACK.COLOR-(30 shl 16)-(30 shl 8)-30;
  END;
END;

FUNCTION GLOBAL_APPLYSCHEME:BYTE;
VAR GUNKINT1,GUNKINT2:INTEGER;
    CTRL_CLR:TCtlColor;
    DESKTOP,CCOUNT:LONGINT;
    light3d,dark3d:TCOLOR;
    R,G,B:BYTE;
    ALTABLE2:ARRAY[0..45] OF LONGINT;

BEGIN
  rgbtovalues(CUR_SCHEME.DATA[1].BACK.COLOR,R,G,B);
  light3d:=valuestorgb(R+30,G+30,B+30);  DARK3d:=valuestorgb(R-30,G-30,B-30);

  ALTABLE2[0]:=CUR_SCHEME.DATA[10].BACK.COLOR;            /*SYSCLR_ENTRYFIELD Entry field and list box background color.*/
  ALTABLE2[1]:=light3d;                                   /*SYSCLR_MENUDISABLEDTEXT Disabled MENU choice colour.*/
  ALTABLE2[2]:=CUR_SCHEME.DATA[6].TEXT.COLOR;             /*SYSCLR_MENUHILITE Selected menu item text.*/
  ALTABLE2[3]:=CUR_SCHEME.DATA[6].BACK.COLOR;             /*SYSCLR_MENUHILITEBGND Selected menu item background.*/
  ALTABLE2[4]:=CUR_SCHEME.DATA[1].BACK.COLOR;             /*SYSCLR_PAGEBACKGROUND Notebook page background.*/
  ALTABLE2[5]:=CUR_SCHEME.DATA[1].BACK.COLOR;             /*SYSCLR_FIELDBACKGROUND Inactive scroll bar and default control background color.*/
  ALTABLE2[6]:=LIGHT3D;                                   /*SYSCLR_BUTTONLIGHT Light pushbutton (3D effect).*/
  ALTABLE2[7]:=CUR_SCHEME.DATA[1].BACK.COLOR;             /*SYSCLR_BUTTONMIDDLE Middle pushbutton (3D effect).*/
  ALTABLE2[8]:=DARK3D;                                    /*SYSCLR_BUTTONDARK Dark pushbutton (3D effect).*/
  ALTABLE2[9]:=CUR_SCHEME.DATA[15].TEXT.COLOR;            /*SYSCLR_BUTTONDEFAULT Pushbutton.*/
  ALTABLE2[10]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_TITLEBOTTOM Line drawn under title bar.*/
  ALTABLE2[11]:=DARK3D;                                   /*SYSCLR_SHADOW Drop shadow for menus and dialogs.*/
  ALTABLE2[12]:=CUR_SCHEME.DATA[2].TEXT.COLOR;            /*SYSCLR_ICONTEXT Text written under icons on the desktop.*/
  ALTABLE2[13]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_DIALOGBACKGROUND Pop up dialog box background.*/
  ALTABLE2[14]:=LIGHT3D;                                  /*SYSCLR_HILITEFOREGROUND Selection foreground.*/
  ALTABLE2[15]:=DARK3D;                                   /*SYSCLR_HILITEBACKGROUND Selection background.*/
  ALTABLE2[16]:=CUR_SCHEME.DATA[8].BACK.COLOR;            /*SYSCLR_INACTIVETITLETEXTBKGD Background of inactive title text.*/
  ALTABLE2[17]:=CUR_SCHEME.DATA[7].BACK.COLOR;            /*SYSCLR_ACTIVETITLETEXTBKGD Background of active title text.*/
  ALTABLE2[18]:=CUR_SCHEME.DATA[8].BACK.COLOR;            /*SYSCLR_INACTIVETITLETEXT Inactive title text.*/
  ALTABLE2[19]:=CUR_SCHEME.DATA[7].BACK.COLOR;            /*SYSCLR_ACTIVETITLETEXT Active title text.*/
  ALTABLE2[20]:=CUR_SCHEME.DATA[1].TEXT.COLOR;            /*SYSCLR_OUTPUTTEXT Output text.*/
  ALTABLE2[21]:=CUR_SCHEME.DATA[1].TEXT.COLOR;            /*SYSCLR_WINDOWSTATICTEXT Static (nonselectable) text.*/
  ALTABLE2[22]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_SCROLLBAR Active scroll bar background area.*/
  ALTABLE2[23]:=CUR_SCHEME.DATA[2].BACK.COLOR;            /*SYSCLR_BACKGROUND Desktop background.*/
  ALTABLE2[24]:=CUR_SCHEME.DATA[8].TEXT.COLOR;            /*SYSCLR_ACTIVETITLE Active window title.*/
  ALTABLE2[25]:=CUR_SCHEME.DATA[7].TEXT.COLOR;            /*SYSCLR_INACTIVETITLE Inactive window title.*/
  ALTABLE2[26]:=CUR_SCHEME.DATA[5].BACK.COLOR;            /*SYSCLR_MENU Menu background.*/
  ALTABLE2[27]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_WINDOW Window background.*/
  ALTABLE2[28]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_WINDOWFRAME Window frame (border line).*/
  ALTABLE2[29]:=CUR_SCHEME.DATA[5].TEXT.COLOR;            /*SYSCLR_MENUTEXT Normal menu item text.*/
  ALTABLE2[30]:=CUR_SCHEME.DATA[1].TEXT.COLOR;            /*SYSCLR_WINDOWTEXT Window text.*/
  ALTABLE2[31]:=CLBLACK;                                  /*SYSCLR_TITLETEXT Text in title bar, size box, scroll bar arrow box.*/
  ALTABLE2[32]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_ACTIVEBORDER Border fill of active window.*/
  ALTABLE2[33]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_INACTIVEBORDER Border fill of inactive window.*/
  ALTABLE2[34]:=CUR_SCHEME.DATA[9].BACK.COLOR;            /*SYSCLR_APPWORKSPACE Background of specific main windows.*/
  ALTABLE2[35]:=CUR_SCHEME.DATA[14].BACK.COLOR;           /*SYSCLR_HELPBACKGROUND Background of help panels.*/
  ALTABLE2[36]:=CUR_SCHEME.DATA[14].TEXT.COLOR;           /*SYSCLR_HELPTEXT Help text.*/
  ALTABLE2[37]:=CUR_SCHEME.DATA[17].TEXT.COLOR;           /*SYSCLR_HELPHILITE Highlighted help text.*/
  ALTABLE2[38]:=CUR_SCHEME.DATA[1].BACK.COLOR;            /*SYSCLR_SHADOWHILITEBGND Shadows of workplace object background highlight color.*/
  ALTABLE2[39]:=CUR_SCHEME.DATA[4].TEXT.COLOR;            /*SYSCLR_SHADOWHILITEFGND Shadows of workplace object foreground highlight color.*/
  ALTABLE2[40]:=CUR_SCHEME.DATA[4].TEXT.COLOR;            /*SYSCLR_SHADOWTEXT Shadows of workplace object text color.*/

  WINSETSYSCOLORS(HWND_DESKTOP,0,LCOLF_CONSECRGB,SYSCLR_ENTRYFIELD,38,ALTABLE2[0]);

  FOR GUNKINT1:=1 TO 20 DO BEGIN
   CCOUNT:=WinQueryControlColors(HWND_DESKTOP,GUNKINT1,CCF_COUNTCOLORS,0,NIL);        //GETS THE NUMBER OF COLOURS AVAILABLE
   WinQueryControlColors(HWND_DESKTOP,GUNKINT1,CCF_GLOBAL|CCF_ALLCOLORS,CCOUNT,CTRL_CLR);           //DUMPS ALL OF THE DATA INTO CTRL_CLR RECORD

   //GET ALL THE CONTROL COLOURS AND MAKE THE MODIFICATIONS
   FOR GUNKINT2:=1 TO CCOUNT DO BEGIN
     WITH CTRL_CLR[GUNKINT2] DO CLRVALUE:=PROCESS_COLOR(clrINDEX,CUR_SCHEME.DATA[1].BACK.COLOR,GUNKINT1);
   END;

   WinSetControlColors(HWND_DESKTOP,GUNKINT1,CCF_GLOBAL|CCF_ALLCOLORS,CCOUNT,CTRL_CLR);                 //APPLIES ALL OF THE NEW COLORS
  END;

  DESKTOP:=WINQUERYOBJECT('<WP_DESKTOP>');
  IF CUR_SCHEME.DATA[2].BACK.BITMAP_USED THEN BEGIN
    IF CUR_SCHEME.DATA[2].BACK.BMP_STYLE=BMP_TILE THEN WINSETOBJECTDATA(DESKTOP,'BACKGROUND='+CUR_SCHEME.DATA[2].BACK.BITMAP_PATH+',T,,I')
    ELSE IF CUR_SCHEME.DATA[2].BACK.BMP_STYLE=BMP_STRETCH THEN WINSETOBJECTDATA(DESKTOP,'BACKGROUND='+CUR_SCHEME.DATA[2].BACK.BITMAP_PATH+',S,,I')
    ELSE WINSETOBJECTDATA(DESKTOP,'BACKGROUND='+CUR_SCHEME.DATA[2].BACK.BITMAP_PATH+',N,,I');
  END
  ELSE begin
    RGBTOVALUES(CUR_SCHEME.DATA[2].BACK.color,R,G,B);
    WINSETOBJECTDATA(DESKTOP,'BACKGROUND=(NONE),,,C,'+TOSTR(R)+' '+TOSTR(G)+' '+TOSTR(B))
  END;

  {DESKTOP:=WINQUERYOBJECT();
  IF CUR_SCHEME.DATA[11].BACK.BMP_STYLE=BMP_TILE THEN WINSETOBJECTDATA(DESKTOP,'BACKGROUND='+CUR_SCHEME.DATA[11].BACK.BITMAP_PATH+',T,,I')
  ELSE IF CUR_SCHEME.DATA[11].BACK.BMP_STYLE=BMP_STRETCH THEN WINSETOBJECTDATA(DESKTOP,'BACKGROUND='+CUR_SCHEME.DATA[11].BACK.BITMAP_PATH+',S,,I')
  ELSE WINSETOBJECTDATA(DESKTOP,'BACKGROUND='+CUR_SCHEME.DATA[11].BACK.BITMAP_PATH+',N,,I');}

END;


FUNCTION PREVIEW_APPLYSCHEME:BYTE;
VAR GUNKINT1,GUNKINT2:INTEGER;
    CTRL_CLR:TCtlColor;
    T,CCOUNT:LONGINT;
    DESKTOP_BACK,TMP_BMP:tbitmap;
    INT_ICON:TICON;
    TEST:POINTL;
    DESTREC,SRCREC:TRECT;

BEGIN
 IF NOT startup THEN BEGIN
 INC(UPDATE_TEST);
 MAINDLG.LABEL6.CAPTION:=TOSTR(UPDATE_TEST);
 MAINDLG.folder.visible:=false; MAINDLG.dialog.visible:=false; MAINDLG.INACTIVE.visible:=false;
 FOR GUNKINT1:=1 TO 20 DO WITH MAINDLG DO BEGIN

   CCOUNT:=WinQueryControlColors(HWND_DESKTOP,GUNKINT1,CCF_COUNTCOLORS,0,NIL);        //GETS THE NUMBER OF COLOURS AVAILABLE
   WinQueryControlColors(HWND_DESKTOP,GUNKINT1,$0|$20,CCOUNT,CTRL_CLR);               //DUMPS ALL OF THE DATA INTO CTRL_CLR RECORD

   //GET ALL THE CONTROL COLOURS AND MAKE THE MODIFICATIONS
   FOR GUNKINT2:=1 TO CCOUNT DO WITH CTRL_CLR[GUNKINT2] DO CLRVALUE:=PROCESS_COLOR(clrINDEX,CUR_SCHEME.DATA[1].BACK.COLOR,GUNKINT1);

   //NOW APPLY THE MODIFICATIONS TO THE INTERNAL DEMO WINDOW
                                                            //FUDGE TO GET THE HANDLE OF THE LISTBOX SCROLLBAR
   IF GUNKINT1=CCT_SCROLLBAR   THEN BEGIN TEST.X:=135;  TEST.Y:=30;  T:=WINWINDOWFROMPOINT(listbox.handle,TEST,FALSE); WinSetControlColors(T,GUNKINT1,$0|$20,CCOUNT,CTRL_CLR);END;
   IF GUNKINT1=CCT_LISTBOX     THEN WinSetControlColors(LISTBOX.HANDLE,GUNKINT1,$0|$20,CCOUNT,CTRL_CLR);

   TEST.X:=2;  TEST.Y:=2;
   IF GUNKINT1=CCT_SCROLLBAR   THEN WinSetControlColors(WINWINDOWFROMPOINT(folder_back.handle,TEST,FALSE),GUNKINT1,$0|$20,CCOUNT,CTRL_CLR);

   IF GUNKINT1=CCT_PUSHBUTTON  THEN WinSetControlColors(SAMP_BUTTON.HANDLE,GUNKINT1,$0|$20,CCOUNT,CTRL_CLR);

   IF GUNKINT1=CCT_ENTRYFIELD  THEN WinSetControlColors(ENTRYFIELD.HANDLE,GUNKINT1,$0|$20,CCOUNT,CTRL_CLR);

   IF GUNKINT1=CCT_MLE         THEN WinSetControlColors(folder_back.handle,GUNKINT1,$0|$20,CCOUNT,CTRL_CLR);
  END;

  WITH MAINDLG DO BEGIN
    //SET DIALOG BOX COLOR
    DIALOG.COLOR:=CUR_SCHEME.DATA[1].BACK.COLOR;   FOLDER.COLOR:=CUR_SCHEME.DATA[1].BACK.COLOR;   INACTIVE.COLOR:=CUR_SCHEME.DATA[1].BACK.COLOR;
    radiobutton1.pencolor:=CUR_SCHEME.DATA[1].text.COLOR;  radiobutton2.pencolor:=CUR_SCHEME.DATA[1].text.COLOR;
    checkbox1.pencolor:=CUR_SCHEME.DATA[1].text.COLOR;

    //SET MENU COLORS
    MENU_1.COLOR:=CUR_SCHEME.DATA[5].BACK.COLOR;         MENU_1_1.PENCOLOR:=CUR_SCHEME.DATA[5].TEXT.COLOR;   MENU_1_2.PENCOLOR:=CUR_SCHEME.DATA[5].TEXT.COLOR;
    MENU_1.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[5].TEXT.FONT.NAME,CUR_SCHEME.DATA[5].TEXT.FONT.SIZE);

    MENU_2.COLOR:=CUR_SCHEME.DATA[5].BACK.COLOR;         MENU_2_2.PENCOLOR:=CUR_SCHEME.DATA[5].TEXT.COLOR;   MENU_2_3.PENCOLOR:=CUR_SCHEME.DATA[5].TEXT.COLOR;
    MENU_2.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[5].TEXT.FONT.NAME,CUR_SCHEME.DATA[5].TEXT.FONT.SIZE);
    MENU_2_4.PENCOLOR:=CUR_SCHEME.DATA[5].TEXT.COLOR;    MENU_2_5.PENCOLOR:=CUR_SCHEME.DATA[5].TEXT.COLOR;

    MENU_2_1.PENCOLOR:=CUR_SCHEME.DATA[6].TEXT.COLOR;    MENU_2_1.COLOR:=CUR_SCHEME.DATA[6].BACK.COLOR;      MENU_2_HIGH.BRUSH.COLOR:=CUR_SCHEME.DATA[6].BACK.COLOR;

    MENU_3.COLOR:=CUR_SCHEME.DATA[5].BACK.COLOR;         MENU_3_1.PENCOLOR:=CUR_SCHEME.DATA[6].TEXT.COLOR;   MENU_3_2.PENCOLOR:=CLYELLOW;
    MENU_3.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[5].TEXT.FONT.NAME,CUR_SCHEME.DATA[5].TEXT.FONT.SIZE);
    MENU_3_3.PENCOLOR:=CUR_SCHEME.DATA[5].TEXT.COLOR;    MENU_3_HIGH.BRUSH.COLOR:=CUR_SCHEME.DATA[6].BACK.COLOR;    MENU_3_1.COLOR:=CUR_SCHEME.DATA[6].BACK.COLOR;

    //SET ACTIVE TITLE
    ACTIVE_BAR.COLOR:=CUR_SCHEME.DATA[7].BACK.COLOR;
    ACTIVE_TEXT.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[7].TEXT.FONT.NAME,CUR_SCHEME.DATA[7].TEXT.FONT.SIZE);
    ACTIVE_TEXT.PENCOLOR:=CUR_SCHEME.DATA[7].TEXT.COLOR;

    //SET INACTIVE TITLES
    INACTIVE1_BAR.COLOR:=CUR_SCHEME.DATA[8].BACK.COLOR;  INACTIVE1_TEXT.PENCOLOR:=CUR_SCHEME.DATA[8].TEXT.COLOR;
    INACTIVE1_TEXT.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[8].TEXT.FONT.NAME,CUR_SCHEME.DATA[8].TEXT.FONT.SIZE);
    INACTIVE2_BAR.COLOR:=CUR_SCHEME.DATA[8].BACK.COLOR;  INACTIVE2_TEXT.PENCOLOR:=CUR_SCHEME.DATA[8].TEXT.COLOR;
    INACTIVE2_TEXT.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[8].TEXT.FONT.NAME,CUR_SCHEME.DATA[8].TEXT.FONT.SIZE);
    INACTIVE3_BAR.COLOR:=CUR_SCHEME.DATA[8].BACK.COLOR;  INACTIVE3_TEXT.PENCOLOR:=CUR_SCHEME.DATA[8].TEXT.COLOR;
    INACTIVE3_TEXT.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[8].TEXT.FONT.NAME,CUR_SCHEME.DATA[8].TEXT.FONT.SIZE);

    //APPLICATION WORKSPACE
    APP_WRKSPACE.COLOR:=CUR_SCHEME.DATA[9].BACK.COLOR;

    //ENTRYFIELD LISTBOX
    ENTRYFIELD.COLOR:=CUR_SCHEME.DATA[10].BACK.COLOR;     ListBox.COLOR:=CUR_SCHEME.DATA[10].BACK.COLOR;
    ENTRYFIELD.PENCOLOR:=CUR_SCHEME.DATA[10].TEXT.COLOR;  ListBox.PENCOLOR:=CUR_SCHEME.DATA[10].TEXT.COLOR;

    //HELP PANEL
    HELP.COLOR:=CUR_SCHEME.DATA[14].BACK.COLOR;  HELP_TEXT.PENCOLOR:=CUR_SCHEME.DATA[14].TEXT.COLOR;  LINK_TEXT.PENCOLOR:=CUR_SCHEME.DATA[17].TEXT.COLOR;

    //BUTTON
    SAMP_BUTTON.COLOR:=CUR_SCHEME.DATA[15].BACK.COLOR;   SAMP_BUTTON.PENCOLOR:=CUR_SCHEME.DATA[15].TEXT.COLOR;
  END;
  MAINDLG.DESKTOPICON.VISIBLE:=NOT CUR_SCHEME.DATA[2].BACK.BITMAP_USED;
  MAINDLG.Image1.VISIBLE:=NOT CUR_SCHEME.DATA[2].BACK.BITMAP_USED;
  IF CUR_SCHEME.DATA[2].BACK.BITMAP_USED THEN BEGIN
    DESKTOP_BACK.CREATE;
    DESKTOP_BACK.LOADFROMFILE(CUR_SCHEME.DATA[2].BACK.BITMAP_PATH);

    MAINDLG.image2.bitmap.LOADFROMRESOURCEID(102);
    IF CUR_SCHEME.DATA[2].BACK.BMP_STYLE=BMP_TILE THEN TileImage(MAINDLG.image2.bitmap,DESKTOP_BACK,TRUE);
    IF CUR_SCHEME.DATA[2].BACK.BMP_STYLE=BMP_CENTER THEN CenterImage(MAINDLG.image2.bitmap,DESKTOP_BACK,TRUE);
    IF CUR_SCHEME.DATA[2].BACK.BMP_STYLE=BMP_STRETCH THEN StretchImage(MAINDLG.image2.bitmap,DESKTOP_BACK,TRUE);
    DESKTOP_BACK.DESTROY;

    INT_ICON.CREATE;INT_ICON.LOADFROMRESOURCEID(100);   MAINDLG.image2.bitmap.CANVAS.DRAW(45,37,INT_ICON);  INT_ICON.DESTROY;

    MAINDLG.image2.bitmap.CANVAS.BRUSH.COLOR:=CUR_SCHEME.DATA[3].BACK.COLOR;
    IF CUR_SCHEME.DATA[3].BACK.TRANS THEN MAINDLG.image2.bitmap.CANVAS.BRUSH.MODE:=BMTRANSPARENT;     MAINDLG.image2.bitmap.CANVAS.FONT:=MAINDLG.FONT;  MAINDLG.image2.bitmap.CANVAS.pen.color:=CUR_SCHEME.DATA[3].text.color;
    MAINDLG.image2.bitmap.CANVAS.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[3].TEXT.FONT.NAME,CUR_SCHEME.DATA[3].TEXT.FONT.SIZE);
    MAINDLG.image2.bitmap.CANVAS.TEXTOUT(24,15,'Desktop Icon'); MAINDLG.image2.refresh;
    MAINDLG.image2.visible:=true;
  END
  ELSE WITH MAINDLG DO BEGIN
    desktop.color:=CUR_SCHEME.DATA[2].BACK.COLOR;
    IF CUR_SCHEME.DATA[3].BACK.TRANS THEN DESKTOPICON.COLOR:=CUR_SCHEME.DATA[2].BACK.COLOR
    ELSE DESKTOPICON.COLOR:=CUR_SCHEME.DATA[3].BACK.COLOR;
    DESKTOPICON.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[3].TEXT.FONT.NAME,CUR_SCHEME.DATA[3].TEXT.FONT.SIZE);
    DESKTOPICON.PENCOLOR:=CUR_SCHEME.DATA[3].TEXT.COLOR;
    MAINDLG.image2.visible:=false;
  END;


  MAINDLG.ICONTEXT.VISIBLE:=NOT CUR_SCHEME.DATA[11].BACK.BITMAP_USED;
  MAINDLG.Panel2.VISIBLE:=NOT CUR_SCHEME.DATA[11].BACK.BITMAP_USED;
  MAINDLG.Image3.VISIBLE:=CUR_SCHEME.DATA[11].BACK.BITMAP_USED;
  IF CUR_SCHEME.DATA[11].BACK.BITMAP_USED THEN BEGIN
    DESKTOP_BACK.CREATE;
    DESKTOP_BACK.LOADFROMFILE(CUR_SCHEME.DATA[11].BACK.BITMAP_PATH);

    MAINDLG.image3.bitmap.LOADFROMRESOURCEID(103);
    IF CUR_SCHEME.DATA[11].BACK.BMP_STYLE=BMP_TILE THEN TileImage(MAINDLG.image3.bitmap,DESKTOP_BACK,TRUE);
    IF CUR_SCHEME.DATA[11].BACK.BMP_STYLE=BMP_CENTER THEN CenterImage(MAINDLG.image3.bitmap,DESKTOP_BACK,TRUE);
    IF CUR_SCHEME.DATA[11].BACK.BMP_STYLE=BMP_STRETCH THEN StretchImage(MAINDLG.image3.bitmap,DESKTOP_BACK,TRUE);
    DESKTOP_BACK.DESTROY;

    INT_ICON.CREATE;  INT_ICON.LOADFROMRESOURCEID(101);   MAINDLG.image3.bitmap.CANVAS.DRAW(173,33,INT_ICON);  INT_ICON.DESTROY;

    MAINDLG.image3.bitmap.CANVAS.BRUSH.COLOR:=CUR_SCHEME.DATA[12].BACK.COLOR;
    IF CUR_SCHEME.DATA[12].BACK.TRANS THEN MAINDLG.image3.bitmap.CANVAS.BRUSH.MODE:=BMTRANSPARENT;     MAINDLG.image3.bitmap.CANVAS.FONT:=MAINDLG.FONT;  MAINDLG.image3.bitmap.CANVAS.pen.color:=CUR_SCHEME.DATA[12].text.color;
    MAINDLG.image3.bitmap.CANVAS.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[12].TEXT.FONT.NAME,CUR_SCHEME.DATA[12].TEXT.FONT.SIZE);
    MAINDLG.image3.bitmap.CANVAS.TEXTOUT(160,10,' Icon Text '); MAINDLG.image3.refresh;
  END
  ELSE WITH MAINDLG DO BEGIN
    folder_back.color:=CUR_SCHEME.DATA[11].back.color;
    Panel2.color:=CUR_SCHEME.DATA[11].back.color;
    IF CUR_SCHEME.DATA[12].BACK.TRANS THEN ICONTEXT.COLOR:=CUR_SCHEME.DATA[11].BACK.COLOR
    ELSE ICONTEXT.COLOR:=CUR_SCHEME.DATA[12].back.color;
    ICONTEXT.FONT:=SCREEN.GETFONTFROMPOINTSIZE(CUR_SCHEME.DATA[12].TEXT.FONT.NAME,CUR_SCHEME.DATA[12].TEXT.FONT.SIZE);
    PENCOLOR:=CUR_SCHEME.DATA[12].TEXT.color;
  END;

  WITH MAINDLG DO BEGIN
    //APPLY THE WINDOW CONTROLS - CLOSE
    WINCTRL.CLOSE.POSITION:=0;   INACTIVE_CLOSE.BITMAP.LOADFROMSTREAM(WINCTRL.CLOSE);
    WINCTRL.CLOSE.POSITION:=0;   HELP_CLOSE.BITMAP.LOADFROMSTREAM(WINCTRL.CLOSE);
    WINCTRL.CLOSE.POSITION:=0;   FOLDER_CLOSE.BITMAP.LOADFROMSTREAM(WINCTRL.CLOSE);

    //APPLY THE WINDOW CONTROLS - MAX
    WINCTRL.MAX.POSITION:=0;   INACTIVE_MAX.BITMAP.LOADFROMSTREAM(WINCTRL.MAX);
    WINCTRL.MAX.POSITION:=0;   FOLDER_MAX.BITMAP.LOADFROMSTREAM(WINCTRL.MAX);
    WINCTRL.MAX.POSITION:=0;   HELP_MAX.BITMAP.LOADFROMSTREAM(WINCTRL.MAX);

    //APPLY THE WINDOW CONTROLS - MIN
    WINCTRL.MIN.POSITION:=0;   HELP_MIN.BITMAP.LOADFROMSTREAM(WINCTRL.MIN);

    //APPLY THE WINDOW CONTROLS - HIDE
    WINCTRL.HIDE.POSITION:=0;   FOLDER_HIDE.BITMAP.LOADFROMSTREAM(WINCTRL.HIDE);

    //APPLY THE WINDOW CONTROLS - SYS
    WINCTRL.SYS.POSITION:=0;   DIALOG_SYS.BITMAP.LOADFROMSTREAM(WINCTRL.SYS);
    WINCTRL.SYS.POSITION:=0;   INACTIVE_SYS.BITMAP.LOADFROMSTREAM(WINCTRL.SYS);

    //APPLY THE WINDOW CONTROLS - CHK&RAD
    TMP_BMP.CREATE;
    DESTREC.LEFT:=0; DESTREC.RIGHT:=16; DESTREC.BOTTOM:=0; DESTREC.TOP:=16;
    WINCTRL.BOX.POSITION:=0;      TMP_BMP.LOADFROMSTREAM(WINCTRL.BOX);         //WE MUST FIRST INITIALISE THE CONTROLS
    WINCTRL.BOX.POSITION:=0;      CHECK1.BITMAP.LOADFROMSTREAM(WINCTRL.BOX);
    WINCTRL.BOX.POSITION:=0;      RADIO1.BITMAP.LOADFROMSTREAM(WINCTRL.BOX);
    WINCTRL.BOX.POSITION:=0;      RADIO2.BITMAP.LOADFROMSTREAM(WINCTRL.BOX);

    SRCREC.LEFT:=16;  SRCREC.BOTTOM:=32; SRCREC.TOP:=48;   SRCREC.RIGHT:=32;      //WE NOW EXTRACT THE RESOURCES FROM THE RELEVANT LOCATION WITHIN THE BITMAP BLOCK
    TMP_BMP.canvas.BitBlt(check1.bitmap.canvas,DESTREC,SRCREC,CMSRCCOPY,bitfIgnore);
    SRCREC.LEFT:=0;  SRCREC.BOTTOM:=16; SRCREC.TOP:=32;   SRCREC.RIGHT:=16;
    TMP_BMP.canvas.BitBlt(RADIO1.bitmap.canvas,DESTREC,SRCREC,CMSRCCOPY,bitfIgnore);
    SRCREC.LEFT:=16;  SRCREC.BOTTOM:=16; SRCREC.TOP:=32;   SRCREC.RIGHT:=32;
    TMP_BMP.canvas.BitBlt(RADIO2.bitmap.canvas,DESTREC,SRCREC,CMSRCCOPY,bitfIgnore);

    TMP_BMP.DESTROY;

  END;

 END;
 MAINDLG.folder.visible:=true; MAINDLG.dialog.visible:=true; MAINDLG.INACTIVE.visible:=true;
 MAINDLG.LABEL7.CAPTION:=TOSTR(MAINDLG.SCHEMEBOX.ITEMINDEX);
 MAINDLG.led1.LEDCONDITION:=CHANGED;
END;

Initialization
End.