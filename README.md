# Directory Organizer

> Note: This Script does not follow the requirements given by the task, but I left it as it is cuz it's cool

## Overview

This project consists of a Bash script that organizes files into directories based on their file extensions. It includes functions defined in an external script (`Functions_Task_A.sh`) to perform the necessary operations. The main script takes a folder path as an argument, creates directories within that path based on file extensions, sorts files into these directories, and then outputs the directory structure using the `tree` command.

## Scripts

1. **Main Script**
   - This script takes a folder path as an argument and processes the files within that folder.
   - It includes functions from the `Functions_Task_A.sh` script to perform the directory creation and sorting.

2. **Functions Script (`Functions_Task_A.sh`)**
   - Contains the functions `CreateDirectories` and `SortIntoDirectories` used by the main script.

### Functions

- **CreateDirectories**
  - Creates directories based on the file extensions of the files in the provided folder path.
  - Skips directories, hidden files, and files without extensions.

- **SortIntoDirectories**
  - Sorts files into the directories created by `CreateDirectories`.
  - Moves files to the corresponding directories based on their extensions.
  - Moves files without extensions and hidden files to a `Misc` directory.

## Prerequisites

- Ensure you have Bash installed on your system.
- Make sure the `tree` command is installed. You can install it using your package manager:
  - For Debian/Ubuntu: `sudo apt-get install tree`
  - For Red Hat/CentOS: `sudo yum install tree`
  - For macOS: `brew install tree`

## Usage

1. **Clone the repository** to your local machine.
   ```bash
   git clone https://github.com/OmarElmelegy/File_Organizer.git
   cd <repository-directory>
   ```

2. **Ensure the `Functions_Task_A.sh` script is in the same directory** as the main script.

3. **Make the main script executable**:
   ```bash
   chmod +x Task_A.sh
   ```

4. **Run the main script** with the folder path as an argument:
   ```bash
   ./Task_A.sh /path/to/folder
   ```

## Options

- **Folder Path**: The path to the folder you want to organize. This is a required argument.
  - Example: `/home/user/documents`

## Example

```bash
./Task_A.sh /home/user/documents
```

This will organize the files in the `/home/user/documents` directory, create directories as needed, sort the files into these directories, and then display the directory structure.

## Output

The script outputs the directory structure of the provided folder path using the `tree` command, which shows the hierarchy of files and directories.

## Error Handling

- If no folder path is provided, the script will exit with a message: `No Input FilePath, Exiting Script`.
- If the provided folder path does not exist, the script will exit with a message: `Path does not exist..`.

## Notes

- Make sure to provide the absolute or relative path to the folder you want to organize.
- The `CreateDirectories` function will create a directory for each unique file extension found in the provided folder path.
- The `SortIntoDirectories` function will move files to the corresponding directories based on their extensions. Files without extensions and hidden files will be moved to a `Misc` directory.

---