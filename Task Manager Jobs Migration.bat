# Set the Source and Destination Servers
source_server = "Enter Serevr IP"
destination_server = "Enter Server IP"


# Set the username and password for the servers
username = ""
password = ""


# Set the path to save the exported XML file
export_path = ""


# Export the task scheduler jobs from the source server
schtasks /query /s $source_server /u $username /p $password /foXML /tn "*" > $export_path

# Import the task scheduler jobs from the destination server
schtasks /create /s $destination_server /u $username /p $password /tn XML /tn "Task Name" /xml $export_path
