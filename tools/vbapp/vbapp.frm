VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "AimlBot Test VB App"
   ClientHeight    =   7815
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10695
   LinkTopic       =   "Form1"
   ScaleHeight     =   7815
   ScaleWidth      =   10695
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lstBotList 
      Height          =   4605
      Left            =   405
      TabIndex        =   13
      Top             =   420
      Width           =   1995
      _ExtentX        =   3519
      _ExtentY        =   8123
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Bot Name"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.ComboBox cboBots 
      Height          =   315
      ItemData        =   "vbapp.frx":0000
      Left            =   600
      List            =   "vbapp.frx":0002
      TabIndex        =   12
      Top             =   8475
      Width           =   3135
   End
   Begin VB.CommandButton cmdUpdateName 
      Caption         =   "Update"
      Enabled         =   0   'False
      Height          =   330
      Left            =   9600
      TabIndex        =   11
      Top             =   5880
      Width           =   855
   End
   Begin VB.TextBox txtUserName 
      Height          =   345
      Left            =   7200
      TabIndex        =   10
      Top             =   5865
      Width           =   2280
   End
   Begin VB.TextBox txtBaseDirectory 
      Height          =   360
      Left            =   2265
      TabIndex        =   5
      Top             =   6420
      Width           =   8205
   End
   Begin VB.CommandButton cmdInitialize 
      Caption         =   "Initialize"
      Height          =   390
      Left            =   420
      TabIndex        =   4
      Top             =   5115
      Width           =   1950
   End
   Begin VB.TextBox txtUserFile 
      Height          =   360
      Left            =   2265
      TabIndex        =   2
      Top             =   7260
      Width           =   8205
   End
   Begin VB.TextBox txtIniFile 
      Height          =   360
      Left            =   2265
      TabIndex        =   0
      Top             =   6840
      Width           =   8205
   End
   Begin VB.Frame frBotsList 
      Caption         =   "Registered Bots"
      Height          =   5490
      Left            =   210
      TabIndex        =   15
      Top             =   165
      Width           =   2370
   End
   Begin VB.Frame frConversation 
      Caption         =   "Conversation - "
      Height          =   5490
      Left            =   2745
      TabIndex        =   14
      Top             =   165
      Width           =   7725
      Begin VB.CommandButton cmdSubmit 
         Caption         =   "Submit"
         Height          =   900
         Left            =   6150
         TabIndex        =   20
         Top             =   630
         Width           =   1440
      End
      Begin VB.TextBox Text1 
         Height          =   870
         Left            =   225
         TabIndex        =   19
         Text            =   "Hello"
         Top             =   630
         Width           =   5775
      End
      Begin VB.TextBox Text2 
         Height          =   3345
         Left            =   225
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         Text            =   "vbapp.frx":0004
         Top             =   1995
         Width           =   7365
      End
      Begin VB.Label Label2 
         Caption         =   "Request:"
         Height          =   225
         Left            =   225
         TabIndex        =   17
         Top             =   360
         Width           =   750
      End
      Begin VB.Label Label1 
         Caption         =   "Response:"
         Height          =   270
         Left            =   225
         TabIndex        =   16
         Top             =   1725
         Width           =   885
      End
   End
   Begin VB.Label Label6 
      Caption         =   "User Name:"
      Height          =   225
      Left            =   6015
      TabIndex        =   9
      Top             =   5925
      Width           =   1005
   End
   Begin VB.Label lblBotName 
      BorderStyle     =   1  'Fixed Single
      Height          =   300
      Left            =   2265
      TabIndex        =   8
      Top             =   5910
      Width           =   1830
   End
   Begin VB.Label aLable 
      Caption         =   "Bot Name:"
      Height          =   255
      Left            =   315
      TabIndex        =   7
      Top             =   5925
      Width           =   870
   End
   Begin VB.Label Label5 
      Caption         =   "Base Directory:"
      Height          =   285
      Left            =   315
      TabIndex        =   6
      Top             =   6465
      Width           =   1395
   End
   Begin VB.Label label4 
      Caption         =   "User File:"
      Height          =   270
      Left            =   315
      TabIndex        =   3
      Top             =   7275
      Width           =   1785
   End
   Begin VB.Label Label3 
      Caption         =   "Initialization File:"
      Height          =   210
      Left            =   315
      TabIndex        =   1
      Top             =   6885
      Width           =   1830
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim oAimlBot As AIMLBOT_Lib.AimlBot
Dim sCurrentBot As String


Private Sub cboBots_Change()
    MsgBox "hello"
End Sub

Private Sub cmdUpdateName_Click()
    
    oAimlBot.UserName = txtUserName.Text
    
    txtUserName = oAimlBot.UserName
    
End Sub


Private Sub Combo1_Change()

End Sub

Private Sub cmdSubmit_Click()

    Dim response As String
    
    response = oAimlBot.respond(Text1.Text)
    response = oAimlBot.stripurl(response)
       
    Text2.Text = Text2.Text & Chr(13) & Chr(10) & response
       
End Sub

