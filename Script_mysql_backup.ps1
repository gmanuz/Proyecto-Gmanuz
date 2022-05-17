     # MySQL Directory
    $mysql_dir = "C:\Program Files\MySQL\MySQL Server 8.0\bin"

# Backup storage directory 
    $existe = Test-Path -Path "$env:SystemDrive\MySQL-backups"

    if ($existe -eq "True" )
        {
         echo "" 
        }
    else 
        {
        New-Item "$env:SystemDrive\MySQL-backups" -ItemType Directory
        }

    $backupfolder = "$env:SystemDrive\MySQL-backups\"

# MySQL user
    $user = "snc"

# MySQL password
    $password = "snc123!"

# Backup date
    $date = Get-Date
    $timestamp = "" + $date.Year + $date.Month + $date.Day + "_" + $date.Hour + $date.Minute

# File logs
    $errorLog = "error_dump.log"

# Number of days to store the backup
    [int]$keep_day = 5
    
# Backup name
    $backupfile = New-Item "$env:SystemDrive\MySQL-backups\backup_$timestamp.sql" -ItemType File

# Create backup
    cd $mysql_dir
    .\mysqldump.exe --host=localhost --hex-blob=TRUE --port=3306  --user=$user --password=$password --force=TRUE  --protocol=tcp --default-character-set=utf8 --single-transaction=TRUE --all-databases --result-file=$backupfile

# Compress backup .zip
    Get-ChildItem $backupfile | Compress-Archive -DestinationPath $env:SystemDrive\MySQL-backups\backup_$timestamp.zip -CompressionLevel Optimal

# Delete old backups, 5 days
    Get-ChildItem C:\MySQL-backups\*.zip -Recurse | Where-Object {$_.CreationTime -lt ($(Get-Date).AddDays(-$keep_day))} | ForEach-Object { Remove-Item $_.FullName}

# Remove .sql
    Remove-Item -Path $backupfile 
