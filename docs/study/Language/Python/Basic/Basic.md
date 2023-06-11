笔记
=
* 常用关键字
    * True
    * False
    * None
* 对象和容器
    * class   对象
    * inport  引入一个包
    * form    从某一个包
    * del     从对象中删除一个元素
* 判断
    * if
    * elif
    * else
    * is 是什么
    * in 判断对象是否在容器
    * assert 断言
* 循环
    * for
    * while
    * continue
    * break
    * pass  什么也不执行直接通过（可以通过使用pass在语法有问题的地方做一个填充）
* 异常
    * raise     可以主动的引发一个异常，直接进入except
    * try   
    * except    等同于catch在try中引发异常后执行    
    * finally
    * as        使用 with 语句，可以实现自动关闭文件、线程锁的自动获取和释放等
* 常用运算符
    * +-*/
    * %
    * (**)  做指数运算 10 ** 2 = 100
    * //    模除
* 比较运算符
    * >, >=
    * <, <=
    * ==
    * !=
* 逻辑运算符
    * and
    * or
    * not
* 位运算
    * << 向左移位（二进制）
    * 》》 向右移位
    * & 与
    * | 或
    * ^ 异或（不相同取1相同取0）
* 基本语法
    * 缩进 缩进异常：IndentationError
    * 注释
        * 井号：单行注释
        * " ``` "多行注释
            
          " ``` "
        * \ 换行（‘abc’\n
                    ‘def’）
        * “““多行文本
                这是第二行
                这是第三行”””
        * 字符串单双引号混用不用转义字符\
        * 中文编码 2.x  需要在头进行表示（）coding utf-8
* 2.x与3.x区别
    * print（3.x版本必须带括号，2.x可以不带）
    * Unicode（3.x默认Unicode）
    * 除法运算 （3.x会自动转成浮点数，2.x整数除以整数会进行模除）
    * 异常 （3.x所有异常必须继承BaseException）
    * xrange （3.x取消xrange，range与xrange同样为实现惰性求值）
        * range：xrange(5)会生成一个连续数组
        * 惰性求值：用到时生成
    * 2/8进制 （3.x必须强制写成0b1101和0o7236）
    * 不等式 （3.x取消了<>只有！=）
    * ''表达式 （3.x版本中取消只可以用repr函数）repr() 函数将对象转化为供解释器读取的形式。
    * 多个模块名称改变
    * 数据类型 
        * 3.x取消了long都改为int
        * 新增bytes类型，并可与String转换{print((1024).to_bytes(2,byteorder='big'))}//如果转换结果中有可打印字符，将会经过ASCII码进行转换
        * 