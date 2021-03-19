#Install-Module MicrosoftTeams

Import-Module MicrosoftTeams

Connect-MicrosoftTeams

$myteams = Get-Team -User a010223@unipi.it 

$dict = @{ a="Ciao"; b=2 }

$dict.Add("ab", 3)

$myteams | Out-String

$idx = @{}

foreach ($t in $myteams) {
    $v = $t.Visibility
    if (-not ($idx.ContainsKey($v))) {
        $idx[$v] = @($t)
    } else {
        $idx[$v] +=  $t
    }
}

$idx.Keys | Foreach-Object -Process { 
    new-object PSCustomObject -Property @{
        Count= ($idx[$_] | measure).Count
        Name=$_
        Group=$idx[$_]
    }  
}

$myteams | Export-Csv pippo.csv -Delimiter ';'

$myteams[0].GetType()

$h = Import-Csv -Delimiter ';' pippo.csv

$h[0].GetType()

$o = new-object PSCustomObject -Property @{
    Name = "A"
    KK = "B"
}

$code = { Invoke-WebRequest https://www.unipi.it }

$myteams | where { $_.Visibility -eq 'Private' }

$myteams | Group-Object Visibility

