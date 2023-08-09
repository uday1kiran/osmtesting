#RequireAdmin 
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIReg.au3>

Global $destinationDir = "C:\Temp\Qualys"

; Create directory if it doesn't exist
If Not FileExists($destinationDir) Then
    DirCreate($destinationDir)
EndIf

; Copy files to destination directory
FileCopy(@ScriptDir & "\activatewindows.ps1", $destinationDir & "\activatewindows.ps1", $FC_OVERWRITE)
FileCopy(@ScriptDir & "\activatewindows.bat", $destinationDir & "\activatewindows.bat", $FC_OVERWRITE)

; Set registry value
Global $regKey = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\ACT"
Global $regValue = $destinationDir & "\activatewindows.bat"

RegWrite($regKey, "", "REG_SZ", $regValue)