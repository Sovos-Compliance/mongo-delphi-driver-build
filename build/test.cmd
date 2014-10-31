@ECHO OFF
set any_error=0
md ..\TestResults

REM Let's run our 32 bits mode tests, compiled with Delphi 2007 and Delphi XE4
set oldStr=DelphiMongoClientTests.exe
set inputFile=DelphiMongoClientTests.xml

cd ..\bin\d5\release\
call DelphiMongoClientTests.exe
if ERRORLEVEL 1 set any_error=1
set newStr=DelphiMongoClientTests_win32_release.exe
set outputFile=..\..\..\TestResults\dunit-result-d5_win32_release.xml
call :REPLACE

cd ..\..\Win32\Debug\
call DelphiMongoClientTests.exe
if ERRORLEVEL 1 set any_error=1

set newStr=DelphiMongoClientTests_Win32_Debug.exe
set outputFile=..\..\..\TestResults\dunit-result-d2007_Win32_Debug.xml
call :REPLACE

cd ..\Release\
call DelphiMongoClientTests.exe
if ERRORLEVEL 1 set any_error=1

set newStr=DelphiMongoClientTests_Win32_Release.exe
set outputFile=..\..\..\TestResults\dunit-result-d2007_Win32_Release.xml
call :REPLACE

set oldStr=DelphiMongoClientTests_XE4.exe
set inputFile=DelphiMongoClientTests_XE4.xml

call DelphiMongoClientTests_XE4.exe
if ERRORLEVEL 1 set any_error=1

set newStr=DelphiMongoClientTests_XE4_Win32_Release.exe
set outputFile=..\..\..\TestResults\dunit-result-xe4_Win32_Release.xml
call :REPLACE

cd ..\Debug\

call DelphiMongoClientTests_XE4.exe
if ERRORLEVEL 1 set any_error=1

set newStr=DelphiMongoClientTests_XE4_Win32_Debug.exe
set outputFile=..\..\..\TestResults\dunit-result-xe4_Win32_Debug.xml
call :REPLACE

cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe mongoc.dll
if ERRORLEVEL 1 set any_error=1

set newStr=DelphiMongoClientTests_XE4_Win32_DebugOnDemand.exe
set outputFile=..\..\..\TestResults\dunit-result-xe4_Win32_DebugOnDemand.xml
call :REPLACE

REM rem Now let's run our 64 bits tests, compiled with DelphiXE4
cd ..\..\x64\Debug\
call DelphiMongoClientTests_XE4.exe
if ERRORLEVEL 1 set any_error=1
set newStr=DelphiMongoClientTests_XE4_x64_Debug.exe
set outputFile=..\..\..\TestResults\dunit-result-xe4_x64_Debug.xml
call :REPLACE

cd ..\Release\
call DelphiMongoClientTests_XE4.exe
if ERRORLEVEL 1 set any_error=1
set newStr=DelphiMongoClientTests_XE4_x64_Release.exe
set outputFile=..\..\..\TestResults\dunit-result-xe4_x64_Release.xml
call :REPLACE

cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe mongoc.dll
if ERRORLEVEL 1 set any_error=1
set newStr=DelphiMongoClientTests_XE4_x64_DebugOnDemand.exe
set outputFile=..\..\..\TestResults\dunit-result-xe4_x64_DebugOnDemand.xml
call :REPLACE

ping 1.1.1.111 -n 1 -w 3000 > nul

rem Let's go back to our Build folder
cd ..\..\..\Build

rem Remove all the databases generated during the tests
rd ..\MongoDB\MongoData /S /Q
rd ..\MongoDB\MongoDataReplica_1 /S /Q
rd ..\MongoDB\MongoDataReplica_2 /S /Q
rd ..\MongoDB\MongoDataReplica_3 /S /Q

exit /B %any_error%

:REPLACE
powershell -Command "& {(Get-Content %inputFile%) -replace '%oldStr%', '%newStr%' | Set-Content %outputFile%}"
GOTO :EOF
