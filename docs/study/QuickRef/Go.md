Go Quick Reference

1. 记不住的内容
    1. 数组创建：
        * 二维数组：
    ```
        x := 2
        y := 4
        
        table := make([][]int, x)
        for i  := range table {
                table[i] = make([]int, y)
        }
   
   
   ```