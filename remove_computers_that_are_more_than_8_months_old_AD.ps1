<#
.SYNOPSIS
This script will remove computers that are more than 8 months old from AD. 

.NOTES  
Created by Beth Longe
LastDateUpdated: 2019-07-11
    
Description:
computers that get deleted with be added to a text file in C:\Reports


#>

# ToDo - delete from wsus and sccm
#TODO make it harder for someone to accidently delete the minus sign
$days = -270

$cutoff = (Get-Date).AddDays($days)

$filter = "LastLogonDate -lt '$cutoff'"

Get-ADComputer -Filter $filter -Properties * | select name | out-file C:\Reports\deleted_computers_from_remove_adcomputer_script.txt

Get-ADComputer -Filter $filter | Remove-ADObject -Recursive -Confirm:$false
