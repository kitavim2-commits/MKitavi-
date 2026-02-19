<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Mitchel M Kitavi
    LinkedIn        : linkedin.com/in/mike-kitavi-6333aa218/
    GitHub          : github.com/kitavim2-commits/MKitavi-
    Date Created    : 2026-02-17
    Last Modified   : 2026-02-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE

# Ensure the registry path exists
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Force | Out-Null

# Set MaxSize to 0x8000 (32768 KB)
New-ItemProperty `
  -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" `
  -Name "MaxSize" `
  -PropertyType DWord `
  -Value 0x8000 `
  -Force
