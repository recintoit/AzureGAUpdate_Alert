#variables used
#There are a few servers, so I hardcoded. But best practice would be to get-content from a server.txt file

$Servers = "<serverNames>"
 
 foreach ($Server in $Servers) 

 #MS changed the filename, so this would need to be updated
 {Foreach-Object  ([XML]$Agent = Get-Content \\$Server\c$\windowsazure\GuestAgent_2.7.41491.898*\CommonAgentConfig.config)
 $agent.configuration.'microsoft.windowsAzure.guestAgent.configuration'.environment.enablePushInVMLogs 

if  ($agent.configuration.'microsoft.windowsAzure.guestAgent.configuration'.environment.enablePushInVMLogs -eq "false")  { write-host "yes"} 
else {Send-MailMessage -From  -To  -Subject "AzureGuestAgent set to True" -SmtpServer  -Body "There is no Azure Guest Agent config on $Server "  }



   }
   
   
   
   
   
   
   

  
