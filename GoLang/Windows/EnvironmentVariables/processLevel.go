package main

import (
	"fmt"
	"os"
)

func main(){
	env_key := "azSub"
	env_value := "TestSub1"

	err := os.Setenv(env_key,env_value)

	if err != nil {
		fmt.Println("Error Setting up process level environment variable", err)
		return
	}

	getEnvValue := os.Getenv(env_key)
	fmt.Println("Environment variable %s is set to: %s\n",env_key,getEnvValue)
}

