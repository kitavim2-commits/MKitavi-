<#
.SYNOPSIS
    This PowerShell command enables Windows’ FIPS-compliant cryptographic mode by configuring the system to use only approved encryption, hashing, and signing algorithms, ensuring compliance with security standards and preventing the use of weak or non-approved cryptography..

.NOTES
    Author          : Mitchel M Kitavi
    LinkedIn        : linkedin.com/in/mike-kitavi-6333aa218/
    GitHub          : 
    Date Created    : 2026-02-20
    Last Modified   : 2026-02-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000230

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000230).ps1 
#>

# Enables FIPS-compliant cryptographic algorithms (STIG: WN11-SO-000230)

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy" `
-Name Enabled -Type DWord -Value 1

# Reboot required for full enforcement
