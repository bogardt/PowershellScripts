Get-ChildItem -Filter *.pdf | ForEach-Object {
    $originalName = $_.BaseName
    $extension = $_.Extension
    $dashPart = ""

    # Vérifie s'il y a un tiret suivi d'un chiffre, et extrait cette partie
    if ($originalName -match '(.+)-(\d+)$') {
        $originalName = $matches[1]
        $dashPart = "-" + $matches[2]
    }

    # Assure que le nom correspond à la structure de date attendue
    if ($originalName -match '(\d{2})(\d{2})(\d{4})') {
        $newName = $matches[3] + $matches[2] + $matches[1] + $dashPart + $extension
        $newPath = Join-Path $_.Directory $newName

        # Renomme le fichier si le nouveau nom est différent de l'original
        if ($_.FullName -ne $newPath) {
            Rename-Item $_.FullName -NewName $newName
        }
    }
}
