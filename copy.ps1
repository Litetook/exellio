if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
$u = $psscriptroot
#cтворюєм і копіюєм папку 
	new-item -path 'D:\zt_admin' -name "exellio_drv" -ItemType "directory" -Force    
    copy-item -path $u\* -destination 'D:\zt_admin\exellio_drv' -recurse -force

Write-Host "Press any key to continue"
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
