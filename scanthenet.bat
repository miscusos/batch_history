@echo off
setlocal enabledelayedexpansion
color f0
color 0a

:: Define MAC address prefixes for different device types
:: Replace these example prefixes with your actual prefixes
set "computer_prefixes=00-1a-2b 00-1b-44 00-1c-23 2c-ab-25 3c-55-76"
set "phone_prefixes=00-21-5c 00-22-68 00-23-45 00-24-60 00-25-7f 00-26-8c 0a-15-0f 9e-34-32 46-47-cf"
set "tv_prefixes=00-24-81 00-25-96 00-26-ab 00-27-10 00-28-ff 00-29-7e 4c-c9-5e"
set "printer_prefixes=00-27-10 00-28-ff 00-29-7e 00-2a-1c 00-2b-2a 00-2c-4f"

:: Faster ping settings
set "ping_count=1"
set "ping_timeout=500"

:: Loop through IP range
for /L %%i in (1,1,254) do (
    set "ip=192.168.0.%%i"
    echo Pinging !ip!...
    ping -n %ping_count% -w %ping_timeout% !ip! >nul

    :: Add IP to ARP table
    arp -d !ip! >nul 2>&1
    arp -a !ip! >nul 2>&1

    :: Check ARP cache for the MAC address
    for /f "tokens=1,2 delims= " %%A in ('arp -a !ip! ^| findstr /i "!ip!"') do (
        if "%%A"=="Interface:" (
            set "interface=%%B"
        ) else (
            set "mac=%%B"
            set "mac_prefix=!mac:~0,8!"

            :: Debug output to verify MAC address and prefixes
            echo MAC Address: !mac! (Prefix: !mac_prefix!)

            :: Classify device based on MAC address prefix
            set "device_type=Unknown"
            for %%P in (%computer_prefixes%) do (
                if "!mac_prefix!"=="%%P" set "device_type=Computer"
            )
            for %%P in (%phone_prefixes%) do (
                if "!mac_prefix!"=="%%P" set "device_type=Phone"
            )
            for %%P in (%tv_prefixes%) do (
                if "!mac_prefix!"=="%%P" set "device_type=TV"
            )
            for %%P in (%printer_prefixes%) do (
                if "!mac_prefix!"=="%%P" set "device_type=Printer"
            )

            echo IP Address: !ip! MAC Address: !mac! Device Type: !device_type!
        )
    )
)

endlocal
