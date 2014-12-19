robocopy %1\user\MongoDB\v2.5.6c ..\MongoDB /ZB /X /TEE

robocopy %1\user\libbson-dll ..\bin\Win32\Debug libbson_d32_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\Win32\DynamicDllLoad libbson_d32_v1-0-1.dll /ZB /X /TEE 
:: rename to test calling functions from custom dll
rename ..\bin\Win32\DynamicDllLoad\libbson_d32_v1-0-1.dll libbson.dll
robocopy %1\user\libbson-dll ..\bin\Win32\Release libbson_r32_v1-0-1.dll /ZB /X /TEE 

robocopy %1\user\libbson-dll ..\bin\Win64\Debug libbson_d64_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\Win64\DynamicDllLoad libbson_d64_v1-0-1.dll /ZB /X /TEE 
rename ..\bin\Win64\DynamicDllLoad\libbson_d64_v1-0-1.dll libbson.dll
robocopy %1\user\libbson-dll ..\bin\Win64\Release libbson_r64_v1-0-1.dll /ZB /X /TEE 

robocopy %1\user\mongoc-dll ..\bin\Win32\Debug mongo-client_d32_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win32\DynamicDllLoad mongo-client_d32_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win32\Release mongo-client_r32_v1-0-1.dll /ZB /X /TEE 

robocopy %1\user\mongoc-dll ..\bin\Win64\Debug mongo-client_d64_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win64\DynamicDllLoad mongo-client_d64_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win64\Release mongo-client_r64_v1-0-1.dll /ZB /X /TEE

exit /B 0