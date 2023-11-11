# Task Scheduler Migration Script

This script facilitates the migration of Task Scheduler jobs from one server to another using the `schtasks` command-line tool.

## Prerequisites

- Ensure that you have the necessary permissions on both the source and destination servers to perform Task Scheduler operations.
- Verify that the `schtasks` command-line tool is available on the servers.

## Usage

**1. Open the script file and update the following variables:**
- Source and destination server IP addresses (source_server and destination_server).
- Usernames and passwords for both servers (source_username, source_password, destination_username, destination_password).
- Path to the directory containing XML files for each task (export_directory).

**2. Run the Script:**
- Execute the script on your local machine to export and import Task Scheduler jobs from Source Server to Destination server.(Make sure your local machine is whitelisted to access both of those servers.)

**3. PowerShell script:**
- In powershell Copy code
- ```.\Task-Scheduler-Migration-Script.ps1```

**4. Review Output:**
- Check the console output for any error messages or confirmations. The script will export tasks from the source server and create them on the destination server.

## Additional Notes
- For advanced usage or customization, consider exploring the script code.

## Contributing
- If you encounter issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License
- This project is licensed under the MIT License.
