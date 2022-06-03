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


# get all the pdfs in the folder
$files = Get-ChildItem $folder -Filter *.pdf

# iterate through each pdf
foreach ($f in $files){
    $fullpath = $f.FullName

    # create the url/path to the pdf -> for browsers
    $filepath = -join("file:///", $fullpath) | 
                    ForEach-Object { $_ -replace "/", "\" } |   # replace / with \"
                    ForEach-Object { $_ -replace " ", "%20"}    # replace spaces with %20
    
    # open the pdf according to argument provided -> else use edge
    switch($app.ToLower()){
     "chrome" { start chrome $filepath; Break }
     "edge"   { start msedge $filepath; Break }
     "app"    { start $fullpath; Break }
     default  { start msedge $filepath }   
    }
}
