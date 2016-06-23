@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, You do not have Admin Rights
if '%errorlevel%' NEQ '0' (

	goto UACPrompt
) else ( goto gotAdmin )

0:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

goto intro

:intro
CLS
color a
echo.
echo.
echo.
echo "   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo "   °°°°°°Þ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÞÞÞ°°°°ÞÞÞ°°°°°°°°°°°°°°
echo "   °°°°°Þ°Þ°°°°°°ÞÞ°°°°°ÞÞ°°ÞÞÞÞÞÞÞÞ°°ÞÞÞÞÞÞÞÞÞ°°ÞÞ°Þ°°Þ°ÞÞ°°ÞÞÞÞÞÞÞÞÞ°°°
echo "   °°°°Þ°°°Þ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°ÞÞ°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo "   °°°Þ°ÞÞÞ°Þ°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo "   °°Þ°°°°°°°Þ°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo "   °Þ°°°°°°°°°Þ°°ÞÞÞÞÞÞÞÞÞ°°°°°ÞÞ°°°°°ÞÞÞÞÞÞÞÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞÞÞÞÞÞÞÞ°°°
echo "   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo "   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo "           __________    ________   __
echo "       |   | |    |  \  /     |  \ /  \  |\  |   
echo "       |   | |__  |   | \__   |   |    | | \ |   
echo "       |   | |    |__/     \  |   |    | |  \|  _|_|_
echo "       |   | |    |  \     |  |   |    | |   |  _|_|_
echo "        \_/  |___ |   |___/ _____  \__/ \|   |   | |   0.8 PRE RELEASE
echo.                                                                  
echo.
echo.
timeout /t 3 >nul
goto start
:start
cls
color E 
echo.
echo Welcome To AutoMo, What Do U Gonna Do ? : 
echo.
echo ========== Main Menu ==========
echo.
echo  [1]. Hotspot Menu
echo  [2]. Folder Lock/Unlock
echo  [3]. Power Menu
echo  [4]. PC Cleanup
echo  [5]. Misc. Tools
echo  [6]. About us
echo  [7]. Exit
echo ===============================
echo.
echo Please choose desired option number: 
choice /n /C 1234567
if %ERRORLEVEL%==1 goto hotspotMenu
if %ERRORLEVEL%==2 goto folder
if %ERRORLEVEL%==3 goto power
if %ERRORLEVEL%==4 goto pcCleanup
if %ERRORLEVEL%==5 goto misc_tools
if %ERRORLEVEL%==6 goto about
if %ERRORLEVEL%==7 goto Quit

:misc_tools
cls
color 0f
echo ====== Miscellaneous Tools ======
echo.
echo  [1]. Administrator Tools
echo  [2]. Folder Flooder at Desktop
echo  [3]. Antivirus
echo  [4]. Battery Report
echo  [5]. Insert Startup Program
echo  [6]. Speaking Text
echo  [7]. Back
echo  [8]. Exit
echo =================================
echo.
echo.
echo Enter your choice: 
choice /n /c 12345678
if %ERRORLEVEL%==1 goto admin_control
if %ERRORLEVEL%==2 goto spam_folder_desktop
if %ERRORLEVEL%==3 goto antivirus
if %ERRORLEVEL%==4 goto battery
if %ERRORLEVEL%==5 goto startup_program
if %ERRORLEVEL%==6 goto text
if %ERRORLEVEL%==7 goto start
if %ERRORLEVEL%==8 goto Quit

:admin_control
cls
color 0b
echo ======== Administrative Controls ========
echo.
echo  [1]. Give Administrator Rights To User
echo  [2]. Take Administrator Rights From User
echo  [3]. Create User
echo  [4]. Delete User
echo  [5]. Hide User
echo  [6]. UnHide User
echo  [7]. Change User Password
echo  [8]. Back
echo  [9]. Main Menu
echo ==========================================
echo.
echo.
echo Choose your Choice: 
choice /c 123456789 /n
if %ERRORLEVEL%==1 goto add_admin
if %ERRORLEVEL%==2 goto del_admin
if %ERRORLEVEL%==3 goto create_user
if %ERRORLEVEL%==4 goto del_user
if %ERRORLEVEL%==5 goto hide_user
if %ERRORLEVEL%==6 goto unhide_user
if %ERRORLEVEL%==7 goto change_password
if %ERRORLEVEL%==8 goto misc_tools
if %ERRORLEVEL%==9 goto start

