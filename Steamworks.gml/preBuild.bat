@echo off
set dllPath=%~1
set solutionDir=%~2
set projectDir=%~3
set arch=%~4
set config=%~5

echo Running pre-build for %config%

where /q GmlCppExtFuncs
if %ERRORLEVEL% EQU 0 (
	echo Running GmlCppExtFuncs...
	
	GmlCppExtFuncs ^
	--prefix itr_test^
	--prepend "// steam_autogen.cpp: Generated by GmlCppExtFuncs. Don't touch this!"^
	--cpp "%projectDir%steam_autogen.cpp"^
	--gml "%solutionDir%Steamworks_23/extensions/Steamworks_gml/steam_autogen.gml"^
	%projectDir%steam_*.cpp
) else (
	echo preBuild.bat: Warning N/A: Could not find GmlCppExtFuncs - `dllg` functions will not be auto-updated.
)