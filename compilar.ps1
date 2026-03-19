# Script de compilació ràpida
# Ús: .\compilar.ps1

$pandoc = "C:\Users\adria\AppData\Local\Microsoft\WinGet\Packages\JohnMacFarlane.Pandoc_Microsoft.Winget.Source_8wekyb3d8bbwe\pandoc-3.9\pandoc.exe"
$pdflatex = "C:\Users\adria\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe"

Write-Host "Compilant exemple.md -> out\exemple.pdf ..."
& $pandoc src\exemple.md -o out\exemple.pdf --pdf-engine=$pdflatex
Write-Host "Fet! PDF a: out\exemple.pdf"
