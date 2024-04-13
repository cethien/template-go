//go:build !dev
// +build !dev

package template

func AppName() string {
	return appName
}

func Version() string {
	return version
}
