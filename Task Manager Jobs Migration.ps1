# Set the Source and Destination Servers
$source_server = "Enter_Source_Server_IP"
$destination_server = "Enter_Destination_Server_IP"

# Set the username and password for the servers
$username = "Your_Username"
$password = "Your_Password"

# Set the path to the directory containing the XML files for each task
$export_directory = "C:\Path\To\ExportedTasks"

# List all XML files in the export directory
$xmlFiles = Get-ChildItem -Path $export_directory -Filter *.xml

# Import each task XML file to create the tasks on the destination server
foreach ($xmlFile in $xmlFiles) {
    schtasks /create /s $destination_server /u $username /p $password /xml $xmlFile.FullName
}
