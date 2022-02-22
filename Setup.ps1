<#
.SYNOPSIS
     HyperFast Settup
.DESCRIPTION
     Install HyperFast from its Github repo onto your computer, and Uninstall it
.NOTES
     Author: AARMN The LIMITLESS
     Contact: aarmn80@gmail.com
     Date published: 21-2-2022
     Current version: 1.2
.LINK
     https://github.com/aarmn/hyperfast
#>

# Repititve Info

# Set-Location ~ ; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aarmn/HyperFast/master/Setup.ps1" -OutFile setup.ps1 ; Start-Process powershell.exe -Verb RunAs -ArgumentList (" -file `"$env:USERPROFILE\Setup.ps1`" -elevated" -f ($myinvocation.MyCommand.Definition)) ; Remove-Item "$env:USERPROFILE\Setup.ps1" ; Set-Location -
# set-ExecutionPolicy RemoteSigned -Scope CurrentUser ; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aarmn/HyperFast/master/Setup.ps1" -OutFile "$env:USERPROFILE\Setup.ps1" ; Start-Process powershell.exe -Verb RunAs -ArgumentList ("-noprofile -file `"$env:USERPROFILE\Setup.ps1`" -elevated" -f ($myinvocation.MyCommand.Definition))

# TODO: check windows
# TODO: check hash of files
# TODO: better names
# TODO: uninstall setup and log in home as well
# TODO: Reinstall Uninstall problem
# TODO: OneLiner Self Destruct, and other stuffs
# TODO: Ask startmenu elevation // Ask where is the path of elevation and if sth dont elevate or run dl code
# TODO: PS2EXE

Write-Output "" > hyperfast.log

# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
        if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
                $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
                Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
                Exit
        }
        $host.ui.WriteLine("Windows is outdated, please update to Windows 10 or newer for a better experience!")
        Exit 1
}

Function Create-Shortcut-HyperFast ($sourcePath, $shortcutPath, $GUIMode) {
        $shell = New-Object -ComObject WScript.Shell
        $shortcut = $shell.CreateShortcut($shortcutPath)
        $shortcut.TargetPath = "$SourcePath"
        $shortcut.IconLocation = "$SourcePath"
        $shortcut.WindowStyle = 3
        $shortcut.Arguments = "$GUIMode" # dollar
        $shortcut.Save()

        $lnkBytes = [System.IO.File]::ReadAllBytes($shortcutPath)
        $lnkBytes[21] = 34
        [System.IO.File]::WriteAllBytes($shortcutPath, $lnkBytes)
}

Function Ask-Shortcut-HyperFast($question) {
        $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Add the asked Shortcut"
        $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Do Not add the asked Shortcut"
        $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
        $action = $host.ui.PromptForChoice("Make Shortcut", "Make a shortcut on $($question) ?", $options, 0) # dollar
        if ($action -eq 0) { return $True } else { return $False }
}
Function Uninstall-HyperFast () {
        $host.ui.WriteLine("Uninstalling HyperFast...")
        Remove-Item -Force -Recurse $psfolderpath, $desktoplink, $startmenulink 2>> hyperfast.log
        $host.ui.WriteLine("HyperFast removed successfully!")
}
Function Install-HyperFast () {
        $host.ui.WriteLine("Installing HyperFast...")
        if (!($psf_exist)) {
                New-Item $psfolderpath -itemtype Directory
        }
        if (!($pss_exist)) {
                Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aarmn/HyperFast/master/out/HyperFast.exe" -OutFile $psscriptpath 2>> hyperfast.log
                $success = $?
                If (!($success)) {
                        $host.ui.WriteLine("Couldn't download the file. Check the Internet connection")
                        Exit 1
                }
        }
        if ( (!($sml_exist)) -or (!($dl_exist)) ) {
                $GUIModeIndex = $host.ui.PromptForChoice(
                        "Run Mode",
                        "Should this script verify things in GUI or Terminal?", 
                        [System.Management.Automation.Host.ChoiceDescription[]](
                                (New-Object System.Management.Automation.Host.ChoiceDescription "&GUI", "Run in GUI Mode"),
                                (New-Object System.Management.Automation.Host.ChoiceDescription "&TUI", "Run in TUI Mode")
                        ),
                        0)
                if ($GUIModeIndex -eq 0) { $GUIMode = " -GUIMode" } else { $GUIMode = "" }
                if (!($dl_exist)) {
                        if (Ask-Shortcut-HyperFast "Desktop") {
                                Create-Shortcut-HyperFast $psscriptpath $desktoplink $GUIMode
                        }
                }
                If (!($sml_exist)) {
                        if ( Ask-Shortcut-HyperFast "Start Menu") {
                                Create-Shortcut-HyperFast $psscriptpath $startmenulink $GUIMode
                        }
                }
        }
        $host.ui.WriteLine("HyperFast installed successfully!")
}

$psfolderpath = "$((Get-Childitem Env:LOCALAPPDATA).Value)\HyperFast"
$psscriptpath = "$((Get-Childitem Env:LOCALAPPDATA).Value)\HyperFast\HyperFast.exe"
$desktoplink = "$((Get-Childitem Env:USERPROFILE).Value)\Desktop\HyperFast On-Off.lnk"
$startmenulink = "$((Get-Childitem Env:USERPROFILE).Value)\Start Menu\HyperFast On-Off.lnk"

$psf_exist = Test-Path -Path $psfolderpath -PathType Container
$pss_exist = Test-Path -Path $psscriptpath -PathType Leaf
$dl_exist = Test-Path -Path $desktoplink -PathType Leaf
$sml_exist = Test-Path -Path $startmenulink -PathType Leaf

$install = New-Object System.Management.Automation.Host.ChoiceDescription "&Install", "Install the tool (Download the most recent version)"
$uninstall = New-Object System.Management.Automation.Host.ChoiceDescription "&Uninstall", "Uninstall the tool"
$reinstall = New-Object System.Management.Automation.Host.ChoiceDescription "&Reinstall", "Uninstall and then Install it again (Download the most recent version)"
$cancel = New-Object System.Management.Automation.Host.ChoiceDescription "&Exit", "Won't change anything and exit"

If (($pss_exist) -or ($dl_exist) -or ($sml_exist)) {
        $options = [System.Management.Automation.Host.ChoiceDescription[]]($reinstall, $uninstall, $cancel)
} 
Else {
        $options = [System.Management.Automation.Host.ChoiceDescription[]]($install, $cancel)
}

$actionIndex = $host.ui.PromptForChoice(
        "HyperFast Setup",
        "Welcome to HyperFast Setup, What do you want to do?",
        $options,
        0
)
$action = $options[$actionIndex].Label
$host.ui.WriteLine("You chose $action")

Switch ($action) {
        "&Install" { 
                Install-HyperFast
        }
        "&Uninstall" { 
                Uninstall-HyperFast
        }
        "&Reinstall" { 
                $host.ui.WriteLine("Reinstalling HyperFast...")
                Uninstall-HyperFast
                Start-Sleep 3
                Install-HyperFast
        }
        Default { 
                Exit
        }
}
Start-Sleep 3
Exit