@echo off

if not exist "%~dp0Build\GenerateProjectFiles.bat" (
    goto Error_NoBatchFile
)

cd Build
call GenerateProjectFiles.bat
echo.
pause
exit

:Error_NoBatchFile
echo Error: The 'GenerateProjectFiles.bat' file in 'Build' could not be found.
echo.
pause
exit