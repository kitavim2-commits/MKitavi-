<#
.SYNOPSIS
    This PowerShell script disables Basic authentication for the Windows Remote Management (WinRM) service by enforcing a registry policy and updating the WinRM configuration to prevent  insecure credential exposure and enforce secure remote administration.

.NOTES
    Author          : Mitchel M Kitavi
    LinkedIn        : linkedin.com/in/mike-kitavi-6333aa218/
    GitHub          : github.com/kitavim2-commits/MKitavi
    Date Created    : 2026-02-20
    Last Modified   : 2026-02-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    WinRM will no longer accept Basic authentication
    Only secure methods (Kerberos, NTLM, Certificate) will be allowed
    System becomes compliant with WN11-CC-000345
    
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000345).ps1 
#>

# Create WinRM policy path if it does not exist
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Force | Out-Null

# Disable Basic authentication via policy
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" `
-Name "AllowBasic" -Type DWord -Value 0

# Apply WinRM auth configuration immediately
winrm set winrm/config/service/auth '@{Basic="false"}'

# Ensure WinRM service is enabled and running
Set-Service -Name WinRM -StartupType Automatic
Start-Service WinRM
