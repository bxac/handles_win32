@IF "%1" EQU "" (
	set p=64
)
@pushd .
@call "\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars%p%.bat"
@popd
@mkdir obj
@mkdir bin

cl /MP8 /Zi /EHsc /Fo"./obj/" /Fe"./bin/test_opened.exe" /DWIN32 /D_DEBUG /DUNICODE /D_UNICODE /MTd handles.c 

IF %ERRORLEVEL% NEQ 0 (
	echo COMPILE ERROR
)
IF %ERRORLEVEL% EQU 0 (
	echo COMPILE OK
	cd bin
	test_opened.exe
)
