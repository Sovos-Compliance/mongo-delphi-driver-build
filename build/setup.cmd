robocopy %1\user\MongoDB\v2.5.6c ..\MongoDB /ZB /X /TEE

robocopy %1\user\libbson-dll ..\bin\Win32\Debug libbson_d32_v1-0-0.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\Win32\DebugOnDemand libbson_d32_v1-0-0.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\Win32\Release libbson_r32_v1-0-0.dll /ZB /X /TEE 

robocopy %1\user\libbson-dll ..\bin\x64\Debug libbson_d64_v1-0-0.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\x64\DebugOnDemand libbson_d64_v1-0-0.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\x64\Release libbson_r64_v1-0-0.dll /ZB /X /TEE 

robocopy %1\user\mongoc-dll ..\bin\Win32\Debug mongoc_d32_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win32\DebugOnDemand mongoc_d32_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\Win32\Release mongoc_r32_v1-0-1.dll /ZB /X /TEE 

robocopy %1\user\mongoc-dll ..\bin\x64\Debug mongoc_d64_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\x64\DebugOnDemand mongoc_d64_v1-0-1.dll /ZB /X /TEE 
robocopy %1\user\mongoc-dll ..\bin\x64\Release mongoc_r64_v1-0-1.dll /ZB /X /TEE


exit /B 0