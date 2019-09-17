Unit main;

Interface

Uses
  Classes, Forms, StdCtrls, Buttons, ExtCtrls, ComCtrls, Spin, ColorGrd, BmpList,
  Dialogs;

Type
  TMainDLG = Class (TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Desktop: TPanel;
    Image1: TImage;
    DESKTOPICON: TLabel;
    Button1: TButton;
    Procedure Button1OnClick (Sender: TObject);
    Procedure MainDLGOnShow (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

  PROCEDURE REG_VARIABLES;

Type
   CNTRL_TEXT_REC=RECORD
     FONT:TFONT;
     FONT_EN,CLR_EN:BOOLEAN;
     COLOR:TCOLOR;
   END;

Type
   CNTRL_BACK_REC=RECORD
     TRANS:BOOLEAN;
     COLOR:TCOLOR;
   END;

Type
   CONTROL_REC=Record
     Name:String[8];
     TEXT:CNTRL_TEXT_REC;
     BACK:CNTRL_BACK_REC;
     TEXT_EN,BACK_EN:BOOLEAN;
   End;

Var
  MainDLG: TMainDLG;
  NO_CONTROL_IDS:BYTE;
  CONTROL_ID:ARRAY[1..20] OF CONTROL_REC;

Const
  QUIET:BYTE=1;



Implementation

USES demowin,demowin1,GRAPHICS;

PROCEDURE REG_VARIABLES;
BEGIN


END;

Procedure TMainDLG.Button1OnClick (Sender: TObject);
Begin
  close;
end;

Procedure TMainDLG.MainDLGOnShow (Sender: TObject);
VAR ICON:TICON;
    GUNKBYTE1:BYTE;
Begin
  REG_VARIABLES;
  ICON.CREATE;ICON.LOADFROMRESOURCEID(100);
  IMAGE1.ICON:=ICON;
  ICON.DESTROY;

  Demo_DLG.show;
  Demo1_DLG.show;
End;


Initialization
  RegisterClasses ([TMainDLG, TLabel, TButton, TBevel,
    TPanel, TImage
   ]);
End.
