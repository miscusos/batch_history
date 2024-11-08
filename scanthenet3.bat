@echo off
setlocal enabledelayedexpansion
color 0a

:: Title for better identification when running the script
title Network Device Scanner and Identifier

:: Define MAC address prefixes for different device types
set "computer_prefixes=00-1A-2B 00-1B-44 00-1C-23 2C-AB-25 3C-55-76 ..."
set "phone_prefixes=00-21-5C 00-22-68 00-23-45 ..."
set "tv_prefixes=00-24-81 00-25-96 00-26-AB ..."
set "printer_prefixes=00-27-10 00-28-FF 00-29-7E ..."

:: Network IP range and settings for ping and timeout
set "network_prefix=192.168.1"
set "ping_count=1"
set "ping_timeout=1"

:: Log file setup
set "log_file=scan_log.txt"
echo Scanning devices on network range %network_prefix%.0 to %network_prefix%.254 > %log_file%
echo.

:: Loop through the IP range from 1 to 254
for /L %%i in (1,1,254) do (
    set "ip=%network_prefix%.%%i"
    ping -n %ping_count% -w %ping_timeout% !ip! >nul && (
        arp -a !ip! | findstr /i "!ip!" >nul && (
            for /f "tokens=1,2 delims= " %%A in ('arp -a !ip! ^| findstr /i "!ip!"') do (
                if not "%%A"=="Interface:" (
                    set "mac=%%B"
                    set "mac_prefix=!mac:~0,8!"
                    set "device_type=Unknown"

                    :: Check against predefined lists
                    for %%P in (%computer_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=Computer"
                    for %%P in (%phone_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=Phone"
                    for %%P in (%tv_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=TV"
                    for %%P in (%printer_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=Printer"

                    :: Manual lookup for known devices
                    if "!mac!"=="54-c2-50-e5-ab-f0" set "device_type=Router"
                    if "!mac!"=="90-78-b2-89-f4-73" set "device_type=Smartphone"
                    
                    :: Output to console and log file
                    echo IP: !ip!  MAC: !mac!  Device Type: !device_type!
                    echo IP: !ip!  MAC: !mac!  Device Type: !device_type! >> %log_file%
                )
            )
        )
    )
)

:: Completion message
echo.
echo Network scan complete. Results saved to %log_file%.
pause

endlocal