:add_admin
cls
echo Enter The Username You Want To Give Administrative Rights To: 
echo.
net users
echo.
echo.
set /p ch_user=
net localgroup administrators %ch_user% /add
goto give_admin_error%ERRORLEVEL%
:give_admin_error2
	cls
	color 0c
	echo.
	echo  "Command unsuccessful."
	echo.
	echo  Make sure you are in admin mode.
	echo  The user might already be an admin.
	timeout /t 4 >nul
	goto misc_tools
:give_admin_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully."
	timeout /t 2 >nul
	goto misc_tools

:del_admin
cls
color 0a
echo "Enter The Username You Want To Take Administrative Rights From"
echo.
net users
echo.
echo.
set /p ch_user=
net localgroup administrators %ch_user% /delete
goto take_admin_error%ERRORLEVEL%
:take_admin_error2
	cls
	color 0c
    echo.
    echo  "Command unsuccessful."
	echo.
	echo  Make sure you are in admin mode
	echo  The user might already be an admin
	timeout /t 4 >nul
	goto misc_tools
:take_admin_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully."
	timeout /t 2 >nul
	goto misc_tools
	
:create_user
cls
color 0a 
echo.
echo "Enter A Username To Create"
echo.
set /p ch_user=
net users %ch_user% /add
goto create_user_error%ERRORLEVEL%
:create_user_error2
	cls
	color 0c 
	echo.
	echo  "Command unsuccessful."
	echo.
	echo  Make sure you are in admin mode
	echo  The user might already exist
	timeout /t 4 >nul
	goto misc_tools
:create_user_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully"
	timeout /t 2 >nul
	goto misc_tools
	
:del_user
cls
color 0a
net users
echo.
echo.
echo "Enter A Username To Delete"
echo.
set /p ch_user=
net users %ch_user% /delete
goto del_user_error%ERRORLEVEL%
:del_user_error2
	cls
	color 0c
	echo.
	echo  "Command unsuccessful."
	echo.
	echo  Make sure you are in admin mode
	echo  The user might not exist
	timeout /t 4 >nul
	goto misc_tools
:del_user_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully"
	timeout /t 2 >nul
	goto misc_tools
	
:hide_user
cls
color 0a
net users
echo.
echo.
echo Enter A Username To Hide: 
echo.  
echo "NOTE, This Will Not Delete A User"
echo.
set /p ch_user=
net users %ch_user% /active:no
goto hide_user_error%ERRORLEVEL%
:hide_user_error2
	cls
	color 0c
	echo.
	echo  "Command unsuccessful."
	echo.
	echo  Make sure you are in admin mode
	echo  make sure you spelled it correctly
	timeout /t 4 >nul
	goto misc_tools
:hide_user_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully"
	timeout /t 2 >nul
	goto misc_tools

:unhide_user
cls
color 0a
echo.
echo Enter A Username To UnHide: 
echo.
set /p ch_user=
net users %ch_user% /active:yes
goto unhide_user_error%ERRORLEVEL%
:unhide_user_error2
	cls
	color 0c
	echo.
	echo  "Command unsuccessful."
	echo.
	echo  Make sure you are in admin mode.
	echo  make sure you spelled it correctly.
	timeout /t 4 >nul
	goto misc_tools
:unhide_user_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully"
	timeout /t 2 >nul
	goto misc_tools

:change_password
cls
color 0b
echo.
echo "Enter A Username"
net users
echo.
echo.
set /p ch_user=
cls
net user %ch_user% *
goto change_password_error%ERRORLEVEL%
:change_password_error2
	cls
	color 0c
	echo.
	echo  "Command unsuccessful."
	echo.
	echo  Make sure you are in admin mode
	echo  make sure you spelled the username correctly
	timeout /t 4 >nul
	goto misc_tools
:change_password_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully"
	timeout /t 2 >nul
	goto misc_tools
	

:spam_folder_desktop
cls
color 0c
echo.
echo CAUTION: This will create as many as folder you want at DESKTOP.
echo.
echo.
echo "Enter number of folders to be created "
echo.
echo "must be between 0 and 10000000000"
echo.
set /p spamfoldernum=
set spamfoldernumbefore=%spamfoldernum%
cls
color 0e
echo.
echo "Enter the name of the folders to be created:"
echo.
set /p spamfoldername=
cls

