<#
.SYNOPSIS
    This PowerShell script configures the system to use only strong Kerberos encryption by disabling weak DES and RC4 algorithms and enforcing AES-based cryptography for domain authentication.

.NOTES
    Author          : Mitchel M Kitavi
    LinkedIn        : linkedin.com/in/mike-kitavi-6333aa218/
    GitHub          : github.com/kitavim2-commits/MKitavi-
    Date Created    : 2026-02-19
    Last Modified   : 2026-02-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000190

.TESTED ON
    Date(s) Tested  : 2026-02-19
    Tested By       : Mitchel Kitavi
    Systems Tested  : 64-bit operating system, x64-based processor
    PowerShell Ver. : 5.1.26100.7705

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000190).ps1 
#>

# YOUR CODE GOES HERE# STIG: WN11-SO-000190
# Disables weak Kerberos encryption (DES and RC4) and enforces AES only

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters"

New-Item -Path $regPath -Force | Out-Null

New-ItemProperty -Path $regPath `
  -Name "SupportedEncryptionTypes" `
  -PropertyType DWord `
  -Value 24 `
  -Force

#Reboot Required

Restart-Computer

#Verification (after reboot)

Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters" |
Select-Object SupportedEncryptionTypes
