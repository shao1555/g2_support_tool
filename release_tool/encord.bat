cd /d %~dp0

fake.exe ..\rooting\device.db  ..\enc\device.db
fake.exe ..\rooting\get_essential_address ..\enc\get_essential_address
fake.exe ..\rooting\run_root_shell ..\enc\run_root_shell
fake.exe ..\rooting\unlock_security_module ..\enc\unlock_security_module

pause
