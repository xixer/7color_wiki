@echo off
title Sync 7color_wiki

:PULL
echo Sync(pull) starting...
echo .
git pull 7color_wiki master

echo .
echo ==============================================================================
git status

echo .
echo ==============================================================================
:LABEL_CONFIRM
set /p doPush=Pull from server completed, continue to push(y/n)?
if "%doPush%"=="y" goto LABEL_PUSH
if "%doPush%"=="n" goto exit
goto LABEL_CONFIRM


:LABEL_PUSH
echo .
set /p commit=Enter commit:
if "%commit%"==""(goto LABEL_AUTOMATIC) else (goto LABEL_MANUAL)
: LABEL_AUTOMATIC
:: get date and time
:: for /f "delims=" %%a in ('date/t') do @set mydate=%%a
:: for /f "delims=" %%a in ('time/t') do @set mytime=%%a
set mydate=%DATE:~0,10%
set mytime=%TIME:~0,8%
set fvar=%mydate% %mytime%
set commit="Automatic commit at %fvar%"

: LABEL_MANUAL
set commit=%commit%

git add .
git commit -a -m %commit%

:: check if ssh-agent is running
:: tasklist|find /i "ssh-agent.exe" || cmd /c ""C:\Program Files\Git\bin\sh.exe" --login -i" && exit
call git push 7color_wiki master

echo .
echo .---------------------------------------------------------------------------.
echo ' '
echo ' Sync complete! '
echo ' '
echo `---------------------------------------------------------------------------+

:LABEL_DONE
pause
exit
