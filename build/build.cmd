SET FrameworkDir=C:\Windows\Microsoft.NET\Framework\
SET FrameworkVersion=v4.0.30319
SET FrameworkSDKDir=
SET PATH=%FrameworkDir%%FrameworkVersion%;%FrameworkSDKDir%;%PATH%

call "C:\Program Files (x86)\Embarcadero\RAD Studio\11.0\bin\rsvars.bat"
call build_internal_delphixe4 Release Win64
if ERRORLEVEL 1 goto fail
call build_internal_delphixe4 Release Win32
if ERRORLEVEL 1 goto fail
call build_internal_delphixe4 Debug Win64
if ERRORLEVEL 1 goto fail
call build_internal_delphixe4 Debug Win32
if ERRORLEVEL 1 goto fail
call build_internal_delphixe4 DynamicDllLoad Win64
if ERRORLEVEL 1 goto fail
call build_internal_delphixe4 DynamicDllLoad Win32
if ERRORLEVEL 1 goto fail

call "C:\Program Files\Borland\BDS\5.0\bin\rsvars.bat"
:: change FrameworkDir64 to FrameworkDir for 32-bit compilation
set FrameworkDir=C:\Windows\Microsoft.NET\Framework\
set PATH=%FrameworkDir%%FrameworkVersion%;%FrameworkSDKDir%;%PATH%

call build_internal_delphid2007 Debug
if ERRORLEVEL 1 goto fail
call build_internal_delphid2007 Release
if ERRORLEVEL 1 goto fail
call build_internal_delphi5
if ERRORLEVEL 1 goto fail

exit /B 0

:fail
exit /B 1