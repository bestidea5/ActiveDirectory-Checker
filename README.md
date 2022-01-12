# BestIdea5 | PowerShell Active Directory Userchecker
[![made-with-powershell](https://img.shields.io/badge/PowerShell-1f425f?logo=Powershell)](https://microsoft.com/PowerShell)

# Introduction
This script checks the status of users in the domain via SID.

The following files are created: 
- output-users-deleted.txt (These users do not exist in the domain)
- output-users-enabled.txt (These users exist in the domain and are activated)
- output-users-disabled.txt (These users exist in the domain and are deactivated)

Working directory `c:\temp\BestIdea5-ad\`

**Directory:** Directory will be created

**source.txt missing :** A file in this new folder called source.txt is required as the source. In this, the SIDs must be one below the other without a domain.
If the file is missing, an error message appears and the program ends. 

**DISCLAIMER:** Please verify the result for correctness. Of course, I do not take any responsibility in the event of an incorrect result!
