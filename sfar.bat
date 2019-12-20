chcp 65001
@echo off 

::   Debugging
::   use this to hide debug info - line starting with %dbg%
::   set dbg=rem   
::   use this to show debug info - line starting with %dbg%
::   set dbg= 

set dbg=rem
set dev=rem 

REM if exist d:\dev.txt set  dev=
REM if exist d:\dev.txt set  dbg=


set project_name=Simple Flashcard Audio Recorder script
set project_short=Sfar
set project_fullname=%project_name% (%project_short%)
set project_version=0.0.3
set project_author=Karol Gruszczynski 
set project_publication_date=19/12/2019 
set project_repo=https://github.com/kgruszczynski/sfar



set microphone=
set microphone=Mikrofon (Microphone Control (DVR))
REM %dev%%dbg% if exist micname.txt set /p microphone=<micname.txt
if exist mic.txt set microphone=Mikrofon (Microphone Control (DVR))
%dev%%dbg% echo %microphone%
%dev%%dbg% pause 

set fileFolder=flashcards
set filenamePrefixOne=PartA_
set filenamePrefixTwo=Section3_
set mp3idTagArtist=%project_fullname% 
set mp3idTagYear=2019
set mp3idTagCoverFile=cover.jpeg

set vlc="C:\Program Files\VideoLAN\VLC\vlc.exe"
set ffmpeg=ffmpeg -hide_banner -loglevel panic

%dbg% set ffmpeg=ffmpeg 



