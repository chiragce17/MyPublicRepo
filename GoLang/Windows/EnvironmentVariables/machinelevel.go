package main

import (
	"fmt"
	"golang.org/x/sys/windows/registry"
)

func setMachineEnvVariable(variableName, variableValue string) {
	keyPath := `SYSTEM\CurrentControlSet\Control\Session Manager\Environment`

	// Open the registry key for environment variables with write access
	key, err := registry.OpenKey(registry.LOCAL_MACHINE, keyPath, registry.SET_VALUE)
	if err != nil {
		fmt.Println("Error opening registry key:", err)
		return
	}
	defer key.Close()

	// Set the environment variable in the registry
	err = key.SetStringValue(variableName, variableValue)
	if err != nil {
		fmt.Println("Error setting registry value:", err)
		return
	}

	fmt.Printf("Machine-level environment variable %s set to %s.\n", variableName, variableValue)
}


func main() {
	variableName := "azSub"
	variableValue := "TestSub1"

	setMachineEnvVariable(variableName, variableValue)
}
