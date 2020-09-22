AimlBot 1.1 Readme.txt - 11/15/01

Requirements
	This software has only been tested on Windows NT 4.0. It has not been tested 
	on windows 95, 	98, winme or Windows XP. It requires regedit32.exe to register 
	AimlBot.dll. Only the debug components have been built and tested (the release 
	versions have not been built or tested).

	AimlBot.zip is about just under 1 meg, it will unzip to just under 4 megs.
	To build all the debug projects & both bots will require about 20 megs of 
	hard drive space.

Installation
	install.bat - The installation script will register the system, register & build the 
	bots (alice & ted) and registers the com object within AimlBot.dll.

	To Install:
	Download and unzip the file AimlBot.zip into its own directory tree. 
	Assuming that you unzip the file to c:\AliceBot. 
	CD into  c:\AliceBot\install
	Run the install.bat script
		1.	Regedit will pop up a dialog indicating that AliceBot.reg was successfully 
			merged into the registry, click ok.
		2.	The two bots, alice & ted, will be compiled.
		3.	regsvr32 will pop up a dialog indicating that the library AliceBot.dll was
			successfully registered.

		You are now ready to run the sample applications (see below), 
		located in c:\AliceBot\bin

	If anything fails during the installation, you can comment out the line
	"echo off" at the top of install.bat so that you can determine the point of 
	failure. If you need help troubleshooting send email to ccallen@windowpane.com.

Testing & Development

	vbapp - VB based sample. Has a list of registered bots from which a bot can be 
		selected and initialized. The converse with the activated bot, type your text
		into the Request textbox in the Conversation frame then click the Submit button.
		The response will be displayed in the lower textbox.

	yo - C++ test app. This is useful for working on the AimlBot code itself. Yo also
		serves as a starting place for creating a c++ based host application. Although 
		Yo.exe is a command line application the concept is the same for embedding
		AimlBot into a win32 GUI app. There is no plans for creating a GUI sample at 
		this time, if this is something you are interested in, please contact Windowpane
		contracting services at services@windowpane.com. 
	
		Usage : yo <botname> (yo Alice)

Documention for the internals of the calice engine (the AIML engine) is in development. Check 
back at www.windowpane.com/AimlBot for developments in this area. Windowpane also offers 
commercial software development services in the Bellevue / Redmond Washington area.

Please send any feedback or comments to ccallen@windowpane.com

Thank you for your interest in AimlBot, 
Conan Callen - Windowpane
