@echo off

set RENODEBATCH=%~dp0

set RENODEVERSION=1.12.0+20220111git04c47ce0
set RENODEINST=https://dl.antmicro.com/projects/renode/builds/renode_%RENODEVERSION%.zip
set RENODE=%DEVTOOLS%\renode

set CREATEDIRS=%RENODEBATCH%create-workspace.bat

if not exist %WSTMP% (
    call %CREATEDIRS%
)

:: 7zip
set SZ=%1

:: download and extract the installation files
echo.
echo Downloading Renode Framework ver. %RENODEVERSION% (Portable Mode)
curl -# -L -o %WSTMP%\renode.zip %RENODEINST%
echo.
echo Extracting files
%SZ% x %WSTMP%\renode.zip -o%WSTMP%

if exist "%WSTMP%\renode_%RENODEVERSION%" (
    echo Moving installation folder
    move %WSTMP%\renode_%RENODEVERSION% %RENODE%
 )

:: notes
echo.
echo ************************************************************
echo *  NOTES :: Renode Framework (Portable Mode)               *
echo ************************************************************
echo Add %RENODE%\bin into the User Path Environment Variable.
echo Note: Restart terminal session to use new path.
echo.
echo ************************************************************
echo.