C O L O U R M A N A G E R   2   D O C U M E N T A T I O N

Last Updated :			18th August 2003
Program Version 		1.11b
Dialog Enhancer Web :		http://www.dialogenhancer.com
Support/contact E-Mail :	support@dialogenhancer.com

CONTENTS

1. Introduction
2. System requirements
3. Installation & Uninstallation
4. Operation
5. Registration
6. Common questions and answers
7. History
8. Known problems
9. Credits
10. Legal comments and disclaimer

1. Introduction
==========

Welcome to the 2nd generation version of ColourManager for OS/2 and eComStation operating systems. ColourManager has evolved considerably since its first life as a utility to modify the colours of the primary window controls and can now offer scheme change potential that rivals and exceeds that provided within alternative operating systems.

2. System requirements
=================

ColourManager will not be displayed correctly at resolutions below 800x600. ColourManager thrives on a good graphics card, so the more detailed and colourful you can make it, the better. ColourManager has no minimum processor and memory requirements, but the faster the machine, the better ColourManager will run!

3. Installation & Uninstallation
=====================

Unlike its previous parent application Dialog Enhancer, ColourManager uses the standard WarpIN installation system which offers users a clean and consistent front end. Installation is straight forward and only requires the WarpIN software package to be installed beforehand. Users can obtain the latest version of WarpIN here : http://warpin.netlabs.org/

Uninstallation is provided via the WarpIN package manager.

*** Important ***
Please remember to reset your scheme back to the OS/2 default before uninstalling WarpIN. The default scheme should be selected and applied in order to clear window control settings that have been compiled into the base operating system. Simply reboot following this and run the WarpIN package manager to uninstall as usual.

4. Operation
=========

Upon launch of ColourManager from the program icon created in the System Setup folder, the user will be presented with the main ColourManager control window. This area allows modification of the currently selected scheme, deletion, saving and the application of the scheme to the system.

Schemes can be selected from the drop-down control in the top left corner of the window. A demonstration of how the scheme looks is displayed in the preview window in the centre of the window.

The currently selected scheme can be deleted or saved using the "Save As..." and "Delete" buttons adjacent.

The "OK" button applies the currently selected scheme to the desktop and exits ColourManager, "Cancel" will exit ColourManager without any changes.

To modify the selected scheme, click the "Modify >>" button which will extend the window to reveal the editing palette. The editing palette can be retracted back by clicking the button again.

During scheme modification, individual properties can be modified by selecting them in the property drop-down box. The scheme components in the preview window are also hot-clickable allowing the property to be directly accessed.

If a change is made, the "Apply" button is enabled - click apply to enable the current scheme on the desktop. ColourManager will not close when apply is used.

If a scheme is modified, ColourManager will blank the scheme selection drop-down list in the top left corner. To save the scheme, click the "Save As..." button. ColourManager will suggest that you save the scheme under the original name, although this is not mandatory.

ColourManager will need to be activated on every re-start as the desktop does not support reboot recall of the extended colour settings used in ColourManager. ColourManager places a program icon for unattended/quiet operation on every reboot. This facility is only available to registered users.

5. Registration
==========

Registration is the same as Dialog Enhancer and although it is bundled as a separate utility, the Dialog Enhancer registration keys will still work. If Dialog Enhancer is installed, then ColourManager will be immediately activated.

Unregistered users can still try out the program but they will loose the automatic (quiet) scheme management on startup.

6. Common questions and answers
=========================

Q. Why does my screen flicker so much when ColourManager works its magic?
A. A lot of complicated palette changes are happening whilst ColourManager is working and unfortunately the command to do the work needs to be run for every control type. The operating system naturally reacts to the palette changes on each issue of the command and forces a redraw of the screen. On faster machines this is much less prominent.

Q. Why do some programs still insist on using grey?
A. Fortunately there are a few programs with hard coded colour schemes in use - there is little I can do as they override the settings imposed by the operating system.

Q. Arrghhh!!! I really like CM but it makes PMMail/ProNews/App X look stupid!
A. This is a problem that is going to be very difficult to resolve without the assistance of the 3rd party developers. ColourManager cannot operate and exception list as the scheme application is a once-per-reboot operation that uses API calls to change the way OS/2 displays its schemes. The issue is caused by PMMail and some other applications which appear to hard select their own colours - remember, until CM, changing dialog colours in OS/2 created bizarre effects systemwide with messed up colours (no match with window controls etc.), so developers tend to program with IBM grey in mind and nothing else. I'm keen to work with developers to iron this problem out. Please contact me at the above address if you would like to enter discussions about resolving the problems.

Q. Does ColourManager sit in the background and consume my resources when I close it?
A. ColourManager is a run-once-per-reboot application and terminates completely when closed.

Q. Why does ColourManager have to run every time I reboot?
A. Unlike the basic scheme settings made in the Scheme Palette program provided with the operating system, the extended colour palettes used by ColourManager are reset on reboot. It is hoped that the silent scheme application on boot is the best compromise in the situation.

Q. I don't like what ColourManger does - how do I get back to my old scheme?
A. Re-select the scheme that most suits your system and apply it to allow the window controls to be reset back to their default grey colours. (Some default system schemes are supplied which mirror Warp 4.0 and eCS etc.) Then, simply run the WarpIN package manager to uninstall ColourManager.

Q. Why aren't the window controls updated immediately?
A. They are changed by patching a system file and will not be re-read into memory until the next reboot - it's a restriction of the OS.

Q. ColourManager complains that it cannot find the IBM resource compiler components and will not start - what do I need to do?
A. In order to complete the window control modifications the resource compiler components are required (RC.EXE, RCPP.EXE, RCPP.ERR) - on non eComStation systems, these will need to be installed via selective install.

More to be added after the beta test....

7. History
=======

1.0b - 7th January 2003
> First release for beta test

1.1b - 20th April 2003
> Public beta test

1.11b - 18th August 2003
> Public beta test 2
UPDATE - Updated code to reduce nagging to non-registered users on startup.
UPDATE - Tidied up documentation to explain the uninstall procedure accurately.


8. Known problems
==============

The following are current known issues:

1. Icon transparancies are ignored until reboot - the colour change API does not seem to work here...
2. Icon text colours don't change until reboot
3. Folder backgrounds are often problematic


9. Credits
========

Thank you to the following people who tested CM/2 during development - sorry if I have missed anyone!!!

Sid Gale, Pete Grubbs, Joachim Benjamins, James Luzenski, Piotr Oniszczuk, R“mulo Silva Neiva, Frank Berke & Duane Chamblee

10. Legal comments and disclaimer
=========================

ColourManager is copyright Richard Castle 2003. 

All trademarks belong to their respective owners.

This package is provided 'as is', without any guarantees whatsoever. We are not liable or responsible for any loss or damage of any kind whatsoever, including, but not limited to, losses of a financial, physical, psychic, emotional, marital, social, or mental nature that may result from the use or the purported use of anything in this package, for any purpose whatsoever.
