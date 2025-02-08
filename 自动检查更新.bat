@echo off
chcp 65001
setlocal EnableDelayedExpansion
echo 正在检查模组
certutil -urlcache -split -f https://raw.bgithub.xyz/ymfwq/look/refs/heads/main/a.txt ./hc/a.txt
echo 正在检查材质
certutil -urlcache -split -f https://raw.bgithub.xyz/ymfwq/look/refs/heads/main/b.txt ./hc/b.txt
del /q/s *.key
set /p xmz=<./hc/a.txt
set /p bmz=<./b.txt
set /p xcz=<./hc/b.txt
set /p bcz=<./v.txt
set /a xz=%xmz%+%xcz%
set /a bd=%bmz%+%bcz%
if %xz% == %bd% (
    echo 没有新版本

    echo 正在启动启动器
) else (
    if %xmz% == %bmz% (
            certutil -urlcache -split -f https://raw.bgithub.xyz/ymfwq/look/refs/heads/main/b.bat ./b.bat
            start ./b.bat
            echo %xmz%>./a.txt
            del /q/s *.key
    )
    if %xcz% == %bcz% (
        certutil -urlcache -split -f https://raw.bgithub.xyz/ymfwq/look/refs/heads/main/a.bat ./a.bat
        start ./b.bat
        echo %xcz%>./b.txt
        del /q/s *.key
    )
)
:: "C:\Program Files\WinRAR\WinRAR.exe" x ./mods.zip.001 ./.minecraft/mods
:: rmdir ./hc