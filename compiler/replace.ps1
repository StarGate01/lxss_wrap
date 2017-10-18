param([string]$path)
(Get-Content main.cpp).replace('FULLPATH', $path) | Write-Host