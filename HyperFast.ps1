<#
.SYNOPSIS
 	Hyper-V Based Technologies Enabler/Disabler
.DESCRIPTION
 	Enable and Disable Hyper-V Based Features like Docker, Kubernate, WSL2, Windows Sandbox, WindowsPhone Emulation and when disabled, enable Feaatures like BlueStacks, VMWare, Qemu HAXM Engine, VirtualBox
.NOTES
 	Author: AARMN The LIMITLESS
	Contact: aarmn80@gmail.com
 	Date published: 10-5-2021
	Current version: 1.0
.LINK
	https://www.limitless.page
.EXAMPLE
	HyperFast.ps1
#>

Write-Host "\n\n\n\n\n\n\n\n\n\n"

$QuestionRunMode = 1 # <<< Change This If you want a CLI prompt instead of a MsgBox [1:MsgBox 0:CLI]

$WindowsFeatures = @('Containers','Containers-DisposableClientVM','VirtualMachinePlatform','HypervisorPlatform','Microsoft-Hyper-V-Tools-All','Microsoft-Hyper-V-All','Microsoft-Hyper-V-Management-Clients','Microsoft-Hyper-V-Services','Microsoft-Hyper-V-Hypervisor','Microsoft-Hyper-V-Management-PowerShell')
$FailedFeatures = @('Some Features Failed to get Enabled/Disabled, including: ')

try {
	$WindowsFeatureState = (Get-WindowsOptionalFeature -FeatureName 'VirtualMachinePlatform' -Online).State
}
catch {
	Write-Error "Failed to get the state of VirtualMachinePlatform Windows Feature as Scale Feature"
	exit
}

Foreach ($WindowsFeature in $WindowsFeatures) {
	try {
		if($WindowsFeatureState -eq 'Enabled') {
			Disable-WindowsOptionalFeature -FeatureName $WindowsFeature -Online -NoRestart -ErrorAction Stop
		}
		else {
			Enable-WindowsOptionalFeature -FeatureName $WindowsFeature -Online -NoRestart -ErrorAction Stop
		}
	}
	catch {
		if($WindowsFeatureState -eq 'Enabled') {
			$errormsg = "Failed to Disable $WindowsFeature"
			Write-Error $errormsg
			$FailedFeatures += $errormsg
		}
		else{
			$errormsg = "Failed to Enable $WindowsFeature"
			Write-Error $errormsg
			$FailedFeatures += $errormsg
		}
	}
}
if ($FailedFeatures.Length -gt 1){
	Foreach ($FailedFeature in $FailedFeatures){
		Write-Error $FailedFeature
	}
}
$title = "Restart Prompt"
$message = "Do you want to restart system now?"
switch($QuestionRunMode){
	0{
		$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","System will restart right now"
		$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Restart manually or debug the process (in case of error)"
		$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
		$result = $host.ui.PromptForChoice($title , $message , $options, 1)
	}
	1{
		[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
		$oReturn=[System.Windows.Forms.MessageBox]::Show($message,$title,[System.Windows.Forms.MessageBoxButtons]::OKCancel) 
		switch ($oReturn){
			"OK" {
				$result = 0
			}
			"Cancel" {
				$result = 1
			}
		}
	}
}

switch ($result) {
	0 {
		Write-Host "Restarting..."
		shutdown /g /t 3 /c "Restart for Enabling "
		#restart computer with updates keep app open
	}
}


# make readme.md of how to configure its lnk file
# add flag of windows restart checker with cmd or windows (or detect it)