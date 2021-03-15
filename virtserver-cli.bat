@echo off

set READY_API_HOME=%~dp0
set OLDDIR=%CD%
cd /d %READY_API_HOME%

if exist "%READY_API_HOME%..\jre\bin" goto SET_BUNDLED_JAVA
if exist "%JAVA_HOME%" goto SET_JAVA_HOME_JAVA
java -version 2> NUL
if not %ERRORLEVEL%==9009 goto SET_SYSTEM_JAVA
echo Java not found. Install it and set JAVA_HOME to the directory of your local Java installation to proceed.
goto END

:SET_BUNDLED_JAVA
set JAVA=%READY_API_HOME%..\jre\bin\java
goto END_SETTING_JAVA

:SET_JAVA_HOME_JAVA
set JAVA=%JAVA_HOME%\bin\java
goto END_SETTING_JAVA

:SET_SYSTEM_JAVA
echo JAVA_HOME is not set, unexpected results may occur.
echo Set JAVA_HOME to the directory of your local Java installation to avoid this message.
set JAVA=java
goto END_SETTING_JAVA

:END_SETTING_JAVA

:START

"%JAVA%" -jar "%READY_API_HOME%..\tools\virtserver-cli-1.0.9.jar" %*

:END
