chcp 65001
@echo  off 

set project_name=Simple Flashcard Audio Recorder script
set project_short=Sfar
set project_fullname=%project_name% (%project_short%)
set project_version=0.0.0.1 
set project_author=Karol Gruszczynski 
set project_publication_date=19/12/2019 
set project_repo=(none)

set fileFolder=flashcards
set filenamePrefixOne=PartA_
set filenamePrefixTwo=Section3_
set microphone=Mikrofon (Microphone Control (DVR))
rem set microphone=

set mp3idTagArtist=%project_fullname% 
set mp3idTagYear=2019
set mp3idTagCoverFile=cover.jpeg
set vlc="C:\Program Files\VideoLAN\VLC\vlc.exe"
set ffmpeg=ffmpeg -hide_banner -loglevel panic



set SfarTextDefault=[40m[1m
set SfarBrigRed=[31;1m%SfarTextDefault%
set SfarDarkRed=[31m%SfarTextDefault%
set SfarDarkGrn=[32;1m%SfarTextDefault%
set SfarWhite=[37;1m%SfarTextDefault%
set SafrsBgWhite=[47;1m[31;1m[1m
set SfarBlink=[5m%SfarTextDefault%
set sfarRedLine=echo %SfarDarkRed% ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ %SfarBrigRed%
set sfarET=E     ███████          
set sfarLogo=@echo %SfarBrigRed% %sfarET%███████╗%sfarET%███████║ ███████╗███████╗ █████╗ ██████╗%sfarET%███████║ ██╔════╝██╔════╝██╔══██╗██╔══██╗%sfarET%███████║ ███████╗█████╗  ███████║██████╔╝%sfarET%███████║ ╚════██║██╔══╝  ██╔══██║██╔══██╗%sfarET%███████║ ███████║██║     ██║  ██║██║  ██║%sfarET%███████║ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝%sfarET%╚═════╝   %SfarWhite%%FLogoText%%SfarBrigRed%%sfarET%%sfarET%
set sfarLogo=@echo %SfarBrigRed% %sfarET% %sfarET%███████╗███████╗ █████╗ ██████╗%sfarET%██╔════╝██╔════╝██╔══██╗██╔══██╗%sfarET%███████╗█████╗  ███████║██████╔╝%sfarET%╚════██║██╔══╝  ██╔══██║██╔══██╗%sfarET%███████║██║     ██║  ██║██║  ██║%sfarET%╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝%sfarET%%SfarWhite%%FLogoText%%SfarBrigRed% EE

set SfarRemoveTwoLines=[1A[K[1A[K[1A[K[3B
set SfarRemoveTwoLines=[1A[K[1A[K[1A[K[1A[K[1A[K[7B
set SfarRemoveTwoLines=[4A[J
rem set SfarRemoveTwoLines=
set SfarColorReset=[0m


goto Intro 

:: Logo created using http://patorjk.com/software/taag/ website.



:Intro

cls
set FLogoText=%project_name% 
%sfarLogo%
%sfarRedLine%
@echo.       
@echo  %SfarBrigRed%                    %project_fullname%                                           
@echo.  ..............................................................................................     
@echo.                                                                                 
@echo  %SfarBrigRed%                    Release Version:  %project_version%                          
@echo  %SfarBrigRed%                    Project Author:   %project_author%                           
@echo  %SfarBrigRed%                    Publication Date: %project_publication_date%                 
@echo  %SfarBrigRed%                    Project Repo:     %project_repo%           
@echo.                  
%sfarRedLine%

@echo.
@echo.
@echo.
@echo.
 

if "%microphone%" == "" set microphone=%1
if "%microphone%" == "" goto microphoneNotDefined
pause

goto recordNewFlashcard



:recordNewFlashcard
cls
set FLogoText=%project_name%       
%sfarLogo%
@echo %SfarDarkRed% ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
@echo.
@echo %SfarBrigRed%                                  Recording New Flashcard
@echo.
@echo %SfarDarkRed% ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@echo. 
set filename=
set title=
set /p title="[2CEnter Flashcard Title: [0,37;1m "
echo. %SfarBrigRed%	
if "%title%" == "" echo   Title is empty. I believe that means you want to finish.
if "%title%" == "" goto end  



set filename=%fileFolder%/%filenamePrefixOne%%filenamePrefixTwo%%title%.mp3
if "%fileFolder%" == "" set filename=%filenamePrefixOne%%filenamePrefixTwo%%title%.mp3

:: Create new folder
if "%fileFolder%" NEQ "" mkdir %fileFolder% >nul 2>&1




if exist "%filename%" @echo. 
if exist "%filename%" @echo   Flashcard %SfarDarkGrn%%filename%%SfarBrigRed% already exists!
if exist "%filename%" @echo.
if exist "%filename%" @echo   Press any key to try again... 
if exist "%filename%" pause  > nul 
if exist "%filename%" goto recordNewFlashcard
 
@echo. 
@echo   Filename:  %SfarDarkGrn% %filename%	%SfarBrigRed%
@echo. 
@echo   Press %SfarWhite%any key%SfarBrigRed% to %SfarWhite%start%SfarBrigRed% recording
rem @echo     Press %SfarWhite%Q%SfarBrigRed% to %SfarWhite%finish recording.%SfarBrigRed%
rem @echo     Press %SfarWhite%X%SfarBrigRed% to %SfarWhite%exit.%SfarBrigRed%
pause >nul 

 @echo.
 @echo   %SafrsBgWhite%      •  Recording now                                    %SfarBrigRed%
 @echo.
 @echo   Press %SfarWhite%Q%SfarBrigRed% to %SfarWhite%finish recording.%SfarBrigRed%
 @echo.
rem choice /c xs /n >nul 
rem IF ERRORLEVEL == 0 goto end
rem choice /c abcdefghijklmnopqrstuvwxyz0123456789 /n /m "Press X to continue, or any other key to exit."
rem pause >nul 
rem set "KEY=" & for /F "delims=" %%K in ('
rem     2^> nul xcopy /L /W /I "%~f0" "%TEMP%"
rem ') do if not defined KEY set "KEY=%%K"
rem setlocal EnableDelayedExpansion
rem if /I "!KEY:~-1!"=="X" goto :end




rm "%filename%" >nul 2>&1
rm raw.mp3 >nul 2>&1
%ffmpeg% -f dshow -i audio="%microphone%" -vn -sn  -c:a libmp3lame -ar 44100 -b:a 160k -ac 1 -id3v2_version 3 -metadata:s:v title="%title%" -metadata:s:v comment="Cover (front)"  -af "highpass=f=200, lowpass=f=3000"  -muxpreload 0 -muxdelay 0 raw.mp3
if exist %mp3idTagCoverFile% %ffmpeg% -i raw.mp3 -i %mp3idTagCoverFile% -map 0:0 -map 1:0 -codec copy -id3v2_version 3 -metadata:s:v title="%title%"  -metadata:s:v artist="%mp3idTagArtist%"  -metadata:s:v artist="%mp3idTagYear%"  -metadata:s:v comment="Cover (front)" "%filename%"
rm raw.mp3 >nul 2>&1

echo %SfarRemoveTwoLines%

if not exist "%filename%" @echo.
if not exist "%filename%" @echo   %SfarWhite% Error! %SfarBrigRed% Not saved
if not exist "%filename%" @echo.     
if not exist "%filename%" pause     
if not exist "%filename%" goto end 

if exist "%filename%" @echo.
if exist "%filename%" @echo   Flashcard has been %SfarWhite%saved%SfarBrigRed%. 
if exist "%filename%" @echo.

@echo   Press any key to %SfarWhite% replay %SfarBrigRed% flashcard.
pause > nul

if %vlc% == "" goto recordNewFlashcard
@echo.
@echo.  Flashcard is being %SfarWhite%played%SfarBrigRed% with VLC.
@echo.

%vlc% --qt-minimal-view "%filename%"  vlc://quit       

@echo.
@echo   Press any key to record %SfarWhite%new %SfarBrigRed%flashcard.
pause > nul
goto recordNewFlashcard 


:microphoneNotDefined
cls
set AFLogo=microphoneNotDefinedAFLogo && set FLogoText=%project_fullname% && goto FLogo
:microphoneNotDefinedAFLogo

@echo    It looks like you have not defined you microphone.
@echo.
@echo    You can add this microphone in the header of this file  - line ~16
@echo.      %SfarWhite% set microphone=%SfarDarkGrn%"YOUR_MICROPHONE"%SfarDarkRed%
@echo.
@echo    You can also run this script giving microphone name as paramater:
@echo.      %SfarWhite%%0 %SfarDarkGrn%"YOUR_MICROPHONE"%SfarDarkRed%
@echo.
@echo    To display list of avaliale microphones type this of command line:
@echo.
@echo    %SfarWhite%   ffmpeg -list_devices true -f dshow -i dummy %SfarDarkRed%
@echo.
@echo.   I will try to do this for you.
@echo.   Press any key to see result:
pause > nul
cls
@echo    Microphone list using ffmpeg
echo.
@echo    %SfarWhite%   ffmpeg -list_devices true -f dshow -i dummy %SfarDarkRed%
echo.
echo.
@echo %SfarDarkGrn%
ffmpeg -list_devices true -f dshow -i dummy
@echo %SfarDarkRed%

@echo.

goto end



:end
@echo.
@echo   Exit...
@echo   %SfarColorReset%