Private Sub cmdInitialize_Click()
Dim new_dir As String
Dim new_drive As String
Dim cur_dir As String

    ' If bot exists, save & delete it
    If Not (oAimlBot Is Nothing) Then
        If oAimlBot.state = BotStateInitialized Then
            oAimlBot.savevars (txtUserFile.Text)
        End If
        Set oAilmBot = Nothing
    End If
    
    Set oAimlBot = New AIMLBOT_Lib.AimlBot

    new_dir = txtBaseDirectory.Text
    If Mid$(new_dir, 2, 2) = ":\" Then
        new_drive = Left$(new_dir, 1)
        ChDrive new_drive
    End If
    
    ChDir new_dir
    cur_dir = CurDir
    ret = oAimlBot.Initialize(txtIniFile.Text)
    If ret <> 0 Then ' Initialize returs S_OK (0) on success
        MsgBox "Bad initialization filename"
        Exit Sub
    End If
    
    oAimlBot.loadvars (txtUserFile.Text)
    If ret <> 0 Then ' loadvars returs S_OK (0) on success
        MsgBox "Bad user filename"
        Exit Sub
    End If
    
    lblBotName.Caption = oAimlBot.BotName
    frConversation.Caption = "Conversation - " & oAimlBot.BotName
    txtUserName.Text = oAimlBot.UserName
    
    Text1.Enabled = True
    Text2.Enabled = True
    cmdSubmit.Enabled = True
    
    cmdUpdateName.Enabled = True
    txtUserName.Enabled = True
    
End Sub

Private Sub Form_Load()
    
    Text1.Enabled = False
    Text2.Enabled = False
    Text2.Text = ""

    cmdSubmit.Enabled = False
    
    cmdUpdateName.Enabled = False
    txtUserName.Enabled = False
    
    FillBotList HKEY_CURRENT_USER, "Software\Windowpane\AimlBot\Bots", "InstallPath", DataPath
    
    'SelectBot cboBots.List(ListIndex)
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    ' If bot exists, save & delete it
    If Not (oAimlBot Is Nothing) Then
        If oAimlBot.state = BotStateInitialized Then
            oAimlBot.savevars (txtUserFile.Text)
        End If
        Set oAilmBot = Nothing
    End If
    
End Sub

Function FillBotList( _
    ByVal hKey As Long, _
    sKeyName As String, _
    sName As String, _
    vValue As Variant) As Long
    
    Dim r As Long
    Dim I As Integer
    
    Dim hSubKey As Long
    Dim err_code As Long
    
    err_code = RegOpenKeyEx(hKey, sKeyName, 0, KEY_ALL_ACCESS, hSubKey)
    If err_code <> ERROR_SUCCESS Then Exit Function
    
    Dim cName As Long, cJunk As Long, ft As FILETIME
    Static hKeyPrev As Long, cNameMax As Long
    If hKeyPrev <> hKey Or cNameMax = 0 Then
        hKeyPrev = hKey
        FillBotDropdown = RegQueryInfoKey(hSubKey, sNullStr, cJunk, pNull, _
                                         cJunk, cNameMax, cJunk, cJunk, _
                                         cJunk, cJunk, cJunk, ft)
        If FillBotDropdown Then Exit Function
    End If
    
    SendMessageAny lstBotList.hwnd, LVM_DELETEALLITEMS, 0, 0
    
    I = 0
    Do While FillBotDropdown = ERROR_SUCCESS
        cName = cNameMax + 1
        sName = String$(cName, 0)
        FillBotDropdown = RegEnumKeyEx(hSubKey, I, sName, cName, _
                                      pNull, sNullStr, cJunk, ft)
        sName = Left$(sName, cName)
        Dim itmX As ListItem
        Set itmX = lstBotList.ListItems.Add(, , sName, 0, 0)
        I = I + 1
    Loop

    'Get the default bot
    Dim vDefaultBot As Variant
    GetRegValue HKEY_CURRENT_USER, sKeyName, "", vDefaultBot
   
   sCurrentBot = vDefaultBot
   SelectBot sCurrentBot
    
End Function

Function FillBotInfo(BotName As String)
    Dim sDataValue As String
    Dim sKeyName As String
    
    sKeyName = "software\Windowpane\AimlBot\Bots\" & BotName
    
    GetRegValue HKEY_CURRENT_USER, sKeyName, "DataPath", sDataValue
    txtBaseDirectory.Text = sDataValue
    
    GetRegValue HKEY_CURRENT_USER, sKeyName, "UserFile", sDataValue
    txtUserFile.Text = sDataValue
    
    GetRegValue HKEY_CURRENT_USER, sKeyName, "IniFile", sDataValue
    txtIniFile.Text = sDataValue
    
End Function

Function SelectBot(BotName As String)

    Dim li As ListItem
    Dim dx As Long
    
    Set li = lstBotList.FindItem(BotName)
    dx = li.index
    
    SelectListItem lstBotList.hwnd, dx - 1
    gCurrentBot = lstBotList.SelectedItem
    
    FillBotInfo (gCurrentBot)
    
End Function

Private Sub lstBotList_Click()
    Dim si As Integer
    Dim sDataPath As String
    Dim IniFile As String
    Dim UserFile As String
    Dim sKeyName As String
   
    gCurrentBot = lstBotList.SelectedItem
    
    FillBotInfo (gCurrentBot)
    
End Sub

