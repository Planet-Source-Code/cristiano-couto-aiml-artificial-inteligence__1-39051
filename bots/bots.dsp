# Microsoft Developer Studio Project File - Name="bots" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=bots - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "bots.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "bots.mak" CFG="bots - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "bots - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "bots - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "bots - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "bots - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /out:"..\bin\Debug\bots.exe" /pdbtype:sept

!ENDIF 

# Begin Target

# Name "bots - Win32 Release"
# Name "bots - Win32 Debug"
# Begin Group "alice"

# PROP Default_Filter ""
# Begin Group "aiml"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\alice\aiml\65Percent.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Botmaster.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\C.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Defaults.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\DrWallace.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Gossip.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Hello.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Inventions.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Lizards.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Numbers.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Pickup.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Politics.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Religion.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Sales.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Sports.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Suffixes.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Top10.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\Turing.aiml
# End Source File
# Begin Source File

SOURCE=.\alice\aiml\YesNo.aiml
# End Source File
# End Group
# Begin Group "data"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\alice\data\alice.ini
# End Source File
# Begin Source File

SOURCE=.\alice\data\defvars.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\patterns.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\person.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\person2.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\personf.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\skeleton.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\substitute.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\templates.txt
# End Source File
# Begin Source File

SOURCE=.\alice\data\unsorted.txt
# End Source File
# End Group
# Begin Group "log"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\alice\log\errors.txt
# End Source File
# Begin Source File

SOURCE=.\alice\log\gossip.txt
# End Source File
# Begin Source File

SOURCE=.\alice\log\localuser.txt
# End Source File
# Begin Source File

SOURCE=.\alice\log\log.txt
# End Source File
# End Group
# End Group
# Begin Group "ted"

# PROP Default_Filter ""
# Begin Group "aiml No. 1"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\ted\aiml\65Percent.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Botmaster.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\C.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Defaults.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\DrWallace.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Gossip.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Hello.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Inventions.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Lizards.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Numbers.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Pickup.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Politics.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Religion.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Sales.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Sports.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Suffixes.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Top10.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\Turing.aiml
# End Source File
# Begin Source File

SOURCE=.\ted\aiml\YesNo.aiml
# End Source File
# End Group
# Begin Group "data No. 1"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\ted\data\bot.ini
# End Source File
# Begin Source File

SOURCE=.\ted\data\defvars.txt
# End Source File
# Begin Source File

SOURCE=".\ted\data\patterns-test.txt"
# End Source File
# Begin Source File

SOURCE=.\ted\data\patterns.txt
# End Source File
# Begin Source File

SOURCE=.\ted\data\person.txt
# End Source File
# Begin Source File

SOURCE=.\ted\data\person2.txt
# End Source File
# Begin Source File

SOURCE=.\ted\data\personf.txt
# End Source File
# Begin Source File

SOURCE=.\ted\data\skeleton.txt
# End Source File
# Begin Source File

SOURCE=.\ted\data\substitute.txt
# End Source File
# Begin Source File

SOURCE=".\ted\data\templates-test.txt"
# End Source File
# Begin Source File

SOURCE=.\ted\data\templates.txt
# End Source File
# Begin Source File

SOURCE=".\ted\data\unsorted-test.txt"
# End Source File
# Begin Source File

SOURCE=.\ted\data\unsorted.txt
# End Source File
# End Group
# Begin Group "log No. 1"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\ted\log\errors.txt
# End Source File
# Begin Source File

SOURCE=.\ted\log\gossip.txt
# End Source File
# Begin Source File

SOURCE=.\ted\log\localuser.txt
# End Source File
# Begin Source File

SOURCE=.\ted\log\log.txt
# End Source File
# End Group
# End Group
# Begin Group "common"

# PROP Default_Filter ""
# Begin Group "aiml No. 2"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\common\aiml\Atomic.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\Brain.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\Dont.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\German.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\Knowledge.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\Personality.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\Robot.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\Srai.aiml
# End Source File
# Begin Source File

SOURCE=.\common\aiml\That.aiml
# End Source File
# End Group
# Begin Group "data No. 2"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\common\data\bot.ini
# End Source File
# Begin Source File

SOURCE=.\common\data\defvars.txt
# End Source File
# Begin Source File

SOURCE=.\common\data\person.txt
# End Source File
# Begin Source File

SOURCE=.\common\data\person2.txt
# End Source File
# Begin Source File

SOURCE=.\common\data\personf.txt
# End Source File
# Begin Source File

SOURCE=.\common\data\skeleton.txt
# End Source File
# Begin Source File

SOURCE=.\common\data\substitute.txt
# End Source File
# End Group
# End Group
# End Target
# End Project
