Import-Module ActiveDirectory

$folder = 'c:\temp'
$foname = 'BestIdea5-ad'
$source = 'source.txt'
$output = 'output'

$folder = "$folder\$foname" # combine folder and additional variable for specific directory


if (Test-Path -d -Path $folder) {
    $users = Get-Content -Path "$folder\$source" -TotalCount 20
    foreach ($user in $users) {
        $userobj = $(try {Get-ADUser $user} catch {$Null})
        If ($userobj -ne $Null) {
            If ($userobj.enabled -eq "True")
                {
                    Write-Output "$user" | Out-File "$folder\$output-users-enabled.txt" -Append #User enabled!
                } else {
            Write-Output "$user" | Out-File "$folder\$output-users-disabled.txt" -Append #User disabled
            }
        } else {
    Write-Output "$user" | Out-File "$folder\$output-users-deleted.txt" -Append #User not available
    }}
    
} else {
    New-Item $folder -ItemType directory # create specific directory
}