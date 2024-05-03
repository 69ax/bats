@echo off


goto main

:main
cls
color 5
for /f "tokens=2 delims==" %%b in ('wmic bios get serialnumber /value') do set "serial=%%b"
echo Serial Number: %serial%


echo System Specifications:
systeminfo | findstr /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"Virtual Memory: Max Size" /C:"Virtual Memory: Available" /C:"Virtual Memory: In Use"


echo BIOS Information:
wmic bios get name, version, manufacturer


echo Motherboard Information:
wmic baseboard get product, manufacturer, serialnumber


echo SMBIOS Information:
wmic path Win32_ComputerSystemProduct get IdentifyingNumber,UUID


echo Physical Address and Transport Name:
ipconfig /all | findstr /C:"Physical Address" /C:"Media State"

pause

