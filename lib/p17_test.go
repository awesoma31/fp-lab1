package euler17

import "testing"

func TestExamples(t *testing.T) {
	if letters(342) != 23 {
		t.Fatal("342 should be 23")
	}
	if letters(115) != 20 {
		t.Fatal("115 should be 20")
	}
}

func TestAnswer(t *testing.T) {
	if got := SolveSum1to1000(); got != 21124 {
		t.Fatalf("want 21124, got %d", got)
	}
}
