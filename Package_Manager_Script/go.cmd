@echo off
path=c:\os2;e:\apps\warpin
del *.exe
wic c_man_111.exe -a 1 -ue:\apps\warpin\stub.exe -c.. clrman2.exe schemes.dat readme.txt THEMES\*.* resmgr.dll -s clr_man.wis
