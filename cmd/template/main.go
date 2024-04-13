package main

import (
	"fmt"

	"github.com/cethien/template-go"
)

func main() {
	fmt.Printf("%s | Version %s\n", template.AppName(), template.Version())
	fmt.Println("Beep Beep I'm a sheep!")
}
