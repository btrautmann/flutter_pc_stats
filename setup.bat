:: Pull latest changes from repo and grab dependencies
cd C:\Users\Brandon\Development\pc_stats
echo Fetching latest changes...
CALL git pull
CALL flutter pub get

:: Get IP of machine running the script
echo Getting IP address for SignalR Server...
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo Using IP address: %NetworkIP%

:: Echo IP into .env file for use
echo PC_STATS_IP=%NetworkIP% > .env
echo PC_STATS_PORT=7188 >> .env

:: Export ENV variables with IP using default PORT
SETX PC_STATS_IP "%NetworkIP%"
SETX PC_STATS_PORT "7188"

:: Start SignalR server
START SignalRServer/bin/Release/net6.0/SignalRServer.exe

:: Start Flutter application
CALL flutter run -d ZY224LJPKC
