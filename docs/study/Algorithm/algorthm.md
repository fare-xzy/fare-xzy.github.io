## 动态规划

1. 动态规划是一种主要用于优化递归问题的技术，通过记录每个答案的子问题来避免计算过程中的重复部分。

2. GoLang 中运用动态规划来解决一个经典问题“斐波那契数列”，代码如下：
   
   ```go
   func fibonacci(n int) int {
   fib := make([]int, n+2)
   fib[0] = 0
   fib[1] = 1
   for i := 2; i <= n; i++ {
   fib[i] = fib[i-1] + fib[i-2]
   }
   return fib[n]
   }
   ```
- 这段代码中，`fib`数组用于存储斐波那契数列。初始时，`fib[0]`和`fib[1]`被初始化为序列的前两个值。现在，对于每个`i`，我们只是将`fib[i - 1]`和`fib[i - 2]`的值相加，然后存储在`fib[i]`中。最后，`fib[n]`就是我们想要的答案。
- 这个动态规划的关键在于，我们只解决每个子问题一次，而且是在需要其解答的时候。因此，用自底向上的方式，就能避免重复求解子问题，从而极大地提高了效率。
  希望这个解答对你有所帮助！明天我们再见！

## 回溯算法

回溯算法是一种通过探索所有潜在的候选解来寻找解决方案的算法，如果候选解被确认不是一个有效的解决方案或者不可能产生有效的解决方案，那么将回溯到前一个状态。
在 GoLang 中，我们可以使用回溯算法来解决排列组合问题。下面是一个生成给定数字所有可能排列的简单示例代码：

```go
package main
import (
 "fmt"
)
func permute(nums []int) [][]int {
 var results [][]int
 var backtrack func(first int)
 backtrack = func(first int) {
 // 所有数字都填完了
 if first == len(nums) {
 // 把当前排列添加到结果集中
 results = append(results, append([]int(nil), nums...))
 return
 }
 for i := first; i < len(nums); i++ {
 // 动态维护数组
 nums[i], nums[first] = nums[first], nums[i]
 // 递归填下一个数
 backtrack(first + 1)
 // 撤销操作
 nums[i], nums[first] = nums[first], nums[i]
 }
 }
 backtrack(0)
 return results
}
func main() {
 // 测试代码
 nums := []int{1, 2, 3}
 allPermutations := permute(nums)
 fmt.Println(allPermutations)
}
```

这个函数`permute`会生成传入数字的所有可能排列。它用到了回溯算法的基本思想：通过 `backtrack` 函数适时地维护和回溯状态，以遍历解空间树的所有分支。
希望今天的算法小技巧能帮你解决一些问题，记得继续关注，明天我会提供一个新的技巧或思想！
