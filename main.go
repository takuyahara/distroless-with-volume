package main

import (
	"fmt"

	"github.com/takuyahara/distroless-with-volume/config"
)

func main() {
	cfg := config.GetConfig()
	for i, l := 0, cfg.Repeat; i < l; i++ {
		fmt.Println(cfg.Message)
	}
}
