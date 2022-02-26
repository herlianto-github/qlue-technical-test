package q5_algorithmic

import "fmt"

func FindCombinationUtils(result []int, index, target, reduceTarget int) {

	if reduceTarget < 0 {
		return
	}
	if reduceTarget == 0 {
		for i := 0; i < index; i++ {
			if result[i] == 4 {
				return
			}
			fmt.Print(result[i], ",")
		}
		fmt.Println()
		return
	} else {
		prev := 0
		if index == 0 {
			prev = 1
		} else {
			prev = result[index-1]
		}

		for i := prev; i <= target; i++ {
			result[index] = i
			// fmt.Println(result, index+1, reduceTarget-i, "=>")
			FindCombinationUtils(result, index+1, target, reduceTarget-i)
		}
		return
	}
}

func FindCombination(n int) {
	arr := make([]int, n)
	FindCombinationUtils(arr, 0, n, n)
}
