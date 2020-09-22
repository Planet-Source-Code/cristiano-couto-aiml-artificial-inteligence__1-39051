Attribute VB_Name = "ListViewSubClass"
Option Explicit

'Subclassing is a technique that enables you to intercept Windows
'messages being sent to a form or control. By intercepting these messages,
'you can then write your own code to change or extend the behavior of the
'object. Subclassing can be complex, and a thorough discussion of it is
'beyond the scope of this book. The following example offers a brief
'illustration of the technique.
'Important   When Visual Basic is in break mode, you can't call vtable
'methods or AddressOf functions. As a safety mechanism, Visual Basic
'simply returns 0 to the caller of an AddressOf function without calling
'the function. In the case of subclassing, this means that 0 is returned
'to Windows from the WindowProc. Windows requires nonzero return values
'from many of its messages, so the constant 0 return may create a
'deadlock situation between Windows and the Visual Basic, forcing
'you to end the process.
    
'This application consists of a simple form with two command buttons.
'The code is designed to intercept Windows messages being sent to the
'form and to print the values of those messages in the Immediate window.
'The first part of the code consists of declarations for the API
'functions, constant values, and variables:

'typedef struct tagNMLISTVIEW
'{
'    NMHDR   hdr;
'    int     iItem;
'    int     iSubItem;
'    UINT    uNewState;
'    UINT    uOldState;
'    UINT    uChanged;
'    POINT   ptAction;
'    LPARAM  lParam;
'} NMLISTVIEW, FAR *LPNMLISTVIEW;


Public Type POINT
  x As Long
  Y As Long
End Type

Public Type NMHDR
    hwndFrom As Long
    idfrom As Long
    code As Long
End Type

Public Type NM_LISTVIEW
    hdr As NMHDR
    iItem As Long
    iSubItem As Long
    uNewState As Long
    uOldState As Long
    uChanged As Long
    ptAction As POINT
    lParam As Long
End Type

Public Type LV_ITEM
  mask As Long
  iItem As Long
  iSubItem As Long
  state As Long
  stateMask As Long
  pszText As String
  cchTextMax As Long
  iImage As Long
  lParam As Long
  iIndent As Long
End Type

Public Type LV_FINDINFO
    flags As Long
    psz As String
    lParam As Long
    pt As POINT
    vkDirection As Long
End Type

Public Type RECT
       Left As Long
       Top As Long
       Right As Long
       Bottom As Long
End Type

Private Type POINTAPI
       x As Long
       Y As Long
End Type

Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long

Declare Function CallWindowProc Lib "user32" Alias _
"CallWindowProcA" (ByVal lpPrevWndFunc As Long, _
    ByVal hwnd As Long, ByVal Msg As Long, _
    ByVal wParam As Long, nml As NM_LISTVIEW) As Long

Declare Function SetWindowLong Lib "user32" Alias _
"SetWindowLongA" (ByVal hwnd As Long, _
ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

'API declarations
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" ( _
    ByVal hwnd As Long, _
    ByVal wMsg As Long, _
    ByVal wParam As Long, _
    ByVal lParam As Long) As Long
Private Declare Function SetWindowPos Lib "user32" ( _
    ByVal hwnd As Long, _
    ByVal hWndInsertAfter As Long, _
    ByVal x As Long, _
    ByVal Y As Long, _
    ByVal cx As Long, _
    ByVal cy As Long, _
    ByVal wFlags As Long) As Long
Private Declare Function ClientToScreen Lib "user32" ( _
    ByVal hwnd As Long, _
    lpPoint As POINTAPI) As Long
Public Declare Function GetClientRect Lib "user32" ( _
    ByVal hwnd As Long, _
    lpRect As RECT) As Long
Private Declare Function ScreenToClient Lib "user32" ( _
    ByVal hwnd As Long, _
    lpPoint As POINTAPI) As Long
Private Declare Function GetWindowRect Lib "user32" ( _
    ByVal hwnd As Long, lpRect _
    As RECT) As Long
Public Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" _
   (ByVal hwnd As Long, _
    ByVal Msg As Long, _
    ByVal wParam As Long, _
    ByVal lParam As Long) As Long

