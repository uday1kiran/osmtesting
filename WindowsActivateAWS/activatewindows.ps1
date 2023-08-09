Import-Module 'C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Module\\Ec2Launch.psm1'
Add-Routes
Set-ActivationSettings
cmd /c 'c:\\windows\\system32\\cscript.exe c:\\windows\\system32\\slmgr.vbs /ato'