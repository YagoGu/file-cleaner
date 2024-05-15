$DirectoryFilePath="C:\Users\Administrator\Desktop\Projects\file-cleaner\FileDirectories.csv"

$DirectoryList=Import-Csv -Path $DirectoryFilePath

foreach ($Directory in $DirectoryList) {
    Get-ChildItem -Path $Directory.DirectoryPath -Filter "*$($Directory.FileName)*" `
    <#on the second line of pepline we are checking if actual day minus days we say on csv it will exists
    are less tham tje ;as las time it was modified
    #>
    | Where-Object LastWriteTime -lt $(Get-Date).AddDays(-$Directory.KeepForDays) `
    <#FileName let you filter by some word inside the name of the file#>
    | Remove-Item -Confirm:$false -Force -WhatIf
    <#You will need to take off -WhatIf to let it works if not it's just a test#>
}