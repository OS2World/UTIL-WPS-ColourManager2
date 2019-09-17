Unit Reg_Nag_DLG;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, Buttons;

Type
  TRegNag_DLG = Class (TForm)
    name: TEdit;
    key: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label6: TLabel;
    Memo1: TMemo;
    Procedure RegNag_DLGOnShow (Sender: TObject);
    Procedure Button3OnClick (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  RegNag_DLG: TRegNag_DLG;

Implementation

Uses Mainwin_dlg,globrout,pmshl;

Procedure TRegNag_DLG.RegNag_DLGOnShow (Sender: TObject);
Begin
   //button3.click;
End;

Procedure TRegNag_DLG.Button3OnClick (Sender: TObject);
VAR RC,GUNKINT1,GUNKINT2:INTEGER;
    naccept:STRING;
    AHAB,DE_INI_HANDLE:LONGWORD;
    GUNKCSTR1:CSTRING;
Begin
  //Richard Castle : 2977227425208537108119
  NACCEPT:='No';
  IF name.TEXT='' THEN LABEL6.TEXT:='ERROR! User name not entered.'
  ELSE BEGIN
    IF LENGTH(name.TEXT)<4 THEN LABEL6.TEXT:='ERROR! User name too short.'
    ELSE BEGIN
       IF SUBSTR(name.TEXT,LENGTH(name.TEXT),1)=' ' THEN LABEL6.TEXT:='ERROR! Spaces detected at end of user name.'
       ELSE BEGIN
            IF NWORDS(name.TEXT,' ')=1 THEN LABEL6.TEXT:='ERROR! Full name not entered.'
            ELSE BEGIN
                IF  SUBSTR(name.TEXT,1,1)=' ' THEN LABEL6.TEXT:='ERROR! Spaces detected at start of user name.'
                ELSE BEGIN
                     IF (LENGTH(key.TEXT)<>22) AND (LENGTH(key.TEXT)<>0) THEN LABEL6.TEXT:='ERROR! Key code is not 22 characters long.'
                     ELSE BEGIN
                         fullname:=name.text;
                         regcode:=key.text;
                         /*NEW CODE IN HERE FOR NEW REGISTRATION SYSTEM*/
                         DE_INI_HANDLE:=PRFOPENPROFILE(AHAB,BOOTDRIVE+DE_INI_LOCATION);

                         /*NEW CODE IN HERE TO LOG A REGISTRATION IN THE OS2.INI FILE*/
                         PRFWRITEPROFILESTRING(DE_INI_HANDLE,'Dialog_Enhancer','RegName',FULLNAME);
                         IF CHECKREG2='Yes' THEN PRFWRITEPROFILESTRING(DE_INI_HANDLE,'Dialog_Enhancer','RegKey',REGCODE)
                         ELSE BEGIN
                           MAINDLG.CAPTION:=MAINDLG.CAPTION+' UNREGISTERED';
                           PRFWRITEPROFILESTRING(DE_INI_HANDLE,'Dialog_Enhancer','RegKey','');
                         END;
                         RegNag_DLG.CLOSE;
                      END;
                END;
            END;
       END;
     END;
   END;
END;


Procedure TRegNag_DLG.Button2OnClick (Sender: TObject);
Begin
  HALT;
End;

Initialization
  RegisterClasses ([TRegNag_DLG, TLabel, TEdit, TButton, TMemo]);
End.
