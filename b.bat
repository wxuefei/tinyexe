@echo off
set vc=D:\Tools\vs2019\Community\VC\Tools\MSVC\14.29.30133
set sdk=C:\Program Files (x86)\Windows Kits\10
set sdk_inc=%sdk%\Include\10.0.19041.0
set sdk_lib=%sdk%\Lib\10.0.19041.0

set INCLUDE=%vc%\include;
set INCLUDE=%INCLUDE%;%sdk_inc%\um
set INCLUDE=%INCLUDE%;%sdk_inc%\ucrt
set INCLUDE=%INCLUDE%;%sdk_inc%\shared

set LIB=%vc%\lib\x64
set LIB=%LIB%;%sdk_lib%\um\x64
set LIB=%LIB%;%sdk_lib%\ucrt\x64
set cc=%vc%\bin\Hostx64\x64\cl.exe
set ld=%vc%\bin\Hostx64\x64\link.exe

set cflag=/permissive- /GS- /W3 /Gy /Zc:wchar_t /Gm- /Od /sdl- 
set cflag=%cflag% /Zc:inline /fp:precise /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /errorReport:prompt /WX- /Zc:forScope
set cflag=%cflag% /Gd /MD /FC /EHsc /nologo
set cflag=%cflag% /diagnostics:column 
:set cflag=%cflag% /Fa"t.asm"

set lflag=/MANIFEST:NO /NXCOMPAT /DYNAMICBASE:NO /MACHINE:X64 /ENTRY:"main" 
set lflag=%lflag% /OPT:REF /INCREMENTAL:NO /SUBSYSTEM:CONSOLE /ERRORREPORT:PROMPT 
set lflag=%lflag% /NOLOGO /NODEFAULTLIB /TLBID:1 

set libs=kernel32.lib

%cc% %cflag% /c /Fo"t.obj" main.c

%ld% %lflag% %libs% /out:t.exe t.obj
