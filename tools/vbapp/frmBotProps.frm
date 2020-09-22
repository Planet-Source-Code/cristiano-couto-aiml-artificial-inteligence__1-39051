VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmBotProps 
   Caption         =   "Bot Properties"
   ClientHeight    =   6285
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5355
   LinkTopic       =   "Form2"
   ScaleHeight     =   6285
   ScaleWidth      =   5355
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lstBotProp 
      Height          =   5925
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   3480
      _ExtentX        =   6138
      _ExtentY        =   10451
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
End
Attribute VB_Name = "frmBotProps"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    ' Get the bots info out of the registry
    ' open the bots info file
    ' display the bots properties in the listview

    Dim sDataPath As String
    Dim IniFile As String
    Dim UserFile As String
    Dim sKeyName As String
       
    sKeyName = "software\Windowpane\AimlBot\Bots\" & gCurrentBot
    GetRegValue HKEY_CURRENT_USER, sKeyName, "DataPath", sDataPath
    
    sKeyName = "software\Windowpane\AimlBot\Bots\" & gCurrentBot
    GetRegValue HKEY_CURRENT_USER, sKeyName, "UserFile", sUserFile
    
    sKeyName = "software\Windowpane\AimlBot\Bots\" & gCurrentBot
    GetRegValue HKEY_CURRENT_USER, sKeyName, "IniFile", sIniFile
    
    sIniFile = sDataPath & "\" & sIniFile
    sUserFile = sDataPath & "\" & sUserFile
    
    Dim FileNum, Mode, Handle
    FileNum = 1   ' Assign file number.
    Open sUserFile For Append As FileNum   ' Open file.
    Mode = FileAttr(FileNum, 1)   ' Returns 8 (Append file mode).
    Handle = FileAttr(FileNum, 2)   ' Returns file handle.
    Close FileNum   ' Close file.


    
End Sub

