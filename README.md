# Hyper Fast
<!-- TODO: Logo, and Badges go here -->
## What? Why? And for Who?
🚀 The fastest way to turn Hyper-V family of features on and off in Microsoft Windows.
If you are a developer or someone who constantly use a combination of following tools: WSL2, Docker, HyperV, Windows Sandbox, Intel HAXM, BlueStacks, VMWare, VirtualBox, or any other virtualization and many other non-virtualization tools you possibly encountered minutes and minutes wasted on toggling some checkboxes on and off in windows feature, which either lead you to googling each time, memorizing them, or writing them on a note somewhere, and sometimes the messages are pretty unhelpful (e.g. BlueStack message which told me my HyperV is on while my HypervisorPlatform was on)
So I finally became frustrated, I didn't care anymore and I just wanted a simple toggle switch to make the apps which don't work right now work after a damn restart, and thats what HyperFast is!

## How to Install?
#### Easy Way
 - Open PowerShell
 - Copy The following Command and Paste it into PowerShell and hit Enter: 

``` Set-Location ~ ; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aarmn/HyperFast/master/Setup.ps1" -OutFile setup.ps1 ; Start-Process powershell.exe -Verb RunAs -ArgumentList ("-noprofile -file `"$env:USERPROFILE\Setup.ps1`" -elevated" -f ($myinvocation.MyCommand.Definition)) ; Remove-Item "$env:USERPROFILE\Setup.ps1" ; Set-Location -```

#### Medium Way
 - Download Setup file
 - Run Setup file
 - Attention: In case of antivirus false positive (more on that (here)[https://github.com/MScholtes/PS2EXE#attention-incorrect-virus-detection]) disable antivirus and re-enable it, this way perk is you dont need to 

#### Hard Way
 - Download Repository

## License
MIT Public License