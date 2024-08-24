@echo off
setlocal enabledelayedexpansion
color 0a

:: Define MAC address prefixes for different device types
set "computer_prefixes=00-1A-2B 00-1B-44 00-1C-23 2C-AB-25 3C-55-76 00-05-9A 00-09-5B 00-1F-29 00-1E-C2 00-50-56 00-60-2F 00-70-18 00-90-27 00-90-4C 00-90-7F 00-90-FB 00-A0-C9 00-B0-D0 00-B4-2E 00-B5-5E 00-C0-9F 00-C0-CA 00-C2-6F 00-C4-6A 00-C5-57 00-E0-4C 00-E0-98 00-E2-4F 00-E3-26 00-E4-9E 00-E5-1F 00-E6-2B 00-E8-6D 00-E9-86"
set "phone_prefixes=00-21-5C 00-22-68 00-23-45 00-24-60 00-25-7F 00-26-8C 0A-15-0F 9E-34-32 46-47-CF 58-55-CA 60-1F-AB 68-4E-34 6C-2F-8A 74-83-C9 78-3A-9E 7C-65-43 80-2A-2F 84-1D-7E 88-10-7A 8C-2A-14 9C-5E-D0 A0-36-9F A4-7C-22 9A-5D-1C"
set "tv_prefixes=00-24-81 00-25-96 00-26-AB 00-27-10 00-28-FF 00-29-7E 4C-C9-5E 4C-ED-EB 50-43-3E 5C-27-9C 6C-62-83 6C-8B-84 70-3A-AB 74-5E-1F 78-AB-4E 80-3F-5A 8C-9A-99 9C-5E-2A"
set "printer_prefixes=00-27-10 00-28-FF 00-29-7E 00-2A-1C 00-2B-2A 00-2C-4F 00-0C-29 00-1A-11 00-1E-68 00-22-4F 00-23-8A 00-24-9B 00-26-9F 00-27-1A 00-28-4A 00-2A-1C 00-2B-15 00-2F-6A 00-30-2A"

:: Faster ping settings
set "ping_count=1"
set "ping_timeout=1"

:: Loop through IP range
for /L %%i in (1,1,254) do (
    set "ip=192.168.0.%%i"
    ping -n %ping_count% -w %ping_timeout% !ip! >nul && (
        arp -a !ip! | findstr /i "!ip!" >nul && (
            for /f "tokens=1,2 delims= " %%A in ('arp -a !ip! ^| findstr /i "!ip!"') do (
                if not "%%A"=="Interface:" (
                    set "mac=%%B"
                    set "mac_prefix=!mac:~0,8!"
                    set "device_type=Unknown"

                    :: Check against updated lists
                    for %%P in (%computer_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=Computer"
                    for %%P in (%phone_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=Phone"
                    for %%P in (%tv_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=TV"
                    for %%P in (%printer_prefixes%) do if /I "!mac_prefix!"=="%%P" set "device_type=Printer"

                    echo IP: !ip!  MAC: !mac!  Device Type: !device_type!
                )
            )
        )
    )
)

endlocal
