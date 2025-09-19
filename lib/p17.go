package euler17

var (
	ones = map[int]int{
		1: 3, 2: 3, 3: 5, 4: 4, 5: 4, 6: 3, 7: 5, 8: 5, 9: 4,
	}
	teens = map[int]int{
		10: 3, 11: 6, 12: 6, 13: 8, 14: 8, 15: 7, 16: 7, 17: 9, 18: 8, 19: 8,
	}
	tens = map[int]int{
		20: 6, 30: 6, 40: 5, 50: 5, 60: 5, 70: 7, 80: 6, 90: 6,
	}
	hundred  = 7
	andWord  = 3
	thousand = 8
)

func letters(n int) int {
	if n == 1000 {
		return 3 + thousand
	}
	if n >= 100 {
		h := n / 100
		r := n % 100
		base := ones[h] + hundred
		if r == 0 {
			return base
		}
		return base + andWord + letters(r)
	}
	if n >= 20 {
		t := (n / 10) * 10
		r := n % 10
		if r == 0 {
			return tens[t]
		}
		return tens[t] + ones[r]
	}
	if n >= 10 {
		return teens[n]
	}
	if n > 0 {
		return ones[n]
	}
	return 0
}

func SolveSum1to1000() int {
	sum := 0
	for i := 1; i <= 1000; i++ {
		sum += letters(i)
	}
	return sum
}
