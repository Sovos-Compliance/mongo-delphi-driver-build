@ECHO OFF
set any_error=0
rd ..\TestResults /S /Q

REM Let's run our 32 bits mode tests, compiled with Delphi 2007 and Delphi XE4
cd ..\bin\Win32\Debug\
call DelphiMongoClientTests.exe -console "..\..\..\TestResults\Win32\Debug\dunit-result-d2007.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests.exe
set newStr=DelphiMongoClientTests_Win32_Debug.exe
set inputFile=..\..\..\TestResults\Win32\Debug\dunit-result-d2007.xml
set outputFile=..\..\..\TestResults\dunit-result-d2007_Win32_Debug.xml
call :REPLACE

call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\Win32\Debug\dunit-result-xe4.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests_XE4.exe
set newStr=DelphiMongoClientTests_XE4_Win32_Debug.exe
set inputFile=..\..\..\TestResults\Win32\Debug\dunit-result-xe4.xml
set outputFile=..\..\..\TestResults\dunit-result-xe4_Win32_Debug.xml
call :REPLACE

cd ..\Release\
call DelphiMongoClientTests.exe -console "..\..\..\TestResults\Win32\Release\dunit-result-d2007.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests.exe
set newStr=DelphiMongoClientTests_Win32_Release.exe
set inputFile=..\..\..\TestResults\Win32\Release\dunit-result-d2007.xml
set outputFile=..\..\..\TestResults\dunit-result-d2007_Win32_Release.xml
call :REPLACE

call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\Win32\Release\dunit-result-xe4.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests_XE4.exe
set newStr=DelphiMongoClientTests_XE4_Win32_Release.exe
set inputFile=..\..\..\TestResults\Win32\Release\dunit-result-xe4.xml
set outputFile=..\..\..\TestResults\dunit-result-xe4_Win32_Release.xml
call :REPLACE

cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\Win32\DebugOnDemand\dunit-result-xe4.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests_XE4.exe
set newStr=DelphiMongoClientTests_XE4_Win32_DebugOnDemand.exe
set inputFile=..\..\..\TestResults\Win32\DebugOnDemand\dunit-result-xe4.xml
set outputFile=..\..\..\TestResults\dunit-result-xe4_Win32_DebugOnDemand.xml
call :REPLACE

REM rem Now let's run our 64 bits tests, compiled with DelphiXE4
cd ..\..\x64\Debug\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\x64\Debug\dunit-result-xe4.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests_XE4.exe
set newStr=DelphiMongoClientTests_XE4_x64_Debug.exe
set inputFile=..\..\..\TestResults\x64\Debug\dunit-result-xe4.xml
set outputFile=..\..\..\TestResults\dunit-result-xe4_x64_Debug.xml
call :REPLACE

cd ..\Release\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\x64\Release\dunit-result-xe4.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests_XE4.exe
set newStr=DelphiMongoClientTests_XE4_x64_Release.exe
set inputFile=..\..\..\TestResults\x64\Release\dunit-result-xe4.xml
set outputFile=..\..\..\TestResults\dunit-result-xe4_x64_Release.xml
call :REPLACE

cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\x64\DebugOnDemand\dunit-result-xe4.xml"
if ERRORLEVEL 1 set any_error=1
set oldStr=DelphiMongoClientTests_XE4.exe
set newStr=DelphiMongoClientTests_XE4_x64_DebugOnDemand.exe
set inputFile=..\..\..\TestResults\x64\DebugOnDemand\dunit-result-xe4.xml
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

if %any_error% EQU 1 exit /B 1
exit /B

:REPLACE
powershell -Command "& {(Get-Content %inputFile%) -replace '%oldStr%', '%newStr%' | Set-Content %outputFile%}"
GOTO :EOF
