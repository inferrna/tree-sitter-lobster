package tree_sitter_lobster_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/tree-sitter/tree-sitter-lobster"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_lobster.Language())
	if language == nil {
		t.Errorf("Error loading Lobster grammar")
	}
}
