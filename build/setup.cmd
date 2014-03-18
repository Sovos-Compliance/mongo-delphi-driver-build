robocopy %1\user\MongoDB\v2.5.6c ..\MongoDB /ZB /X /TEE

robocopy %1\user\libbson-dll ..\bin\Win32\Debug libbson_d32_v0-6-5.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\Win32\DebugOnDemand libbson_d32_v0-6-5.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\Win32\Release libbson_r32_v0-6-5.dll /ZB /X /TEE 

robocopy %1\user\libbson-dll ..\bin\x64\Debug libbson_d64_v0-6-5.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\x64\DebugOnDemand libbson_d64_v0-6-5.dll /ZB /X /TEE 
robocopy %1\user\libbson-dll ..\bin\x64\Release libbson_r64_v0-6-5.dll /ZB /X /TEE 


exit /B 0