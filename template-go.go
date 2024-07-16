package application

import (
	_ "embed"
)

type meta struct {
	Name      string
	Copyright string
	Version   string
}

//go:embed .version
var version string

var m = &meta{
	Version:   version,
}

func Meta() *meta {
	return m
}