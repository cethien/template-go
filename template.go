package template

import (
	_ "embed"
)

//go:embed .app_name
var appName string

//go:embed .version
var version string
