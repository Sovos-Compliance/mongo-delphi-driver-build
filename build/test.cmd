cd ..\bin\Win32\Debug\
call DelphiMongoClientTests.exe -console "'..\..\..\TestResults\Win32\Debug\dunit-result-d2007.xml"
call DelphiMongoClientTests_XE4.exe -console "'..\..\..\TestResults\Win32\Debug\dunit-result-xe4.xml"
cd ..\Release\
call DelphiMongoClientTests.exe -console "'..\..\..\TestResults\Win32\Release\dunit-result-d2007.xml"
call DelphiMongoClientTests_XE4.exe -console "'..\..\..\TestResults\Win32\Release\dunit-result-xe4.xml"
cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe -console "'..\..\..\TestResults\Win32\DebugOnDemand\dunit-result-xe4.xml"

cd ..\..\x64\Debug\
call DelphiMongoClientTests.exe -console "'..\..\..\TestResults\x64\Debug\dunit-result-d2007.xml"
call DelphiMongoClientTests_XE4.exe -console "'..\..\..\TestResults\x64\Debug\dunit-result-xe4.xml"
cd ..\Release\
call DelphiMongoClientTests.exe -console "'..\..\..\TestResults\x64\Release\dunit-result-d2007.xml"
call DelphiMongoClientTests_XE4.exe -console "'..\..\..\TestResults\x64\Release\dunit-result-xe4.xml"
cd ..\DebugOnDemand\
call DelphiMongoClientTests_XE4.exe -console "'..\..\..\TestResults\x64\DebugOnDemand\dunit-result-xe4.xml"
