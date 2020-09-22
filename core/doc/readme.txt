***Please note, this is Jacco's original readme.txt.  Some things have been
invalidated.  But I have included it as it may still be helpfull.


Quick documentation for C Alice

Introduction

C Alice is a C-version of the now famous Alice bot, created by Dr. Wallace. The original
Alice is currently written in Java, making it very easy to run it on virtually every
platform. Also, communication over the Internet is easy to do using Java, without having
to worry about the various platforms.
However, I wanted a personal version of Alice, sitting on my desktop, so that I could
occasionally chat with her. This is possible with the Java version. However, the Java
version consumes a lot of memory (64Mb is recommended to run Alice), and a lot of
processor time.
So, C Alice as born. At this moment, it is an almost (NOTE: ALMOST :) fully functional
interpreter of the original Alice AIML code. That means that you can use C Alice instead
of Alice, if you just want a private conversation. Your conversation will NOT be send to
the botmaster, and so it will NOT be used to improve the quality of the AIML files.
But, it uses very little memory (under 1Mb), and is very processor friendly. In fact, it's
perfectly possible to have C Alice running all day.

Installation

To install C Alice, simply unpack the zip file (c_alice.zip) to a directory. Make sure that
you extract with subfolders: This is essential for the correct functioning of C Alice.
Once you unpacked the zipfile, you should have the following directory structure:
[alice]: Contains the original Alice AIML files.
[data]: Contains user data and compiled AIML files.
[literature]: Contains some docs for the experimental dictionary.
[log]: Contains the conversation logs.
[my_aiml]: Contains some AIML code made by me. :)
[source]: Contains the full source code.
Program C.dsp: A Microsoft Visual C++ project file.
Program C.dsw: A Microsoft Visual C++ workspace file.
Program C.exe: A ready-to-run Win9x executable (check WinAlice!)
readme.txt: This file.
If you are using a Win9x platform, I encourage you to try WinAlice: This is a more graphical
version, with some added things like speech and background graphics.

Extentions

As I wanted to use Alice on my desktop, I also wanted her to be able to remember things.
To facilitate this, I added some internal commands (commands can be used from AIML using
the <system> tag), "GET" and "STORE". In my_aiml there's some AIML to try this.
You can now say to Alice:
Please remember that a banana is yellow.
Alice will now store 'a banana is yellow' in the file 'information.txt' in the data
directory.
If you ask Alice:
Please tell me about a banana
she will scan the file for 'a banana' and return the lines that you added.
It's simple, but it works pretty well.
The WinAlice version supports more extentions, check out the readme for that project.

That's all for the moment. If there are problems, please contact me at:
Phantom@goright.to
Or post a message on the Alice mailing list.

Jacco Bikker
