if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
$u = $PSScriptRoot

#шукаємо екселіо папку


    [array]$programchild = (get-childitem -Path "C:\Program Files").name |Select-String  -Pattern "exellio","artsoft"


    If ($programchild -ne $null)
        {
         
        Write-host "Знайдена папка Екселіо!"
        $Programchild
        $deletebutton = Read-host "Видалити все? 1 - Так, 2 - Ні, 3 - Пропуск"
        if ($deletebutton -eq 1)
                    {
                        
                         

                        foreach ( $item in $programchild ) 
                        { $path = "C:\Program files\"+$item
                             Remove-item -Path $path -Recurse -force
                             $a=1
                             $a
                             #$length=$programchild.count
                            
                            Write-host "Видалено! $path" 
                            }
                        <# function delete
                             {
                            $path = "C:\Program files\"+$item
                             Remove-item -Path $path -Recurse -force
                             $a=1
                             $a
                             #$length=$programchild.count
                            
                            Write-host "Видалено! $path"
                            }
                          delete  
                    #>
                    }  
        
       
         }





$num = Read-host "Вибери касовий апарат для копій. 1 - FP1000, 2 - FP700, 3 - FP2000 "
if ($num -eq 1)
    {
        new-item -path 'C:\Program Files' -name "Exellio_FP" -ItemType "directory" -Force
        copy-item -path $u\Exellio_FP1000\* -destination 'C:\Program Files\Exellio_FP' -recurse -force
    }
if ($num -eq 2)
    {
        new-item -path 'C:\Program Files' -name "Exellio_FP" -ItemType "directory" -Force
        copy-item -path $u\Exellio_FP700\* -destination 'C:\Program Files\Exellio_FP' -recurse -force
    }
if ($num -eq 3)
    {
        new-item -path 'C:\Program Files' -name "Exellio_FP" -ItemType "directory" -Force
        copy-item -path $u\Exellio_FP2000\* -destination 'C:\Program Files\Exellio_FP' -recurse -force
    }

    ii 'C:\Program Files\Exellio_FP'

#Write-Host -NoNewLine 'Press any key to continue...';
#$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
