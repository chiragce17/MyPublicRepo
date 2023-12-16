import os
import winreg

def set_user_env_variable(variable_name, variable_value):
    key_path = r"Environment"

    try:
        # Open the registry key for environment variables with write access
        key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, key_path, 0, winreg.KEY_SET_VALUE)

        # Set the environment variable in the registry
        winreg.SetValueEx(key, variable_name, 0, winreg.REG_EXPAND_SZ, variable_value)

        # Close the registry key
        winreg.CloseKey(key)

        print(f"User-level environment variable {variable_name} set to {variable_value}.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    variable_name = 'azsub'
    variable_value = 'TestSub4'

    set_user_env_variable(variable_name, variable_value)