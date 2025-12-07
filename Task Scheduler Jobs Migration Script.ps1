# Set the Source and Destination Servers
$source_server = "Enter_Source_Server_IP"
$destination_server = "Enter_Destination_Server_IP"

# Set the credentials for the source server
$source_username = "Source_Username"
$source_password = "Source_Password"

# Set the credentials for the destination server
$destination_username = "Destination_Username"
$destination_password = "Destination_Password"

# Set the path to the directory containing the XML files for each task
$export_directory = "C:\Path\To\ExportedTasks"

# Ensure export directory exists
if (!(Test-Path -Path $export_directory)) {
    New-Item -ItemType Directory -Path $export_directory | Out-Null
}

# Export all tasks from source server
Invoke-Command -ComputerName $source_server -Credential (New-Object System.Management.Automation.PSCredential($source_username, (ConvertTo-SecureString $source_password -AsPlainText -Force))) -ScriptBlock {
    $tasks = Get-ScheduledTask
    $backupPath = $using:export_directory
    foreach ($task in $tasks) {
        $taskName = $task.TaskName
        $taskPath = $task.TaskPath
        $taskInfo = Export-ScheduledTask -TaskName $taskName -TaskPath $taskPath
        $filePath = Join-Path -Path $backupPath -ChildPath "$($taskName).xml"
        $taskInfo | Out-File -FilePath $filePath
    }
}

# Import tasks to destination server
Get-ChildItem -Path $export_directory -Filter *.xml | ForEach-Object {
    $xmlContent = Get-Content -Path $_.FullName -Raw
    Invoke-Command -ComputerName $destination_server -Credential (New-Object System.Management.Automation.PSCredential($destination_username, (ConvertTo-SecureString $destination_password -AsPlainText -Force))) -ScriptBlock {
        $xml = $using:xmlContent
        $taskName = (Select-String -InputObject $xml -Pattern '<RegistrationInfo Description="(.*?)"').Matches.Groups[1].Value
        Register-ScheduledTask -TaskName $taskName -Xml $xml
    }
}
