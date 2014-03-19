cd /d %~dp0

fake ..\enc\device.db  ..\rooting\device.db
fake ..\enc\get_essential_address ..\rooting\get_essential_address
fake ..\enc\run_root_shell ..\rooting\run_root_shell
fake ..\enc\unlock_security_module ..\rooting\unlock_security_module

