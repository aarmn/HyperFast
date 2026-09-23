Install-Module ps12exe
mkdir out
ps12exe -inputFile ".\Setup.ps1" -outputFile ".\out\Setup.exe"
ps12exe -inputFile ".\HyperFast.ps1" -outputFile ".\out\HyperFast.exe"