@ECHO OFF

echo ##############################################################################
echo                           ##### Speedy Git #####
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
color F
REM get date and time
for /f "delims=" %%a in ('date/t') do @set mydate=%%a
for /f "delims=" %%a in ('time/t') do @set mytime=%%a
set currentTime=%mydate%%mytime%
call git status
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

echo.
set /p "msgline=### Type message for your new commit:"
echo.
echo ### Choose to Push or Get ###
echo   Available commands are:
echo    1. Push with automated commit.
echo    2. Push with custom message.
echo    3. Pull new updates.
echo    4. Check your notifications at Github.
echo    5. Exit.
set /p "option=### Make your choice:"
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

IF "%option%"=="1" (
	REM add all new files with auto-commit
	call git add .
	call git commit -a -m "Automated commit by Speedy_Git on %currentTime%"
	call git push origin master
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo ### Great, everything went well! Press any key for exit.
	pause >nul
) ELSE IF "%option%"=="2" (
	REM make new commit with your custom message
	call git add .
	call git commit -m "%msgline%"
	call git push origin master
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo ### Great, everything went well! Press any key for exit.
	pause >nul
) ELSE IF "%option%"=="3" (
	call git pull origin master
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo ### Great, everything went well! Press any key for exit.
	pause >nul
) ELSE IF "%option%"=="4" (
	start https://github.com/notifications
	echo ### Processing your request.
	echo.
	echo ### Great, everything went well! Press any key for exit.
	pause >nul
) ELSE IF "%option%"=="5" (
	exit
) ELSE (
    exit
)
