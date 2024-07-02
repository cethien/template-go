//go:build tools
// +build tools

package tools

import (
	_ "github.com/bokwoon95/wgo"
	_ "github.com/evilmartians/lefthook"
	_ "github.com/goreleaser/goreleaser/v2"
	_ "honnef.co/go/tools/cmd/staticcheck"
)
