<#
.SYNOPSIS
    .

.DESCRIPTION
    This command will open all the pdfs in a directory
    
.PARAMETER folder
    The path to the folder which contains the pdf files you wish to open

.PARAMETER app
    Available options: chrome, edge, app
              default: edge
              app = uses default app to open pdf
#>

param (
    [string]
    [Alias("f")]
    $folder = "./",

    [string]
    [Alias("a")]
    $app="edge"
)

$folder = Resolve-Path -Path $folder

# $folder = Resolve-Path -Path $args[0]
# $app = "$args[1]" -or "edge"
# Write-Host $app
# Write-Host $folder

$files = Get-ChildItem $folder -Filter *.pdf

foreach ($f in $files){
    $fullpath = $f.FullName
    $filepath = -join("file:///", $fullpath) | 
                    ForEach-Object { $_ -replace "/", "\" } | 
                    ForEach-Object { $_ -replace " ", "%20"}
    switch($app.ToLower()){
     "chrome" { start chrome $filepath; Break }
     "edge"   { start msedge $filepath; Break }
     "app"    { start $fullpath; Break }
     default  { start msedge $filepath }   
    }
}
