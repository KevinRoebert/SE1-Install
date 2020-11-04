:: Chocolatey install script from earlier

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: Install Java AdoptOpenJDK8
choco install AdoptOpenJDK8 -fy --params="/ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome

:: Download Karel
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/KevinRoebert/SE1-Install/blob/main/karel2020.jar?raw=true', 'karel2020.jar')"

:: Install BlueJ
choco install bluej -fy