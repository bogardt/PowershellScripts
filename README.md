# PowershellScripts

## 1. ListFolderSizeRecursively.ps1

### Synopsis
This script lists the size of all folders in the current directory and its subdirectories.

### Description
The script iterates over each folder in the current directory and its subdirectories. For each folder, it calculates the total size by summing up the sizes of all files in that folder and its subdirectories. The sizes are then outputted to the console.

### Parameters
None

### Example
```powershell
.\ListFolderSizeRecursively.ps1
```

## 2. RenameFrenchDateFileIntoUsDateFormat.ps1

### Synopsis
This script renames PDF files in the current directory from French date format to US date format.

### Description
The script first creates a new directory named "NewFiles" in the current location if it doesn't exist. Then, it iterates over each PDF file in the current directory. For each file, it extracts the base name and checks if it matches a specific pattern. If the base name matches the pattern, it is split into different parts. The script then checks if the original name matches the French date format (DDMMYYYY). If it does, the script renames the file to the US date format (YYYYMMDD), appends any additional parts that were split off earlier, and copies the renamed file to the "NewFiles" directory.

### Parameters
None

### Example
```powershell
.\RenameFrenchDateFileIntoUsDateFormat.ps1
```

