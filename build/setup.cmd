robocopy \\conveydev.com\files\dev\sdlc-ci\development\user\MongoDB\v3.1.2c ..\MongoDB mongod.exe /ZB /X /TEE

set libbson_v=1-1-0
set mongoc_v=1-1-0
:: rename to test calling functions from custom dll's using dynamic loading
robocopy %1\user\libbson-dll ..\bin\Win32\DynamicDllLoad libbson_d32_v%libbson_v%.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win32\DynamicDllLoad mongo-client_d32_v%mongoc_v%.dll /ZB /X /TEE 
rename ..\bin\Win32\DynamicDllLoad\libbson_d32_v%libbson_v%.dll libbson.dll
rename ..\bin\Win32\DynamicDllLoad\mongo-client_d32_v%mongoc_v%.dll libmongoc.dll
robocopy %1\user\libbson-dll ..\bin\Win64\DynamicDllLoad libbson_d64_v%libbson_v%.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win64\DynamicDllLoad mongo-client_d64_v%mongoc_v%.dll /ZB /X /TEE 
rename ..\bin\Win64\DynamicDllLoad\libbson_d64_v%libbson_v%.dll libbson.dll
rename ..\bin\Win64\DynamicDllLoad\mongo-client_d64_v%mongoc_v%.dll libmongoc.dll


robocopy %1\user\mongoc-dll ..\bin\Win32\Debug mongo-client_d32_v%mongoc_v%.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win32\Release mongo-client_r32_v%mongoc_v%.dll /ZB /X /TEE 

robocopy %1\user\mongoc-dll ..\bin\Win64\Debug mongo-client_d64_v%mongoc_v%.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win64\Release mongo-client_r64_v%mongoc_v%.dll /ZB /X /TEE

exit /B 0