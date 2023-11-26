package main

import "fmt"

func twoSum(nums []int, target int) []int {
	numsMap := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		result := target - nums[i]
		if _, ok := numsMap[result]; ok {
			return []int{numsMap[result], i}
		} else {
			numsMap[nums[i]] = i
		}
	}
	return []int{}
}

// 牛逼的代码 不理解
func twoSum1(nums []int, target int) []int {
	temp := make(map[int]int)
	res := make([]int, 0)
	for i, n := range nums {
		if index, ok := temp[target-n]; ok && index != i {
			res = append(res, index)
			res = append(res, i)
		}
		temp[n] = i
	}
	return res
}

func main() {
	nums := []int{2, 7, 11, 15}
	fmt.Print(twoSum(nums, 9))
}
