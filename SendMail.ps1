#Install-Package Send-MailKitMessage

$cred = Get-Credential

function Test-EmailSyntax ($email) {
    Process {
        $email -imatch ".+?@[\w-]+(\.[\w-]+)*\.(it|com|eu|org|net)"
    }
}

$subj = "Subj"

$body = "<b>Testo</b>"


$count = 0
ls .\pdf | ForEach-Object -Process {
    $count++
    $to = $_.BaseName
    $fn = $_.FullName
    $fname = $_.Name
    Write-Host "$($count): Sending message to $to file $fname"
    Send-MailKitMessage -From no-reply-ICT@crui.it -BCCList no-reply-ICT@crui.it -RecipientList $to -SMTPServer smtp.office365.com -Port 25 -UseSecureConnectionIfAvailable -Subject $subj -HTMLBody $body -Credential $cred -AttachmentList $fn
    sleep 20
}


