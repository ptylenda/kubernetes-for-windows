@echo off
setlocal enabledelayedexpansion

@echo on
:: Forward all parameters to WSL command specified as name of the script
powershell.exe -File %~dp0/execute-in-wsl.ps1 %~n0 %*