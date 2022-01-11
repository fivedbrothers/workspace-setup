@echo off

set BATCHDIR=%~dp0
set CMDIR=%BATCHDIR%cmd
set UTDIR=%BATCHDIR%utils

:: create .workspace folder under %USERPROFILE% directory
call %CMDIR%\create-workspace.bat

:: setup basic development tools

:: archiving tool
call %CMDIR%\install-7zip.bat %UTDIR%

@REM :: git
@REM call %CMDIR%\install-git.bat %ZIP%\7z.exe

@REM :: vscode-portable
@REM call %CMDIR%\install-vscode.bat %ZIP%\7z.exe

@REM :: msys2-mingw64
@REM call %CMDIR%\install-msys.bat %ZIP%\7z.exe %CMDIR%\bash

:: renode-portable
call %CMDIR%\install-renode.bat %ZIP%\7z.exe

:: systemc
@REM call %CMDIR%\install-systemc.bat %CMDIR%\bash

@REM :: miniconda
@REM call %CMDIR%\install-miniconda.bat


@REM pause
