package application

import (
	_ "embed"
)

type meta struct {
	name      string
	version   string
}

func (m *meta) Name() string {
	returb m.name
}

func (m *meta) Version() string {
	returb m.Version
}

//go:embed .version
var version string

var m = &meta{
	version:   version,
}

func Meta() *meta {
	return m
}