# pdf-opener

This script will allow you to open multiple pdf simultaneously with
1 command. You don't need to click each pdf manually anymore.

<br />

Currently this supports opening of pdfs in the following apps

- microsoft edge (default)
- chrome
- default app: usually people use adobe, however it will use your system default

<br />

## How to use the paramters

```ps1

.\pdfopener.exe -folder folderPath -app chrome/edge/app
-folder default: .\
-app    default: edge
```

Optionally you could just run the executable by clicking on it, it will use the fedault values

<br />

## Build command

```ps1
Install-Module ps2exe

## Use the full command name
Invoke-ps2exe .\pdfopener.ps1 .\out\pdfopener.exe

## Use the alias
ps2exe .\pdfopener.ps1 .\out\pdfopener.exe
```
