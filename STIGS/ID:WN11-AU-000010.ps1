<#
.SYNOPSIS
    This PowerShell script remediates the Windows 11 security control WN11-AU-000010 by enabling auditing for successful credential validation events.

.NOTES
    Author          : Josh Madakor
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2026-02-19
    Last Modified   : 2024-02-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    It configures the required advanced audit policy setting to ensure authentication activity is logged in the Security event log. The script also verifies the configuration to confirm compliance with the control.
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000010).ps1 
#>

# WN11-AU-000010 Remediation Script
# Enables auditing for Account Logon - Credential Validation (Success)

Write-Host "Remediating WN11-AU-000010..." -ForegroundColor Cyan

# Enable success auditing for Credential Validation
auditpol /set /subcategory:"Credential Validation" /success:enable

# Verify setting
Write-Host "Current audit policy setting:" -ForegroundColor Cyan
auditpol /get /subcategory:"Credential Validation"

<#
This project demonstrates the practical application of security policy enforcement through automation and highlights the importance of audit logging in maintaining system security and supporting incident detection and response activities.
#>
