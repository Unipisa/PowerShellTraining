$form = new-object System.Windows.Forms

Get-Help Add-Type

#Add-Type -Path 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$form = new-object System.Windows.Forms.Form
$form.Show()
$form.Close()

