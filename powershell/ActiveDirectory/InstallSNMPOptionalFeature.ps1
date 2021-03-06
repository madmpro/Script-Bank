﻿$strFileName="C:\Users\snmpinstalled.txt"
$snmpcheck = (Get-WindowsOptionalFeature -FeatureName SNMP -online).state

If (Test-Path $strFileName) {
    #// If File Exists get out
    break
    }Else{
    #// Run snmp check and enable
    If ($snmpcheck -eq "Disabled" -Or "DisablePending"){
        enable-WindowsOptionalFeature -Online -FeatureName "snmp" -NoRestart
        enable-WindowsOptionalFeature -Online -FeatureName "WMISnmpProvider" -NoRestart
        }Else{
            "SNMP Is already installed."
            }
    #Create file if it doesn't exist.
    New-Item C:\Users\snmpinstalled.txt -ItemType file
}




