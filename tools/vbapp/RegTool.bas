Attribute VB_Name = "MRegTool"
Option Explicit

Public Enum EErrorRegTool
    eeBaseRegTool = 13590   ' RegTool
End Enum

Public Const ERROR_SUCCESS = 0&

Public Const ERROR_MORE_DATA = 234 '  dderror

Public Const REG_BINARY = 3                     ' Free form binary
Public Const REG_CREATED_NEW_KEY = &H1                      ' New Registry Key created
Public Const REG_DWORD = 4                      ' 32-bit number
Public Const REG_DWORD_BIG_ENDIAN = 5           ' 32-bit number
Public Const REG_DWORD_LITTLE_ENDIAN = 4        ' 32-bit number (same as REG_DWORD)
Public Const REG_EXPAND_SZ = 2                  ' Unicode nul terminated string
Public Const REG_FULL_RESOURCE_DESCRIPTOR = 9   ' Resource list in the hardware description
Public Const REG_LINK = 6                       ' Symbolic Link (unicode)
Public Const REG_MULTI_SZ = 7                   ' Multiple Unicode strings
Public Const REG_NONE = 0                       ' No value type
Public Const REG_NOTIFY_CHANGE_ATTRIBUTES = &H2
Public Const REG_NOTIFY_CHANGE_LAST_SET = &H4                      ' Time stamp
Public Const REG_NOTIFY_CHANGE_NAME = &H1                      ' Create or delete (child)
Public Const REG_NOTIFY_CHANGE_SECURITY = &H8
Public Const REG_OPENED_EXISTING_KEY = &H2                      ' Existing Key opened
Public Const REG_OPTION_BACKUP_RESTORE = 4     ' open for backup or restore
Public Const REG_OPTION_CREATE_LINK = 2        ' Created key is a symbolic link
Public Const REG_OPTION_NON_VOLATILE = 0       ' Key is preserved when system is rebooted
Public Const REG_OPTION_RESERVED = 0           ' Parameter is reserved
Public Const REG_OPTION_VOLATILE = 1           ' Key is not preserved when system is rebooted
Public Const REG_REFRESH_HIVE = &H2                      ' Unwind changes to last flush
Public Const REG_RESOURCE_LIST = 8              ' Resource list in the resource map
Public Const REG_RESOURCE_REQUIREMENTS_LIST = 10
Public Const REG_SZ = 1                         ' Unicode nul terminated string
Public Const REG_WHOLE_HIVE_VOLATILE = &H1                      ' Restore whole hive volatile
Public Const REG_LEGAL_CHANGE_FILTER = (REG_NOTIFY_CHANGE_NAME Or REG_NOTIFY_CHANGE_ATTRIBUTES Or REG_NOTIFY_CHANGE_LAST_SET Or REG_NOTIFY_CHANGE_SECURITY)
Public Const REG_LEGAL_OPTION = (REG_OPTION_RESERVED Or REG_OPTION_NON_VOLATILE Or REG_OPTION_VOLATILE Or REG_OPTION_CREATE_LINK Or REG_OPTION_BACKUP_RESTORE)

Public Const SYNCHRONIZE = &H100000
Public Const READ_CONTROL = &H20000
Public Const STANDARD_RIGHTS_ALL = &H1F0000
Public Const STANDARD_RIGHTS_EXECUTE = (READ_CONTROL)
Public Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Public Const STANDARD_RIGHTS_REQUIRED = &HF0000
Public Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)

Public Const KEY_QUERY_VALUE = &H1
Public Const KEY_CREATE_LINK = &H20
Public Const KEY_CREATE_SUB_KEY = &H4
Public Const KEY_ENUMERATE_SUB_KEYS = &H8
Public Const KEY_EVENT = &H1     '  Event contains key event record
Public Const KEY_NOTIFY = &H10
Public Const KEY_SET_VALUE = &H2
Public Const KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Public Const KEY_EXECUTE = ((KEY_READ) And (Not SYNCHRONIZE))
Public Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Public Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) And (Not SYNCHRONIZE))

Public Enum EROOTKEY
    HKEY_CLASSES_ROOT = &H80000000
    HKEY_CURRENT_CONFIG = &H80000005
    HKEY_CURRENT_USER = &H80000001
    HKEY_DYN_DATA = &H80000006
    HKEY_LOCAL_MACHINE = &H80000002
    HKEY_PERFORMANCE_DATA = &H80000004
    HKEY_USERS = &H80000003
    HKL_NEXT = 1
    HKL_PREV = 0
End Enum

Public Type ACL
        AclRevision As Byte
        Sbz1 As Byte
        AclSize As Integer
        AceCount As Integer
        Sbz2 As Integer
End Type

Public Type SECURITY_ATTRIBUTES
        nLength As Long
        lpSecurityDescriptor As Long
        bInheritHandle As Long
End Type

Public Type SECURITY_DESCRIPTOR
        Revision As Byte
        Sbz1 As Byte
        Control As Long
        Owner As Long
        Group As Long
        Sacl As ACL
        Dacl As ACL
End Type

Public Type FILETIME
        dwLowDateTime As Long
        dwHighDateTime As Long
