@echo off

@setlocal

set EXEC_PATH=%~dp0

if "%PHP_COMMAND%" == "" set PHP_COMMAND=php.exe

"%PHP_COMMAND%" "%EXEC_PATH%lint" %*

@endlocal

IF %ERRORLEVEL% NEQ 0 (
  EXIT 1;
)