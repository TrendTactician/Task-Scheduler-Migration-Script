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

# List all XML files in the export directory
$xmlFiles = Get-ChildItem -Path $export_directory -Filter *.xml

# Export tasks from the source server
foreach ($xmlFile in $xmlFiles) {
    schtasks /query /s $source_server /u $source_username /p $source_password /fo XML /tn "*" > $xmlFile.FullName
}

# Import tasks to the destination server
foreach ($xmlFile in $xmlFiles) {
    schtasks /create /s $destination_server /u $destination_username /p $destination_password /xml $xmlFile.FullName
}
