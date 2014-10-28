SET workspace=%~dp0
:: echo ### Removing previous DCU files ###
:: del /S /Q ..\intermediate\win32\debug
if not exist ..\bin\win32\debug md ..\bin\win32\debug
if not exist ..\intermediate\win32\debug md ..\intermediate\win32\debug
if not exist ..\intermediate\obj md ..\intermediate\obj

set outputDir=..\intermediate\obj



echo ### Building CnvBPL C Files ###
SET CParams=-k -Od


set cFile=%workspace%..\__submodules\convey-private-libs\lbCypher.c
call :BUILDC5_
IF ERRORLEVEL 1 EXIT /B

set cFile=%workspace%..\__submodules\convey-private-libs\CryptText.c
call :BUILDC5_
IF ERRORLEVEL 1 EXIT /B

set cFile=%workspace%..\__submodules\convey-private-libs\Rmd160.c
call :BUILDC5_
IF ERRORLEVEL 1 EXIT /B

set cFile=%workspace%..\__submodules\convey-libs\Soundex.c
call :BUILDC3_
IF ERRORLEVEL 1 EXIT /B

set cFile=%workspace%..\__submodules\convey-cnvzlib\ADLER32.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\deflate.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\inflate.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\inftrees.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\trees.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\infblock.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\infcodes.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\infutil.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\inffast.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B
set cFile=%workspace%..\__submodules\convey-cnvzlib\crc32.c
call :BUILDC5
IF ERRORLEVEL 1 EXIT /B


GOTO :EOF


:BUILDC5_
pushd %outputDir%
C:\Borland\BCC55\Bin\bcc32.exe -v -y -w-par %CParams% -L"C:\Borland\BCC55\Lib" -I"C:\Borland\BCC55\LIB;C:\Borland\BCC55\Include;%workspace%..\__submodules\convey-libs;%workspace%..\__submodules\convey-private-libs;%workspace%..\__submodules\convey-temp-libs\D5\Zlib;%workspace%..\__submodules\convey-validations;%workspace%..\__submodules\convey-private-libs\ZipForge;%workspace%..\__submodules\convey-temp-libs\D5" -c "%cFile%"
popd
GOTO :EOF

:BUILDC5
pushd %outputDir%
C:\Borland\BCC55\Bin\bcc32.exe -v -y -w-par %CParams% -u- -L"C:\Borland\BCC55\Lib" -I"C:\Borland\BCC55\LIB;C:\Borland\BCC55\Include;%workspace%..\__submodules\convey-libs;%workspace%..\__submodules\convey-private-libs;%workspace%..\__submodules\convey-cnvzlib;%workspace%..\__submodules\convey-validations;%workspace%..\__submodules\convey-private-libs\ZipForge;%workspace%..\__submodules\convey-temp-libs\D5" -c "%cFile%"
popd
GOTO :EOF


:BUILDC3_
pushd %outputDir%
"C:\Program Files\Borland\CBuilder3\Bin\bcc32.exe" -v -y -w-par %CParams% -L"C:\Program Files\Borland\CBuilder3\Lib" -I"C:\Program Files\Borland\CBuilder3\LIB;C:\Program Files\Borland\CBuilder3\LIB\OBJ;%workspace%..\__submodules\convey-libs;%workspace%..\__submodules\convey-private-libs;%workspace%..\__submodules\convey-temp-libs\D5\Zlib;%workspace%..\__submodules\convey-validations;%workspace%..\__submodules\convey-private-libs\ZipForge;%workspace%..\__submodules\convey-temp-libs\D5" -c "%cFile%"
popd
GOTO :EOF