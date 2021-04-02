$a = "Sono una stringa"
$n = 2

Write-Host "La variable n contiene $n"
Write-Host 'La variable n contiene $n'

Write-Host "Questa è una stringa con espressione $(2+2)"

$s = "Una stringa con HTML

<div id=""ciao""></div>
"

$a = (1, 2, 3, 4)

$a.Add(2) # Non si può fare

$a += 2

foreach ($e in $a) {
    if (($e % 2) -eq 0) {
        Write-Output "Il numero è $e" # >> outfile.txt
    }
}

foreach ($n in 0 .. 100) {
    Write-Host "Installing server base-$n.unipi.it"
}

Get-NetAdapter -Name vEth*

function Get-Pippo ($n) {
    Write-Output "Pippo $n"
}

Get-Pippo -n 2

Get-Disk | select FriendlyName, SerialNumber | Out-GridView

Invoke-WebRequest http://www.unipi.it

Get-NetAdapter

Get-PackageProvider

