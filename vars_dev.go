//go:build dev
// +build dev

package template

func AppName() string {
	return appName + " [DEV]"
}

func Version() string {
	return "DEV-" + version
}
