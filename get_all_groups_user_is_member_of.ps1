#Get-ADPrincipalGroupMembership LRH1027 | select name
get-adgroup -Filter "name -like '*athletics*'" | select name