#################################################################################  
##  
## Server Health Check  
## Created by Sravan Kumar S   
## Date : 3 Mar 2014  
## Version : 1.0  
## Email: sravankumar.s@outlook.com    
## This scripts check the server Avrg CPU and Memory utlization along with C drive  
## disk utilization and sends an email to the receipents included in the script 
################################################################################  
 
$ServerListFile = "D:\Raju\Scripts\ServerList.txt"   
$ServerList = Get-Content $ServerListFile -ErrorAction SilentlyContinue  
$Result = @()  
ForEach($computername in $ServerList)  
{ 
 
$AVGProc = Get-WmiObject -computername $computername win32_processor |  
Measure-Object -property LoadPercentage -Average | Select Average 
$OS = gwmi -Class win32_operatingsystem -computername $computername | 
Select-Object @{Name = "MemoryUsage"; Expression = {“{0:N2}” -f ((($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)*100)/ $_.TotalVisibleMemorySize) }} 
$vol = Get-WmiObject -Class win32_Volume -ComputerName $computername -Filter "DriveLetter = 'C:'" | 
Select-object @{Name = "C PercentFree"; Expression = {“{0:N2}” -f  (($_.FreeSpace / $_.Capacity)*100) } } 
   
$result += [PSCustomObject] @{  
        ServerName = "$computername" 
        CPULoad = "$($AVGProc.Average)%" 
        MemLoad = "$($OS.MemoryUsage)%" 
        CDrive = "$($vol.'C PercentFree')%" 
    } 
 
    $Outputreport = "<HTML><TITLE> Server Health Report </TITLE> 
                     <BODY background-color:peachpuff> 
                     <font color =""#99000"" face=""Microsoft Tai le""> 
                     <H2> Server Health Report </H2></font> 
                     <Table border=1 cellpadding=0 cellspacing=0> 
                     <TR bgcolor=gray align=center> 
                       <TD><B>Server Name</B></TD> 
                       <TD><B>Avrg.CPU Utilization</B></TD> 
                       <TD><B>Memory Utilization</B></TD> 
                       <TD><B>C Drive Utilizatoin</B></TD></TR>" 
                         
    Foreach($Entry in $Result)  
     
        {  
          if((($Entry.CpuLoad) -or ($Entry.memload)) -ge "80")  
          {  
            $Outputreport += "<TR bgcolor=red>"  
          }  
          else 
           { 
            $Outputreport += "<TR>"  
          } 
          $Outputreport += "<TD>$($Entry.Servername)</TD><TD align=center>$($Entry.CPULoad)</TD><TD align=center>$($Entry.MemLoad)</TD><TD align=center>$($Entry.Cdrive)</TD></TR>"  
        } 
     $Outputreport += "</Table></BODY></HTML>"  
        }  
  
$Outputreport | out-file D:\Raju\Scripts\Test.htm  
Invoke-Expression D:\Raju\Scripts\Test.htm 
##Send email functionality from below line, use it if you want    
$smtpServer = "smtp.gmail.com" 
$smtpFrom = "raju234007@gmail.com" 
$smtpTo = "raju237007@gmail.com" 
$messageSubject = "Servers Health report" 
$message = New-Object System.Net.Mail.MailMessage $smtpfrom, $smtpto 
$message.Subject = $messageSubject 
$message.IsBodyHTML = $true 
$message.Body = "<head><pre>$style</pre></head>" 
$message.Body += Get-Content D:\Raju\Scripts\test.htm 
$smtp = New-Object Net.Mail.SmtpClient($smtpServer) 
$smtp.Send($message)

###<--script to attachment in mail-->###
$Username = "raju234007@gmail.com";
$Password = "raju*csg@237007";
$path = "D:\Raju\Scripts\diskSpace.txt";

function Send-ToEmail([string]$email, [string]$attachmentpath){
	
	# get freespace from drivers
	Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property DeviceID, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}},@{L="CapacityGB";E={"{0:N2}" -f ($_.Size/1GB)}} > diskSpace.txt
	# get hostname from localmachine
	$hostname = ipconfig | ? { $_ -match 'Ipv4.*: ((\d{1,3}\.){3}\d{1,3})' }| select @{n="IPv4";e={$Matches[1]}}
	# file attachment to mail
	$diskSpace = [IO.File]::ReadAllText("D:\Raju\Scripts\diskSpace.txt")
	
	# cpu usage
	$proc =get-counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 2
	$cpu_use=($proc.readings -split ":")[-1]
	
    $message = new-object Net.Mail.MailMessage;
    $message.From = "raju234007@gmail.com";
    $message.To.Add($email);
    $message.Subject = "Subject - Alert for CPU Utilization on $(Get-Date) from $hostname";
    $message.Body = "Body - Alert for CPU Utilization $cpu_use";
    $attachment = New-Object Net.Mail.Attachment($attachmentpath);
    $message.Attachments.Add($attachment);

    $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", "587");
    $smtp.EnableSSL = $true;
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
    $smtp.send($message);
    write-host "Mail Sent" ;
    $attachment.Dispose();
 }
