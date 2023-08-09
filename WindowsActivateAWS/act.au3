#RequireAdmin ; Request administrative privileges

#include <MsgBoxConstants.au3>
#include <WinAPIReg.au3>

Global $destinationDir = "C:\Temp\Qualys"
Global $extractedFilesDir = @ScriptDir & "\ExtractedFiles"

; Create directory if it doesn't exist
If Not FileExists($destinationDir) Then
    DirCreate($destinationDir)
EndIf

; Extract files from the script to a temporary directory
DirCreate($extractedFilesDir)
FileInstall("activatewindows.ps1", $extractedFilesDir & "\activatewindows.ps1")
FileInstall("activatewindows.bat", $extractedFilesDir & "\activatewindows.bat")

; Copy extracted files to destination directory
FileCopy($extractedFilesDir & "\activatewindows.ps1", $destinationDir & "\activatewindows.ps1", $FC_OVERWRITE)
FileCopy($extractedFilesDir & "\activatewindows.bat", $destinationDir & "\activatewindows.bat", $FC_OVERWRITE)

; Set registry value
Global $regKey = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\ACT"
Global $regValue = $destinationDir & "\activatewindows.bat"

RegWrite($regKey, "", "REG_SZ", $regValue)



; Clean up extracted files
DirRemove($extractedFilesDir, $DIR_REMOVE)
