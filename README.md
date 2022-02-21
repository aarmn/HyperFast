# Hyper Fast
<!-- Logo, and Badges go here -->
## What? Why? and For Who?
🚀 Fastest way to Turn Hyper-V family of features On and Off on Windows.
If you are a developer or someone who constantly use, a combination of following tools: WSL2, Docker, HyperV, Windows Sandbox, Intel HAXM, BlueStacks, VMWare, VirtualBox, or any other virtualization and many other non-virtualization tools you possibly encountered minutes and minutes wasted on toggling some checkboxes on and off in windows feature, which either lead you to googling each time, memorizing them, or writing them on a note somewhere, and sometimes the messages are pretty unhelpful (e.g. BlueStack message which told me my HyperV is on while my HypervisorPlatform was on)
So I finally became frustrated, I didn't care anymore and I just wanted a simple toggle switch to make the apps which don't work right now work after a damn restart, and thats what HyperFast is!

## How to Install?
 - Open PowerShell
 - Copy The following Command and Paste it into PowerShell and hit Enter: 

``` Set-Location ~ ; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aarmn/HyperFast/master/Setup.ps1" -OutFile setup.ps1 ; Start-Process powershell.exe -Verb RunAs -ArgumentList ("-noprofile -file `"$env:USERPROFILE\Setup.ps1`" -elevated" -f ($myinvocation.MyCommand.Definition))  ; Set-Location - ```

## License
MIT Public License