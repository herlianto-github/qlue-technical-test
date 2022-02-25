package q3_golang

func GetShape(input int) string {
	res := ""

	if input%2 == 0 && input%3 == 0 {
		res = "CIRCLE STAR"
	} else if input%2 == 0 {
		res = "CIRCLE"
	} else if input%3 == 0 {
		res = "STAR"
	} else {
		res = "Null"
	}

	return res
}
