md ..\intermediate\d5\release
md ..\bin\d5\release

cd ..\__submodules\mongo-delphi-driver\Tests
"C:\Program Files\Borland\Delphi5\Bin\dcc32" DelphiMongoClientTests.dpr -b -cc
set err=%ERRORLEVEL%

cd ..\..\..\build

exit /B %err%