Send-ToEmail  -email "raju237007@gmail.com" -attachmentpath $path;

###<--script to attachment in mail-->###

###<--script for cpu usage in mail-->###
while($true){
    if((Get-Counter -Counter "\Processor(_Total)\% Processor Time").CounterSamples.CookedValue -ge 5){
	
	$emailSmtpServer = "smtp.gmail.com"
	$emailSmtpServerPort = "587"
	$emailSmtpUser = "user@gmail.com"
	$emailSmtpPass = ""
	$emailFrom = "user@gmail.com"
	$emailTo = "to@gmail.com"
	
	Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property DeviceID, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}},@{L="CapacityGB";E={"{0:N2}" -f ($_.Size/1GB)}} > diskSpace.txt
	# get hostname from localmachine
	$hostname = ipconfig | ? { $_ -match 'Ipv4.*: ((\d{1,3}\.){3}\d{1,3})' }| select @{n="IPv4";e={$Matches[1]}}
	# file attachment to mail
	$diskSpace = [IO.File]::ReadAllText("D:\Raju\Scripts\diskSpace.txt")
	$path = "D:\Raju\Scripts\diskSpace.txt";

	$emailMessage = New-Object System.Net.Mail.MailMessage( $emailFrom , $emailTo )
	$emailMessage.Subject = "Subject - Alert for Disk Utilization on $(Get-Date) from $hostname" 
	$emailMessage.Body = " Body - Alert for Disk Utilization $diskSpace"

	$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
	$SMTPClient.EnableSsl = $True
	$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
	$SMTPClient.Send( $emailMessage )
    }
    Start-Sleep -Seconds 5
}
###<--script for cpu usage in mail-->###

### Windows Disk Alert ###
<#
$smtpServer = "smtp.gmail.com"
$smtpPort = "587"
$creds = Get-Credential "raju234007@gmail.com"
$params = @{
SmtpServer = $smtpServer
Port = $smtpPort
UseSSL = $true
creds = $creds
From = "raju234007@gmail.com"
To = "raju237007@gmail.com"
Subject = "Alert for Disk Usage"
}

#>
<#
$ProcessList = Get-WmiObject Win32_Process -ComputerName IND-RAJU
foreach ($Process in $ProcessList) {
    write-host $Process.Handle "::" $Process.Name "::" $Process.WorkingSetSize
}
#>

### Windows Disk Alert ###
$emailSmtpServer = "smtp.gmail.com"
$emailSmtpServerPort = "587"
$emailSmtpUser = "raju234007@gmail.com"
$emailSmtpPass = "raju*csg@237007"

$emailFrom = "raju234007@gmail.com"
$emailTo = "raju237007@gmail.com"

Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property DeviceID, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}},@{L="CapacityGB";E={"{0:N2}" -f ($_.Size/1GB)}} > diskSpace.txt
$hostname = ipconfig | ? { $_ -match 'Ipv4.*: ((\d{1,3}\.){3}\d{1,3})' }| select @{n="IPv4";e={$Matches[1]}}
$diskSpace = [IO.File]::ReadAllText("D:\Raju\Scripts\diskSpace.txt")
$emailMessage = New-Object System.Net.Mail.MailMessage( $emailFrom , $emailTo )
$emailMessage.Subject = "Subject - Alert for Disk Utilization on $(Get-Date) from $hostname" 
$emailMessage.Body = " Body - Alert for Disk Utilization $diskSpace"

$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
$SMTPClient.EnableSsl = $True
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
$SMTPClient.Send( $emailMessage )

### Windows Disk Alert ###
<#
$mythreshold = 10GB
Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property FreeSpace, DeviceID | foreach { 
    if ($_.FreeSpace -lt $mythreshold){

        $from = "raju234007@gmail.com" 
        $to = "raju237007@gmail.com" 
		$emailSmtpUser = "raju234007@gmail.com"
		$emailSmtpPass = "raju*csg@237007"
		$port = "587"
        $subject = "Low Disk Space!" 
        $body = "Free Space Remaining: " + $_.FreeSpace + "Drive" + $_.DeviceID 
        $smtpServer = "smtp.gmail.com" 
		
		$SMTPClient = New-Object System.Net.Mail.SmtpClient( $smtpServer , $port )
		$SMTPClient.EnableSsl = $True
		$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
		$SMTPClient.Send( $from,$to,$subject,$body )
    } 
    }
#>

<#
$proc =get-counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 2
$cpu=($proc.readings -split ":")[-1]
write-host "CPU utilization is \t: $cpu"
#>

