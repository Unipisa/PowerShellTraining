$cred = Get-Credential

$cred.Password | ConvertFrom-SecureString

$uid = "cisterni"
$pwd = "01000000d08c9ddf0115d1118c7a00c04fc297eb01000000a86054ad19c7eb4b8bdc9f3bf1b6ae82000000000200000000001066000000010000200000000b14aa07c18822ead9fb7a7561867bb29d57257bc7213b72f70a20dd1ccce76f000000000e8000000002000020000000d430fd170af52543fb8a2e5b8b27228527a8c2fd90907d400bffb6bc21430e9220000000477c38513c72a81728c1d47497a61de30fd91f6706542c2628fd7b4256ff0e3d4000000027fa718b2616eb5461c86d7dac5bf95d389f06efe828bffdecfd49205c7a650b84390c139f89bc30bc91368b36c78f4ce5734e0dcf672a6dee1a2c6fa80af27f"

$spwd = ConvertTo-SecureString $pwd

$clearpwd = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($spwd))

$cred = New-Object System.Management.Automation.PSCredential ($uid, $spwd)

$d = Get-Date

[System.DateTime]::Now.AddDays(1).ToString("yyyy-MM-dd")