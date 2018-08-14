#Remove-Item –path C:\Wildfly-9.0.0.Final\standalone\data\* –recurse
#Remove-Item –path C:\Wildfly-9.0.0.Final\standalone\tmp\vfs\* –recurse
#start-process "cmd.exe" "/k C:\Wildfly-9.0.0.Final\bin\standalone.bat"

$Prog = "C:\Wildfly-9.0.0.Final\bin\standalone.bat"
$Running = Get-Process prog -ErrorAction SilentlyContinue
$Start = {([wmiclass]"win32_process").Create($Prog)} 
if($Running -eq $null) # evaluating if the program is running
{& $Start} # the process is created on this line