<#
$Username = "raju234007@gmail.com";
$Password = "raju*csg@237007";
$path = "D:\Raju\Scripts\diskSpace.txt";

function Send-ToEmail([string]$email, [string]$attachmentpath){
	
	# get freespace from drivers
	Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property DeviceID, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}},@{L="CapacityGB";E={"{0:N2}" -f ($_.Size/1GB)}} > diskSpace.txt
	# get hostname from localmachine
	$hostname = ipconfig | ? { $_ -match 'Ipv4.*: ((\d{1,3}\.){3}\d{1,3})' }| select @{n="IPv4";e={$Matches[1]}}
	# file attachment to mail
	$diskSpace = [IO.File]::ReadAllText("D:\Raju\Scripts\diskSpace.txt")
	# Memory utilization
	$ComputerMemory = Get-WmiObject -ComputerName $Server -Class win32_operatingsystem -ErrorAction Stop
	$Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
	$RoundMemory = [math]::Round($Memory, 2)
	
    $message = new-object Net.Mail.MailMessage;
    $message.From = "raju234007@gmail.com";
    $message.To.Add($email);
    $message.Subject = "Subject - Alert for CPU Utilization on $(Get-Date) from $hostname";
    $message.Body = "CPU Utilization $cpu_use & Memory Utilization $RoundMemory";
    $attachment = New-Object Net.Mail.Attachment($attachmentpath);
    $message.Attachments.Add($attachment);

    $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", "587");
    $smtp.EnableSSL = $true;
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
    $smtp.send($message);
    write-host "Mail Sent" ;
    $attachment.Dispose();
 }

Send-ToEmail  -email "raju237007@gmail.com" -attachmentpath $path;

#>

### Windows Disk Alert ###

while($true){
    if((Get-Counter -Counter "\Processor(_Total)\% Processor Time").CounterSamples.CookedValue -ge 5){
	
	$emailSmtpServer = "smtp.gmail.com"
	$emailSmtpServerPort = "587"
	$emailSmtpUser = "raju234007@gmail.com"
	$emailSmtpPass = "raju*csg@237007"
	$emailFrom = "raju234007@gmail.com"
	$emailTo = "raju237007@gmail.com"
	
	Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property DeviceID, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}},@{L="CapacityGB";E={"{0:N2}" -f ($_.Size/1GB)}} > diskSpace.txt
	# get hostname from localmachine
	$hostname = ipconfig | ? { $_ -match 'Ipv4.*: ((\d{1,3}\.){3}\d{1,3})' }| select @{n="IPv4";e={$Matches[1]}}
	# file attachment to mail
	$diskSpace = [IO.File]::ReadAllText("D:\Raju\Scripts\diskSpace.txt")

	$emailMessage = New-Object System.Net.Mail.MailMessage( $emailFrom , $emailTo )
	$emailMessage.Subject = "Subject - Alert for Disk Utilization on $(Get-Date) from $hostname" 
	$emailMessage.Body = " Body - Alert for Disk Utilization $diskSpace"

	$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
	$SMTPClient.EnableSsl = $True
	$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
	$SMTPClient.Send( $emailMessage )
    }
    Start-Sleep -Seconds 5
}

### Windows Disk Alert ###

while($true){
    if((Get-Counter -Counter "\Processor(_Total)\% Processor Time").CounterSamples.CookedValue -ge 5){
	
	$emailSmtpServer = "smtp.gmail.com"
	$emailSmtpServerPort = "587"
	$emailSmtpUser = "raju234007@gmail.com"
	$emailSmtpPass = "raju*csg@237007"
	$emailFrom = "raju234007@gmail.com"
	$emailTo = "raju237007@gmail.com"
	
	Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property DeviceID, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}},@{L="CapacityGB";E={"{0:N2}" -f ($_.Size/1GB)}} > diskSpace.txt
	# get hostname from localmachine
	$hostname = ipconfig | ? { $_ -match 'Ipv4.*: ((\d{1,3}\.){3}\d{1,3})' }| select @{n="IPv4";e={$Matches[1]}}
	# file attachment to mail
	$diskSpace = [IO.File]::ReadAllText("D:\Raju\Scripts\diskSpace.txt")
	$path = "D:\Raju\Scripts\diskSpace.txt";

	$emailMessage = New-Object System.Net.Mail.MailMessage( $emailFrom , $emailTo )
	$emailMessage.Subject = "Subject - Alert for Disk Utilization on $(Get-Date) from $hostname" 
	$emailMessage.Body = " Body - Alert for Disk Utilization $diskSpace"

	$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
	$SMTPClient.EnableSsl = $True
	$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
	$SMTPClient.Send( $emailMessage )
    }
    Start-Sleep -Seconds 5
}