:spamfolderloop
mkdir %USERPROFILE%\desktop\%spamfoldername%%spamfoldernum%
set /a spamfoldernum=%spamfoldernum%-1
if %spamfoldernum% GTR 0 goto spamfolderloop
cls
echo.
color 0a
echo %spamfoldernumbefore% folders named %spamfoldername% have been
echo created on the desktop!"
timeout /t 4 >nul
goto misc_tools


:startup_program
cls
echo "Enter the path of the program"
echo.
set /p ch_dir=
copy "%ch_dir%" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
echo %ERRORLEVEL%
pause
goto change_password_error%ERRORLEVEL%
:startup_program_error1
	cls
	colr 0c
	echo.
	echo  "Command unsuccessful."
	echo.
	timeout /t 4 >nul
	goto misc_tools
:startup_program_error0
	cls
	color 0a
	echo.
	echo  "Command completed successfully"
	timeout /t 2 >nul
	goto misc_tools

:hotspotMenu
color f  
cls
echo ========= Hotspot Menu ============
echo.
echo [1]. Turn On Wifi Hotspot [Default]
echo [2]. Turn On Wifi Hotspot [Manual]
echo [3]. Turn Off Wifi Hotspot
echo [4]. Main Menu
echo ===================================
echo.
echo Please choose your option no. : 
choice /n /C 1234
if %ERRORLEVEL%==1 goto hotspotDefault
if %ERRORLEVEL%==2 goto hotspotManual
if %ERRORLEVEL%==3 goto wifioff
if %ERRORLEVEL%==4 goto start

:hotspotDefault
cls
netsh wlan set hostednetwork mode=allow ssid=AutoMo key=automo567
netsh wlan start hostednetwork
echo.
cls
color A 
echo Hotspot started... Status: OK
echo.
echo. 
echo  Hotspot Name: AutoMo      Pass: automo567
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo NOTE: If you are starting hotspot FIRST time using AutoMo
echo       than only follow below steps
echo.
echo Step 1) go to Control Pannel and open 'Network and Internet'
echo Step 2) open 'Network and Sharing Center'
echo Step 3) Here Right Cick on the connection that you use to connect to the internet 
echo         and select 'Properties'.
echo Step 4) In the Properties go to 'Sharing' tab and check the box 
echo         "Allow other network users to connect through this computer's internet"
echo Step 5) Now select the network conncetion name that is used by your hotspot name.
echo         And save it by clicking on 'OK'
echo.
echo         Now your internet is shared to your hotspot.
echo.
echo.
pause 
cls
color B
echo ---------------------------------
echo What are you gonna do now ? :
echo ---------------------------------
echo [1]. Turn Off Hotspot
echo [2]. Back (Hotspot Menu)
echo [3]. Main Menu
echo [4]. Exit
echo ---------------------------------
echo.
echo Please choose between [1-4]
choice /n /c 1234
if %ERRORLEVEL%==1 goto wifiOff
if %ERRORLEVEL%==2 goto hotspotMenu
if %ERRORLEVEL%==3 goto start
if %ERRORLEVEL%==4 goto Quit

:hotspotManual
cls
color B
echo ------------------------------------------------
echo Please type the Hotspot Name (don't use space):
set /p ssid=""
echo ------------------------------------------------
echo.
echo Please enter your password [min 8 letters, use small alphabets and number only]
set /p password=""
echo ------------------------------------------------
echo.
echo Processing request ...
ping localhost -n 2 >nul
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%password%
netsh wlan start hostednetwork
cls
color A 
echo.
echo Hotspot Sucessfully STARTED...
echo.
echo.
echo.
echo.
echo.
echo.
echo NOTE: If you are starting hotspot FIRST time using AutoMo
echo       than only follow below steps
echo.
echo Step 1) go to Control Pannel and open 'Network and Internet'
echo Step 2) open 'Network and Sharing Center'
echo Step 3) Here Right Cick on the connection that you use to connect to the internet 
echo         and select 'Properties'.
echo Step 4) In the Properties go to 'Sharing' tab and check the box 
echo         "Allow other network users to connect through this computer's internet"
echo Step 5) Now select the network conncetion name that is used by your hotspot name.
echo         And save it by clicking on 'OK'
echo.
echo         Now your internet is shared to your hotspot.
echo.
echo.
echo.
pause 
color B
cls
echo ---------------------------------
echo What are you gonna do now ? :
echo ---------------------------------
echo [1]. Turn Off Hotspot
echo [2]. Back
echo [3]. Main Menu
echo [4]. Exit
echo ---------------------------------
echo.
echo Please choose between [1-4]
choice /n /c 1234
if %ERRORLEVEL%==1 goto wifiOff
if %ERRORLEVEL%==2 goto hotspotMenu
if %ERRORLEVEL%==3 goto start
if %ERRORLEVEL%==4 goto Quit

