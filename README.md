# Task Scheduler Migration Script
**This PowerShell script automates the migration of all scheduled tasks from one Windows server to another. It exports tasks from the source server as XML files and imports them to the destination server, ensuring a reliable and repeatable migration process.**

## Prerequisites

**Windows Server 2012 or later (for ScheduledTasks module).**
**PowerShell 5.1 or later.**

- Administrative permissions on both source and destination servers.

- Network connectivity from your local machine to both servers.

## Usage

**1. Update Configuration:**
- Set the source and destination server IP addresses.
- Enter valid usernames and passwords for both servers.
- Specify the directory for exporting XML files.

**2. Run the Script:**
- Execute the script from your local machine in PowerShell.
- Ensure your machine can remotely access both servers.

**3. Review Output:**
- Check the console for success or error messages.
- All tasks will be exported to XML files and imported to the destination server.

## Script Features
- Exports all scheduled tasks from the source server to XML files.
- Imports each XML file as a scheduled task on the destination server.
- Handles secure remote authentication and centralized configuration.
- Provides clear console output for troubleshooting.

## License
- This project is licensed under the MIT License.
