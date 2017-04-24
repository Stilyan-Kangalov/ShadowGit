@echo off
REM change the directory
call G:
cd G:\Side_Project\Speedy_Git_3.0\ShadowGit
REM pick up current status
call git status
REM get current time and set it up
for /f "delims=" %%a in ('date/t') do @set mydate=%%a
for /f "delims=" %%a in ('time/t') do @set mytime=%%a
set currentTime=%mydate%%mytime%
REM add all new files with auto-commit
call git add .
call git commit -a -m "Automated commit by Speedy_Git on %currentTime%"
call git push origin master
exit
