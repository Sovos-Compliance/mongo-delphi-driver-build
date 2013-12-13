set BDS=C:\Program Files (x86)\Embarcadero\RAD Studio\11.0\
call build_internal ..\DelphiMongoTests.groupproj Release Win64
call build_internal ..\DelphiMongoTests.groupproj Release Win32
call build_internal ..\DelphiMongoTests.groupproj Debug Win64
call build_internal ..\DelphiMongoTests.groupproj Debug Win32
call build_internal ..\DelphiMongoTests.groupproj DebugOnDemand Win64
call build_internal ..\DelphiMongoTests.groupproj DebugOnDemand Win32