call build_internal_vs Release x64
call build_internal_vs Release Win32
call build_internal_vs Debug x64
call build_internal_vs Debug Win32


set BDS=C:\Program Files (x86)\Embarcadero\RAD Studio\11.0\
call build_internal_delphixe4 ..\DelphiMongoTests.groupproj Release Win64
call build_internal_delphixe4 ..\DelphiMongoTests.groupproj Release Win32
call build_internal_delphixe4 ..\DelphiMongoTests.groupproj Debug Win64
call build_internal_delphixe4 ..\DelphiMongoTests.groupproj Debug Win32
call build_internal_delphixe4 ..\DelphiMongoTests.groupproj DebugOnDemand Win64
call build_internal_delphixe4 ..\DelphiMongoTests.groupproj DebugOnDemand Win32

copy ..\bin\win32\Debug\MongoC.dll ..\bin\Win32\DebugOnDemand\
copy ..\bin\x64\Debug\MongoC.dll ..\bin\x64\DebugOnDemand\