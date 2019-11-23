@echo off
REM docker-build(dob)
REM 
REM Command: dob.cmd command option
REM ビルドしたdockerを簡単に実行する補助コマンド
REM 

REM docker用に /mnt/{drive}/{path} の形式に変換
SET DIR=/mnt/%CD:\=/%
SET DIR=%DIR::=%

SET SHARE_DIR=/local

REM run command ---------------------------------------------
SET IMAGE=%1
SET args=%*
call :shift %args%

call :run_we docker run --rm -it -v %DIR%:%SHARE_DIR% -w %SHARE_DIR% %IMAGE% ls -la
call :run_we docker run --rm -it -v %DIR%:%SHARE_DIR% -w %SHARE_DIR% %IMAGE% %IMAGE% %args%
GOTO END

REM run with echo ==================================================
:run_we
echo %*
%*
exit /b

REM shift ==================================================
:shift
set args=
:shift-loop
if "%~2" neq "" (
  set args=%args%"%~2" 
  shift
  goto :shift-loop
)
exit /b

REM echo all arg ==================================================
:echoAll
for %%a in (%*) do (
  echo %%a
)
:END
