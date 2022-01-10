Import-Module ActiveDirectory

$folder = 'c:\temp'
$foname = 'BestIdea5-ad'
$source = 'source.txt'
$output = 'output'

$folder = "$folder\$foname" # combine directory and additional variable for specific directory

clear

if (Test-Path -d -Path $folder) {
    if (Test-Path "$folder\$source" -PathType leaf) {
        $users = Get-Content -Path "$folder\$source" #-TotalCount 20        # Testtry with first 20 lines?
        foreach ($user in $users) {
            $userobj = $(try {Get-ADUser $user} catch {$Null})
            If ($userobj -ne $Null) {
                If ($userobj.enabled -eq "True") {
                        Write-Output "$user" | Out-File "$folder\$output-users-enabled.txt" -Append #User enabled!
                } else {
                Write-Output "$user" | Out-File "$folder\$output-users-disabled.txt" -Append #User disabled
                }
            } else {
            Write-Output "$user" | Out-File "$folder\$output-users-deleted.txt" -Append #User not available
            }
        }
    } else {
        Write-Host "File ($source) does not in directory ($folder\) exist!" -ForegroundColor Red
        Write-Host "Please create this file and add one SID per line" -ForegroundColor Gray
        Break
    }
    Write-Host "Done!" -ForegroundColor Green
} else {
    New-Item $folder -ItemType directory # create specific directory
}