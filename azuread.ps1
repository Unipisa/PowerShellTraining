#Install-Module AzureAD

Import-Module AzureAD

Connect-AzureAD

Get-Command | More

Get-Module

Get-Service

function HelloWorld ($hw, $hw2) {
    Write-Output "Hello world $hw $hw2"
}

function Get-MrParameterCount {
    param (
        [string[]]$ParameterName
    )

    foreach ($Parameter in $ParameterName) {
        $Results = Get-Command -ParameterName $Parameter -ErrorAction SilentlyContinue

        [pscustomobject]@{
            ParameterName = $Parameter
            NumberOfCmdlets = $Results.Count
        }
    }
}

function Test-MrCmdletBinding {

    [CmdletBinding()] #<<-- This turns a regular function into an advanced function
    param (
        $ComputerName
    )

    Write-Output $ComputerName

}

function Test-MrSupportsShouldProcess {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        $ComputerName
    )

    Write-Output $ComputerName

}


function Test-MrParameterValidation {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$ComputerName
    )

    Write-Output $ComputerName

}

function Test-MrPipelineInput {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline)]
        [string[]]$ComputerName
    )

    PROCESS {
        Write-Output $ComputerName
    }

}

Test-MrParameterValidation

1 .. 8 | Test-MrPipelineInput 


function Test-MrErrorHandling {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [string[]]$ComputerName=@("Ciao")
    )

    PROCESS {
        foreach ($Computer in $ComputerName) {
            try {
                Test-WSMan -ComputerName $Computer
            }
            catch {
                Write-Warning -Message "Unable to connect to Computer: $Computer"
            }
        }
    }

}

function Get-MrAutoStoppedService {

    <#
    .SYNOPSIS
        Returns a list of services that are set to start automatically, are not
        currently running, excluding the services that are set to delayed start.
    
    .DESCRIPTION
        Get-MrAutoStoppedService is a function that returns a list of services from
        the specified remote computer(s) that are set to start automatically, are not
        currently running, and it excludes the services that are set to start automatically
        with a delayed startup.
    
    .PARAMETER ComputerName
        The remote computer(s) to check the status of the services on.
    
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default
        is the current user.
    
    .EXAMPLE
         Get-MrAutoStoppedService -ComputerName 'Server1', 'Server2'
    
    .EXAMPLE
         'Server1', 'Server2' | Get-MrAutoStoppedService
    
    .EXAMPLE
         Get-MrAutoStoppedService -ComputerName 'Server1' -Credential (Get-Credential)
    
    .INPUTS
        String
    
    .OUTPUTS
        PSCustomObject
    
    .NOTES
        Author:  Mike F Robbins
        Website: http://mikefrobbins.com
        Twitter: @mikefrobbins
    #>
    
        [CmdletBinding()]
        param (
    
        )
    
        #Function Body
    
    }

Get-Help Get-MrAutoStoppedService

function Test-NotExOBox ($uid) {
    ($exobox | where { $_.uid -eq $uid }).Count -eq 0
}
