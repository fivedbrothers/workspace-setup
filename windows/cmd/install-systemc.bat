@echo off

set SYSCBATCH=%~dp0

set MSYS=%DEVTOOLS%\msys64
set SYSCVERSION=2.3.4_pub_rev_20190614
set SCCIVERSION=1.0.0

:: cmd\bash
set BSH=%1
:: systemc-mingw
set SHSYSC=%BSH%\systemc-core-mingw64.sh
set SHSCCI=%BSH%\systemc-cci-mingw64.sh

echo.
echo ************************************************************
echo *  SystemC Libraries Installation                          *
echo ************************************************************
echo.
echo Installing SystemC Core Library
echo ************************************************************
echo Launching MinGW64 shell and logging in to setup SystemC Core.
call %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MINGW64 /usr/bin/bash -li %SHSYSC%
setx SYSTEMC_HOME %DEVTOOLS%\systemc\core-%SYSCVERSION%

echo.
echo Installing SystemC Configuration, Control, Inspection Library
echo ************************************************************
echo Launching MinGW64 shell and logging in to setup SystemC CCI.
call %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MINGW64 /usr/bin/bash -li %SHSCCI%
setx CCI_HOME %DEVTOOLS%\systemc\cci-%SCCIVERSION%

echo.
echo Setup finished! Logged out.
echo.