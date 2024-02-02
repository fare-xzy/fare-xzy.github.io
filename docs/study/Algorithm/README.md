# algorithm 相关

1. 时间复杂度
   
   1. O(1) 常量复杂度
      
      ```
      int n = 1000
      System.out.println(n)
      ```
      
      2. O(n)
         
         ```
         for(int i = 0; i < n; i ++){
         System.out.println(i)
         }
         ```
      
      3. O(n^2)
         
         ```
         for(int i = 0; i < n; i ++){
         for(int j = 0; j< n; j ++){
              System.out.println(j)
         }
         }
         ```
      
      4. O(2^n)
         
         ```
         int fn(n){
         if(n <= 2){
           return n;
         }
         n = fn(n - 1) + fn(n - 2)
         }
         ```
      
      5. O(log n)
         
         ```
         for(int i = 0; i < n; i += 2){
           System.out.println(i)
         }
         ```

2. 空间复杂度
   
   1. O(n) : 一维数组
   2. O(n^2) ： 二维数组

3. 对数组等数据结构尽量使用交换操作，不要使用删除和添加来代替交换[示例](../../../../../python/leetcode/algorithms/easy/283-移动零.py)
