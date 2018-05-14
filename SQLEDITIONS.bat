@echo off
set var=
setlocal enabledelayedexpansion
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL" /s`
) DO FOR /F "usebackq tokens=2,* skip=2" %%L IN (
	`reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%%M\Setup" /v "Edition"`
) DO (
set var=!var!%%M;
)
echo !var!
endlocal