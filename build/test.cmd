rem Let's run our 32 bits mode tests, compiled with Delphi 2007 and Delphi XE4
cd ..\bin\Win32\Debug\
call DelphiMongoClientTests.exe -console "..\..\..\TestResults\Win32\Debug\dunit-result-d2007.xml"
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\Win32\Debug\dunit-result-xe4.xml"
cd ..\Release\
call DelphiMongoClientTests.exe -console "..\..\..\TestResults\Win32\Release\dunit-result-d2007.xml"
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\Win32\Release\dunit-result-xe4.xml"
cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\Win32\DebugOnDemand\dunit-result-xe4.xml"

rem Now let's run our 64 bits tests, compiled with DelphiXE4
cd ..\..\x64\Debug\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\x64\Debug\dunit-result-xe4.xml"
cd ..\Release\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\x64\Release\dunit-result-xe4.xml"
cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe -console "..\..\..\TestResults\x64\DebugOnDemand\dunit-result-xe4.xml"

ping 1.1.1.111 -n 1 -w 3000 > nul

rem Let's go back to our Build folder
cd ..\..\..\Build

rem Remove all the databases generated during the tests
rd ..\MongoDB\MongoData /S /Q
rd ..\MongoDB\MongoDataReplica_1 /S /Q
rd ..\MongoDB\MongoDataReplica_2 /S /Q
rd ..\MongoDB\MongoDataReplica_3 /S /Q
