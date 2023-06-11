容器
=
* 原生基本容器
    * list/tuple [] list列表带索引，从0开始（元素类型可以不一致）。tuple元组，只读列表。
        * 操作（支持负数索引）
            * 添加（append变成元素，extend接着继续，根据索引读写，判断是否为空，字符穿转换，容器元素数量，遍历，按照索引删除元素）
    * dict {} 字典key-value形式使用冒号分割，每一对之间使用逗号分割，整个字典在花括号中。
        * 访问元素dict[key]
        * 一个key只能对应一个值
        * 判断key是否存在  key in "内容"
        * 删除  del（key）
        * len 长度
        * 遍历 
            for [key] in [dict]
            for [key value] in [dict].items() 
            [dict].keys()  取出所有的key
    * set 无序不重复元素集，基本功能包括关系测试和消除重复元素。集合对象支持union | 联合， insterserction & 交，difference - 差，symmetric_difference 对称差（A | B）-（A & B））)
        * set([1,2,3,4,5,6])
        * set.add()  添加元素  set.update() 多元素添加  set.remove() 删除元素（元素必须存在）
        * len长度
        * for i in [set]
* 切片
    * 存取序列（列表，元组，字符串）的任意一部分
    * 格式： seq[开始索引:结束索引:步长]
        * 默认值[0,len,1]  >= 开始索引  < 结束索引 
        * 负数索引 从后往前数
        * 负数步长  翻转
* 列表推导
    * 问题的提出
        * 快速简单生成一个列表  列表元素相同  li = [0] * 10  (十个0的列表)   li = [i for i in range(10)]
        * 对原有列表进行简单的转换
    * 一维列表推导
    * 二维列表推导及注意事项
    
* 生成器
    * range 惰性求值
* 迭代器
    * 可用于for循环的对象成为可迭代对象  被next调用才会继续进行