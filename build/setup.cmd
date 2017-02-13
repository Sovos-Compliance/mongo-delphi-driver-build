robocopy \\conveydev.com\files\dev\sdlc-ci\development\user\MongoDB\v3.1.2c ..\MongoDB mongod.exe /ZB /X /TEE

set mongoc_v=1-3-0
:: rename to test calling functions from custom dll's using dynamic loading
robocopy %1\ci-support\mongoc-dll ..\bin\Win32\DynamicDllLoad mongo-client_d32_v%mongoc_v%.dll /ZB /X /TEE
del ..\bin\Win32\DynamicDllLoad\libmongoc.dll
rename ..\bin\Win32\DynamicDllLoad\libbson_d32_v%libbson_v%.dll libbson.dll
rename ..\bin\Win32\DynamicDllLoad\mongo-client_d32_v%mongoc_v%.dll libmongoc.dll
robocopy %1\ci-support\mongoc-dll ..\bin\Win64\DynamicDllLoad mongo-client_d64_v%mongoc_v%.dll /ZB /X /TEE 
del ..\bin\Win64\DynamicDllLoad\libmongoc.dll
rename ..\bin\Win64\DynamicDllLoad\mongo-client_d64_v%mongoc_v%.dll libmongoc.dll


robocopy %1\ci-support\mongoc-dll ..\bin\Win32\Debug mongo-client_d32_v%mongoc_v%.dll /ZB /X /TEE 
robocopy %1\ci-support\mongoc-dll ..\bin\Win32\Release mongo-client_r32_v%mongoc_v%.dll /ZB /X /TEE 

robocopy %1\ci-support\mongoc-dll ..\bin\Win64\Debug mongo-client_d64_v%mongoc_v%.dll /ZB /X /TEE 
robocopy %1\ci-support\mongoc-dll ..\bin\Win64\Release mongo-client_r64_v%mongoc_v%.dll /ZB /X /TEE

exit /B 0