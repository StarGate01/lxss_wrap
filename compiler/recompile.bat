@echo off
echo Loading envoirement
pushd "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools"
call VsDevCmd.bat
popd
rmdir /s /q "..\path"
mkdir "..\path"
echo Reading list
echo.
for /F "tokens=*" %%A in (list.txt) do (
    echo Compiling adapter for %%A
    echo Generating code
    Powershell.exe -File "replace.ps1" -path %%A > new.cpp
    echo Assembling binary
    cl /EHsc new.cpp >nul 2>&1
    move /Y new.exe "..\path\%%A.exe" >nul 2>&1
    del new.obj
    echo.
)
del new.cpp
echo Done