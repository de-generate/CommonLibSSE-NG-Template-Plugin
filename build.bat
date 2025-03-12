@echo off

RMDIR dist /S /Q

cmake -S . --preset=build-release-msvc --check-stamp-file "build\release-msvc\CMakeFiles\generate.stamp"
if %ERRORLEVEL% NEQ 0 exit 1
cmake --build build\release-msvc --config Release
if %ERRORLEVEL% NEQ 0 exit 1

xcopy "build\release-msvc\*.dll" "dist\SKSE\Plugins\" /I /Y
@REM xcopy "build\release-msvc\*.pdb" "dist\SKSE\Plugins\" /I /Y

xcopy "package" "dist" /I /Y /E
