<#
.SYNOPSIS
    This PowerShell script configures Hardened UNC Paths for the SYSVOL and NETLOGON shares by enforcing mutual authentication and integrity checking, preventing tampering or spoofing of Group Policy and logon script traffic.

.NOTES
    Author          : Mitchel M Kitavi
    LinkedIn        : linkedin.com/in/mike-kitavi-6333aa218/
    GitHub          : github.com/kitavim2-commits/MKitavi-
    Date Created    : 2026-02-19
    Last Modified   : 2026-02-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000050

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000050).ps1 
#>

# Create Hardened UNC Paths registry key if it does not exist
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Force | Out-Null

# Configure SYSVOL share to require mutual authentication and integrity
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" `
-Name "\\*\SYSVOL" -Type String -Value "RequireMutualAuthentication=1,RequireIntegrity=1"

# Configure NETLOGON share to require mutual authentication and integrity
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" `
-Name "\\*\NETLOGON" -Type String -Value "RequireMutualAuthentication=1,RequireIntegrity=1"

# Force Group Policy update
gpupdate /force
