set any_error=0
md ..\TestResults

cd ..\bin\Win32\release
set suffix=win32_release

set test=tests_mongoc_wrapper_delphi_2007
call :REPLACE

set test=tests_mongoc_wrapper_delphi_5
call :REPLACE

set test=tests_mongoc_wrapper_delphi_xe4
call :REPLACE

cd ..\Debug
set suffix=win32_debug

set test=tests_mongoc_wrapper_delphi_2007
call :REPLACE

set test=tests_mongoc_wrapper_delphi_xe4
call :REPLACE

cd ..\DynamicDllLoad
set suffix=win32_DynamicDllLoad
set args=libbson.dll

set test=tests_mongoc_wrapper_delphi_xe4
call :REPLACE
set args=

cd ..\..\Win64\Release
set suffix=win64_release

set test=tests_mongoc_wrapper_delphi_xe4
call :REPLACE

cd ..\Debug
set suffix=win64_debug

set test=tests_mongoc_wrapper_delphi_xe4
call :REPLACE

cd ..\DynamicDllLoad
set suffix=win64_DynamicDllLoad
set args=libbson.dll

set test=tests_mongoc_wrapper_delphi_xe4
call :REPLACE
set args=

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
call %test% %args%
if ERRORLEVEL 1 set any_error=1
powershell -Command "& {(Get-Content %test%.xml) -replace '%test%.exe', '%test%_%suffix%.exe' | Set-Content ..\..\..\TestResults\dunit-result-%test%_%suffix%.xml}"
GOTO :EOF
