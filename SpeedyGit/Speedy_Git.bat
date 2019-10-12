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
echo ### Choose to Push or Get ###
echo   Available commands are:
echo    1. Push with automated commit.
echo    2. Push with custom message.
echo    3. Pull new updates.
echo    4. Sync updates from a forked repo. (Pull, Merge and Push)
echo    5. Show me all remotes...
echo    6. Add an upstream remote from a forked repo.
echo    7. Check your notifications at Github.
echo    8. Exit.
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
	set /p "msgline=### Type message for your new commit:"
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
	echo ### Processing your request.
    call git fetch upstream
    echo ### All updates are in your upstream branch. Now, press any key to trigger the merge!
    timeout /t -1
    call git merge upstream/master
	timeout /t 5
	call git push origin master
	echo.
	echo ### Great, everything went well! Press any key for exit.
	pause >nul
) ELSE IF "%option%"=="5" (
	call git remote -v
    echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo ### Great, everything went well! Press any key for exit.
    pause >nul
) ELSE IF "%option%"=="6" (
	set /p "url=### Paste the URL from the original(forked) repo and press Enter:"
    call git remote add upstream %url%
    echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo ### Great, everything went well! Press any key for exit.
    pause >nul
) ELSE IF "%option%"=="7" (
	start https://github.com/notifications
	echo ### Processing your request.
	echo.
	echo ### Great, everything went well! Press any key for exit.
	pause >nul
) ELSE IF "%option%"=="8" (
	exit
) ELSE (
    exit
)
