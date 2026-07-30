

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
## ¿Qué? ¿Por qué? ¿Y para quién?
🚀 La forma más rápida de activar y desactivar las características de la familia Hyper-V en Microsoft Windows.
Si eres un desarrollador o alguien que utiliza constantemente una combinación de las siguientes herramientas: WSL2, Docker, HyperV, Windows Sandbox, Intel HAXM, BlueStacks, VMWare, VirtualBox, u otras herramientas de virtualización y muchas otras que no lo son, es probable que te hayas encontrado con minutos y minutos desperdiciados al activar y desactivar casillas de verificación en las características de Windows, lo que te lleva a buscar en Google cada vez, memorizarlas o escribirlas en una nota en algún lugar, y a veces los mensajes son bastante poco útiles (por ejemplo, el mensaje de BlueStack que me decía que mi HyperV estaba activado mientras que mi HypervisorPlatform estaba activado).
Así que finalmente me frustré, ya no me importaba y solo quería un simple interruptor para que las aplicaciones que no funcionan en este momento sí funcionen después de un maldito reinicio, ¡y eso es lo que es HyperFast! (si en la primera ejecución no funciona a la primera, ejecútalo dos veces y prueba esa aplicación nuevamente (la que necesita que HyperV (y amigos) esté apagado/encendido), si aún así no funciona, abre un issue aquí)

## ¿Cómo instalarlo?
  - Descarga la última versión desde [Github](https://github.com/aarmn/HyperFast/releases/latest)
  - Ejecútalo y acepta el acceso de administrador (es para el acceso directo en el Menú Inicio)
  - ¡Sigue la instalación! (Solo puedes presionar Enter)
## Licencia
Licencia Pública MIT
