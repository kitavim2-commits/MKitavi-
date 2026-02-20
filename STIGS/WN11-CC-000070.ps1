<#
.SYNOPSIS
    This STIG requires Windows 11 to enable Virtualization-Based Security (VBS) to protect critical operating system components using hardware-assisted isolation.

.NOTES
    Author          : Mitchel M Kitavi
    LinkedIn        : linkedin.com/in/mike-kitavi-6333aa218/
    GitHub          : github.com/kitavim2-commits/MKitavi-
    Date Created    : 2026-02-18
    Last Modified   : 2024-02-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000070).ps1 
#>

# STIG: WN11-CC-000070
# Enables Virtualization-Based Security and requires Secure Boot -Secure Boot and DMA Protection

New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Force | Out-Null

New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" `
  -Name "EnableVirtualizationBasedSecurity" -PropertyType DWord -Value 1 -Force

New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" `
  -Name "RequirePlatformSecurityFeatures" -PropertyType DWord -Value 1 -Force

Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" |
Select-Object EnableVirtualizationBasedSecurity, RequirePlatformSecurityFeatures

<#
This STIG requires Windows 11 to enable Virtualization-Based Security (VBS) to protect critical operating system components using   hardware-assisted isolation. By leveraging the system’s hypervisor and Secure Boot (or Secure Boot with DMA Protection), VBS separates sensitive kernel and credential processes from the rest of the operating system, reducing the risk of credential theft, kernel tampering, and advanced malware persistence. Enforcing this control significantly strengthens platform integrity by ensuring that only trusted, validated code executes in protected memory regions, thereby mitigating attacks that rely on privilege escalation or direct kernel access.
#>