set SfarTextDefault=[40m[1m
set SfarBrigRed=[31;1m%SfarTextDefault%
set SfarDarkRed=[31m%SfarTextDefault%
set SfarDarkGrn=[32;1m%SfarTextDefault%
set SfarWhite=[37;1m%SfarTextDefault%
set SafrsBgWhite=[47;1m[31;1m[1m
set SfarColorReset=[37m%SfarTextDefault%
set SfarRemoveFourLines=[4A[J
set SfarRemoveFourLines=[1AK[1A2K[1A2K[1A2K[4B
set SfarRemoveFourLines=[A[2K[A[2K[A[2K[A[2K[A[2K[A[2K
set sfarLogoLine=%SfarBrigRed%           ███████║  
set LogoText1=%SfarDarkGrn%%project_name%%SfarBrigRed% 
set LogoText=%LogoText1%
set sfarRedLine=echo %SfarDarkRed% ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ %SfarBrigRed%
       
:: Logo created using http://patorjk.com/software/taag/ website 
rem set sfarLogo=%SfarBrigRed% %sfarET% %sfarET%███████╗███████╗ █████╗ ██████╗%sfarET%██╔════╝██╔════╝██╔══██╗██╔══██╗%sfarET%███████╗█████╗  ███████║██████╔╝%sfarET%╚════██║██╔══╝  ██╔══██║██╔══██╗%sfarET%███████║██║     ██║  ██║██║  ██║%sfarET%╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝

powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/kgruszczynski/sfar/master/banner.txt','%cd%banner.txt')

goto Intro

:FLogo 

@echo.
@echo. %sfarLogoLine%
@echo. %sfarLogoLine%███████╗███████╗ █████╗ ██████╗ 
@echo. %sfarLogoLine%██╔════╝██╔════╝██╔══██╗██╔══██╗
@echo. %sfarLogoLine%███████╗█████╗  ███████║██████╔╝
@echo. %sfarLogoLine%╚════██║██╔══╝  ██╔══██║██╔══██╗
@echo. %sfarLogoLine%███████║██║     ██║  ██║██║  ██║
@echo. %sfarLogoLine%╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝
@echo. %SfarBrigRed%           ╚══════╝  %LogoText%
goto %AFLogo%
 

:Intro
cls
set LogoText= && set AFLogo=Intro2 && goto FLogo
:Intro2
echo.
%sfarRedLine%
@echo.       
@echo  %SfarBrigRed%                    %project_fullname%                                           
@echo. ..............................................................................................     
@echo.                                                                                 
@echo  %SfarBrigRed%                    Release Version:  %project_version%                          
@echo  %SfarBrigRed%                    Project Author:   %project_author%                           
@echo  %SfarBrigRed%                    Publication Date: %project_publication_date%                 
@echo  %SfarBrigRed%                    Project Repo:     %project_repo%           
@echo.                  
%sfarRedLine%
@echo.
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/kgruszczynski/sfar/master/banner.txt','%cd%banner.txt')
@if exist banner.txt  type banner.txt


pause
if "%microphone%" == "" set microphone=%1
if "%microphone%" == "" goto microphoneNotDefined


goto recordNewFlashcard



:recordNewFlashcard
cls
 
set LogoText=%LogoText1% && set AFLogo=recordNewFlashcard2 && goto FLogo
:recordNewFlashcard2
echo.
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

echo.%title% | findstr /R /C:"[^a-z0-9-_]."  1>nul

if errorlevel 1 (
  goto FileNameIsLegal
) ELSE (
  goto FileNameNotLegal
)

:FileNameNotLegal
@echo. 
@echo.  Title contains illegal character(s).
@echo.   
@echo   Press any key to try again... 
pause > nul 
goto recordNewFlashcard

:FileNameIsLegal

set filename=%fileFolder%/%filenamePrefixOne%%filenamePrefixTwo%%title%.mp3
if "%fileFolder%" == "" set filename=%filenamePrefixOne%%filenamePrefixTwo%%title%.mp3

:: Create new folder
if "%fileFolder%" NEQ "" mkdir %fileFolder% >nul 2>&1



if exist "%filename%" @echo   Flashcard %SfarDarkGrn%%filename%%SfarBrigRed% already exists!
if exist "%filename%" @echo.
if exist "%filename%" @echo   Press any key to try again... 
if exist "%filename%" pause  > nul 
if exist "%filename%" goto recordNewFlashcard

@echo   Filename:  %SfarDarkGrn% %filename%	%SfarBrigRed%
@echo. 
@echo   Press %SfarWhite%any key%SfarBrigRed% to %SfarWhite%start%SfarBrigRed% recording.

pause >nul 

 @echo.
 @echo   %SafrsBgWhite%      •  RECORDING NOW                           %SfarBrigRed%
 @echo.
 @echo   Press %SfarWhite%Q%SfarBrigRed% to %SfarWhite%finish recording%SfarBrigRed%.
 @echo.

rm "%filename%" >nul 2>&1
rm "%filename%" >nul 2>&1
del /s /f raw.mp3 >nul 2>&1
del /s /f raw.mp3 >nul 2>&1
%dbg% pause
%dbg% ffmpeg -loglevel panic
%dbg% pause 
%ffmpeg% -f dshow -i audio="%microphone%" -vn -sn  -c:a libmp3lame -ar 44100 -b:a 160k -ac 1 -id3v2_version 3 -metadata:s:v title="%title%" -metadata:s:v comment="Cover (front)"  -af "highpass=f=200, lowpass=f=3000"  -muxpreload 0 -muxdelay 0 raw.mp3
%dbg% pause

%dbg% pause 
@echo.
if exist raw.mp3 @echo. [A[2K[A[2K[A[2K[A[2K[A[2K[A[2K[A[2K[A[2K
if exist raw.mp3 @echo.  Recording %SfarWhite%finished and saved.%SfarBrigRed%  
if exist raw.mp3 @echo.  
  
if exist %mp3idTagCoverFile%   @echo   Adding %SfarWhite%cover image%SfarBrigRed% to your file.
if exist %mp3idTagCoverFile%   @echo.  
if exist %mp3idTagCoverFile% %ffmpeg% -i raw.mp3 -i %mp3idTagCoverFile% -map 0:0 -map 1:0 -codec copy -id3v2_version 3 -metadata:s:v title="%title%"  -metadata:s:v artist="%mp3idTagArtist%"  -metadata:s:v artist="%mp3idTagYear%"  -metadata:s:v comment="Cover (front)" "%filename%"
if not exist %mp3idTagCoverFile% copy raw.mp3 "%filename%"

rm raw.mp3 >nul 2>&1
del /s /f raw.mp3 >nul 2>&1

if not exist "%filename%" @echo   %SfarWhite% Error! %SfarBrigRed% Not saved.
if not exist "%filename%" @echo.     
if not exist "%filename%" pause     
if not exist "%filename%" goto end 

if exist "%filename%" @echo   Flashcard has been%SfarWhite% saved%SfarBrigRed%. 
if exist "%filename%" @echo.

@echo   Press any key to %SfarWhite% replay %SfarBrigRed% flashcard.
@echo.
pause > nul

if %vlc% == "" goto recordNewFlashcard

REM @echo. [A[2K[1A[2K Flashcard is being %SfarWhite% played %SfarBrigRed% with VLC.
@echo. [A[2K[1A[2K%SafrsBgWhite%  New flashcard is being PLAYED in VLS. %SfarBrigRed%
@echo.

%vlc% --qt-minimal-view "%filename%"  vlc://quit       

@echo. [A[2K[A[2K[A[2K
@echo. [40m[1m %SfarBrigRed%Press any key to%SfarWhite% create new %SfarBrigRed%flashcard.
pause > nul
goto recordNewFlashcard 


:microphoneNotDefined
cls
cls
set FLogoText=%project_name%   
set LogoText=%LogoText1% && set AFLogo=microphoneNotDefined2 && goto FLogo
:microphoneNotDefined2

@echo.
@echo.
@echo    It looks like you have not defined you microphone.
@echo.   %SfarDarkRed%
@echo    You can set your microphone in the header of this file  - line ~28.
@echo.
@echo.      %SfarWhite%set microphone=%SfarDarkGrn%"YOUR_MICROPHONE"
@echo.   %SfarDarkRed%
@echo.   You can also set other nice features:
@echo.
@echo.      %SfarWhite%set fileFolder=%SfarDarkGrn%%fileFolder%
@echo.      %SfarWhite%set filenamePrefixOne=%SfarDarkGrn%%filenamePrefixOne%
@echo.      %SfarWhite%set filenamePrefixTwo=%SfarDarkGrn%%filenamePrefixTwo%
@echo.      %SfarWhite%set mp3idTagArtist=%SfarDarkGrn%%mp3idTagArtist% 
@echo.      %SfarWhite%set mp3idTagYear=%SfarDarkGrn%%mp3idTagYear%
@echo.      %SfarWhite%set mp3idTagCoverFile=%SfarDarkGrn%%mp3idTagCoverFile%
@echo.   %SfarDarkRed%
@echo    You can also run this script giving microphone name as paramater:
@echo.
@echo.      %SfarWhite% %0 %SfarDarkGrn%"YOUR_MICROPHONE"%SfarDarkRed%
@echo.   %SfarDarkRed%
@echo    This is a sample line I am using on my home laptop:
@echo.
@echo.      %SfarWhite%%0 %SfarDarkGrn%"Mikrofon (Microphone Control (DVR))"%SfarDarkRed%
@echo.   %SfarDarkRed% 
@echo    To display list of available microphones (for ffmpeg) just type this in command line:
@echo.
@echo    %SfarWhite%   ffmpeg -list_devices true -f dshow -i dummy %SfarDarkRed%
@echo.   %SfarDarkRed%
@echo.   I will try to do this for you.
@echo.   %SfarDarkRed%
@echo.   Press any key to see result:
echo.
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
@echo.  Exit...
@echo.  %SfarColorReset%
