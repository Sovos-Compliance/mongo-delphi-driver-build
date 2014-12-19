md ..\intermediate\Win32\release\d5
md ..\bin\Win32\release

cd ..\__submodules\mongoc-wrapper-delphi\tests
"C:\Program Files\Borland\Delphi5\Bin\dcc32" tests_mongoc_wrapper_delphi_5.dpr -b -cc
set err=%ERRORLEVEL%

cd ..\..\..\build

exit /B %err%