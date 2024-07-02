package templatego

import (
	_ "embed"
)

//go:embed .version
var version string

// Version number defined in .version file
func Version() string {
	return version
}
