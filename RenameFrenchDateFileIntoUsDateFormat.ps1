# Define the destination folder
$destinationFolder = Join-Path (Get-Location) "NewFiles"

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

Get-ChildItem -Filter "*.pdf" -File | ForEach-Object {
    $originalName = $_.BaseName
    $dashPart = ""

    # Check if there is a dash followed by a number, and extract that part
    if ($originalName -match '^(.*?)-(\d+)$') {
        $originalName = $matches[1]
        $dashPart = "-" + $matches[2]
    }

    # Ensure that the name matches the expected date structure
    if ($originalName -match '^(\d{2})(\d{2})(\d{4})$') {
        # Build the new file name with the format yearMonthDay
        $newName = $matches[3] + $matches[2] + $matches[1] + $dashPart + $_.Extension
        $newPath = Join-Path $destinationFolder $newName

        # Copy the file to the new folder with the new name
        Copy-Item $_.FullName -Destination $newPath
    }
}
