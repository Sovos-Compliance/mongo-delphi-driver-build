taskkill /F /T /IM mongod.exe

set any_error=0

cd ..
if not exist TestResults (
  md TestResults
) else (
  del /Q TestResults\*.xml
)

cd mongodb
rd MongoData /S /Q
md MongoData
start "27017" /MIN mongod.exe --quiet --smallfiles --dbpath MongoData

cd ..\bin\Win32\release
set suffix=win32_release

set test=tests_mongoc_wrapper_delphi_2007
call :REPLACE

:: Won't call D5 tests anymore
:: set test=tests_mongoc_wrapper_delphi_5
:: call :REPLACE

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
set args=libbson.dll libmongoc.dll

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
set args=libbson.dll libmongoc.dll

set test=tests_mongoc_wrapper_delphi_xe4
call :REPLACE
set args=

cd ..\..\..\Build
taskkill /F /T /IM mongod.exe
exit /B %any_error%

:REPLACE
%test%.exe %args%
if ERRORLEVEL 1 set any_error=1
powershell -Command "& {(Get-Content %test%.xml) -replace '%test%.exe', '%test%_%suffix%.exe' | Set-Content ..\..\..\TestResults\dunit-result-%test%_%suffix%.xml}"
GOTO :EOF