:wifioff
color C
cls
echo Turning off wifi hotspot .......
ping localhost -n 2 >nul
netsh wlan stop hostednetwork 
cls
echo Hotspot Successfully STOPPED.
ping localhost -n 2 >nul
cls
color b
echo.
echo ---------------------------------
echo What are u gonna do now ?
echo ---------------------------------
echo.
echo [1]. Start Hotspot
echo [2]. Back (Hotspot Menu)
echo [3]. Main Menu
echo [4]. Exit
echo ---------------------------------
echo.
echo Please choose between [1-4]
choice /n /c 1234
if %ERRORLEVEL%==1 goto hotspotDefault
if %ERRORLEVEL%==2 goto hotspotMenu
if %ERRORLEVEL%==3 goto start
if %ERRORLEVEL%==4 goto Quit

:battery
cls
color B
powercfg /batteryreport /output "C:\Windows\Temp\battery_report.html"
cls
C:\Windows\Temp\battery_report.html
del "C:\Windows\Temp\battery_report.html"
cls
echo ---------------------------------
echo What are u gonna do now ?
echo ---------------------------------
echo.
echo [1]. Again Generate Battery Report
echo [2]. Save Battery Report to Desktop
echo [3]. Main Menu
echo [4]. Exit 
echo ---------------------------------
echo.
echo Please choose between [1-4]
choice /n /c 1234
if %ERRORLEVEL%==1 goto battery
if %ERRORLEVEL%==2 goto batterySave
if %ERRORLEVEL%==3 goto start
if %ERRORLEVEL%==4 goto Quit

:batterySave
cls
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Battery_Report.html"
cls
echo.
color A
echo Battery Report save Successfully
echo.
pause
clr
goto start


:folder
cls
color b
echo Enter The Drive letter (c,d,e, etc) where you want to Lock/Unlock folder
set /p drive=""
%drive%:
if EXIST "Control Panel.{ED7BA470-8E54-465E-825C-99712043E01C}" goto UNLOCK
if EXIST myFolder goto CONFIRM2
if NOT EXIST myFolder goto MDmyFolder

:UNLOCK
cls
echo.
echo Folder is Locked
echo.
echo Enter password to Unlock Your Secure Folder
set/p "pass=>"
if NOT %pass%== automo123 goto FAIL
attrib -h -s "Control Panel.{ED7BA470-8E54-465E-825C-99712043E01C}"
ren "Control Panel.{ED7BA470-8E54-465E-825C-99712043E01C}" myFolder
echo.
cls
color a
echo Folder Unlocked successfully
echo.
echo.
pause
%drive%:\myFolder

goto start
:FAIL
color c
echo.
echo Invalid password
echo.
echo Press any key to RETRY Password
pause >nul
goto UNLOCK

:MDmyFolder
md myFolder
echo.
cls
color a
echo.
echo myFolder created successfully
echo.
echo.
echo Copy all prvate data in "myFolder"  which is created in "%drive%" drive
echo.
pause
cls
goto CONFIRM
:CONFIRM
color c
echo.
echo NOTE: Before Locking folder please paste your private data in myFolder
echo. 
pause
start %newdrive%:\myFolder
goto CONFIRM2