Public Declare Function SendMessageAny Lib "user32" Alias "SendMessageA" ( _
  ByVal hwnd As Long, _
  ByVal wMsg As Long, _
  ByVal wParam As Long, _
  lParam As Any) As Long
  
'Constants
Public Const LVM_FIRST = &H1000
Public Const LVM_FINDITEM = (LVM_FIRST + 13)
Public Const LVM_GETCOLUMNWIDTH = (LVM_FIRST + 29)
Public Const LVM_GETITEMTEXT = (LVM_FIRST + 45)
Public Const LVM_GETNEXTITEM = (LVM_FIRST - 12)
Public Const LVM_SORTITEMS = (LVM_FIRST + 48)
Public Const LVM_SETCOLUMNWIDTH = (LVM_FIRST + 30)
Public Const LVSCW_AUTOSIZE = -1
Public Const LVSCW_AUTOSIZE_USEHEADER = -2
    
Public Const LVN_FIRST = (0 - 100)
Public Const LVN_ITEMCHANGED = (LVN_FIRST - 1)

Public Const LVM_SETEXTENDEDLISTVIEWSTYLE = LVM_FIRST + 54
Public Const LVM_GETEXTENDEDLISTVIEWSTYLE = LVM_FIRST + 55
Public Const LVM_SETITEMSTATE = LVM_FIRST + 43

Public Const LVS_EX_FULLROWSELECT = &H20
Public Const LVS_EX_GRIDLINES = &H1

Public Const LVNI_ALL = &H0
Public Const LVNI_FOCUSED = &H1
Public Const LVNI_SELECTED = &H2
Public Const LVNI_CUT = &H4
Public Const LVNI_DROPHILITED = &H8
Public Const LVNI_ABOVE = &H100
Public Const LVNI_BELOW = &H200
Public Const LVNI_TOLEFT = &H400
Public Const LVNI_TORIGHT = &H800

Private Const LVIF_TEXT = &H1
Private Const LVIF_IMAGE = &H2
Private Const LVIF_PARAM = &H4
Private Const LVIF_STATE = &H8
Private Const LVIF_INDENT = &H10
Private Const LVIF_NORECOMPUTE = &H800

Private Const LVIS_FOCUSED = &H1
Private Const LVIS_SELECTED = &H2
Private Const LVIS_CUT = &H4
Private Const LVIS_DROPHILITED = &H8
Private Const LVIS_ACTIVATING = &H20
Private Const LVIS_OVERLAYMASK = &HF00
Private Const LVIS_STATEIMAGEMASK = &HF000

Public Const LVFI_PARAM = &H1
Public Const LVFI_STRING = &H2
Public Const LVFI_PARTIAL = &H8
Public Const LVFI_WRAP = &H20
Public Const LVFI_NEARESTXY = &H40

Public Const WM_DESTROY = &H2
Public Const WM_CREATE = &H1
Public Const WM_NOTIFY = &H4E
Public Const WM_SETREDRAW = &HB

Public Const WM_USER = &H400
Public Const WM_GOTCHA = WM_USER + 1

Public Const GWL_WNDPROC = -4

Global lpPrevWndProc As Long

Global gHW As Long
Private lv As ListView

Public objItem As LV_ITEM
Public objFind As LV_FINDINFO

Public Function ListView_FindItem(sItem As String, ByVal hwnd As Long) As Long
   
   Dim r As Long
  'Convert the input parameter to an index in the list view
   objFind.flags = LVFI_STRING
   objFind.psz = (sItem)
   r = SendMessageAny(hwnd, LVM_FINDITEM, -1, objFind)
  
  ListView_FindItem = r

End Function

Function SelectListItem(hwnd As Long, index As Long)
    Dim r As Long
    objItem.iItem = index
    objItem.iSubItem = 0
    objItem.mask = LVIF_STATE
    objItem.stateMask = LVIS_FOCUSED Or LVIS_SELECTED
    objItem.state = LVIS_FOCUSED Or LVIS_SELECTED
    r = SendMessageAny(hwnd, LVM_SETITEMSTATE, index, objItem)

End Function