End Type

Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Public Declare Function RegConnectRegistry Lib "advapi32.dll" Alias "RegConnectRegistryA" (ByVal lpMachineName As String, ByVal hKey As Long, phkResult As Long) As Long
Public Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, lpSecurityAttributes As SECURITY_ATTRIBUTES, phkResult As Long, lpdwDisposition As Long) As Long
Public Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Public Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Public Declare Function RegEnumKey Lib "advapi32.dll" Alias "RegEnumKeyA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long
Public Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, ByVal lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As FILETIME) As Long
Public Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, lpData As Byte, lpcbData As Long) As Long
Public Declare Function RegFlushKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Public Declare Function RegGetKeySecurity Lib "advapi32.dll" (ByVal hKey As Long, ByVal SecurityInformation As Long, pSecurityDescriptor As SECURITY_DESCRIPTOR, lpcbSecurityDescriptor As Long) As Long
Public Declare Function RegQueryInfoKey Lib "advapi32.dll" Alias "RegQueryInfoKeyA" (ByVal hKey As Long, ByVal lpClass As String, lpcbClass As Long, ByVal lpReserved As Long, lpcSubKeys As Long, lpcbMaxSubKeyLen As Long, lpcbMaxClassLen As Long, lpcValues As Long, lpcbMaxValueNameLen As Long, lpcbMaxValueLen As Long, lpcbSecurityDescriptor As Long, lpftLastWriteTime As FILETIME) As Long
Public Declare Function RegEnumValueInt Lib "advapi32.dll" Alias "RegEnumValueIntA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, ByRef lpData As Byte, lpcbData As Long) As Long
Public Declare Function RegEnumValueStr Lib "advapi32.dll" Alias "RegEnumValueStrA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, ByRef lpData As String, lpcbData As Long) As Long
Public Declare Function RegEnumValueByte Lib "advapi32.dll" Alias "RegEnumValueByteA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, ByRef lpData As Byte, lpcbData As Long) As Long
Public Declare Function RegQueryValueEx Lib "advapi32.dll" _
   Alias "RegQueryValueExA" _
  (ByVal hKey As Long, ByVal lpszValueName As String, _
   ByVal lpdwRes As Long, lpType As Long, _
   lpData As Any, nSize As Long) As Long
'Public Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByRef lpData As Any, lpcbData As Long) As Long         ' Note that if you declare the lpData parameter as String, you must pass it By Value.
Public Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long

Const sWin = "Software\Microsoft\Windows\"
Const sExp = "CurrentVersion\Explorer\Shell Folders"
Const sWinExp = sWin & sExp
Const sBack = "\"
Const sNullStr = 0
Const pNull = 0
Const sEmpty = ""

Function GetRegValue( _
    ByVal hKey As Long, _
    sKeyName As String, _
    sValueName As String, _
    vValue As Variant) As Long
    
    On Error GoTo GetRegValueFail
    
    Dim hSubKey As Long
    Dim err_code As Long
    
    err_code = RegOpenKeyEx(hKey, sKeyName, 0, KEY_ALL_ACCESS, hSubKey)
    If err_code <> ERROR_SUCCESS Then Exit Function

    Dim cData As Long, sData As String, ordType As Long, e As Long
    e = RegQueryValueEx(hSubKey, sValueName, pNull, ordType, 0&, cData)
    If e And e <> ERROR_MORE_DATA Then Exit Function
    Select Case ordType
    Case REG_DWORD, REG_DWORD_LITTLE_ENDIAN
        Dim iData As Long
        e = RegQueryValueEx(hSubKey, sKeyName, pNull, _
                               ordType, iData, cData)
        vValue = iData
        
    Case REG_DWORD_BIG_ENDIAN  ' Unlikely, but you never know
        Dim dwData As Long
        e = RegQueryValueEx(hSubKey, sValueName, pNull, _
                               ordType, dwData, cData)
        vValue = dwData
        
    Case REG_SZ, REG_MULTI_SZ, REG_EXPAND_SZ ' Same thing to Visual Basic
       Dim sDataRet As String
       Dim dwDataRet As Long
       Dim success As Long
       Dim pos As Long
       
      'get the value of the passed key
       sDataRet = Space$(cData)
       dwDataRet = Len(sDataRet)
       
        success = RegQueryValueEx(hSubKey, sValueName, _
                                 ByVal 0&, ordType, _
                                 ByVal sDataRet, dwDataRet)
    
       If success = ERROR_SUCCESS Then
          If dwDataRet > 0 Then
          
             pos = InStr(sDataRet, Chr$(0))
             'If ordType = REG_EXPAND_SZ Then
             '   vValue = ExpandEnvStr(sData)
             'Else
                vValue = Left$(sDataRet, pos - 1)
             'End If
          End If
       End If
        
    ' Catch REG_BINARY and anything else
    Case Else
        Dim abData() As Byte
        ReDim abData(cData)
        e = RegQueryValueEx(hSubKey, sValueName, pNull, _
                                ordType, abData(0), cData)
        vValue = abData
        
    End Select
    ' Close the sub key
    RegCloseKey (hSubKey)
    GetRegValue = e

    Exit Function

GetRegValueFail:
    MsgBox "Opps!"
End Function
