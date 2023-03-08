# Hyper Fast
<!-- 

TODO: Logo, and Badges go here 
TODO: progressbar don't work
TODO: check hash of files
TODO: better names
TODO: Reinstall problem
TODO: OneLiner Self Destruct, and other stuffs

# Set-Location ~ ; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aarmn/HyperFast/master/Setup.ps1" -OutFile setup.ps1 ; Start-Process powershell.exe -Verb RunAs -ArgumentList (" -file `"$env:USERPROFILE\Setup.ps1`" -elevated" -f ($myinvocation.MyCommand.Definition)) ; Remove-Item "$env:USERPROFILE\Setup.ps1" ; Set-Location -

# set-ExecutionPolicy RemoteSigned -Scope CurrentUser ; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aarmn/HyperFast/master/Setup.ps1" -OutFile "$env:USERPROFILE\Setup.ps1" ; Start-Process powershell.exe -Verb RunAs -ArgumentList ("-noprofile -file `"$env:USERPROFILE\Setup.ps1`" -elevated" -f ($myinvocation.MyCommand.Definition))

-->
![Logo of HyperFast](https://raw.githubusercontent.com/aarmn/HyperFast/master/icon/hyperfast-bg.png)
![PowerShell Badge](https://img.shields.io/badge/PowerShell-00AFEF?style=for-the-badge&logo=powershell&logoColor=white)
## What? Why? And for Who?
🚀 The fastest way to turn Hyper-V family of features on and off in Microsoft Windows.
If you are a developer or someone who constantly use a combination of following tools: WSL2, Docker, HyperV, Windows Sandbox, Intel HAXM, BlueStacks, VMWare, VirtualBox, or any other virtualization and many other non-virtualization tools you possibly encountered minutes and minutes wasted on toggling some checkboxes on and off in windows features, which either lead you to googling each time, memorizing them, or writing them on a note somewhere, and sometimes the messages are pretty unhelpful (e.g. BlueStack message which told me my HyperV is on while my HypervisorPlatform was on)
So I finally became frustrated, I didn't care anymore and I just wanted a simple toggle switch to make the apps which don't work right now work after a damn restart, and thats what HyperFast is! (if at first run it didn't work first-time, run it twice and try that app again (the app which needs HyperV (and bros) be off/on), if still didn't work, open an issue here)

## How to Install?
  - Download latest release from [Github](https://github.com/aarmn/HyperFast/releases/latest)
  - Run it and accept Admin access (Its for StartMenu shortcut)
  - Follow the Setup! (You can just press enter)
## License
MIT Public License
