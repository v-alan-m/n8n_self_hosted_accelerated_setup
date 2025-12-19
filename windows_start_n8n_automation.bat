@echo off
REM =====================================
REM CONFIGURATION
REM =====================================
REM Path to your Docker project
set PROJECT_DIR=C:\Users\VAM\Desktop\desktop_all_files\projects\python\n8n\n8n_self_hosted_accelerated_setup

REM Path to Docker Desktop executable
set DOCKER_DESKTOP="C:\Program Files\Docker\Docker\Docker Desktop.exe"

REM =====================================
REM START DOCKER DESKTOP
REM =====================================
echo Starting Docker Desktop...
start "" %DOCKER_DESKTOP%

REM =====================================
REM WAIT FOR DOCKER TO BE READY
REM =====================================
echo Waiting for Docker to start...
:waitloop
docker info >nul 2>&1
IF ERRORLEVEL 1 (
    timeout /t 5 >nul
    goto waitloop
)

echo Docker is running.

REM =====================================
REM CHANGE DIRECTORY
REM =====================================
echo Changing directory to %PROJECT_DIR%
cd /d "%PROJECT_DIR%"

IF ERRORLEVEL 1 (
    echo Failed to change directory.
    pause
    exit /b 1
)

REM =====================================
REM RUN DOCKER COMPOSE
REM =====================================
echo Running docker compose up -d
docker compose up -d

IF ERRORLEVEL 1 (
    echo Docker Compose failed.
    pause
    exit /b 1
)

echo Docker Compose started successfully.
pause
