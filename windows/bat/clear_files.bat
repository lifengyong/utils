@echo off

::设置要删除的目录
set SrcDir=D:\temp\files

::要删除多少天前的文件,*.jpg表示要删除的文件类型
set DaysAgo=5
forfiles /p %SrcDir% /s /m *.log /d -%DaysAgo% /c "cmd /c del /f /q /a @path"

::删除文件后，将空目录删除
for /f "delims=" %%a in ('dir /ad /b /s %SrcDir%\^|sort /r') do (
  rd "%%a">nul 2>nul &&echo empty folder"%%a"delete success!
)
pause