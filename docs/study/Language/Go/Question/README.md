# Go Question

* package 问题 (需要构建go mod才可以进行工程内部引用)
* map（字典）初始化问题，需要使用make()进行创建
    ```
    // 先声明map
    var m1 map[string]string
    // 再使用make函数创建一个非nil的map，nil map不能赋值
    m1 = make(map[string]string)
    // 最后给已声明的map赋值
    m1["a"] = "aa"
    m1["b"] = "bb"
  
  // 直接创建
  m2 := make(map[string]string)
  // 然后赋值
  m2["a"] = "aa"
  m2["b"] = "bb"
  
  // 初始化 + 赋值一体化
  m3 := map[string]string{
  	"a": "aa",
  	"b": "bb",
  }  
    ```