:CONFIRM2
echo.
cls
color b
echo Have you pasted all data ?
echo.
echo Are you sure to LOCK this folder? (Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto no
if %cho%==N goto no
echo Invalid choice.
goto CONFIRM

:LOCK
ren myFolder "Control Panel.{ED7BA470-8E54-465E-825C-99712043E01C}"
attrib +h +s "Control Panel.{ED7BA470-8E54-465E-825C-99712043E01C}"
color A
echo.
echo Folder locked Sucessfully
echo.
echo.
echo.
echo pass: automo123
echo.
echo.
echo.
echo Please remember above password
pause
goto start

:no
echo.
echo Folder is not Locked
echo.
goto start 

echo ---------------------------------



:antivirus
cls
color b
echo.
echo =======================
echo    Antivirus Menu
echo =======================
echo.
echo [1]. Test your Antivirus
echo [2]. Remove Virus
echo [3]. Remove Virus From PENDRIVE
echo [4]. Main Menu
echo [5]. Exit
echo.
echo.
echo.
echo.
echo NOTE: If you want a full protection from Viruses than BUY a good Antivirus
echo       such as Quick Heal Antivirus, Guardian Antivirus, Eset Smart Security, etc.

echo.
echo.
echo Choose your Option:
choice /n /c 123456
if %ERRORLEVEL%==1 goto testAntivirus
if %ERRORLEVEL%==2 goto removeVirus
if %ERRORLEVEL%==3 goto pendrive
if %ERRORLEVEL%==4 goto start
if %ERRORLEVEL%==5 goto Quit
goto antivirus

:testAntivirus
cls
color E
echo ==================================================
echo  HOW TO TEST YOUR ANTIVIRUS IS WORKING OR NOT ?
echo ==================================================
echo. 
echo Step 1. Create a notepad file
echo Step 2. Copy the code give below in the notepad file:
echo.
echo X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
echo.
echo Step 3. Save it with an .exe extension like 'testvirus.exe'
echo Step 4. If antivirus is working fine than your Antivirus will Delete that file.
echo.
echo.
echo.
echo. Press any key to open Notepad...
pause >nul
start notepad
cls
color a
echo. Copy and Past this, after that Save it with named 'testvirus.exe'
echo.
echo.
echo X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
echo.
echo.
echo.
pause
goto antivirus

echo --------------------------------- 

:removeVirus
cls
echo ===========================
echo    Select Drive
echo ===========================
echo.
wmic logicaldisk get deviceid, volumename, description
echo.
echo.
set /p virus="Enter the Drive letter in which you want to delete Virus: "
if %virus%==c goto c
goto otherDrive

:c
cls
color c
echo.
echo  Removing Autorun Virus...
ping localhost -n 3 >nul
cd "c:\"
attrib -h -r -s autorun.inf
del autorun.inf
echo.
echo   Removing Shortcut Virus...
ping localhost -n 2 >nul
del *.lnk
echo.
color a
pause
goto antivirus

:otherDrive
cls
color c
echo  Removing Autorun Virus...
%virus%:
attrib -h -r -s autorun.inf
del autorun.inf
ping localhost -n 3 >nul
cls
echo.
echo  Removing Shortcut Virus...
ping localhost -n 3 >nul
%virus%:
del *.lnk
attrib -h -r -s /s /d %virus%:*.*
echo.
color a
pause
goto antivirus

:pendrive
cls
echo.
echo ===========================
echo    Select Pendrive Disk 
echo ===========================
echo.
wmic logicaldisk where drivetype=2 get deviceid, volumename, description
echo.
echo.
set /p virus="Enter the Drive letter in which you want to delete Virus: "
if %virus%==%virus% goto pendrive1

:pendrive1
%virus%:
cls
color c
echo  Removing Autorun Virus...
ping localhost -n 3 >nul
attrib -h -a *.*
attrib -h -r -s autorun.inf
del autorun.inf
del *.lnk

cls
echo.
echo  Removing Shortcut Virus...
ping localhost -n 3 >nul
attrib -h -r -s /s /d %virus%:*.*
echo.
echo.
color a
echo.
pause
goto antivirus


:power
cls
color b
echo.
echo  This Menu will do a Particular task at a Particular Time automatically.  
echo  Just you have to tell after how many MINUTES you want your system to do a particular Task.
echo.
echo.
echo ========= Power Scheduled Menu ========
echo.
echo [1]. Shutdown
echo [2]. Restart
echo [3]. Hibernate
echo [4]. Log off
echo [5]. go to Main Menu
echo.
echo Enter your desired option: 
choice /n /c 12345
if %ERRORLEVEL%==1 goto shutdown
if %ERRORLEVEL%==2 goto restart
if %ERRORLEVEL%==3 goto hibernate
if %ERRORLEVEL%==4 goto logoff
if %ERRORLEVEL%==5 goto start

:shutdown
color e
cls
echo.
echo Enter the Time(in min) after which you want your system to Shutdown
echo For example, if you want to shutdown your system after 2 hour than type '120'
echo.
set /p time="Enter the Time (in minutes): "
set/a time=%time%*60
shutdown /a
shutdown.exe /s /f /t %time%
cls
echo.
color a
echo Successfully set the Shutdown Scheduled.
ping localhost -n 3 >nul
cls
color b
echo =================================
echo [1]. Cancel Shutdown Scheduled
echo [2]. Rescheduled Shutdown
echo [3]. go to Main Menu
echo [4]. Exit
echo =================================
echo.
echo.
echo Enter your Desired Option number:
choice /n /c 1234
if %ERRORLEVEL%==1 goto cancelSchedule1
if %ERRORLEVEL%==2 goto shutdown
if %ERRORLEVEL%==3 goto start
if %ERRORLEVEL%==4 goto Quit

:restart
color e
cls
echo.
echo Enter the Time(in min) after which you want your system to Restart
echo For example, if you want to Restart your system after 2 hour than type '120'
echo.
set /p time="Enter the Time (in minutes): "
set/a time=%time%*60
shutdown.exe /a
shutdown.exe /r /f /t %time%
cls
echo.
color a
echo Successfully set the Restart Scheduled.
ping localhost -n 3 >nul
cls
color b
echo =================================
echo [1]. Cancel Restart Scheduled
echo [2]. Rescheduled Restart
echo [3]. go to Main Menu
echo [4]. Exit
echo =================================
echo.
echo.
echo Enter your Desired Option number:
choice /n /c 1234
if %ERRORLEVEL%==1 goto cancelSchedule
if %ERRORLEVEL%==2 goto restart
if %ERRORLEVEL%==3 goto start
if %ERRORLEVEL%==4 goto Quit

:hibernate
cls
color c
echo.
echo Your System will Hibernate as soon as you hit enter.
echo.
echo Are you sure [y/n] ?
set /p key=""
if %key%==y goto yesHibernate
if %key%==Y goto yesHibernate
if %key%==n goto noHibernate
if %key%==N goto noHibernate

cls
echo.
color c
echo Invalid key
echo.
pause
goto hibernate
:yesHibernate
cls
shutdown.exe /a
shutdown.exe /h
cls
echo.
color a
echo Your System was Hibernate Successfully. 
echo.
pause
goto power
:noHibernate
goto power

:logoff
cls
color c
echo.
echo Your System will Log Off (Sign out) as soon as you hit enter.
echo.
echo Are you sure [y/n] ?
set /p logoff=""
if %logoff%==y goto yeslogoff
if %logoff%==Y goto yeslogoff
if %logoff%==n goto nologoff
if %logoff%==N goto nologoff
cls
echo.
color c
echo Invalid key
echo.
pause
goto power
:yeslogoff
cls
shutdown.exe /a
shutdown.exe /l

:nologoff
goto power

:cancelSchedule
cls
echo.
color c
shutdown -a
cls
echo The Scheduled has been Canceled
ping localhost -n 3 >nul
goto power



:pcCleanup
cls
color b
echo --------------------
echo PC Cleanup Utility
echo --------------------
echo.
echo Select a tool
echo =============
echo.
echo [1]. All in One Cleanup
echo [2]. Disk Defragment
echo [3]. Main Menu
echo.
echo Select a Tool: 
choice /n /C 123
if %ERRORLEVEL%==1 goto allinone
if %ERRORLEVEL%==2 goto defragment
if %ERRORLEVEL%==3 goto start
:allinone
cls
color c
echo.
echo  Deleting Cookies...
ping localhost -n 3 >nul
rd %userprofile%\Cookies /s /q
cls
color a
echo.
echo  Cookies deleted.
echo.
ping localhost -n 2 >nul
goto temporary
:temporary
cls
color c
echo.
echo  Deleting Temporary Files...
ping localhost -n 3 >nul
rd %userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\ /s /q
cls
color a
echo.
echo  Temporary Internet Files deleted.
ping localhost -n 2 >nul
goto cleanup
:cleanup
cls
color c
echo.
echo  Running Disk Cleanup...
ping localhost -n 4 >nul

if exist "C:\Windows\temp" rd C:\Windows\temp /s /q
if exist "C:\Windows\tmp" rd C:\WINDOWS\tmp\ /s /q
if exist "C:\tmp" rd C:\tmp /s /q
if exist "C:\temp" rd C:\temp /s /q
if exist "%temp%" rd %temp% /s /q

if exist "%tmp%" rd %tmp% /s /q
if not exist "C:\WINDOWS\Users\*.*" goto skip
if exist "C:\WINDOWS\Users\*.zip" del "C:\WINDOWS\Users\*.zip" /f /q
if exist "C:\WINDOWS\Users\*.exe" del "C:\WINDOWS\Users\*.exe" /f /q
if exist "C:\WINDOWS\Users\*.gif" del "C:\WINDOWS\Users\*.gif" /f /q
if exist "C:\WINDOWS\Users\*.jpg" del "C:\WINDOWS\Users\*.jpg" /f /q
if exist "C:\WINDOWS\Users\*.png" del "C:\WINDOWS\Users\*.png" /f /q
if exist "C:\WINDOWS\Users\*.bmp" del "C:\WINDOWS\Users\*.bmp" /f /q
if exist "C:\WINDOWS\Users\*.avi" del "C:\WINDOWS\Users\*.avi" /f /q
if exist "C:\WINDOWS\Users\*.mpg" del "C:\WINDOWS\Users\*.mpg" /f /q
if exist "C:\WINDOWS\Users\*.mpeg" del "C:\WINDOWS\Users\*.mpeg" /f /q
if exist "C:\WINDOWS\Users\*.ra" del "C:\WINDOWS\Users\*.ra" /f /q
if exist "C:\WINDOWS\Users\*.ram" del "C:\WINDOWS\Users\*.ram"/f /q
if exist "C:\WINDOWS\Users\*.mp3" del "C:\WINDOWS\Users\*.mp3" /f /q
if exist "C:\WINDOWS\Users\*.mov" del "C:\WINDOWS\Users\*.mov" /f /q
if exist "C:\WINDOWS\Users\*.qt" del "C:\WINDOWS\Users\*.qt" /f /q
if exist "C:\WINDOWS\Users\*.asf" del "C:\WINDOWS\Users\*.asf" /f /q
:skip
if not exist C:\WINDOWS\Users\Users\*.* goto skippy /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.zip del C:\WINDOWS\Users\Users\*.zip /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.exe del C:\WINDOWS\Users\Users\*.exe /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.gif del C:\WINDOWS\Users\Users\*.gif /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.jpg del C:\WINDOWS\Users\Users\*.jpg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.png del C:\WINDOWS\Users\Users\*.png /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.bmp del C:\WINDOWS\Users\Users\*.bmp /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.avi del C:\WINDOWS\Users\Users\*.avi /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mpg del C:\WINDOWS\Users\Users\*.mpg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mpeg del C:\WINDOWS\Users\Users\*.mpeg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.ra del C:\WINDOWS\Users\Users\*.ra /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.ram del C:\WINDOWS\Users\Users\*.ram /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mp3 del C:\WINDOWS\Users\Users\*.mp3 /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.asf del C:\WINDOWS\Users\Users\*.asf /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.qt del C:\WINDOWS\Users\Users\*.qt /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mov del C:\WINDOWS\Users\Users\*.mov /f /q
:skippy
if exist "C:\WINDOWS\ff*.tmp" del C:\WINDOWS\ff*.tmp /f /q
if exist C:\WINDOWS\ShellIconCache rd C:\WINDOWS\ShellI~1\ /s /q
cls
color a
echo.
echo  Disk Cleanup successful!
echo.
ping localhost -n 2 >nul
goto start
:defragment
cls
color 07
echo ----------------------
echo Disk Defragmentation
echo ----------------------
echo.
echo  NOTE: Defragmentation will take aroud 30 minutes or more
echo        depending on your system configuration.
echo.
echo.
echo Are you sure to continue [y/n] ?
set /p key=" "
if %key%==y goto yesDefragment
if %key%==Y goto yesDefragment
if %key%==n goto noDefragment
if %key%==N goto noDefragment

:noDefragment
goto pcCleanup

:yesDefragment
echo.
cls
color a
echo  Defragmenting hard disks...
ping localhost -n 3 >nul
defrag -c -v
cls
echo.
echo  Disk Defrag successful!
echo.
pause
goto pcCleanup


:text
cls
color e
echo Write the text here to convert into speech ?
echo.
set /p text=
goto num
:num
set num=%random%
if exist "%userprofile%\appdata\local\temp\temp%num%.vbs" goto num
echo ' > "%userprofile%\appdata\local\temp\temp%num%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "%userprofile%\appdata\local\temp\temp%num%.vbs"
echo speech.speak "%text%" >> "%userprofile%\appdata\local\temp\temp%num%.vbs"
goto speaking

:speaking
cls
color a
echo.
echo %text%
start %userprofile%\appdata\local\temp\temp%num%.vbs
echo.
pause
cls
color b
echo ====== Text 2 Speech ======
echo.
echo [1]. Listen again
echo [2]. Type text again
echo [3]. Main Menu
echo [4]. Exit
echo.
echo Enter your choice:
echo.
choice /n /c 1234
if %ERRORLEVEL%==1 goto speaking
if %ERRORLEVEL%==2 goto delspeaking
if %ERRORLEVEL%==3 goto delstart
if %ERRORLEVEL%==4 goto delquit
:delspeaking
del "%userprofile%\appdata\local\temp\temp%num%.vbs"
goto text

:delstart
del "%userprofile%\appdata\local\temp\temp%num%.vbs"
goto start

:delquit
del "%userprofile%\appdata\local\temp\temp%num%.vbs"
goto Quit



:about
cls
color 0F
echo              AutoMo is developed by Mohit Kumar
echo.
echo  AutoMo is based on Batch Programming. It does not require installation.
echo  AutoMo shows how a command prompt can be so powerful
echo  to do a various tasks.
echo  AutoMo is completely free and open source. This means you can customize 
echo  it according to your needs
echo  It is still under construction, for newer update stay tunned.
echo.
echo.  
echo " °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo " °°°°°°Þ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÞÞÞ°°°°ÞÞÞ°°°°°°°°°°°°°°
echo " °°°°°Þ°Þ°°°°°°ÞÞ°°°°°ÞÞ°°ÞÞÞÞÞÞÞÞ°°ÞÞÞÞÞÞÞÞÞ°°ÞÞ°Þ°°Þ°ÞÞ°°ÞÞÞÞÞÞÞÞÞ°°°
echo " °°°°Þ°°°Þ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°ÞÞ°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo " °°°Þ°ÞÞÞ°Þ°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo " °°Þ°°°°°°°Þ°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo " °Þ°°°°°°°°°Þ°°ÞÞÞÞÞÞÞÞÞ°°°°°ÞÞ°°°°°ÞÞÞÞÞÞÞÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞÞÞÞÞÞÞÞ°°°
echo " °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo " °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo "           __________    ________   __
echo "       |   | |    |  \  /     |  \ /  \  |\  |   
echo "       |   | |__  |   | \__   |   |    | | \ |   
echo "       |   | |    |__/     \  |   |    | |  \|  _|_|_
echo "       |   | |    |  \     |  |   |    | |   |  _|_|_
echo "        \_/  |___ |   |___/ _____  \__/ \|   |   | |   0.8 PRE RELEASE
echo.                                                                  
pause
goto start



:Quit
cls
echo.
color b
echo     Thanks for using AutoMo by Mohit Kumar
echo.
echo.
echo " °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo " °°°°°°Þ°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°ÞÞÞ°°°°ÞÞÞ°°°°°°°°°°°°°°
echo " °°°°°Þ°Þ°°°°°°ÞÞ°°°°°ÞÞ°°ÞÞÞÞÞÞÞÞ°°ÞÞÞÞÞÞÞÞÞ°°ÞÞ°Þ°°Þ°ÞÞ°°ÞÞÞÞÞÞÞÞÞ°°°
echo " °°°°Þ°°°Þ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°ÞÞ°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo " °°°Þ°ÞÞÞ°Þ°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo " °°Þ°°°°°°°Þ°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°°°°ÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞ°°°°°ÞÞ°°°
echo " °Þ°°°°°°°°°Þ°°ÞÞÞÞÞÞÞÞÞ°°°°°ÞÞ°°°°°ÞÞÞÞÞÞÞÞÞ°°ÞÞ°°°°°°ÞÞ°°ÞÞÞÞÞÞÞÞÞ°°°
echo " °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo " °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
ping 127.0.0.1 >nul
exit