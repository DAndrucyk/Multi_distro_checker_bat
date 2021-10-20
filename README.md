# [Multi_distro_checker_bat](https://github.com/DAndrucyk/Multi_distro_checker_bat/releases/tag/Batch)
Batch file to check multiple users are in multiple security groups,

## Known issues
- Distribution/security groups can only have 25 characters for the compairison
- Tool may bring back false positives if the group name has other groups that start with the same name
  - Example:
  - If you are checking permissions on Group_Test, you may get a false positive if there is a group called Group_Test_Admins
  - If the user is in Group_Test_Admins and not in Group_Test, you may get a false positive
  - The script checks for the name Group_Test (in this example) and will see both groups and check both groups

## Installation
- Download the batch file to a location of your choice.
- Run the stand alone bat file to run the script. All prompts will be brought up in a command prompt window.

## Default directories
- Requires connecting to check distirubtion/security groups, so those will need to be available on the network.

## Configuration
- No configuration should be required on this batch file.
- The script will prompt you to put in any information that is required for the script to check permissions.

## Development notes
- There is no additional software requirements to use this script (other than having the distirubtion/security groups set up in your domain)
- At this point there are no current plans to update this file unless a feature is requested or discovered to be needed (10/20/2021)
