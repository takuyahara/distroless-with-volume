package config

import (
	_ "embed"
	"encoding/json"
	"os"
	"path/filepath"

	"github.com/fatih/color"
)

type Config struct {
	Message string `json:"message"`
	Repeat  int    `json:"repeat"`
}

var defaultConfig = Config{
	Message: "Hello world",
	Repeat:  3,
}

func GetConfig() Config {
	fpathConfigAbs, _ := filepath.Abs(FpathConfig)
	bytes, err := os.ReadFile(fpathConfigAbs)
	if err != nil {
		color.New(color.FgYellow).Printf("Invalid path: %s\n", fpathConfigAbs)
		return defaultConfig
	}
	var config Config
	if err := json.Unmarshal(bytes, &config); err != nil {
		color.New(color.FgYellow).Println("Invalid JSON file")
		return defaultConfig
	}
	return config
}
