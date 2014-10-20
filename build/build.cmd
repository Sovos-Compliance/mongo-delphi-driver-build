@SET FrameworkDir=C:\Windows\Microsoft.NET\Framework\
@SET FrameworkVersion=v4.0.30319
@SET FrameworkSDKDir=

@SET PATH=%FrameworkDir%%FrameworkVersion%;%FrameworkSDKDir%;%PATH%

call "C:\Program Files (x86)\Embarcadero\RAD Studio\11.0\bin\rsvars.bat"
call build_internal_delphixe4 Release Win64
call build_internal_delphixe4 Release Win32
call build_internal_delphixe4 Debug Win64
call build_internal_delphixe4 Debug Win32
call build_internal_delphixe4 DebugOnDemand Win64
call build_internal_delphixe4 DebugOnDemand Win32

call "C:\Program Files\Borland\BDS\5.0\bin\rsvars.bat"
:: change FrameworkDir64 to FrameworkDir for 32-bit compilation
set FrameworkDir=C:\Windows\Microsoft.NET\Framework\
set PATH=%FrameworkDir%%FrameworkVersion%;%FrameworkSDKDir%;%PATH%
call build_internal_delphid2007 Debug
call build_internal_delphid2007 Release