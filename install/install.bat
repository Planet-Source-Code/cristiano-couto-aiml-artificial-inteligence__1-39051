echo off

CurrentDir = cd

rem Edit this file to add, delete or modifiy a bot
rem or to change the default bot. This file contains 
rem entries that will be writen into the registry.
if not exist install.reg goto error1
regedit install.reg


cd ..
rem Compile & Register bots - cd in to the bots directory
if not exist bots goto usage
cd bots

rem For each Bot build its aiml
rem If you add a bot, add that bot this section 
rem copy & paste the alice block below and substitute your
rem new bot name for alice

echo Compiling Alice's AIML
cd alice
..\..\bin\ac
cd ..

echo Compiling Ted's AIML
cd ted
..\..\bin\ac
cd ..

rem End of Bot Section - cd back to the root directory
cd ..

rem register the COM control - 
rem Change bin\debug to bin\release to use release version
rem This will generate an error if you do not have 
rem regsvr32 on your path. This is the last step, so you 
rem can run this step manually.
cd bin\debug
regsvr32 AimlBot.dll
cd ..\..\install

goto finish

:error1
echo Error : This script must be run from the install directory.
goto finish

:error2
echo Error : Missing bots directory.
goto finish

:error3
goto finish

:finish
echo on