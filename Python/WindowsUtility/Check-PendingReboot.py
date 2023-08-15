import winreg

access_registry = winreg.ConnectRegistry(None,winreg.HKEY_LOCAL_MACHINE)

component_key = winreg.OpenKey(access_registry,r"SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing")
auto_update_key = winreg.OpenKey(access_registry,r"SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update")
session_key = winreg.OpenKey(access_registry,r"SYSTEM\CurrentControlSet\Control\Session Manager")

count = 0

for i in range(30):
    try:
        if(winreg.EnumKey(auto_update_key,i) == "RebootRequired"):
            count = 1
            break
    except:
        break

for i in range(30):
    try:
        if(winreg.EnumKey(component_key,i) == "RebootPending"):
            count = 1
            break
    except:
        break

for i in range(30):
    try:
        # print(winreg.EnumKey(session_key,i))
        if(winreg.EnumKey(session_key,i) == "FileRenameOperations"):
            count = 1
            break
    except:
        break


if count == 0:
    print("Server Reboot is not pending")
else:
    print("Server Reboot is Pending..Restart your Server")